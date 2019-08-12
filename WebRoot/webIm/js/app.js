var stompClient = null;
var username = "demo";
function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#greetings").html("");
}

function connect() {
    var url = "http://127.0.0.1:8888";
    var name = "demo";
    var password = "password++++++++++++";
    var socket = new SockJS(url+'/gs-guide-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({'name': name,'password': password}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        //订阅广播信息
        stompClient.subscribe('/topic/greetings', function (greeting) {
            showGreeting(JSON.parse(greeting.body).content);
        });

        //订阅服务器端周期性发送的广播消息
        stompClient.subscribe('/topic/getResponse',function(response){
            showResponse(JSON.parse(response.body));
        });

        var userId="demo";
        //订阅一对1消息
        //通过stompClient.subscribe订阅/topic/getResponse 目标(destination)发送的消息
        stompClient.subscribe('/user/' + userId + '/queue/getResponse',function(response){
            var code=JSON.parse(response.body);
            showUserResponse(code)
        });
        // 原文：https://blog.csdn.net/liyongzhi1992/article/details/81221103

        stompClient.send("/foo/connectOpenF", {}, JSON.stringify({'content': username}));

    });
}

function showUserResponse(message) {
    var response = $("#userresponse");
    response.append("<p>只有userID为"+message.id+"的人才能收到，信息为："+ message.content +"</p>");
}

function showResponse(message) {
    var response = $("#response");
    response.append("<p>" + message.content + "</p>");
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendName() {
    stompClient.send("/foo/demo", {}, JSON.stringify({'content': $("#name").val()}));
}

function showGreeting(message) {
    $("#greetings").append("<tr><td>" + message + "</td></tr>");
}

$(function () {
    $("form").on('submit', function (e) {
        e.preventDefault();
    });
    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendName(); });
});