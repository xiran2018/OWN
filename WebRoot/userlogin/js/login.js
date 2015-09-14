///////////////////////////////////////////////global variables

//////////////////////////////////////////////////////////////
$(function() {
	miniLoginRegister();
	userLoginResult();//显示登录结果
});

/**
 * 注册用户登录事件
 */
function miniLoginRegister()
{
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
function userLoginResult()
{
	if(loginFlag==3)
	{//用户名或者密码不对
		$("#l_f_code").css("display","none");
		$("#J_Message").css("display","block");
		if(loginTime>=3)
		{
			$("#l_f_code").css("display","block");
			$("#J_CheckCode_Message").css("display","none");
		}
		
		$("#page2").css("display","block");//show the login div
		$("#loading-login").css("display","none");//hidden the loading image
	}
	else if(loginFlag==1)
	{//验证码不对
		$("#J_Message").css("display","none");
		
		$("#l_f_code").css("display","block");
		$("#J_CheckCode_Message").css("display","block");
		
		$("#page2").css("display","block");//show the login div
		$("#loading-login").css("display","none");//hidden the loading image
	}
}

function clearUserName()
{
	$("#TPL_username_1").val("").focus();
}