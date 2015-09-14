//********************************************************************************************
/**
 * the global Variable
 * 
 */
var password;

//********************************************************************************************
function getPassword(element)
{
	password=$.trim($(element).val());
	var flag=isPassword(password);
	if(!flag)
	{
		$("#password-tipbox").removeClass("hide");
		return fasle;
	}
	else
	{
		$("#password-tipbox").addClass("hide");
		return true;
	}
}



function isPassword(obj)
{   
    reg=/^[\w]{6,12}$/;   
   if(!reg.test(obj))
   {        
	   return false;
    }
   else
    {   
       return true;
    }   
}  

function checkPassword(element)
{
	var checkpassword=$.trim($(element).val());
	if(password!=checkpassword)
	{
		$("#confirm-password-tipbox").removeClass("hide");
		return false;
	}
	else
	{
		$("#confirm-password-tipbox").addClass("hide");
		return true;
	}
}

$(document).ready(function () {
	registerEventListerAddInPage();//给网页的元素添加注册事件，和分页没有关系，可以根据不同的情况删除该函数
});

/**
 * 清空各个内容框的内容
 */
function clearInput()
{
	$("#password").val("");
	$("#checkpassw").val("");
	$("#curpassword").val("");
}

function registerEventListerAddInPage()
{
	$("#page960").on("click","#form-submit-btn",resetPassword);

}
function resetPassword()
{
	
	var actionUrl = "client-center/changePasswordSecurity.action";
	
	 var id=$.trim($("#userid").val());
	 var curpassword=$.trim($("#curpassword").val());
	 var password=$.trim($("#password").val());
	 var flag=getPassword("#password");
	 if(!flag)
		 return;//输入的密码不符合要求
	 flag=checkPassword("#checkpassw");
	 if(!flag)
		 return;//两次输入的密码不一致

	 
	 var params=
	 {
		   "id":id,
           "curpassword":curpassword,
           "password":password
	 };
	 
	$.ajax( { // 修改语言
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			alert("sorry,try again!!");
		},
		success : function(data) 
		{
			if(data=="4")
			{
				$("#curpassword-tipbox").removeClass("hide");
			}
			else
			{
				alert("success！");
			}	
		}
	});// end of ajax
}