
//********************************************************************************************
/**
 * the global Variable
 * 
 */
var password;

//********************************************************************************************
/**
 * 获取语言
 */
function getShowLanguage()
{
	var actionUrl = "client/getShowLanguage.action";
	$.ajax( { // 取语言
		url : actionUrl,
		type : "post",
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
				alert("请再试刷新一次");
			}
			else if(data.status=="500")
			{	
				alert("服务器崩溃了!!!!");
			}
			
		},
		success : function(data) 
		{
			insertLanguageInPage(data);
		}
	});// end of ajax
}

function insertLanguageInPage(data)
{

 
	var insertHtml="<ul>";
	var len=data.length;
	for(var i=0;i<len;i++)
	{
		var tempId=data[i].id;
		var tempName=data[i].foreignerName;
		if(tempId==selectLanguageId)//说明是用户选择的语言的id
		{
			insertHtml="<a href='javascritp:void(0)' class='downmenu'>"+tempName+"</a>"+insertHtml;
		}		
		else
		{
				insertHtml+="<li><a href='client/newCustomerRegister.action?languageId="+tempId+"'>"+tempName+"</a></li>";
		}
		
	}
	
	insertHtml+="</ul>";
	
	$(".languagedownmenu").append(insertHtml);

}
function getPassword(element)
{
	password=$.trim($(element).val());
	var flag=isPassword(password);
	if(!flag)
	{
		$("#password-tipbox").removeClass("hide");
		return false;
	}
	else
	{
		$("#password-tipbox").addClass("hide");
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

function checkUserName(element)
{
	var username=$.trim($(element).val());
	if(username==""||username==null||username==undefined)
	{
		$("#name-tipbox").removeClass("hide");
		return false;
	}
	else if(username.indexOf("@")>=0)
	{
		$("#name-tipbox").removeClass("hide");
		return false;
	}
	else
	{
		$("#name-tipbox").addClass("hide");
		return true;
	}
}

function checkIsMail(element)
{
	var checkpassword=$.trim($(element).val());
	var flag=isEmail(checkpassword);
	if(!flag)
	{
		$("#email-tipbox").removeClass("hide");
		return false;
	}
	else
	{
		$("#email-tipbox").addClass("hide");
		return true;
	}
	
}



function validate()
{
	if(!checkIsMail("#mail"))
		return;
	if(!checkUserName("#username"))
		return;
	if(!getPassword("#password"))
		return;
	if(!checkPassword("#checkpassw"))
		return;
	var checkcode=$("#checkcode").val()
	if(checkcode==null||checkcode==""||checkcode==undefined)
	{
		$("#checkcode-tipbox").removeClass("hide");
		return;
	}

	
	$("form:first").submit();//提交表单
}


