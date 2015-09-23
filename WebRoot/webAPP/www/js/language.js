/**
 * 获取语言
 */
function getShowLanguageApp()
{
	alert("start to excute!!!!!!");
	var actionUrl = "http://192.168.1.123/client/getShowLanguage.action";
	$.ajax( { // 取语言
		url : actionUrl,
		type : "get",
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
			else
			{
				alert("there is an errror!!!");
			}
		},
		success : function(data) 
		{
			alert("yes,it is success!!!");
			var insertHtml=insertLanguageInPage(data);
			alert(insertHtml);
		}
	});// end of ajax
}

function getShowLanguage(data)
{
	alert("yes,it is in getShowLanguage")
}


function insertLanguageInPage(data)
{

	var selectLanguageId=7;
	var customerRequestPage="7";
	
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
			if(customerRequestPage.indexOf("?") > 0)
			{//已经有了别的参数，需要加&
				insertHtml+="<li><a href='"+customerRequestPage+"&languageId="+tempId+"'>"+tempName+"</a></li>";
			}
			else
			{//没有别的参数，需要加？
				insertHtml+="<li><a href='"+customerRequestPage+"?languageId="+tempId+"'>"+tempName+"</a></li>";
			}
		}
		
	}
	
	insertHtml+="</ul>";
	
	return insertHtml;

}