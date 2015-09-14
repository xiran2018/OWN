///////////////////////////////////////////////global variables
var skuAttrId=[];//just save the attrId that support sku
var attrNameIds=[]; //save the id of all attribute name
var attrIdNameObj={};//save the map of attrId and Name
var attrValueNameIds=[];
var attrValueIdNameObj={};//save the map of attrValueValueId and Name
var attrValueIdAttrIdObj={};//save the map of attrValueId and AttrId
var skuInfos={};//save the sku data of the product,such as:{"10;24;31;40": {price:366,count:46,image_addr:,sku_id:},***}
var skuFlag=false;//the flag means whether there is sku-info or not for the product
var shippingDialog;
var products;//save the basic info of product,it will be use in product.select.js
var loginDialog;// log in dialog

//the following variables is for shipping-show
var countryIdNameMap={}; //save the map of countryId and Name
var shipIdNameMap={}; //save the map of shipId and Name
var selectCountryId;//查看运费时，选择的货运国家的id
var selectCountryName;//查看运费时，选择的货运国家的名称
var selectShipId; //选择的货运方式id
var selectShipName; //选择的货运方式名称
var selectShipFee;//选择的货运方式的运费计算参数
var selectRealFee;//选择货运方式相应的运费
var selectRealTime;
var freeShipFlag=false;//是否找到了free shipping的选项
var selectCountryShippingInfo;//所选择的国家的物流信息和相应的运费以及时间信息
//价格符号
var currencyShowSymbol=currencyName+" "+currencySymbol;  //the variable:currencyName and currencySymbol in the headermenu.jsp

//点击货运方式时，暂存的选择的货运方式的id
var tempSelectShipId;

//////////////////////////////////////////////////////////////
$(function() {
	
	loadProductDetailInfo();
	productShowRegister();  //包含购物车添加事件
	registShippingEvent();//注册货运事件

});

/**
 * 加载商品详细信息
 */
function loadProductDetailInfo()
{
	loadProductImages(id);
	loadProductBasicInfo(id);
}

/**
 * 加载详细信息
 * @param id
 */
function loadProductBasicInfo(id)
{
	var actionUrl = "client/getProductBasicInfo.action";
	var params={"id":id};
	$.ajax({
		url : actionUrl,
		type : "post",
		data :params,
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
			products=data.productvo.products;
			selectCountryShippingInfo=data.ssvo;
			insertProductBasicInfoInPage(data.productvo.products);
			insertProductAttrsInfoInPage(data.productvo.pBasic_Attrs);//插入可选择的属性
			insertProductAttrs4InfoInPage(data.productvo.pBasic_Attrs4);//插入基本属性（商品详情中显示）
			insertProductAttrs13InfoInPage(data.productvo.pBasic_Attrs13);//插入基本属性
			genertSkuDataInfo(data.productvo.psku);
			insertShippingCountryInfoInPage(data.sc,defaultShippingCountryId); //defaultShippingCountryId is in the productshow.jsp
			insertShippingInfoInPage(data.ssvo,data.productvo.products);
			insertShowShippingInfoInPage();//插入显示的货运信息
		}
	});// end of ajax
}



/**
 * @param shippingInfoList,相应国家的物流列表
 * @param products ，产品基本信息
 *插入物流信息
 */
function insertShippingInfoInPage(shippingInfoList,products)
{
	var selectNumber=$("#buy-num").val(); //商品数量
	
	selectNumber=parseInt(selectNumber);
	
	freeShipFlag=false;//如果没有这句话，连续两次加载会出现选不中的情况，因为第一次已经为true了
	shipIdNameMap={	};//清空
	
	var insertHtml="";
	var len=shippingInfoList.length;
	if(len==0)
	{
		$("#mui-No-Shipping-Info").css("display","");
	}
	else
	{
		for(var i=0;i<len;i++)
		{
			var tempShipIdObj={};
			var shippingInfo=shippingInfoList[i];
			var ship=shippingInfo.ship;
			var shipId=ship.id;
			
			var shipName=ship.name;
			tempShipIdObj["name"]=shipName;
			
			var shipFee=shippingInfo.shipFee;
			tempShipIdObj["fee"]=shipFee;
			
			var realFee=calculateShippingFee(shipFee,products,selectNumber);//calculateShippingFee in product.ship.js
			if(realFee!="Free Shipping")
			{
				realFee=calculateShippingFeeByExchangeRate(realFee);
			}
//			currencyShowSymbol=currencyName+" "+currencySymbol;  //the variable:currencyName and currencySymbol in the headermenu.jsp
			
			//TIME
			var shipTime=shippingInfo.shipTime;
			tempShipIdObj["time"]=shipTime;
			
			shipIdNameMap[shipId]=tempShipIdObj;
			
			var realTime=calculateShippingTime(shipTime);  ////calculateShippingTime in product.ship.js
			
			insertHtml+="<tr><th>";
			if(selectShipId==undefined || selectShipId=="")
			{//说明是初次加载
				if(!freeShipFlag&&realFee=="Free Shipping")
				{
					insertHtml+="<input type='radio' name='shipping-company' data-id='"+shipId+"'  checked='checked'>";
				}
				else if(!freeShipFlag&&i==len-1)
				{//最后一个还是没有找到免费的那个货运方式
					insertHtml+="<input type='radio' name='shipping-company' data-id='"+shipId+"'  checked='checked'>";
				}
				else
				{
					insertHtml+="<input type='radio' name='shipping-company' data-id='"+shipId+"'>";
				}
			}
			else if(selectShipId==shipId)
			{//说明不是初次加载，已经被加载过一次了，也就是已经选择了一次货运方式
				insertHtml+="<input type='radio' name='shipping-company' data-id='"+shipId+"'  checked='checked'>";
			}
			else
			{
				insertHtml+="<input type='radio' name='shipping-company' data-id='"+shipId+"'>";
			}
			insertHtml+="</th>";
			insertHtml+="<td>"+shipName+"</td>";
			insertHtml+="<td>"+realTime+"days</td>";
			insertHtml+="<td>";
			if(selectShipId==undefined || selectShipId=="")
			{//说明是初次加载
				if(realFee!="Free Shipping")
				{
					if(!freeShipFlag&&i==len-1)
					{//最后一个还是没有找到免费的那个货运方式
						selectShipId=shipId;
						selectShipName=shipName;
						selectShipFee=shipFee;
						selectRealFee=realFee;
						selectRealTime=realTime;
						freeShipFlag=true;
					}
					insertHtml+="<div class='shipping-cost'><strong>"+currencyShowSymbol+" "+realFee+"</strong></div>";
				}
				else
				{
					if(!freeShipFlag)
					{//说明前面已经找到了免运费方式，这里不需要改变了
						selectShipId=shipId;
						selectShipName=shipName;
						selectShipFee=shipFee;
						selectRealFee=realFee;
						selectRealTime=realTime;
						freeShipFlag=true;
					}
					
					insertHtml+="<div class='shipping-cost'><strong>"+realFee+"</strong></div>";
				}
			}
			else
			{//说明不是初次加载
				if(realFee!="Free Shipping")
				{
					insertHtml+="<div class='shipping-cost'><strong>"+currencyShowSymbol+" "+realFee+"</strong></div>";
				}
				else
				{
					insertHtml+="<div class='shipping-cost'><strong>"+realFee+"</strong></div>";
				}
			}
			
			insertHtml+="</td></tr>";
		}
	}

	$("#mui-shipping-info").empty();
	$("#mui-shipping-info").append(insertHtml);
	

}

/**
 * 增加或者减少数量时重新计算运费信息，在商品展示的右边显示
 */
function calculateShipFeeInpage()
{
	var selectNumber=$("#buy-num").val(); //商品数量
	var realFee=calculateShippingFee(selectShipFee,products,selectNumber); //calculateShippingFee in product.ship.js
	if(realFee!="Free Shipping")
	{
		realFee=calculateShippingFeeByExchangeRate(realFee);
		
		var tempHtml=currencyShowSymbol+" "+realFee;
		$("#shipping-cost").children(".shipping-real-cost").html(tempHtml);
	}
}

/**
 * 在商品展示的右边插入货运信息
 */
function insertShowShippingInfoInPage()
{
	$("#shipping-country").html(selectCountryName);
	if(selectShipName!=undefined&&selectShipName!=null)
	{
		$("#shipping-company").html(selectShipName);
		showShippingInfo();
	}
	else
	{
		hideShippingInfo();
	}
	var tempHtml="";
	if(selectRealFee==undefined||selectRealFee==null)
	{
		tempHtml="Can't Delivery";
	}
	else if(selectRealFee=="Free Shipping")
	{
		tempHtml="Free Shipping";
	}
	else
	{
		tempHtml=currencyShowSymbol+" "+selectRealFee;
	}
	$("#shipping-cost").children(".shipping-real-cost").html(tempHtml);
	$("#shipping-delivery-day").html(selectRealTime);
}

/**
 * 国家没有可达性信息
 * 隐藏元素
 */
function hideShippingInfo()
{
	$("#shipping-company-info").css("display","none");//隐藏货运公司信息
	$("#product-info-shipping-sub").css("display","none");//隐藏货运时间信息
}

/**
 * 国家有可达性信息
 * 显示元素
 */
function showShippingInfo()
{
	$("#shipping-company-info").css("display","");//隐藏货运公司信息
	$("#product-info-shipping-sub").css("display","");//隐藏货运时间信息
}



/**move to the product.ship.js
 * 计算邮费
 * @param shippingInfoList,相应国家的物流列表
 * @param products ，产品基本信息
 * @returns
 */
//function calculateShippingFee(shipFee,products)
//{
//	var realFee;
//	var shipStyle=shipFee.shippingStyle;
//	if(shipStyle==0)
//	{//免邮费
//		realFee="Free Shipping";
//		
//	}
//	else
//	{//自定义
//		var selectMode=shipFee.selectMode;
//		if(selectMode==1)
//		{//标准
//			realFee=shipFee.standardFee;
//		}
//		else
//		{//自定义
//			var selectQwpattern=shipFee.selectQwpattern;
//			if(selectQwpattern==1)
//			{//数量
//
//				clMin=shipFee.clMin;
//				clMax=shipFee.clMax;
//				clPrice=shipFee.clPrice;
//				clAddNum=shipFee.clAddNum;
//				clAddPrice=shipFee.clAddPrice;
//				var selectNumber=$("#buy-num").val(); //商品数量
//				if(selectNumber<clMax)
//				{//在首重的数量范围之内
//					realFee=shipFee.clPrice;
//				}
//				else
//				{
//					var addNumber=selectNumber-clMax;
//					var addPrice=addNumber*clAddPrice;
//					realFee=addPrice+shipFee.clPrice;
//				}
//			}
//			else
//			{//重量
//				
//				weightEnd0=shipFee.weightEnd0; //首重
//				weightPrice0=shipFee.weightPrice0; //首重运费
//				weightEnd1=shipFee.weightEnd1;  //续重最高重量
//				weightInterval1=shipFee.weightInterval1;  //每增加的重量
//				weightPrice1=shipFee.weightPrice1;  //增加多少钱
//				var selectNumber=$("#buy-num").val(); //商品数量
//				if(selectNumber==null||selectNumber==undefined)
//					selectNumber=1;
//				var pweight=products.p_weight; //商品重量
//				var totalWeight=pweight*selectNumber; //总重量
//				if(totalWeight<weightEnd0)
//				{//在首重范围之内
//					realFee=shipFee.weightPrice0;
//				}
//				else
//				{
//					var addWeight=totalWeight-weightEnd0;
//					var addedPrice=(addWeight/weightInterval1)*weightPrice1;
//					realFee=addedPrice+shipFee.weightPrice0;
//				}
//			}
//		}
//		
//	}
//	
//	return realFee;
//}
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

/**
 * 产生sku信息
 * 
 */
function genertSkuDataInfo(pskuArray)
{
	var len=pskuArray.length;
	for(var i=0;i<len;i++)
	{
		var pskuEle=pskuArray[i];
		var psku=pskuEle.psku;
		
		var tempSkuValue={};
		var count=psku.count;
		tempSkuValue.count=count;
		var image_addr=psku.image_addr;
		tempSkuValue.image_addr=image_addr;
		var price=psku.price;
		tempSkuValue.price=price;
		var product_id=psku.product_id;
		tempSkuValue.product_id=product_id;
		var sku_id=psku.sku_id;
		tempSkuValue.sku_id=sku_id;
		
		
		
		var skuAttrValues=pskuEle.skuAttrValues;
		var skuAttrValuesLen=skuAttrValues.length;
		var tempSkuKey="";
		for(var j=0;j<skuAttrValuesLen;j++)
		{
			var skuAttrValueEle=skuAttrValues[j];
			var attr_value_id=skuAttrValueEle.attr_value_id;
			if(tempSkuKey=="")
			{
				tempSkuKey=attr_value_id;
			}
			else
			{
				tempSkuKey+=";"+attr_value_id;
			}
			
			
		}
		
		skuInfos[tempSkuKey]=tempSkuValue;
		
	}
	
	if(!($.isEmptyObject(skuInfos)))  //在jquery。js中
	{
		skuFlag=true;
	}
	
	productSelectAttrValue();//the function is in the product.select.js
}



/**
 * insert product attrs info in the page
 * the input_style of  attrs is 4
 * @param attr2
 */
function insertProductAttrs4InfoInPage(attr4)
{
	var insertAttrsHtml="";
	var len=attr4.length;
	for(var i=0;i<len;i++)
	{
		var attrEle=attr4[i];
		
		var attrName=attrEle.attrName;
		var attrValueEle=attrEle.attrValues;

		var attrValueName=attrValueEle.attrValueName;
		
		insertAttrsHtml+="<li title="+attrValueName+">"+attrName+":"+ attrValueName+"</li>";
		
	}
	
	$("#attributes-list").prepend(insertAttrsHtml);
}

/**
 * insert product attrs info in the page
 * the input_style of  attrs is 1 or 3
 * @param attr2
 */
function insertProductAttrs13InfoInPage(attr2)
{
	var insertAttrsHtml="";
	var len=attr2.length;
	if(len>0)
	{
		$("#text-ul").css("display","");
	}
	for(var i=0;i<len;i++)
	{
		var attrEle=attr2[i];
		
		var attrName=attrEle.attrName;
		
		
		insertAttrsHtml+="<li  class='text-li'>";
		insertAttrsHtml+="<div class='dt'>"+attrName+"：</div>";
		insertAttrsHtml+="<div class='text-dd'>";
		
		var attrValueEle=attrEle.attrValues;

		var attrValueName=attrValueEle.attrValueName;
		//insertAttrsHtml+="<div class='item sku' data-value='"+attrId+":"+attrValueId+"'><b></b>";
		insertAttrsHtml+=attrValueName;
		insertAttrsHtml+="</div>";
		
		
		//insertAttrsHtml+="</div>";
		insertAttrsHtml+="</li>";
		
	}
	
	$("#text-ul").prepend(insertAttrsHtml);
}

/**
 * insert product attrs info in the page
 * the input_style of  attrs is 2
 * @param attrs
 */
function insertProductAttrsInfoInPage(attrs)
{
	var insertAttrsHtml="";
	var len=attrs.length;
	for(var i=0;i<len;i++)
	{
		var attrEle=attrs[i];
		var attrId=attrEle.attrId;
		attrNameIds.push(attrId);
		
		var attrName=attrEle.attrName;
		attrIdNameObj[attrId]=attrName;
		
		var isSku=attrEle.is_sku;
		if(isSku==1)
		{//支持sku
			skuAttrId.push(attrId);
		}
		
		insertAttrsHtml+="<li  class='choose-color-shouji'>";
		insertAttrsHtml+="<div class='dt'>"+attrName+"：</div>";
		insertAttrsHtml+="<div class='dd'>";
		
		var attrValues=attrEle.attrValues;
		var attrValuesLen=attrValues.length;
		for(var j=0;j<attrValuesLen;j++)
		{
			var attrValueEle=attrValues[j];
			var attrValueId=attrValueEle.attrValueId;
			attrValueNameIds.push(attrValueId);
			attrValueIdAttrIdObj[attrValueId]=attrId;
			var attrValueName=attrValueEle.attrValueName;
			attrValueIdNameObj[attrValueId]=attrValueName;
			insertAttrsHtml+="<div class='item sku' data-value='"+attrId+":"+attrValueId+"'><b></b>";
			insertAttrsHtml+="<a href='javascript:void(0);' title='"+attrValueName+"'>";
			insertAttrsHtml+="<i>"+attrValueName+"</i>";
			insertAttrsHtml+="</a>";
			insertAttrsHtml+="</div>";
		}
		
		insertAttrsHtml+="</div>";
		insertAttrsHtml+="</li>";
		
	}
	
	$("#choose").prepend(insertAttrsHtml);
	

}

/**
 * insert product basic info 
 * @param products
 */
function insertProductBasicInfoInPage(products)
{

	var p_freemail=products.p_freemail;
	var p_id=products.p_id;
	var p_jifen=products.p_jifen;
	var p_storenumber=products.p_storenumber;
	var p_minbuyamount=products.p_minbuyamount;
	var p_weight=products.p_weight;
	var p_name=products.p_name;
	var p_nowprice=products.p_nowprice;
	var p_originprice=products.p_originprice;
	var product_desc=products.product_desc;
	var product_detail_desc=products.product_detail_desc;
	var title=products.title;
	var keywords=products.keywords;
	var description=products.description;
	
	//商品名称和描述
	$("#name").children("h1").html(p_name);
	$("#product-desc").html(product_desc);
	
	//价格符号
	var currencyShowSymbol=currencyName+" "+currencySymbol;  //the variable:currencyName and currencySymbol in the headermenu.jsp
	$("#pop-origin-price-symbol").html(currencyShowSymbol);
	$("#pop-discount-price-symbol").html(currencyShowSymbol);
	
	//商品价格
	var pop_origin_price=(p_originprice/currencyRate);//currencyRate in the headermenu.jsp
	pop_origin_price=Digit.round(pop_origin_price, 2);
	
	pop_origin_price=Digit.changeTwoDecimal(pop_origin_price);
	
	$("#pop-origin-price").html(pop_origin_price);
	
	var sku_discount_price=(p_nowprice/currencyRate);
	sku_discount_price=Digit.round(sku_discount_price, 2);
	
	
	sku_discount_price=Digit.changeTwoDecimal(sku_discount_price);
	
	$("#sku-discount-price").html(sku_discount_price);
	
	
	//商品详情
	$("#product_detail_desc").html(product_detail_desc);
	
	//title
	document.title=title;
	//$("title").html(title);
	
	var keywordsMeta="<meta name='Keywords' content='"+keywords+"' >";
	$('head').append(keywordsMeta);
	
	
	var descriptionMeta="<meta name='Description' content='"+description+"' >";
	$('head').append(descriptionMeta);
}

/**
 * 加载图片信息
 * @param id
 */
function loadProductImages(id)
{
	var actionUrl = "client/getProductImageInfo.action";
	var params={"id":id};
	$.ajax( {
		url : actionUrl,
		type : "post",
		data :params,
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
			insertProductImageInPage(data);
		}
	});// end of ajax
}
/**
 * 插入图片
 * 
 * @param data
 */
function insertProductImageInPage(data)
{
	var insertHtml="";
	var images=data.pimg;
	var len=images.length;
	for(var i=0;i<len;i++)
	{
		var ele=images[i];
		var imageAddr=ele.imageAddr;
		insertHtml+="<li><img  class='' src='"+imageAddr+"' width='50' height='50' ></li>";
		var imageSort=ele.imageSort;
		if(imageSort==1)
		{
			//$("#product-big-img").attr("src",imageAddr);
			mui_ProductBigImage(imageAddr); //mui_replaceSmallImage is in product.image.js
		}
	}
	
	$(".lh").append(insertHtml);//插入图片
	$("#spec-n1").mui_zoom({markSize : [175, 175],markSizeFlag: true});
	$("#preview").mui_productSmallImagePlay();

}


//第一次刚在显示的时候的图片
function mui_ProductBigImage (src) {
	//the real width and height of the image
	var img = new Image();
	img.onload = function(){
		var imageWidth = img.width;
		var imageHeight = img.height;
		var widthZoom=imageWidth/350;
		var heightZoom=imageHeight/350;
		var relativeWidth,relativeHeight;
		if(widthZoom>heightZoom)
		{
			relativeWidth=imageWidth/widthZoom;
			relativeHeight=imageHeight/widthZoom;
		}
		else
		{
			relativeWidth=imageWidth/heightZoom;
			relativeHeight=imageHeight/heightZoom;
		}	
		//console.log("widthZoom="+relativeWidth+",heightZoom="+relativeHeight);
		//set width and height of the image element
		if(isNaN(relativeWidth))
			relativeWidth=350;
		if(isNaN(relativeHeight))
			relativeWidth=350;
		$("#product-big-img").attr('width',relativeWidth+"px");
		$("#product-big-img").attr('height',relativeHeight+"px");
		$("#product-big-img").attr('src',src);
	};
	img.src =src ;

}

/**
 * 注册事件
 */
function productShowRegister()
{
	productShowShippingRegister();
	loginDialogRegister();
	addToCartRegister();
}

/**
 * add to cart
 */
function addToCartRegister()
{
	$("#InitCartUrl").click(function(){
		var actionUrl = "client/addToCart.action";
		
		 var count=$.trim($("#buy-num").val());
		 count=parseInt(count);

		 var selectAttrCount=allSelectIds.length; //选择的属性值的数量
		 var realAttrCount=attrNameIds.length;//实际属性的数量
		 var cssStyel={
				 "border": "2px solid",
		 		 "border-color": "#C76767"
		 };
		 if(selectAttrCount<realAttrCount)	
		 {
			 $("#choose").css(cssStyel);
			 return;
		 }
		 var attrStrings=allSelectIds.join("|");
		 var skuStrings=selectedIds.join("|");
		 

		var minBuyCount=products.p_minbuyamount;  //最少购买量
		if(count<minBuyCount) alert("please buy "+minBuyCount+"products at least");
		
		var sku_id=-1;
		var skuImageAttr="";
		if(skuFlag)
		{//get the sku_id
			sku_id=SKUResult[selectedIds.join(';')].sku_id;
			skuImageAttr=SKUResult[selectedIds.join(';')].imageAddr;
			if(skuImageAttr==null || skuImageAttr=="")
			{
				skuImageAttr="";
			}
		}
		 
		 var params=
		 {
			  "count":count,
	          "id":products.p_id,
	          "sku_id":sku_id,
	          "skuImageAttr":skuImageAttr,
	          "shippingid":selectShipId,
	          "name":products.p_name,
	          "price":products.p_nowprice,
	          "attrStrings":attrStrings,
	          "skuStrings":skuStrings
		 };
		 
		$.ajax( { //加入购物车
			url : actionUrl,
			type : "post",
			data:params,
			dataType : "json",
			error : function(data) 
			{
				alert("sorry,the server has some problems,please contact the website owner,thank you !");
			},
			success : function(data) 
			{
				if(data.registerFlag==0)
				{
					loginDialog.dialog( "open" );
				}
				else
				{
					alert("add to cart success！");
				}
			}
		});// end of ajax
	});
	
}

function loginDialogRegister()
{
	loginDialog = $("#minilogin-dialog").dialog({
		  dialogClass: "userLoginDialog",
	      autoOpen: false,
	      closeText: "hide",
	      resizable: true,
	      minHeight:350,
	      height: 350,
	      maxHeight:350,
	      width: 400,
	      minWidth: 400,     
	      modal: true,
	      buttons: {
	       /*"ok": userLogin*/
	      },
	      close: function() {
	      }
	    });

}
function userLogin()
{
	 var actionUrl = "client/userLogin.action";
	
	 var count=$.trim($("#buy-num").val());
	 count=parseInt(count);

	 var selectAttrCount=selectedIds.length; //选择的属性值的数量
	 var realAttrCount=attrNameIds.length;//实际属性的数量
	 var cssStyel={
			 "border": "2px solid",
	 		 "border-color": "#C76767"
	 };
	 if(selectAttrCount<realAttrCount)	
	 {
		 $("#choose").css(cssStyel);
		 return;
	 }
	 var attrStrings=selectedIds.join("|");
	 

	var minBuyCount=products.p_minbuyamount;  //最少购买量
	if(count<minBuyCount) alert("please buy "+minBuyCount+"products at least");
	 
	 var params=
	 {
		  "count":count,
         "id":products.p_id,
         "name":products.p_name,
         "price":products.p_nowprice,
         "attrStrings":attrStrings
	 };
	 
	$.ajax( { //加入购物车
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			alert("sorry,the server has some problems,please contact the website owner,thank you !");
		},
		success : function(data) 
		{
			if(data.registerFlag==0)
			{
				$("#page2").css("display","block");//show the login div
				$("#loading-login").css("display","none");//hide the loading image
				loginDialog.dialog( "open" );
			}
			else
			{
				alert("add to cart success！");
			}
		}
	});// end of ajax
}
function productShowShippingRegister()
{
	shippingDialog = $("#mui-shipping").dialog({
	      autoOpen: false,
	      closeText: "hide",
	      resizable: true,
	      minHeight:440,
	      height: 440,
	      maxHeight:440,
	      width: 730,
	      minWidth: 730,     
	      modal: true,
	      buttons: {
	       "ok": modifyShippingInfoInPage
	      },
	      close: function() {
//	        form[ 0 ].reset();
//	        allFields.removeClass( "ui-state-error" );
	      }
	    });
	
	$("#shipping-link").click(function(){
		insertShippingInfoInPage(selectCountryShippingInfo,products);
		shippingDialog.dialog( "open" );
	});
}

function modifyShippingInfoInPage()
{
	var selectNumber=$("#buy-num").val(); //商品数量
	 selectNumber=parseInt(selectNumber);
	
	if(selectCountryId!=0&&selectCountryId!=null&&selectCountryId!=undefined)
	{
		//country
		selectCountryName=countryIdNameMap[selectCountryId];
	}
	
	if(tempSelectShipId!=0&&tempSelectShipId!=null&&tempSelectShipId!=undefined)
	{
		//ship
		selectShipId=tempSelectShipId;
		
		var tempMapObj=shipIdNameMap[selectShipId];
		selectShipName=tempMapObj["name"];
		

		
		//fee
		var tempShipFee=tempMapObj["fee"];
		var realFee=calculateShippingFee(tempShipFee,products,selectNumber);
		if(realFee!="Free Shipping")
		{
			realFee=calculateShippingFeeByExchangeRate(realFee);
		}
		selectRealFee=realFee;
		selectShipFee=tempShipFee;
		
		//TIME
		var tempShipTime=tempMapObj["time"];
		var realTime=calculateShippingTime(tempShipTime);
		selectRealTime=realTime;
	}
		//show in page
		insertShowShippingInfoInPage();
		
		//dialog close
		shippingDialog.dialog("close");
	
}

//move to the product.ship.js
//function calculateShippingTime(tempShipTime)
//{
//	var realTime=tempShipTime.shippingTime;
//	if(realTime==null||realTime==undefined||realTime=="")
//		realTime="6-30";
//	return realTime;
//}

function registShippingCountrySelectMenu()
{
    $( "#mui-shipping-country" ).selectmenu({
        change: function( event, data ) {
        	selectShipId="";
        	selectCountryId=data.item.value;
            requestShippingInfoByCountryIdAndTemplateId(selectCountryId,products.p_freight_templet);
          }//end of function
        })//end of selectmenu
    .selectmenu( "menuWidget" )
    .addClass( "overflow" );
}

function requestShippingInfoByCountryIdAndTemplateId(countryId,templetId)
{
	var actionUrl = "client/requestShippingInfoByCountryIdAndTemplateId.action";
	 
	 var params=
	 {
		  "id":countryId,
          "templateId":templetId
	 };
	 
	$.ajax( { // 修改物流信息
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			alert("get shipping data error!!");
		},
		success : function(data) 
		{
			selectCountryShippingInfo=data.ssvo;
			insertShippingInfoInPage(data.ssvo,products);
		}
	});// end of ajax
}

//////////////////////////////////////////以下是关于物流信息的操作////////////////////////////////////////
function registShippingEvent()
{
	$("#mui-shipping-info").on("change","input[name='shipping-company']",function() {
	    tempSelectShipId =$("input[name='shipping-company']:checked").attr("data-id");
	});
}

//////////////////////////////////////////end of 关于物流信息的操作////////////////////////////////////////