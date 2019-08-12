function containsStr(str,subStr){
    index=str.indexOf(subStr)
    if(index != -1)
        return true;
    else
        return false;
}

function checkIsMail(element)
{
    var mail=$.trim($(element).val());
    var flag=isEmail(mail);
    if(!isLogin() && !isAdminOnline){
        if(!flag)
        {
            $("#13822errorIcon").css("display","block");
            $("#13822errorMessage").css("display","block");
            return false;
        }
        else
        {
            $("#13822errorIcon").css("display","none");
            $("#13822errorMessage").css("display","none");
            return true;
        }
    }


}

//基于用户是否登录生成用户id
function getCustomeruserid()
{
    if(customeruserid==0) //这个0代表是后台，因为在后台页面adminWebIm.jsp中customeruserid=0
        return customeruserid;

    if(customeruserid==null||customeruserid==undefined){ //未登录
        var temp=getCookie("srcId");
        flag=containsStr(temp,"noLogin")
        if(flag && temp!="")
            return temp;
        else{
            removeCookie("srcId");
            return "noLogin"+getRandomString();  //
        }
    }
    else
        return customeruserid; //customeruserid在headermenu.jsp中
}
//基于用户是否登录生成用户名
function getCustomerusername()
{
    if(customerusername=="客服")
        return customerusername;
    if(customerusername==null||customerusername==undefined||customerusername=="null"){//未登录
        var temp=getCookie("srcName");
        if(temp!="")
            return temp;
        return ("游客"+getRandomString());
    }
    else
        return customerusername; //customerusername在headermenu.jsp中
}

//生成随机字符串
function getRandomString()
{
    var Range = 100000 - 10;
    var Rand = Math.random();
    var num=10 + Math.round(Rand * Range);
    var date = new Date();
    var time=date.getTime()+"";
    time=time.substr(0,4);
    return (time+""+num);
}

var chatsock; //websocket 发送 内容
var saveContent={};//保存对话消息,key为对话人的id，list为一个三元组【id（说话人的id），content，timestamp】

var srcId=getCustomeruserid(); //自己的id,
setCookie("srcId",srcId,1);//用cookie，保存自己的id，这样可以再跨页面时使用

var srcName=getCustomerusername(); //自己的用户名,customerusername在headermenu.jsp中
setCookie("srcName",srcName,1);//用cookie，保存自己的name，这样可以再跨页面时使用

//该字段表示当前聊天窗口的人的id
//默认："0_0_0_0"表示是系统消息，系统消息也就是群发的消息,admin是系统管理员，点击相应的用户时候会改变
var desId="admin";


var desName="客服";//默认名称，点击相应的用户时候会改变


var messageComeIntervalId;//提示消息到来的interval Id

var s="有消息…".split("");

var isAdminOnline=0;//admin is online flag

function messageComeTipsfunc(){
    s.push(s[0]);
    s.shift();// 去掉数组的第一个元素
    document.title = s.join("");
}

function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
        + " " + date.getHours() + seperator2 + date.getMinutes()
        + seperator2 + date.getSeconds();
    return currentdate;
}

//生成联系人
function generateUser(data)
{
    var srcid=data.srcId; //信息从哪里来
    var srcName=data.srcName;

    var firstEle=$("<div id='' class='c-li' style='cursor: pointer;' data-username='' data-userstatus='' data-postid='' data-posttitle='' data-posturl=''></div>");

    var id="imjs-"+srcid;
    firstEle.attr("id",id);
    firstEle.attr("data-postid",srcid);
    firstEle.attr("data-username",srcName);
    firstEle.attr("data-userstatus",0); //默认暂时这里不在线处理

    var del=$("<em title='Delete' class='webim-close' style='display: none;'>&nbsp;</em>");
    firstEle.append(del);

    var delA=$("<a style='display:none' title='Delete' class='webim-close-enter'>Delete</a>");
    firstEle.append(delA);

    var usernameStatus=$("<em class='webim-status webim-username-offline'>&nbsp;</em>");
    firstEle.append(usernameStatus);

    var userName=$("<em class='webim-username-n'></em>");
    userName.html(srcName);
    firstEle.append(userName);

    var count=$("<em style='display:none' class='webim-msg-count'></em>");
    firstEle.append(count);

    $("#imjs-main-contact-list").prepend(firstEle);

}


/**
 *
 * @param talkid 说话人的id
 * @param srcContent  内容
 * @param timeArgs  时间
 */
function showContent(talkid,srcContent,timeArgs,detailMessage)
{
    var srcId=getOpenFireListenName(); // 这个srcId 应该会覆盖全局变量里面的srcId

    var chatList = $(".imjs-msg-list");
    if(talkid==srcId)
    {//说明是自己说的话，在本页面右面展示即可
        var firstEle = $("<div class='textalign-right'></div>");

        var contentDiv=$("<div class='webim-body-comtent-msg-right imjs-msg-content'><s>&nbsp;</s></div>");
        contentDiv.prepend(srcContent);

        firstEle.append(contentDiv);


        var contentTime=$("<span class='webim-times imjs-msg-time'></span>");
        contentTime.text(timeArgs);

        firstEle.append(contentTime);

        chatList.append(firstEle);
    }
    else
    {//说明是对方说的话
        var firstEle = $("<div class='textalign-left'></div>");

        var contentDiv=$("<div class='webim-body-comtent-msg-left imjs-msg-content'><s>&nbsp;</s></div>");
        var contentString=srcContent;
        contentDiv.prepend(contentString);
        firstEle.append(contentDiv);

        if(detailMessage.isAdminOnline==0){ //如果属于不在线的消息，就需要添加上用户名和邮箱信息
            var contactDiv=$("<div class='webim-body-comtent-msg-left imjs-msg-content'><s>&nbsp;</s></div>");

            var name=detailMessage.name;
            var contentName="<div>姓名:"+name+"</div>";
            if(name!=""&&name!=undefined)
                contactDiv.append(contentName);

            var tel=detailMessage.tel;
            var contentTel="<div>电话:"+tel+"</div>";

            if(tel!=""&&tel!=undefined)
                contactDiv.append(contentTel);

            var mail=detailMessage.email;
            var contentMail="<div>邮箱:"+mail+"</div>";
            if(mail!=""&&mail!=undefined)
                contactDiv.append(contentMail);

            firstEle.append(contactDiv);
        }


        var contentTime=$("<span class='webim-times imjs-msg-time'></span>");
        contentTime.text(timeArgs);
        firstEle.append(contentTime);
        chatList.append(firstEle);
    }
}

/*
        sessid: 对方的人的id，也就是对方的id，以此id作为key保存会话
        talkid：说话人的id，也就是聊天页面登录用户的id

        生成保存内容的数据结构
     */
function saveContentFunction(sessid,talkid,content,timestamp,tempJsonMessage)
{
    var ss=saveContent[sessid];
    if(ss==null||ss==undefined)
        saveContent[sessid]=[];
    var tripleContent={};
    tripleContent.talkid=talkid;
    tripleContent.content=content;
    tripleContent.timestamp=timestamp;
    tripleContent.tempJsonMessage=tempJsonMessage;

    saveContent[sessid].push(tripleContent);
}

/*
    发送内容到服务器
    *@content 要发送到服务器的内容
     *  */
function handleSendMessage(content)
{
    //var content= $.trim($('#imjs-textarea').val());
    if(content=="")
    {
        $("#imjs-empty-tip").css("display","block");
        setTimeout( function(){
            $("#imjs-empty-tip").css("display","none");
        }, 2 * 1000 );//延迟5000毫米
        return;
    }

//        saveContentFunction(desId,srcId,content,getNowFormatDate());

    addToContentWindow(); //自己发送的内容，添加到自己的窗口里

    var name=$.trim($('#13821input').val());
    var tel=$.trim($('#13823input').val());
    var mail=$.trim($('#13822input').val());
    var islogin=isLogin();
    if(!isAdminOnline && !islogin && (srcId!="admin"&&srcId!=0&&srcId!="0")){ //如果不是后台，且客服不在线，需要填写邮箱和姓名等信息
        if(!isEmail(mail)){
            $("#13822errorIcon").css("display","block");
            $("#13822errorMessage").css("display","block");
            return;
        }
        if(name==""||name=="undefined"){
            $("#13821errorIcon").css("display","block");
            $("#13821errorMessage").css("display","block");
            return;
        }
        if(tel==""||tel=="undefined"){
            $("#13823errorIcon").css("display","block");
            $("#13823errorMessage").css("display","block");
            return;
        }
    }

    //发送到对方客户端
    var message = {
        srcId:getOpenFireListenName(),
        desId:desId,  //对方的id，0代表着系统管理员
        srcName:srcName,
        desName:desName,
        srcContent:content, //我所说的话
        desContent:content, //对方所说的话，为空
        time:getNowFormatDate(),
        message: content,
        isAdminOnline:isAdminOnline,
        name:name,
        email:mail,
        tel:tel
    };
    var url="/foo/"+getOpenFireSocketUserName()+"/"+getSocketToken();
    stompClient.send(url, {}, JSON.stringify({'content': JSON.stringify(message)}));

    $("#imjs-textarea").val('').focus();
}

//自己发送的内容，添加到自己的窗口里
function addToContentWindow()
{
    // 这里应用了后台传过来的方式类同步各个页面，不用这种方式了
        // var content= $.trim($('#imjs-textarea').val());
        // saveContentFunction(desId,srcId,content,getNowFormatDate());
        // showContent(srcId,content,getNowFormatDate());
}

/**
 * 做一些预处理工作
 */
function preProcess()
{
    if(srcId=="0") //说明是后台
        $("#imjs-0").remove();

    if(srcId!="0")
    {//说明是前台
        $("#imjs-0").attr("id",srcId);
    }
}

function isLogin(){

    if(customeruserid==null||customeruserid==undefined){    // 未登录
        return false;
    }
    else
        return true;
}

function getOpenFireListenName() {
    if(srcId=="0"||srcId==0) //说明是后台客服
        return "admin";     //后台客服订阅admin消息即可
    else if(isLogin())
        return customerusername;
    else
        return srcId;
}

function getOpenFireSocketUserName() {
    if(srcId=="0"||srcId==0) //说明是后台客服
        return "admin";     //后台客服订阅admin消息即可
    else if(isLogin())
        return customerusername;
    else
        return "demo";
}

function getSocketToken() {
    if(srcId=="0"||srcId==0) //说明是后台客服
        return "uu}~}t'!";     //后台客服订阅admin消息即可
    if(isLogin())
        return customeruserToken;
    else
        return "<,7:>5";
}

function showResponse(message) {
    var response = $("#response");
    // response.append("<p>" + message.content + "</
    console.log(message.content);
}

//取消新消息提示
function cancelMessageTips() {
    clearInterval(messageComeIntervalId);
    document.title="";
}

function adminOnLineTips(message){
    if(message.content=="0" || message.content==0){
        isAdminOnline=0;
        $(".adminStatusEm").removeClass("webim-username-online");
        $(".adminStatusEm").addClass("webim-username-offline");
    }

    else
    {
        isAdminOnline=1;
        $(".adminStatusEm").removeClass("webim-username-offline");
        $(".adminStatusEm").addClass("webim-username-online");
    }

}

function connect() {
    var url = "http://13.231.165.68:8888";

    // var url = "http://127.0.0.1:8888";
    var name = getOpenFireSocketUserName();
    var token =getSocketToken();

    var socket = new SockJS(url+'/gs-guide-websocket');

    stompClient = Stomp.over(socket);
    stompClient.connect({'name': name,'password': token}, function (frame) {

        console.log('Connected: ' + frame);
        //订阅广播信息
        // stompClient.subscribe('/topic/greetings', function (greeting) {
        //     showGreeting(JSON.parse(greeting.body).content);
        // });

        //订阅客服上线的广播的消息
        stompClient.subscribe('/topic/adminStatus',function(response){
            var code=JSON.parse(response.body);
            adminOnLineTips(code);
        });

        //订阅查询服务端状态的消息
        stompClient.subscribe('/user/' + getOpenFireListenName() +'/querey/adminStatus',function(response){
            var code=JSON.parse(response.body);
            adminOnLineTips(code);
        });

        //订阅查询客服在线状态的消息
        stompClient.subscribe('/user/' + getOpenFireListenName() +'/cancel/MsgTips',function(response){
            cancelMessageTips();
        });

        //订阅一对1消息
        //通过stompClient.subscribe订阅/topic/getResponse 目标(destination)发送的消息
        stompClient.subscribe('/user/' + getOpenFireListenName() + '/queue/getResponse',function(response){
            var code=JSON.parse(response.body);
            receiveMessage(code) //websocket接收到消息之后的处理
        });
        // 原文：https://blog.csdn.net/liyongzhi1992/article/details/81221103
        var cmd="/foo/connectOpenF/"+getOpenFireListenName();
        stompClient.send(cmd, {}, JSON.stringify({"content": name,"password":token}));

    });
}

function splitStirng(strN) {
    var arr=new Array();
    //可以用字符或字符串分割
    arr=strN.split('@');
    return arr[0];
}

function receiveMessage (message) {
    var data = {};
    tempJsonMessage=$.parseJSON(message.content)
    data.srcContent=tempJsonMessage.message; //
    data.srcName = tempJsonMessage.srcName;
    data.time=message.time;

    var srcid = splitStirng(($.parseJSON(message.content)).srcId); //消息的发送者,真实的srci，比如noLogin22234
    var desid = splitStirng(($.parseJSON(message.content)).desId); //消息的对话者，比如admin

    // if(srcid=="demo") //针对nologin的用户，在这里做了一个转换，nologin的用户访问的时候，统一都是用的demo用户
    //     srcid=srcId;
    // if(desid=="demo") //针对nologin的用户，在这里做了一个转换，nologin的用户访问的时候，统一都是用的demo用户
    //     desid=srcId;



    data.srcId=srcid;
    data.desId=desid;

    var srcId=getOpenFireListenName(); // 这个srcId 应该会覆盖全局变量里面的srcId

    //保存内容
    if(srcid!=srcId) //说明是接收到的别人发送的消息
        saveContentFunction(srcid,srcid,data.srcContent,data.time,tempJsonMessage);
    else//说明是接收到的自己发送的消息
        saveContentFunction(desid,srcid,data.srcContent,data.time,tempJsonMessage);

    var id="imjs-"+srcid;  //此说话用户的id
    var eles=$("#"+id); //此说话用户的元素
    //var desid=data.desId;
    if((srcId=="admin"||srcId==0||srcId=="0")&&srcid!=srcId)
        // 这个if是操作后台的聊天界面的
    //这个srcId是全局变量，不要混淆
    //srcId=="0"，说明是后台；srcid!=0&&srcid!="0"是为了说明，这个消息不是自己发送的,防止在后台页面产生自己的一个联系人
    {//需要根据desid生成相应的联系人
        //首先判断，此用户是否已经存在了
        //var ss=eles.length;
        if(eles.length == 0)//如果不存在
        {
            generateUser(data);
            //新生成了用户，要提示消息到来
            eles=$("#"+id);
            eles.children(".webim-msg-count").css("display","block");
        }
    }
    else
    {//说明本页面是咨询人员页面，如果以后是所有客户可以双双交互，那么需要和上面一样，在这个else片段里判断是否有新的用户

    }

    if(srcid!=srcId) //不是自己发送给自己的，提示消息到来
    {
        clearInterval(messageComeIntervalId);
        messageComeIntervalId=setInterval(messageComeTipsfunc,1000);//提示消息到来，设置时间间隔运行
    }


    if(srcid==srcId)
    {//说明是自己发送过来的信息
        if(desid==desId)//如果当前页面，正好是和对应用户的聊天页面，显示即可
            // tempJsonMessage=$.parseJSON(data.srcContent)
            // showContent(srcid,tempJsonMessage.message,data.time);
        showContent(srcid,data.srcContent,data.time,tempJsonMessage);
    }
    else if(srcid==desId)
    {//如果当前聊天窗口的id和接收到的消息的id一样，则说明是当前聊天窗口的用户发送过来的，显示发过来的内容
        showContent(srcid,data.srcContent,data.time,tempJsonMessage);
    }
    else
    {//提示消息即可，不用立即显示，消息已经保存在内存中，也就是saveContent中
        eles.children(".webim-msg-count").css("display","block");
    }

    //保持在底部
    $('#mCSB_2').scrollTop( $('#mCSB_2').height());
    var scrollTop = $("#mCSB_2")[0].scrollHeight;
    $("#mCSB_2").scrollTop(scrollTop);
};

//聊天点击时的各种事件
$(function() {
    // When we're using HTTPS, use WSS too.
    //生成websocket
    connect();

    $("#imjs-textarea").keydown(function(event){
        if(event.keyCode==13){
            //$("#mouse").click();
            var content= $.trim($('#imjs-textarea').val());
            handleSendMessage(content);
        }
    });

    $(".webim-body-comtent-submit").on("click", function(event) {
        var content= $.trim($('#imjs-textarea').val());
        handleSendMessage(content);
        return false;
    });



});

//点击时的各种事件
$(function() {

    preProcess();//预处理工作，如果是后台用户登录， 则在联系人列表中删除客服

    var closeFlag=1;
    //最小化，关闭按钮
    $(".webim-icon-mini").on("click",function(){
        handleMinDialog();

    });
    $(".webim-icon-close").on("click",function(){
        handleMinDialog();
    });

    //回复聊天窗口
    $("#restoreDiolag").on("click",function(){
        handleRestoreDialog();
    });

    function  handleMinDialog()
    {
        $("#chat-icon").css("display","block");
        $("#webim2").css("display","none");
        // $("#webim2").removeClass("imjs-open");
        // $(".webim-body-comtent-header").css("display","none"); //隐藏用户列表
        // $(".webim-user-list").css("display","none");
        // $(".webim-body-content").css("display","none");
    }

    function handleRestoreDialog()
    {
        $("#chat-icon").css("display","none");
        $("#webim2").css("display","block");
        $("#webim2").addClass("imjs-open");
        $(".webim-body-comtent-header").css("display","block"); //隐藏用户列表
        $(".webim-user-list").css("display","block");
        $(".webim-body-content").css("display","block");
        $("#imjs-lianxiren").css("display","block")
        $("#imjs-default-guide-page").css("display","none");
    }


    var flag=1;//关闭
    //点击我的联系人时的事件，隐藏所有的联系人
    $(".webim-user-list").on("click",".webim-myfriends",function(){
        if(flag==1)
        {
            $(this).addClass("webim-myfriends-close"); //图标变为往上
            $("#imjs-user-list").css("display","none"); //隐藏用户列表
            flag=0;
        }
        else
        {
            $(this).removeClass("webim-myfriends-close"); //图标变为往下
            $("#imjs-user-list").css("display","block"); //隐藏用户列表
            flag=1;
        }

    });


    //鼠标放到相应联系人上的事件，显示删除按钮
    $("#imjs-main-contact-list").on("mouseenter",".c-li",function(){
        var hasClassFlag=$(this).hasClass("webim-system-info");
        if(!hasClassFlag)
        {//不是系统消息
            // $(this).children(".webim-close").css("display","block");
        }
    }).on("mouseleave",".c-li",function(){
        var hasClassFlag=$(this).hasClass("webim-system-info");
        if(!hasClassFlag)
        {//不是系统消息
            // $(this).children(".webim-close").css("display","none");
        }
    });

    //点击用户列表右边删除按钮时的动作
    $("#imjs-main-contact-list .c-li .webim-close").on("click",function(event){
        event.stopPropagation();
    });

    //点击用户列表中的对话人时的事件
    $("#imjs-main-contact-list").on("click",".c-li",function(){
        $("#imjs-main-contact-list .c-li").each(function(){
            $(this).removeClass("c-li-open");
        });
        $(this).addClass("c-li-open");
        desId=$(this).attr("data-postid"); //和某位用户聊天，对方的id

        //消息列表内容清空
        $(".imjs-msg-list").empty();

        //不再提示消息到来
        clearInterval(messageComeIntervalId);
        document.title="客服";

        var hasClassFlag=$(this).hasClass("webim-system-info");
        if(hasClassFlag)
        {//说明是点击的系统消息
            $("#imjs-body-content-talk").addClass("webim-body-content-talk-h");
            $(".imjs-left-bottom").css("display","none"); //隐藏
            $(".webim-body-comtent-submit").css("display","none"); //隐藏

            $(".imjs-msg-list").append(webIMSystemInfo);
        }
        else
        {//点击的是用户列表
            $("#imjs-body-content-talk").removeClass("webim-body-content-talk-h");
            $(".imjs-left-bottom").css("display","block");  //因为点击系统消息的时候隐藏起来了，所以现在显示
            $(".webim-body-comtent-submit").css("display","block");  //因为点击系统消息的时候隐藏起来了，所以现在显示

            var chatContent=showOldChatContent(srcId,desId); //显示和这位用户以往的聊天记录
        }

        $(this).children(".webim-msg-count").css("display","none"); //已经查看，隐藏消息数目

        //改变header标题和在线状况，图标变为绿色或者灰色
        handleOnLineStatus(this);

    });

    /**
     *获取对话信息
     * srcIdArgs： 本页面的用户id
     * toUseridArgs： 会话对方的用户id
     * @returns {string}
     */
    function showOldChatContent(srcIdArgs,toUseridArgs)
    {
        var allContentTriple=saveContent[toUseridArgs];//存储的所有的会话的三元组
        if(allContentTriple!=null&&allContentTriple!=undefined)
        {
            var len=allContentTriple.length;
            for(var i=0;i<len;i++)
            {
                var ele=allContentTriple[i];
                showContent(ele.talkid,ele.content,ele.timestamp,ele.tempJsonMessage);
            }
        }

    }

    function handleOnLineStatus(ele)
    {
        //改变名字
        var userName=$(ele).attr("data-username");
        var nameStrong="<strong>"+userName+"</strong>";
        $(".webim-body-comtent-header > .imjs-username").html(nameStrong);

        //在线状况
        // var OnLineStatus=$(ele).attr("data-userstatus");
        // if(OnLineStatus==1)
        // {//在线
        //     $(".webim-body-comtent-header > .imjs-userstatus").removeClass("webim-username-offline");
        //     $(".webim-body-comtent-header > .imjs-userstatus").addClass("webim-username-online");
        // }
        // else
        // {
        //     $(".webim-body-comtent-header > .imjs-userstatus").addClass("webim-username-offline");
        //     $(".webim-body-comtent-header > .imjs-userstatus").removeClass("webim-username-online");
        // }
    }

    /**
     * 点击表情时，出现表情对话框
     */
    $(".icon-emotions").on("click",function(){
        $("#imjs-emotion").css("display","block");

        $("body").bind("mousedown", onBodyQuantityDown);
    });

    /**
     * 点击表情上一页按钮时动作
     */
    $(".prevEmotions").on("click",function(){
        $(".prevEmotions").removeClass("left-arrow");
        $(".prevEmotions").addClass("left-arrow-no");

        $(".nextEmotions").removeClass("right-arrow-no");
        $(".nextEmotions").addClass("right-arrow");

        $(".page1").css("display","block");
        $(".page2").css("display","none");
    });
    /**
     * 点击表情下一页按钮时动作
     */
    $(".nextEmotions").on("click",function(){

        $(".prevEmotions").removeClass("left-arrow-no");
        $(".prevEmotions").addClass("left-arrow");

        $(".nextEmotions").removeClass("right-arrow");
        $(".nextEmotions").addClass("right-arrow-no");

        $(".page1").css("display","none");
        $(".page2").css("display","block");
    });

    /**
     * 隐藏表情菜单
     * @param event
     */
    function onBodyQuantityDown(event)
    {
        if (!($(event.target).parents("#imjs-emotion").length > 0))
        {
            hideQuantityMenu();
        }
    }

    function hideQuantityMenu()
    {
        $("#imjs-emotion").fadeOut("fast");
        $("body").unbind("mousedown", onBodyQuantityDown);
    }

    $(".ePanelarea > li > a").on("click",function(){
        var number=$(this).attr("emotionid");
        var imgele="<img src='images/emotion/"+number+".gif'>";

        //隐藏表情面板,如果这句注释，那么下面那句也要注释，否则会出现表情况隐藏不掉的问题
        $("#imjs-emotion").css("display","none");
        //因为上面已经消失了，所以这里绑定
        $("body").unbind("mousedown", onBodyQuantityDown);

        //现在就是点击了之后，直接在框中显示，以后再进行改进


        handleSendMessage(imgele); //发送消息
    });
});