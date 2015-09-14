/**
 * 重置密码
 */
function resetPassword()
{
	var actionUrl = "resetPassword.action";
	
	 var id=$.trim($("#userid").val());
	 var passw=$.trim($("#passw").val());
	 var checkpassw=$.trim($("#checkpassw").val());

	 
	 if(passw=="")
	{
			 alert("请输入密码");
			 return;
	}
	 
	 if(checkpassw=="")
	 {
		 alert("请确认密码");
		 return;
	 }
	 


	 
	 var params=
	 {
		   "id":id,
           "passw":passw
	 };
	 
	$.ajax( { //重置密码
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
				alert("链接已经失效，请重新获取密码!!!!");
			}
			else if(data.status=="500")
			{	
				alert("由于服务器原因，修改密码失败!!!!");
			}
		},
		success : function(data) 
		{
			alert("修改密码成功！");
			window.location="login.jsp";
		}
	});// end of ajax

}
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
		alert("请输入符合要求的密码");
//		$(element).focus();
	}
}



function isPassword(obj)
{   
    reg=/^[\w]{6,12}$/;   
   if(!reg.test(obj))
   {        
//        $("#test").html("<b>请输入正确的邮箱地址</b>");   
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
		alert("两次输入的密码不一致");
//		$("#passw").focus();
		return;
	}
} 