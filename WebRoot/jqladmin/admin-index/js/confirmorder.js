///////////////////////////////////////////////global variables
//the following variables is for shipping-show
var countryIdNameMap={}; //save the map of countryId and Name

var mailAddressIdValueMap={}; //save the map of countryId and Name
var editMailAddressId=-1;//需要编辑的邮寄地址的id，如果点击编辑按钮的时候，该值会变为大于0的数值

//一下三个变量，保存getSelectShipName函数中得到的信息，以便在后面计算货运费用的时间的时候使用
var selectShip;  //货运名称
var selectShipFee;//货运费用
var selectShipTime;  //货运时间

var subtotalPrice=0;//货物（商品）的总价格
var shippingPrice=0;//货运的总价格

var messageArray={};//用户留言信息，key为商品id，value为留言信息	
///////////////////////////////////////////////end of global variables

$(document).ready(function () {
	eventRegister();//事件注册
	loadCartDetailedInfo(); //加载页面详细信息
});

function eventRegister()
{
	shippingClickEventRegister(); //货运方式事件注册
	shopCartQuanityClickEventRegister();  //购物车数量注册方式
	registShippingCountrySelectMenu();//货运国家改变注册事件
	editAddressClickEventRegister();//货运地址改变事件
	placeOrder();//确认订单事件
	couponClickEventRegister();//优惠券填入事件
}
/**
 * 优惠券和积分填入等事件
 */
function couponClickEventRegister()
{
	
}

/**
 * 填入积分
 * @param ele
 */
function  changeValue(ele)
{
	var tempValue=$(ele).val(); //输入的积分
	var tempTotalprice=subtotalPrice+shippingPrice; //商品价格+运费；
	var maxUseJifen=tempTotalprice/0.01; //可以使用的最多积分，是商品的总价
	var allHaveJifen=parseInt(jifen);
	if(Digit.checkIsInt(tempValue))
	{//是整数
		tempValue=parseInt(tempValue);
		if(tempValue>allHaveJifen)
		{
			alert("the value must be lower "+allHaveJifen);
			return;
		}
		else if(tempValue>maxUseJifen)
		{
			alert("the value must be lower "+maxUseJifen);
			return;
		}
		else
		{
			changeTotalPriceInPage(tempValue);
		}
	}
	else
	{
		alert("the value must be integer!!");
		$(ele).val(0);
	}
	
	
}

/**
 * 使用的积分多少
 * @param usejifen
 */
function changeTotalPriceInPage(usejifen)
{
	var subPrice=0.01*usejifen;  //使用积分之后，需要减免的费用
	var tempTotalprice=subtotalPrice+shippingPrice; //商品价格+运费；
	var allTotalFee=tempTotalprice-subPrice; //减去使用积分之后的费用
	
	var tempprice=currencyShowSymbol+" "+calculateFeeByExchangeRate(allTotalFee,currencyRate);//calculateFeeByExchangeRate in math.js
	$("#all-totalfee-show").html(tempprice);
}

/**
 * 确认订单
 */
function placeOrder()
{
	$("#page").on("click","#place-order-btn",function(event){
		
		var usejifen=$.trim($("#J_tjbToUse").val());

		var pids=availableProductShopcartIds.split(",");
		var len=pids.length;
		var message="";
		var tempTextAreaId="";
		var cid;
		for(var i=0;i<len;i++)
		{
			cid=pids[i];
			tempTextAreaId="messageToSupplier-item-"+cid;
			message=$("#"+tempTextAreaId).val();
			messageArray[cid]=message;
		}
		var messageArrayString=JSON.stringify(messageArray);
		var params={
				"mailAddressId":defaultMailAddressId,//邮寄地址
				"subtotalPrice":subtotalPrice,
				"shippingPrice":shippingPrice,
				"availableProductShopcartIds":availableProductShopcartIds,
				"leaveMessageString":messageArrayString,
				"usejifen":usejifen
				
		};
		generateOrder(params);
	});
}

/**
 * 生成订单
 */
function generateOrder(params)
{
		var actionUrl = "shopcart/place-order.action";
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
				var redirecthref="/payment-control/checkout.action?orderId="+data.orderId;
				window.location.href=redirecthref;
			}
		});// end of ajax
	

}

/**
 * 货运地址改变事件
 */
function editAddressClickEventRegister()
{
	//编辑货运地址
	$("#page").on("click",".edit-adress-btn",function(event){
		var selectMailAddressId=$(this).attr("data-addressid");
		editMailAddressId=selectMailAddressId;
		editAddressClickHandler(selectMailAddressId);
		event.stopPropagation(); //阻止冒泡到根元素，因为根元素也注册了点击事件
	});
	
	//选择其他地址的处理事件
	$("#page").on("click",".select-address-btn",function(){
		$(".address-item-box").removeClass("hide");//去除隐藏类
		$(this).addClass("return-address");
		$(this).html("Return to previous page");
	});
	
	//返回原来地址时的处理事件
	$("#page").on("click",".return-address",function(){
		$(".address-item-box").each(function(){
			if(!$(this).hasClass("selectedAddress"))
			{
				$(this).addClass("hide");
			}
		});
		$(this).removeClass("return-address");
		$(this).html("Select other addresses");
	});
	
	//选择其他地址的hover事件
	$("#page").on('mouseenter mouseleave',".address-item-box",function(){
		//console.log( event.type ); 可以根据  mouseover or mouseout 的值实现toggle的效果
		$(this).toggleClass("addressHover");//添加相应的css类
	});
	
	//注册点击事件
	$("#page").on('click',".address-item-box",function(event){
//		var target = event.target || event.srcElement;
//		if(!$(target).hasClass("edit-adress-btn"))
//		{
			var mailAddressId=$(this).attr("data-addressid");
			var tempHrefString='shopcart/confirmorder.action?availableProductShopcartIds='+availableProductShopcartIds+"&mailAddressId="+mailAddressId;
			window.location.href=tempHrefString;
//		}

	});
	
	//点击添加邮寄地址事件,显示对话框
	$("#page").on("click",".add-address-btn",function(){
	
		$("#edit-address").css({
			"display":"block"
		});//显示增加地址对话框
		
		$("#all-address-list").css({
			"display":"none"
		});//隐藏地址对话框
		
		$("#orders-mask").css({
			"display":"block"
		});//需要购物的物品变为不可编辑
		
	});
	
	//添加邮寄地址取消事件
	$("#page").on("click",".address-btn-cancel",function(){
	
		$("#edit-address").css({
			"display":"none"
		});//显示增加地址对话框
		
		$("#all-address-list").css({
			"display":"block"
		});//隐藏地址对话框
		
		$("#orders-mask").css({
			"display":"none"
		});//需要购物的物品变为不可编辑
		
	});
	
	
	//添加邮寄地址事件
	$("#page").on("click",".address-btn-enter",function(){
		
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
		if(editMailAddressId>0)
		{//添加邮寄信息
			addMailAddressInfo(params);
		}
		else
		{//更新邮寄信息
			updateMailAddressInfo(params);
		}
		
	});
	
}

function editAddressClickHandler(selectId)
{
	var rootEle=mailAddressIdValueMap[selectId];
	
	var mailAddress=rootEle.mailAddress;
	var shppingCountry=rootEle.shppingCountry;

	//contact-name
	var contactName=mailAddress.contactName;
	$("#contact-name").val(contactName);
	
	//streetAdress
	var streetAdress=mailAddress.streetAddress;
	$("#street-address").val(streetAdress);
	
	//streetAdress2
	var streetAdress2=mailAddress.streetAddress;
	$("#streetAddressOther").val(streetAdress2);
	
	//city
	var city=mailAddress.city;
	$("#addressCity").val(city);
	
	var zipCode=mailAddress.zipCode;
	$("#adressPostalCode").val(zipCode);

	//country
	var countryId=shppingCountry.id;
	$("#country-region-select").val(countryId);

	//tel
	var countryNumber=mailAddress.countryNumber;
	$("#countryNumber").val(countryNumber);
	
	var areaNumber=mailAddress.areaNumber;
	$("#areaNumber").val(areaNumber);
	
	var localNumber=mailAddress.localNumber;
	$("#localNumber").val(localNumber);
	
	
	//mobil
	var mobile=mailAddress.mobile;
	$("#mobile-input-ele").val(mobile);
	
	//显示增加对话框
	$("#edit-address").css({
		"display":"block"
	});//显示增加地址对话框
	
	$("#all-address-list").css({
		"display":"none"
	});//隐藏地址对话框
	
	$("#orders-mask").css({
		"display":"block"
	});//需要购物的物品变为不可编辑
	

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
			var redirecthref='shopcart/confirmorder.action?availableProductShopcartIds='+availableProductShopcartIds+"&mailAddressId="+data.id;
			window.location.href=redirecthref;
		}
	});// end of ajax
}

/**
 * 增加邮寄地址
 */
function addMailAddressInfo(params)
{
	var actionUrl = "client-center/addMailAddress.action";
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
			var redirecthref='shopcart/confirmorder.action?availableProductShopcartIds='+availableProductShopcartIds+"&mailAddressId="+data.id;
			window.location.href=redirecthref;
		}
	});// end of ajax
}

function shopCartQuanityClickEventRegister()
{
	
	$(".order-container").on("click",".product-quantity-input",function(){
		
		
		updateDlgEditQuantityInfo(this);//更新编辑对话框的数量信息
		
		var value=$.trim($(this).val());
		$("#txt-editable-quantity").val(value);
		
		//此元素相对于父元素id=orders-main的相对位置
		var x = $(this).position().top;
		var y = $(this).position().left;
		
		//id=orders-main元素相对于父元素id=page的相对位置
		var fx = $("#orders-main").position().top;
		var fy = $("#orders-main").position().left;
		
		//position()获取相对于它最近的具有相对位置(position:relative)的父级元素的距离，
		//如果找不到这样的元素，则返回相对于浏览器的距离。
		//offset()始终返回相对于浏览器文档的距离，它会忽略外层元素。
		
		
		var realtop=fx+x-1-6+"px";
		var realleft=fy+y-1-6-26+"px";
		
		$("#dlg-edit-quantity").css({
			"top":realtop,
			"left":realleft,
			"display":"block"
		});//显示改变数量对话框
		
		$("body").bind("mousedown", onBodyQuantityDown);//绑定事件：隐藏改变数量对话框的点击事件
	});
}

/**
 * 提交更新购物车数量的action时，检查数量是否符合要求
 */
function checkToSubmit()
{
	var inventory=$.trim($("#hid-product-id-quantity").val()); //库存
	var intInventory=parseInt(inventory);
	var inputQuantity=$.trim($("#txt-editable-quantity").val());  //实际填写的数量
	var intInputQuantity=parseInt(inputQuantity);
	if(Digit.checkIsInt(inputQuantity))
	{//是整数
		if(intInventory>=0)
		{
			if(intInventory<intInputQuantity)
			{
				alert("sorry,the stocks are not enough!");
				return;
			}
		}
		
		document.getElementById("dlg-edit-quantity").submit();
	}
	else
	{
		alert("the value must be integer!!");
		$(ele).val(0);
		return;
	}

}

/**
 * 删除购物车中的某一项
 * @returns
 */
function removeCartSubmit(ele)
{
	if(confirm("are you sure to delete the cart?"))
	{
		$(ele).parent(".remove-cart-product").submit();
		//document.getElementBy("remove-cart-product").submit();
	}
}

/**
 * 更新数量对话框中的信息
 */
function updateDlgEditQuantityInfo(ele)
{
	var shopCartId=$.trim($(ele).siblings(".hid-shopcart-id").val());
	$("#cartid").val(shopCartId);
	
	
	var inventory=$.trim($(ele).siblings(".hid-inventory").val()); //库存
	$("#hid-product-id-quantity").val(inventory);
	$("#inventory-value").html(inventory);
}
/**
 * 隐藏数量菜单
 */
function hideQuantityMenu() 
{
	$("#dlg-edit-quantity").fadeOut("fast");
	$("body").unbind("mousedown", onBodyQuantityDown);
}
function onBodyQuantityDown(event) 
{
	if (!($(event.target).parents("#dlg-edit-quantity").length > 0)) 
	{
		hideQuantityMenu();
	}
}

function shippingClickEventRegister()
{
	
	//点击货运按钮时出现货运信息
	$(".order-table-wrapper").on("click",".product-shipping-select",function(){		
		$(this).siblings(".pnl-shipping").css("display","");
		$("body").bind("mousedown", onBodyDown);
	});
	
	//点击取消按钮时隐藏货运信息
	$(".order-table-wrapper").on("click",".btn-cancel",function(){
		$(this).parents(".pnl-shipping").fadeOut("fast");
	});
	
}
/**
 * 隐藏货运菜单
 */
function hideMenu() 
{
	$(".pnl-shipping").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) 
{
	if (!($(event.target).parents(".pnl-shipping").length > 0)) 
	{
		hideMenu();
	}
}
/**
 * 加载页面详细的信息
 */
function loadCartDetailedInfo()
{
	insertMailAddress(mailAddressList,defaultMailAddressId);//添加邮寄地址信息
	insertShopCartItemsInPage(selectShopCartItemList); //添加需要购物的详细信息，selectShopCartItemList is in confirmorder.jsp
	insertShippingCountryInfoInPage(countryList,defaultShippingCountryId);//插入货运国家信息,countryList，defaultShippingCountryId is in confirmorder.jsp
	insertPriceInfo(); //插入价格信息
	insertCouponInfo();//插入优惠券和积分信息
}

function insertCouponInfo()
{
	$("#J_AvailableTjb").html(jifen);  //jifen is in confirmorder.jsp
	$("#J_MaxUsableTJB").html(jifen);
}

/**
 * 插入价格信息
 */
function insertPriceInfo()
{
	var tempprice=currencyShowSymbol+" "+calculateFeeByExchangeRate(subtotalPrice,currencyRate);//calculateFeeByExchangeRate in math.js
	$(".subtotal-price").html(tempprice);
	
	tempprice=currencyShowSymbol+" "+calculateFeeByExchangeRate(shippingPrice,currencyRate);
	$(".shipping-price").html(tempprice);
	
	var totalprice=subtotalPrice+shippingPrice;
	tempprice=currencyShowSymbol+" "+calculateFeeByExchangeRate(totalprice,currencyRate);
	$("#totalprice").html(tempprice);
	$("#all-totalfee-show").html(tempprice);
}

/**
 * 添加货运地址信息
 * showMailAddressId:初次加载页面需要显示的邮寄地址的id
 * @returns
 */
function insertMailAddress(mailAddressArray,showMailAddressId)
{
	var insertHtml="";
	var len=mailAddressArray.length;
	var rootObject;
	for(var i=0;i<len;i++)
	{
		var mailAddressVO=mailAddressArray[i];
		
		var mailAddress=mailAddressVO.mailAddress;
		var shppingCountry=mailAddressVO.shppingCountry;
		
		//id
		var mailAddressId=mailAddress.id;
		
		rootObject={};
		rootObject["mailAddress"]=mailAddress;
		rootObject["shppingCountry"]=shppingCountry;
		mailAddressIdValueMap[mailAddressId]=rootObject;
		
		
		if(mailAddressId==showMailAddressId)
		{
			insertHtml+="<div class='address-item-box selectedAddress' data-addressid='"+mailAddressId+"'>";
		}
		else
		{
			insertHtml+="<div class='address-item-box hide' data-addressid='"+mailAddressId+"'>";
		}
		
		insertHtml+="<div class='address-item-inner'>";
		if(mailAddressId==showMailAddressId)
		{
			insertHtml+="<input type='radio' checked='checked' name='addressId' class='select-radio-input' value='"+mailAddressId+"'>";
		}
		else
		{
			insertHtml+="<input type='radio'  name='addressId' class='select-radio-input' value='"+mailAddressId+"'>";
		}
		
		insertHtml+="<span class='select-icon'></span>";
		if(mailAddressId==showMailAddressId)
		{
			insertHtml+="<span class='ship-address-tips'>Ship to this address</span>";
		}
		
		insertHtml+="<dl>";
		//contact-name
		var contactName=mailAddress.contactName;
		insertHtml+="<dt class='contact-name'>"+contactName+"</dt>";
		
		//streetAdress
		var streetAdress=mailAddress.streetAddress;
		insertHtml+="<dd class='street-adress'>"+streetAdress+"</dd>";
		
		//streetAdress2
		var streetAdress2=mailAddress.streetAddress;
		insertHtml+="<dd class='street-adress2' >"+streetAdress2+"</dd>";
		
		//city
		var city=mailAddress.city;
		var zipCode=mailAddress.zipCode;
		insertHtml+="<dd><span class='city-text' >"+city+"</span>, <span class='zip-code-text'>"+zipCode+"</span></dd>";
	
		//country
		var countryName=shppingCountry.name;
		var countryId=shppingCountry.id;
		insertHtml+="<dd class='country-region-text'>"+countryName+"<input type='hidden' value='"+countryId+"' class='country-region-value'></dd>";
	
		//tel
		var countryNumber=mailAddress.countryNumber;
		var areaNumber=mailAddress.areaNumber;
		var localNumber=mailAddress.localNumber;
		
		insertHtml+="<dd>";
		
		insertHtml+="<span class='address-list-key'>Phone Number:</span>";
		insertHtml+="+ ";
		insertHtml+="<span class='country-number-text'>"+countryNumber+"</span>";
		insertHtml+="- ";
		insertHtml+="<span class='area-number-text'>"+areaNumber+"</span>";
		insertHtml+="- ";
		insertHtml+="<span class='local-number-text'>"+localNumber+"</span>";
		
		insertHtml+="</dd>";
		
		//mobil
		var mobile=mailAddress.mobile;
		insertHtml+="<dd><span class='address-list-key'>Mobile Number:</span><span class='mobile-number-text' data-val=''>"+mobile+"</span></dd>";
		
		insertHtml+="</dl>";
		insertHtml+="<div class='edit-address-btn'><a href='javascript:void(0);' class='edit-adress-btn' data-action='edit-adress' data-addressid='"+mailAddressId+"'>Edit</a></div>";
		insertHtml+="</div>";
		insertHtml+="</div>";
	}
	
	$(".address-list-main").append(insertHtml);
}

/**
 * 插入货运国家信息
 * countryShowId,第一次进入页面的时候，显示物流信息所属国家的id
 * @returns
 */
function insertShippingCountryInfoInPage(shippingCountryList,countryShowId)
{
	//首先获取第一次进入页面时，显示的是哪一个国家的物流信息
	
	var insertHtml="";
	var len=shippingCountryList.length;
	for(var i=0;i<len;i++)
	{
		var shippingCountry=shippingCountryList[i];
		var id=shippingCountry.id;
		var countryName=shippingCountry.name;
		countryIdNameMap[id]=countryName;
		
		if(countryShowId!=null&&countryShowId==id)
		{//有货运国家
			selectCountryId=id;
			selectCountryName=countryName;
			insertHtml+="<option selected='selected' value='"+id+"'>"+countryName+"</option>";
		}
		else 
		{
			insertHtml+="<option  value='"+id+"'>"+countryName+"</option>";
		}
	}
	
	$("#country-region-select").append(insertHtml);
	
}


/**
 * 插入购物车的具体信息
 * @param shopCartList
 */
function insertShopCartItemsInPage(shopCartList)
{
	var insertHtml="";
	var shopCartList = eval('(' + shopCartList + ')');
	var len=shopCartList.length;
	for(var i=0;i<len;i++)
	{
		var cartElement=shopCartList[i];
		var cartvo=cartElement.cartvo;
		var number=cartvo.productnumber;  //数量
		var cpi=cartElement.cpi;
		var skuvo=cartElement.skuvo;
		var pbvo=cartElement.pbvo;//基本信息
		var ssvo=cartElement.ssvo;//货运信息
		
		
		
		var pid=cartvo.productid;
		var productattrids=cartvo.productattrids;
		insertHtml+="<tr class='item-product' productid='"+pid+"'>";
		
		var cartid=cartvo.cartid;
		
		
		//商品图片等基本信息
		insertHtml+="<td width='740' class='order-product-info'>";
		
		//<!-- product item start-->
		insertHtml+="<ul class='item-details-list'>";
		insertHtml+="<input name='purchaseId' type='hidden' value='"+pid+"'>";//商品id
		
		//图片、名称
		
		insertHtml+="<li>";
		insertHtml+="<div class='item-details util-clearfix'>";
		insertHtml+="<a name='anchor-3001580401'></a>";
		//图片
		var image=cpi.productimageaddr;
		insertHtml+="<div class='pimg'>";
		insertHtml+="<a target='_blank' href='client/productShow.action?id="+pid+"'>";
		insertHtml+="<img  alt=''  width='80' height='80'  src='"+image+"'>";
		insertHtml+="</a>";
		insertHtml+="</div>";
		//商品名称
		var productname=cartvo.productname;
		insertHtml+=" <div class='p-info'>";
		
		insertHtml+="<div class='p-title'>";
		insertHtml+="<a target='_blank' href='client/productShow.action?id="+pid+"'>"+productname+"</a>";
		insertHtml+="</div>";
		
		
		//属性
		var pAttrList=cartElement.pAttrShowVOs;
		var attrLen=pAttrList.length;
		for(var j=0;j<attrLen;j++)
		{
			var attrEle=pAttrList[j];
			var attrname=attrEle.attrName;
			var attrValueName=attrEle.attrValueName;
			
			insertHtml+="<div class='p-sku'>";
			insertHtml+="<span class='p-keys'>"+attrname+":</span>";
			insertHtml+="<span class='p-value'>"+attrValueName+"</span>";
			insertHtml+="<span class='p-color-card sku-color-173'></span>";
			insertHtml+="</div>";
		}
		
		insertHtml+=" </div>";

		//数量
		var quantity=cartvo.productnumber;
		
		insertHtml+="<div class='p-extra'>";
		insertHtml+="<div class='p-price notranslate'>";
		insertHtml+="<input class='product-quantity-input ui-textfield ui-textfield-system' readonly='readonly' value='"+quantity+"'> ";
		insertHtml+="<span class='txt-unit-quantity'>piece </span>";
		
		//乘号
		insertHtml+="<span class='txt-multiply'>×</span>";
		
		//price
		var nowPrice=getNowPrice(cartvo,pbvo,skuvo);
		//单价
		insertHtml+="<span>"+currencyShowSymbol+" "+nowPrice+"</span>";  //currencyShowSymbol is in common/js/product.price.js
		
		//计算物品总价格
		var tempItemPrice=quantity*nowPrice;
		subtotalPrice+=tempItemPrice;
		
		//购物车id 
		insertHtml+="<input class='hid-shopcart-id' type='hidden' value='"+cartid+"' name='id'>";
		
		//计算库存数量  
		var storeNumber=getstoreNumber(cartvo,pbvo,skuvo);
		insertHtml+="<input class='hid-inventory' type='hidden' value='"+storeNumber+"'>";
		insertHtml+="</div>";
		insertHtml+="</div>";
		insertHtml+="</div>";
		
		
		//留言信息
		insertHtml+="<div class='p-message'>";
		insertHtml+="<div class='p-message-title'>Leave a message for this seller:</div>";
		
		var tempId="messageToSupplier-item-"+cartid;
		insertHtml+="<textarea name='messageToSupplier-item' id='"+tempId+"' cols='100' rows='2' class='message-text no-hit ui-textfield ui-textfield-system multiple'></textarea>";
		insertHtml+="<p class='message-text-tip'>Max. 1,000 English characters or Arabic numerals only. No HTML codes.</p>";
		insertHtml+="</div>";
		
		//<!-- product item end-->
		insertHtml+="</li>";
		insertHtml+="</ul>";
		insertHtml+="</td>";
		 
		
		insertHtml+="<td class='order-shipment-info'>";
		//货运信息  <!-- shipping start -->
		var shipName=getSelectShipName(cartvo,ssvo);
		if(shipName!=""&&shipName!=null)
		{
			insertHtml+="<div class='product-shipping-select notranslate'>";
			insertHtml+=shipName;//选择的货运信息
			insertHtml+="</div>";
			
			//money
//			var tempRealFee=calculateShipFeeInpage(selectShipFee,pbvo,number);
			
			var tempRealFee=calculateShippingFee(selectShipFee,pbvo,number); //calculateShippingFee in product.ship.js
			
			if(tempRealFee=="Free Shipping")
			{
				//具体的费用
				insertHtml+="<p class='free-shipping'>Free shipping</p>";
			}
			else
			{
				//计算总邮费
				shippingPrice+=tempRealFee;
				
				tempRealFee=calculateShippingFeeByExchangeRate(tempRealFee);
				
				//具体的费用
				insertHtml+="<p><span class='order-target notranslate'>"+currencyShowSymbol+" "+tempRealFee+"</span></P>";//currencyShowSymbol in product.price.js
			}
			
			
			
			//货运time
			var tempRealTime=calculateShippingTime(selectShipTime);  //calculateShippingTime in product.ship.js
			insertHtml+="<p class='ship-info'>Delivery Time:<span class='ship-value'>"+tempRealTime+" days </span></p>"

			
			//处理time
			insertHtml+="<p class='ship-info'>Processing Time:<span class='ship-value'>7 days </span></p>";
			
			//货运信息列表
			insertHtml+="<div class='pnl-shipping notranslate' style='display:none;z-index:99;'>";
			insertHtml+="<div class='inner'>";
			insertHtml+="<form action='shopcart/updateShipIdInConfirmOrder.action' method='get'>";
			insertHtml+="<ul>";
			var shipList=getShipList(cartvo,pbvo,ssvo);
			if(shipList!=""||shipList!=null)
			{
				//console.log(shipList);
				insertHtml+=shipList;//列表
			}
			insertHtml+="</ul>";
			
			
			insertHtml+="<div class='pnl-shipping-action util-clearfix'>";
			insertHtml+="<input type='hidden' name='cartid' value='"+cartid+"'>";
			insertHtml+="<input type='hidden' name='redirctURL'  id='redirctURL'  value='"+redirctURL+"'>";
			insertHtml+="<input type='submit' class='btn-ok' value=''><a class='btn-cancel'>Cancel</a>";
			insertHtml+="</div>";
			insertHtml+="</form>";
			
			insertHtml+="</div>";
			insertHtml+="</div>";
			
			insertHtml+="</td>";
		}
		else
		{
			insertHtml+="<td class='product-quantity item-product-info product-unavialable'>This product can't be shipped to the selected region</td>";
		}
		
		insertHtml+="</tr>";
	}
	
	$("#shopCartItems").append(insertHtml);
//	console.log("insertHtml="+insertHtml);
}

/**
 * 得到货运信息列表
 * @param cartvo
 * @param ssvo
 * @returns
 */
function getShipList(cartvo,pbvo,ssvo)
{
	insertHtml="";
	var tempShipId=selectShip.id;  //所选择的货运方式的id
	var number=cartvo.productnumber;  //数量
	var len=ssvo.length;
	for(var i=0;i<len;i++)
	{

		var shipEle=ssvo[i];
		var ship=shipEle.ship;
		var shipId=ship.id;
		var shipName=ship.name;
		
		var shipTime=shipEle.shipTime;
		var realTime=calculateShippingTime(shipTime);  //calculateShippingTime in product.ship.js
		
		var shipFee=shipEle.shipFee;
		var realFee=calculateShipFeeInpage(shipFee,pbvo,number);
		
		if(shipId!=tempShipId)
		{//说明改货运方式和选择的货运方式不同
			insertHtml+="<li>";
			insertHtml+="<label class='shipping-label util-clearfix' for='shipping-select-3001580401-1'>";
			
			insertHtml+="<span class='lbl-shipping-remaining'>"+realTime+"days</span>";
			
			insertHtml+="<span class='price lbl-shipping-price'>";
			if(realFee=="Free Shipping")
			{
				insertHtml+="<span class='value notranslate'>"+realFee+"<br></span>"; //currencyShowSymbol in product.price.js
			}
			else
			{
				insertHtml+="<span class='value notranslate'>"+currencyShowSymbol+" "+realFee+"<br></span>"; //currencyShowSymbol in product.price.js
			}
			insertHtml+="</span>";
			
			insertHtml+="<input type='radio' value="+shipId+" name='shippingid' >"+shipName+"";
			
			insertHtml+="</label>";
			insertHtml+="</li>";
		}
		else
		{//说明改货运方式和选择的货运方式相同
			var tempInsertHtml="";
			tempInsertHtml+="<li>";
			tempInsertHtml+="<label class='shipping-label util-clearfix' for='shipping-select-3001580401-1'>";
			
			tempInsertHtml+="<span class='lbl-shipping-remaining'>"+realTime+"days</span>";
			
			tempInsertHtml+="<span class='price lbl-shipping-price'>";
			if(realFee=="Free Shipping")
			{
				tempInsertHtml+="<span class='value notranslate'>"+realFee+"<br></span>"; //currencyShowSymbol in product.price.js
			}
			else
			{
				tempInsertHtml+="<span class='value notranslate'>"+currencyShowSymbol+" "+realFee+"<br></span>"; //currencyShowSymbol in product.price.js
			}
			tempInsertHtml+="</span>";
			
			tempInsertHtml+="<input type='radio' value="+shipId+" name='shippingid'  checked='true' >"+shipName+"";
			
			tempInsertHtml+="</label>";
			tempInsertHtml+="</li>";
			
			insertHtml=tempInsertHtml+insertHtml; //添加到第一项
		}//end of else
	}//end of for
	
	return insertHtml;
}
/**
 * 得到货运信息
 * @param cartvo
 * @param ssvo
 * @returns
 */
function getSelectShipName(cartvo,ssvo)
{
	var selectShipId=cartvo.shipid;
	var selectShipName="";
	if(ssvo!=null)
	{
		var len=ssvo.length;
		for(var i=0;i<len;i++)
		{
			var shipEle=ssvo[i];
			var ship=shipEle.ship;
			var shipId=ship.id;
			if(shipId==selectShipId)
			{//说明找到了相对应的货运方式
				selectShipName=ship.name;
				
				selectShip=ship;  
				selectShipFee=shipEle.shipFee;
				selectShipTime=shipEle.shipTime;
				break;
			}
		}
		
		if(i>=len)
		{//说明没有找到对应的方式,取第一个即可
			var shipEle=ssvo[0];
			var ship=shipEle.ship;
			selectShipName=ship.name;
			
			selectShip=ship;  
			selectShipFee=shipEle.shipFee;
			selectShipTime=shipEle.shipTime;
		}
	}
	return selectShipName;
}

/**
 * 得到现价格
 * @param cartvo
 * @param pbvo
 * @param skuvo
 * @returns
 */
function getOriginPrice(cartvo,pbvo,skuvo)
{
	var price;

	price=pbvo.p_originprice;

	
	//商品价格
	price=(price/currencyRate); //currencyRate in the headermenu.jsp
	price=Digit.round(price, 2);
	price=Digit.changeTwoDecimal(price);
	
	return price;
}

/**
 * 得到现价格
 * @param cartvo
 * @param pbvo
 * @param skuvo
 */
function getNowPrice(cartvo,pbvo,skuvo)
{
	var price;
	var skuid=cartvo.skuid;
	if(skuid==-1)
	{//说明不是sku商品
		price=pbvo.p_nowprice;
	}
	else
	{//是sku商品
		price=skuvo.price;

	}
	
	//商品价格
	price=(price/currencyRate); //currencyRate in the headermenu.jsp
	price=Digit.round(price, 2);
	price=Digit.changeTwoDecimal(price);
	
	return price;
}

/**
 * 得到库存数量
 * @param cartvo
 * @param pbvo
 * @param skuvo
 */
function getstoreNumber(cartvo,pbvo,skuvo)
{
	var storeNumber;
	var skuid=cartvo.skuid;
	if(skuid==-1)
	{//说明不是sku商品
		storeNumber=pbvo.p_storenumber;
	}
	else
	{//是sku商品
		var tempStoreNumber=pbvo.p_storenumber;
		var skuStoreNumber=skuvo.count;
		if(tempStoreNumber==-1&&skuStoreNumber==-1)
		{//说明是无限的
			storeNumber=-1;
		}
		else if(skuStoreNumber!=-1)
		{
			storeNumber=skuStoreNumber;
		}
		else
		{
			storeNumber=tempStoreNumber;
		}
	}
	return storeNumber;
}

/**
 *货运国家改变注册事件
 */
function registShippingCountrySelectMenu()
{
 
}