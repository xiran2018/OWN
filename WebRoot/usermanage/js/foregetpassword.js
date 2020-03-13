function checkMail(mail)
{
	var flag=isEmail(mail);
	if(!flag)
	{
		alert(messageResourceIsEmailTips);
		return false;
	}
	else
		return true;
	
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
		 alert(messageResourceInputEmailTips);
		 return;
	}
	 
	if(!checkMail(mail))//不是一个邮箱地址
		return;
	 
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
				alert(messageResourceNotHaveEmailTips);
			}
			else if(data.status=="500")
			{	
				// alert(messageResourceErrorTips);
			}
		},
		success : function(data) 
		{
			alert(messageResourceEmailSendTips);
//				window.opener = null;
//				window.open(' ','_self');
//				window.close();
			window.location="login.jsp";
		}
	});// end of ajax

}