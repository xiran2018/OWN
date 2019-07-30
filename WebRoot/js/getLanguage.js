/**
 * 此js被userlogin/login.jsp 引用
 */
//********************************************************************************************
/**
 * the global Variable
 * 
 */

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