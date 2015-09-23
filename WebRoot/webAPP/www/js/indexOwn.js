/**
 * Created by jql on 2015-09-17.
 */
// Wait for device API libraries to load

$(function() {
    onLoad();
    $(".mybutton").click(function(){
        //alert("i have click the button");
        getShowLanguageApp();
    });
});

function getMessageFromServer()
{
    var actionUrl=dsff;
    $.ajax({
        url : actionUrl,
        type : "post",
        dataType : "json",
        error : function() {
            alert("请求失败!!!!");
        },
        success : function(data) {
            alert("请求成功！");
            alert(data);
        }
    });
}

function onLoad() {
    document.addEventListener("deviceready", onDeviceReady, false);
}

// device APIs are available
//
function onDeviceReady() {
    // Now safe to use device APIs
    //alert("hello,it has already!!");
}