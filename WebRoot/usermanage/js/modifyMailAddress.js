//********************************************************************************************
/**
 * the global Variable
 * 页面显示相关
 */
//********************************************************************************************

$(document).ready(function () {
	registerEventListerAddInPage();//给网页的元素添加注册事件，和分页没有关系，可以根据不同的情况删除该函数
});


function registerEventListerAddInPage()
{
	//添加邮寄地址事件
	$("#page960").on("click",".address-btn-enter",function(){
		
		
		
		var contactName=$.trim($("#contact-name").val());
		if(contactName==""||contactName==null)
		{
			$("#contact-name-tips").css({
				"display":"block"
			});//显示提示消息
			return;
		}
		else
		{
			$("#contact-name-tips").css({
				"display":"none"
			});//显示提示消息
		}
		
		var countryId=$.trim($("#country-region-select").val());
		if(countryId==""||countryId==null)
		{
			$("#country-id-tips").css({
				"display":"block"
			});//显示提示消息
			return;
		}
		else
		{
			$("#country-id-tips").css({
				"display":"none"
			});//显示提示消息
		}
		
		var streetAddress=$.trim($("#street-address").val());
		if(streetAddress==""||streetAddress==null)
		{
			$("#street-address-tips").css({
				"display":"block"
			});//显示提示消息
			return;
		}
		else
		{
			$("#street-address-tips").css({
				"display":"none"
			});//显示提示消息
		}
		var streetAddressOther=$.trim($("#streetAddressOther").val());
		
		var addressCity=$.trim($("#addressCity").val());
		if(addressCity==""||addressCity==null)
		{
			$("#address-city-tips").css({
				"display":"block"
			});//显示提示消息
			return;
		}
		else
		{
			$("#address-city-tips").css({
				"display":"none"
			});//显示提示消息
		}
		
		var adressPostalCode=$.trim($("#adressPostalCode").val());
		if(adressPostalCode==""||adressPostalCode==null)
		{
			$("#address-postal-tips").css({
				"display":"block"
			});//显示提示消息
			return;
		}
		else
		{
			$("#address-postal-tips").css({
				"display":"none"
			});//显示提示消息
		}
		
		var countryNumber=$.trim($("#countryNumber").val());
		var areaNumber=$.trim($("#areaNumber").val());
		var localNumber=$.trim($("#localNumber").val());
		
		var mobileInputEle=$.trim($("#mobile-input-ele").val());
		if(mobileInputEle==""||mobileInputEle==null)
		{
			$("#mobile-tips").css({
				"display":"block"
			});//显示提示消息
			return;
		}
		else
		{
			$("#mobile-tips").css({
				"display":"none"
			});//显示提示消息
		}
		
		var params={
				"id":editMailAddressId,
				"contactName":contactName,
				"countryId":countryId,
				"streetAddress":streetAddress,
				"streetAddressOther":streetAddressOther,
				"addressCity":addressCity,
				"adressPostalCode":adressPostalCode,
				"countryNumber":countryNumber,
				"areaNumber":areaNumber,
				"localNumber":localNumber,
				"mobileInputEle":mobileInputEle
		};
		
		updateMailAddressInfo(params);

		
	});
}

/**
 * 更新邮寄地址
 * @param params
 */
function updateMailAddressInfo(params)
{
	var actionUrl = "client-center/updateMailAddress.action";
	$.ajax( { 
		url : actionUrl,
		type : "post",
		data:params,
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
			alert("Modify MailAddress Success!");
		}
	});// end of ajax
}
