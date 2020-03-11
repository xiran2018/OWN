function checkIsMail(element)
{
	var checkpassword=$.trim($(element).val());
	var flag=isEmail(checkpassword);
	if(!flag)
	{
		alert("请输入正确的邮箱地址");
		$(element).focus();
		return;
	}
	
}

function isEmail(obj)
{   
    reg=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;   
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

function getPassword()
{
	var actionUrl = "getPassword.action";
	

	 var mail=$.trim($("#mail").val());

	 
	if(mail=="")
	{
		 alert("请输入邮箱");
		 return;
	}
	 

	 
	 var params=
	 {
            "mail":mail
	 };
	 
	$.ajax( { // 请求后台，给相应的邮箱发送邮件
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
				alert("没有此邮箱，请输入正确的邮箱");
			}
			else if(data.status=="500")
			{	
				alert("由于服务器原因失败，请稍后再试!!!!");
			}
		},
		success : function(data) 
		{
			alert("邮件已经发送，请登录邮箱修改密码！");
			//window.open(location, '_self').close();
//			window.opener = null;
//			window.open(' ','_self');
//			window.close();
			window.location="login.action";
		}
	});// end of ajax

}