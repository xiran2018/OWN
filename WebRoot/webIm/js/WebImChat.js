//基于用户是否登录生成用户id
function getCustomeruserid()
{
	if(customeruserid==0)
		return customeruserid;
	var temp=getCookie("srcId");
	if(temp!="")
		return temp;
	if(customeruserid==null||customeruserid==undefined)
		return "noLogin"+getRandomString();
	else
		return customeruserid; //customeruserid在headermenu.jsp中
}
//基于用户是否登录生成用户名
function getCustomerusername()
{
	if(customerusername=="客服")
		return customerusername;
	var temp=getCookie("srcName");
	if(temp!="")
		return temp;
	if(customerusername==null||customerusername==undefined||customerusername=="null")
		return ("游客"+getRandomString());
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

var desId="0_0_0_0";//默认："0_0_0_0"表示是系统消息,0是系统管理员，点击相应的用户时候会改变
var desName="客服";//默认名称，点击相应的用户时候会改变


var messageComeIntervalId;//提示消息到来的interval Id

var s="有消息…".split("");
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

        var del=$("<em title='删除' class='webim-close' style='display: none;'>&nbsp;</em>");
        firstEle.append(del);

        var delA=$("<a style='display:none' title='删除' class='webim-close-enter'>删除</a>");
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
function showContent(talkid,srcContent,timeArgs)
{
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

        var contentTime=$("<span class='webim-times imjs-msg-time'></span>");
        contentTime.text(timeArgs);
        firstEle.append(contentTime);
        chatList.append(firstEle);
    }
}

/*
        sessid: 会话人的id，以此id作为key保存会话
        talkid：说话人的id

        生成保存内容的数据结构
     */
function saveContentFunction(sessid,talkid,content,timestamp)
{
    var ss=saveContent[sessid];
    if(ss==null||ss==undefined)
        saveContent[sessid]=[];
    var tripleContent={};
    tripleContent.talkid=talkid;
    tripleContent.content=content;
    tripleContent.timestamp=timestamp;

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

        //发送到对方客户端
        var message = {
            srcId:srcId,
            desId:desId,  //对方的id，0代表着系统管理员
            srcName:srcName,
            desName:desName,
            srcContent:content, //我所说的话
            desContent:content, //对方所说的话，为空
            time:getNowFormatDate(),
            message: content
        };
        chatsock.send(JSON.stringify(message));
        $("#imjs-textarea").val('').focus();
    }

    //自己发送的内容，添加到自己的窗口里
    function addToContentWindow()
    {
//        var content= $.trim($('#imjs-textarea').val());
//        showContent(srcId,content,getNowFormatDate());
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

//聊天点击时的各种事件
$(function() {
    // When we're using HTTPS, use WSS too.
    var ws_scheme = window.location.protocol == "https:" ? "wss" : "ws";
    chatsock = new ReconnectingWebSocket(ws_scheme + '://' + "13.114.104.139:8000" + "/chat" + "/"+srcId);
    //var chatsock = new ReconnectingWebSocket(ws_scheme + '://' + window.location.host + "/chat" + window.location.pathname);

    //接收到消息之后的处理
    chatsock.onmessage = function(message) {
        var data = JSON.parse(message.data); //{srcId:11,desId:22,srcContent:"dslsjf',desContent:"sjdf"},这样的形式
        var srcid=data.srcId;//消息的发送者
        var desid=data.desId; //消息的对话者

        //保存内容
        if(srcid!=srcId) //说明是接收到的别人发送的消息
        	saveContentFunction(srcid,srcid,data.srcContent,data.time);
        else//说明是接收到的自己发送的消息
        	saveContentFunction(desid,srcid,data.srcContent,data.time);

        var id="imjs-"+srcid;  //此说话用户的id
        var eles=$("#"+id); //此说话用户的元素
        //var desid=data.desId;
        if((srcId=="0"||srcId==0)&&srcid!=srcId) 
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
        		showContent(srcid,data.srcContent,data.time);
        }
        else if(srcid==desId)
        {//如果当前聊天窗口的id和接收到的消息的id一样，则说明是当前聊天窗口的用户发送过来的，显示发过来的内容，这个功能是针对后台的
            showContent(srcid,data.srcContent,data.time);
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
        $("#imjs-lianxiren").on("click",function(){
           handleRestoreDialog();
        });

        function  handleMinDialog()
        {
            $("#webim2").removeClass("imjs-open");
            $(".webim-body-comtent-header").css("display","none"); //隐藏用户列表
            $(".webim-user-list").css("display","none");
            $(".webim-body-content").css("display","none");
        }

        function handleRestoreDialog()
        {
            $("#webim2").addClass("imjs-open");
            $(".webim-body-comtent-header").css("display","block"); //隐藏用户列表
            $(".webim-user-list").css("display","block");
            $(".webim-body-content").css("display","block");
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
                 $(this).children(".webim-close").css("display","block");
             }
         }).on("mouseleave",".c-li",function(){
             var hasClassFlag=$(this).hasClass("webim-system-info");
             if(!hasClassFlag)
             {//不是系统消息
                 $(this).children(".webim-close").css("display","none");
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
                    showContent(ele.talkid,ele.content,ele.timestamp);
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
            var OnLineStatus=$(ele).attr("data-userstatus");
            if(OnLineStatus==1)
            {//在线
                $(".webim-body-comtent-header > .imjs-userstatus").removeClass("webim-username-offline");
                $(".webim-body-comtent-header > .imjs-userstatus").addClass("webim-username-online");
            }
            else
            {
                $(".webim-body-comtent-header > .imjs-userstatus").addClass("webim-username-offline");
                $(".webim-body-comtent-header > .imjs-userstatus").removeClass("webim-username-online");
            }
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
            var imgele="<img src='http://sta.ganjistatic1.com/src/tool/webim_v2/img/emotions/"+number+".gif'>";

            //隐藏表情面板,如果这句注释，那么下面那句也要注释，否则会出现表情况隐藏不掉的问题
            $("#imjs-emotion").css("display","none");
            //因为上面已经消失了，所以这里绑定
            $("body").unbind("mousedown", onBodyQuantityDown);

            //现在就是点击了之后，直接在框中显示，以后再进行改进


            handleSendMessage(imgele); //发送消息
        });
});