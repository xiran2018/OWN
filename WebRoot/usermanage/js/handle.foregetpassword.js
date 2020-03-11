/**
 * the global Variable
 * 
 */
var password;

/**
 * 重置密码
 */
function resetPassword()
{
	var actionUrl = "resetPassword.action";
	
	 var id=$.trim($("#userid").val());
	 var checkcodeString=$.trim($("#checkcodeforgetpass").val());
	 var password=$.trim($("#passw").val());
	 var checkpassw=$.trim($("#checkpassw").val());

	 
	 if(!getPassword("#passw"))
			return;

	 
	 if(!checkPassword("#checkpassw"))
	 {
		 alert("please input same string！");
		 return;
	 }
	 
	 var params=
	 {
		   "id":id,
		   "checkcode":checkcodeString,
           "passw":password
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
				alert(messageResourceLinkFailureTips);
			}
			else if(data.status=="500")
			{	
				// alert(messageResourceErrorTips);
			}
		},
		success : function(data) 
		{
			if(data=="0")
			{
				alert("Success！");
				window.location="login.action";
			}
			else if(data=="1")
			{
				alert("Sorry,retry later！");
			}
			else if(data=="2")
			{
				alert("Sorry,the Link has expired. Please request again！");
				window.location="foregetPassword.action";
			}
			else
			{//data=="3"
				alert("Sorry,there is something wrong！");
			}
				
		}
	});// end of ajax

}

function getPassword(element)
{
	password=$.trim($(element).val());
	var flag=isPassword(password);
	if(!flag)
	{
		alert("please meet the requirements of the password！");
		return false;
	}
	return true;
}

function checkPassword(element)
{
	var checkpassword=$.trim($(element).val());
	if(password!=checkpassword)
	{
		alert("please input same string！");
		return false;
	}
	return true;
} 