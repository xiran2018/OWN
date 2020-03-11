$(document).ready(function() 
{   //******************************************
	//delete the attribute values
/*	$(".close").on("click","a .close",
			function()
			{
				var spanElement=$(this).parent('.attr_value_span');
				spanElement.remove(); 
				return false;
			}
	);*/
	//******************************************

});// end of $(document).ready(function() {

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
				// alert(messageResourceErrorTips);
			}
			else if(data.status=="500")
			{	
				// alert(messageResourceErrorTips);
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
	
	$(".languagedownmenu").append(insertHtml);

}