///////////////////////////////////////////////global variables

//////////////////////////////////////////////////////////////
$(function() {
	miniLoginRegister();
});

/**
 * 注册用户登录事件
 */
function miniLoginRegister()
{
	$("#J_SubmitStatic").on("click",userLogin);  //点击登录时的注册事件
	$("#J_NickX1420787893107").on("click",clearUserName); //清空用户名的事件
	$(".ph-label").on("click",hiddenTip); //隐藏提示文字
	$("#J_CodeInput_i").on("focus",hiddenTip); //提示文字显示
	$("#J_CodeInput_i").on("blur",showTip); //提示文字显示
	// $('input[fs]').muiTip();
}

/**
 * 显示文字
 */
function showTip()
{
	var checkCode=$("#J_CodeInput_i").val();
	if(checkCode=="")
		$(".ph-label").css("display","block");
}
/**
 * 隐藏文字
 */
function hiddenTip()
{
	$(".ph-label").css("display","none");
	$("#J_CodeInput_i").focus();
}

/**
 * 加载详细信息
 * @param id
 */
function userLogin()
{
	$("#page2").css("display","none");//hide the login div
	$("#loading-login").css("display","block");//show the loading image
	
	var username=$.trim($("#TPL_username_1").val());
	var password=$.trim($("#TPL_password_1").val());
	var checkcode=$.trim($("#J_CodeInput_i").val());
	var actionUrl = "client/userLogin.action";
	var params={
		"type":1,
		"username":username,
		"password":password,
		"checkcode":checkcode,
	};
	$.ajax({
		url : actionUrl,
		type : "post",
		data :params,
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
				alert("please login again");
			}
			else if(data.status=="500")
			{	
				alert("sorry,the server has down!");
			}
			
		},
		success : function(data) 
		{
			if(data.loginFlag==3)
			{//用户名或者密码不对
				$("#l_f_code").css("display","none");
				$("#J_Message").css("display","block");
				if(data.loginTime>=3)
				{
					$("#l_f_code").css("display","block");
					$("#J_CheckCode_Message").css("display","none");
				}
				
				$("#page2").css("display","block");//show the login div
				$("#loading-login").css("display","none");//hidden the loading image
			}
			else if(data.loginFlag==2)
			{//log in success
				$("#page2").css("display","block");//show the login div
				$("#loading-login").css("display","none");//hide the loading image
				loginDialog.dialog( "close" );
			}
			else if(data.loginFlag==1)
			{//验证码不对
				$("#J_Message").css("display","none");
				
				$("#l_f_code").css("display","block");
				$("#J_CheckCode_Message").css("display","block");
				
				$("#page2").css("display","block");//show the login div
				$("#loading-login").css("display","none");//hidden the loading image
			}
		}
	});// end of ajax
}

function clearUserName()
{
	$("#TPL_username_1").val("").focus();
}