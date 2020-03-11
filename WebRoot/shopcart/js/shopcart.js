///////////////////////////////////////////////global variables
var p_minbuyamount=1;//最小购买量，默认为1
//the following variables is for shipping-show
var countryIdNameMap={}; //save the map of countryId and Name

var cartIdAllFee={};//保存每一个购物车中元素相应的id，以及对应的商品费用和运费

var selectShip;  //货运名称
var selectShipFee;//货运费用
var selectShipTime;  //货运时间
///////////////////////////////////////////////end of global variables

$(document).ready(function () {
	eventRegister();//事件注册
	loadCartDetailedInfo(); //加载页面详细信息，包括货运国家信息等
});

function checkSelectItem()
{
	var hrefString=$("#confirm-order").attr("href");
	if(hrefString==""||hrefString==null||hrefString==undefined)
	{
		alert(messageResourceconfirmOrderTips);
		return false;
	}
	else
	{
		window.location.href=hrefString;
	}
}

function eventRegister()
{
	shippingClickEventRegister(); //货运方式事件注册
	shopCartQuanityClickEventRegister();  //购物车数量注册方式
}

function shopCartQuanityClickEventRegister()
{
	
	$(".item-group-wrapper").on("click",".product-quantity-input",function(){


		
		updateDlgEditQuantityInfo(this);  //更新数量信息
		
		var value=$.trim($(this).val());
		$("#txt-editable-quantity").val(value);
		
		var x = $(this).position().top;  //获取相对最近的relative元素的相对位置
		var y = $(this).position().left;
		//position()获取相对于它最近的具有相对位置(position:relative)的父级元素的距离，
		//如果找不到这样的元素，则返回相对于浏览器的距离。
		//offset()始终返回相对于浏览器文档的距离，它会忽略外层元素。
		
		
		var realtop=x-1-6+"px";
		var realleft=y-1-6-26+"px";
		
		$("#dlg-edit-quantity").css({
			"top":realtop,
			"left":realleft,
			"display":"block"
		});
		
		$("body").bind("mousedown", onBodyQuantityDown);
	});
	
	//点击取消按钮
	$("#dlg-edit-quantity").on("click","#btn-cancel-quantity",function(){
		hideQuantityMenu();
	});
}

/**
 * 提交更新购物车数量的action时，检查数量是否符合要求
 */
function checkToSubmit()
{
	var inventory=$.trim($("#hid-product-id-quantity").val()); //库存
	var intInventory=parseInt(inventory);
	var productMinbuyamount=$("#hid-product-minbuyamount").val(); //最少购买数量
	var intProductMinbuyamount=parseInt(productMinbuyamount);
	
	var inputQuantity=$.trim($("#txt-editable-quantity").val());  //实际填写的数量
	var intInputQuantity=parseInt(inputQuantity);
	
	//最小购买量不够
	if(intProductMinbuyamount>=0)
	{
		if(intInputQuantity<intProductMinbuyamount)
		{
			alert("sorry,please buy "+intProductMinbuyamount+" products at least !");
			return;
		}
	}
	
	//库存数量不够
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
	var shopCartId=$.trim($(ele).siblings(".hid-shopcart-id").val()); //购物车Id
	$("#cartid").val(shopCartId);
	
	p_minbuyamount=$.trim($(ele).siblings(".hid-minbuyamount").val()); //最少购买数量
	$("#hid-product-minbuyamount").val(p_minbuyamount);
	
	
	var inventory=$.trim($(ele).siblings(".hid-inventory").val()); //库存
	$("#hid-product-id-quantity").val(inventory);
	if(inventory>0)
		$("#inventory-value").html(inventory);
	else
		$("#inventory-value").html("Not Limited");
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
	$(".item-group-wrapper").on("click",".product-shipping-select",function(){		
		$(this).siblings(".pnl-shipping").css("display","");
		$("body").bind("mousedown", onBodyDown);
	});
	
	//点击取消按钮时隐藏货运信息
	$(".item-group-wrapper").on("click",".btn-cancel",function(){
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
	var actionUrl = "shopcart/getCartShowDetailedInfo.action";
	var params={
		
	};
	$.ajax( { 
		url : actionUrl,
		type : "post",
		data:params,
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
			insertShippingCountryInfoInPage(data.sc,defaultShippingCountryId); //defaultShippingCountryId is in the cart.jsp
			insertShopCartItemsInPage(data.shopCartList);
		}
	});// end of ajax
}

/**
 * 插入购物车的具体信息
 * @param shopCartList
 */
function insertShopCartItemsInPage(shopCartList)
{
	var insertHtml="";
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
		insertHtml+="<tr class='item-product' productid='"+pid+"'  skuattr='"+productattrids+"'>";
		
		var cartid=cartvo.cartid;
		//选择按钮
		insertHtml+="<td class='fourColume1_1 mui_name'>";
		insertHtml+="<input onclick='selectOneElement(this)' type='checkbox' class='mui_select' keyid='"+cartid+"'>";
		insertHtml+="</td>";
		
		//商品图片等基本信息
		insertHtml+="<td class='product-info-detail'>";
		insertHtml+="<input class='hid-product-id' type='hidden' value='"+pid+"'>";//商品id
		
		//图片、名称
		
		insertHtml+="<dl>";
		//图片
		var image=cpi.productimageaddr;
		insertHtml+="<dt class='product-pic'>";
		insertHtml+="<a target='_blank' href='client/productShow.action?id="+pid+"'>";
		insertHtml+="<img class='product-pic-image' width='80' height='80' alt='' src='"+image+"'>";
		insertHtml+=" </a>";
		insertHtml+="</dt>";
		//商品名称
		var productname=cartvo.productname;
		insertHtml+="<dd class='product-link'>";
		insertHtml+="<a target='_blank' href='client/productShow.action?id="+pid+"' class='lnk-product-name'>"+productname+"</a>";
		insertHtml+="</dd>";
		
		insertHtml+="</dl>";
		
		//属性
		var pAttrList=cartElement.pAttrShowVOs;
		var attrLen=pAttrList.length;
		for(var j=0;j<attrLen;j++)
		{
			var attrEle=pAttrList[j];
			var attrname=attrEle.attrName;
			var attrValueName=attrEle.attrValueName;
			
			insertHtml+="<dl class='product-attribute'>";
			insertHtml+="<dt>"+attrname+":</dt>";
			insertHtml+="<dd>";
			insertHtml+="<span>"+attrValueName+"</span>";
			insertHtml+="</dd>";
			insertHtml+="</dl>";
		}
		
		insertHtml+=" </td>";

		//数量
		var quantity=cartvo.productnumber;
		
		insertHtml+="<td class='product-quantity'>";
		insertHtml+="<input readonly='readonly' value='"+quantity+"' class='product-quantity-input ui-textfield ui-textfield-system '>";
		insertHtml+="<span class='txt-unit-quantity'>"+messageResourcePiece+"</span>";
		insertHtml+="<input class='hid-shopcart-id' type='hidden' value='"+cartid+"' name='id'>";
		
		//计算库存数量
		var storeNumber=getstoreNumber(cartvo,pbvo,skuvo);
		insertHtml+="<input class='hid-inventory' type='hidden' value='"+storeNumber+"'>";
		
		//最少购买数量
		insertHtml+="<input class='hid-minbuyamount' type='hidden' value='"+pbvo.p_minbuyamount+"'>";
		
		// insertHtml+="<span class='stock-tips'>"+messageResourceStockTips+"</span>";
		insertHtml+=" </td>";
		
		//price
		var nowPrice=getNowPrice(cartvo,pbvo,skuvo);
		insertHtml+="<td class='product-price'>";
		insertHtml+="<span class='value notranslate'>"+currencyShowSymbol+" "+nowPrice+"</span>";  //currencyShowSymbol is in common/js/product.price.js
		insertHtml+="<span class='separator'>/</span>";
		insertHtml+="<span class='unit'>"+messageResourcePiece+"</span>";
		
		var tempTotalProductPrice=quantity*nowPrice;
		var tempCartPrice={};//存放商品的总价格和货运费用价格
		tempCartPrice.totalProcutPrice=tempTotalProductPrice;
		
		var originPrice=getOriginPrice(cartvo,pbvo,skuvo);
		insertHtml+=" <del class='product-quantity-comment'>"+currencyShowSymbol+" "+originPrice+"</del>";//原价格
		//insertHtml+="<span class='discount-count-down'>";
		//insertHtml+="<span class='discount'>5% OFF</span>";
		//insertHtml+="</span>";
		insertHtml+="</td>";
		
		//货运信息
		var shipName=getSelectShipName(cartvo,ssvo);
		if(shipName!=""&&shipName!=null)
		{
			insertHtml+="<td class='product-shipping '>";
			insertHtml+="<div class='mui-product-shipping'>";
			insertHtml+="<div class='product-shipping-select notranslate'>";
			insertHtml+=shipName;//选择的货运信息
			insertHtml+="</div>";
			
			//货运信息列表
			insertHtml+="<div class='pnl-shipping notranslate' style='display:none;z-index:5;'>";
			insertHtml+="<div class='inner'>";
			insertHtml+="<form action='shopcart/updateShipId.action' method='get'>";
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
			insertHtml+="<input type='submit' class='btn-ok' value=''><a class='btn-cancel'>Cancel</a>";
			insertHtml+="</div>";
			insertHtml+="</form>";
			insertHtml+="</div>";
			insertHtml+="</div>";
			insertHtml+="</div>";
			
			//money
			insertHtml+="<div class='product-shipping-cost'>";
			insertHtml+="<span class='currency'></span>";
			var tempRealFee=calculateShipFeeInpage(selectShipFee,pbvo,number);
			
			if(tempRealFee=="Free Shipping")
			{
				//具体的费用
				insertHtml+="<span class='value notranslate'>"+tempRealFee+"</span>"; //currencyShowSymbol in product.price.js
			}
			else
			{
				//具体的费用
				insertHtml+="<span class='value notranslate'>"+currencyShowSymbol+" "+tempRealFee+"</span>"; //currencyShowSymbol in product.price.js
			}
			insertHtml+="</div>";
			
			//货运费用信息
			tempCartPrice.totalShipPrice=tempRealFee;
			cartIdAllFee[cartid]=tempCartPrice;
			
			//货运time
			insertHtml+="<dl class='product-shipping-comment util-clearfix'>";
			insertHtml+="<dt>"+messageResourceDeliveryTime+":&nbsp;</dt>";
			var tempRealTime=calculateShippingTime(selectShipTime);  //calculateShippingTime in product.ship.js
			insertHtml+="<dd> "+tempRealTime+" "+messageResourceDays+"</dd>"; //时间
			insertHtml+="</dl>";
			
			//处理time
			insertHtml+="<dl class='product-shipping-comment util-clearfix'>";
			insertHtml+="<dt>"+messageResourceProcessingTime+":&nbsp;</dt>";
			insertHtml+="<dd>3-5 "+messageResourceDays+"</dd>";
			insertHtml+="</dl>";
			
			insertHtml+="</td>";
		}
		else
		{
			insertHtml+="<td class='product-quantity item-product-info product-unavialable'>"+messageResourceShipUnavialable+"</td>";
		}
		

		
		//操作
		insertHtml+="<td class='product-operate '>";
		insertHtml+="<div class='product-remove'>";
		insertHtml+="<form method='post' action='shopcart/deleteShopCartItem.action' class='remove-cart-product'>";
		insertHtml+="<input type='hidden' name='cartid' value='"+cartid+"'>";
		insertHtml+="<a href='javascript:void(0);'  onclick='removeCartSubmit(this);' class='remove-single-product'>" +
					messageResourceCartItemRemove+"</a>";
		insertHtml+="</form>";
		insertHtml+="</div>";
		insertHtml+="</td>";
		
		insertHtml+="</tr>";
		
		if(shipName==""||shipName==null)
		{
			//暂时不用这种方式显示了
//			insertHtml+="<tr>";
//			insertHtml+=" <td class='item-product-info-wrapper' colspan='4'>";
//			insertHtml+="<p class='ui-notice ui-notice-normal ui-notice-alert'>";
//			insertHtml+="<span class='ui-notice-body'>";
//			insertHtml+="This product can't be shipped to the selected region.";
//			insertHtml+="</span>";
//			insertHtml+="</p>";
//			insertHtml+="</td>";
//			insertHtml+="</tr>";
		}

	}
	
	$("#shopCartItems").append(insertHtml);
	//console.log("insertHtml="+insertHtml);
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
			insertHtml+="<label for='shipping-select-0-1' class='shipping-label util-clearfix'>";
			
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
			tempInsertHtml+="<label for='shipping-select-0-1' class='shipping-label util-clearfix'>";
			
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
		
		if(i!=0&&i>=len)
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
	price=(price*currencyRate); //currencyRate in the headermenu.jsp
	price=Digit.round(price, 2);
	price=Digit.changeTwoDecimal(price);
	
	return price;
}

/**
 * 得到现价格,已经用相应的汇率换算了
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
		if(price==0)//说明没有对这个sku进行价格赋值
			price=pbvo.p_nowprice;

	}
	
	//商品价格
	price=(price*currencyRate); //currencyRate in the headermenu.jsp
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
 * 得到二级分类
 * @param secondLevelList
 * createtime: null
description: "售前"
fatherid: null
id: 13
image: "upload/categoryImage/2014111116121862319.jpg"
keyword: "售前"
name: "sales"
pagename: null
status: null
title: "售前"
 *
 */
function getSecondNavInfoHtml(secondLevelList)
{
	var insertHtml="<div class='con'>";
	var len=secondLevelList.length;
	for(var i=0;i<len;i++)
	{
		
		var oneElement=secondLevelList[i];
		
		var pagename=oneElement.pagename;
		var name=oneElement.name;
		var id=oneElement.id;
		
		insertHtml+="<div><a title="+name+"  href="+pagename+"?id="+id+">"+name+"</a></div>";
			
	}
	insertHtml+="</div>";
	return insertHtml;
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
//		else if(countryShowId==null&&i==len-1)
//		{//说明没有，选择最后一个国家即可
//			selectCountryId=id;
//			selectCountryName=countryName;
//			insertHtml+="<option selected='selected' value='"+id+"'>"+countryName+"</option>";
//		}
		else 
		{
			insertHtml+="<option  value='"+id+"'>"+countryName+"</option>";
		}
	}
	
	$("#mui-shipping-country").append(insertHtml);
	registShippingCountrySelectMenu();
}

function registShippingCountrySelectMenu()
{
    $( "#mui-shipping-country" ).selectmenu({
        change: function( event, data ) {
        	selectCountryId=data.item.value;
        	var requestString="shopcart/changeCountry.action?id="+selectCountryId;
        	window.location.href=requestString;
            //requestShippingInfoByCountryIdAndTemplateId(selectCountryId,products.p_freight_templet);
          }//end of function
        })//end of selectmenu
    .selectmenu( "menuWidget" )
    .addClass( "overflow" );
}

/**
 * //点击某一个复选框时的后续动作,改变确认订单按钮的href属性值
 */
function checkboxChangeLister()
{
	var notDeliveryToCountryTips=false;//是否不能邮寄到相应国家
	var totalProductPrice=0;  //所有的商品费用
	var totalShipPrice=0;//所有的货运费用
	var availableProductShopcartIds="";
	//把所有选中的都加入链接地址
	$(".mui_select:checked").each(function(i){
		var cartId=$(this).attr("keyid");
		
		//计算货运费用等信息
		var tempCartPrice=cartIdAllFee[cartId];
		
		if(tempCartPrice==undefined||tempCartPrice==""||tempCartPrice==null)
		{
			notDeliveryToCountryTips=true;
			alert(messageResourceNotDeliveryToCountryTips);
			return;
		}
		
		totalProductPrice+=tempCartPrice.totalProcutPrice;
		if(tempCartPrice.totalShipPrice!="Free Shipping")
		{
			var tempString2Int=parseFloat(tempCartPrice.totalShipPrice);
			totalShipPrice+=tempString2Int;
		}
		
		if(availableProductShopcartIds=="")
		{
			availableProductShopcartIds=cartId;
		}
		else
		{
			availableProductShopcartIds+=","+cartId;
		}
	});
	
	$(".product-price-value").html(currencyShowSymbol+" "+calculateFeeByExchangeRate(totalProductPrice,1));//因为这个地方的价格已经经过了汇率计算，所以这个地方的汇率设定为1就可以了
	$(".product-ship-value").html(currencyShowSymbol+" "+calculateFeeByExchangeRate(totalShipPrice,1));
	var totalPrice=totalProductPrice+totalShipPrice;
	$(".product-price-total").html(currencyShowSymbol+" "+calculateFeeByExchangeRate(totalPrice,1));
	var hrefString="";
	if(!notDeliveryToCountryTips)
	{
		hrefString="shopcart/confirmorder.action?availableProductShopcartIds="+availableProductShopcartIds;
	}
	$("#confirm-order").attr("href",hrefString);
}