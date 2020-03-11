$(document).ready(function() 
{   
	getShowCurrency();

});// end of $(document).ready(function() {

/**
 * 获取货币
 */
function getShowCurrency()
{
	var actionUrl = "client/getShowCurrency.action";
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
			insertCurrencyInPage(data);
		}
	});// end of ajax
}

function insertCurrencyInPage(data)
{

 
	var insertHtml="<ul>";
	var len=data.length;
	for(var i=0;i<len;i++)
	{
		var tempId=data[i].idcurrency;
		var tempName=data[i].currencyname;
		if(tempId==selectCurrencyId)//说明是用户选择的货币的id
		{
			insertHtml="<a href='javascritp:void(0)' class='downmenu'>"+tempName+"</a>"+insertHtml;
		}		
		else
		{
			if(customerRequestPage.indexOf("?") > 0)
			{//已经有了别的参数，需要加&
				insertHtml+="<li><a href='"+customerRequestPage+"&currencyId="+tempId+"'>"+tempName+"</a></li>";
			}
			else
			{//没有别的参数，需要加？
				insertHtml+="<li><a href='"+customerRequestPage+"?currencyId="+tempId+"'>"+tempName+"</a></li>";
			}
		}
		
	}
	
	insertHtml+="</ul>";
	
	
	$(".currencydownmenu").append(insertHtml);

}