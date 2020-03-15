///////////////////////////////////////////////global variables
//the following variables is for shipping-show

var productAmount=0;//商品总价
var shippingCost=0; //运费总价
var  allRealTotal; //商品总价+运费总价-jinfen，该项费用，不包含调整的价格
var allTotal;//商品总价+运费总价-jinfen-调整的价格


//一下三个变量，保存getSelectShipName函数中得到的信息，以便在后面计算货运费用的时间的时候使用
	
///////////////////////////////////////////////end of global variables

///////////////////////////////////////临时的全局变量，以后可能还是会更改////////////////////////////////////////
var currencyShowSymbol="USD $";
var currencyRate=1;

///////////////////////////////////////临时的全局变量，以后可能还是会更改////////////////////////////////////////

$(document).ready(function () {
	eventRegister();//事件注册
	showOrderDetail(orderList);
	
});


function eventRegister()
{
	changePriceDialog();//修改价格
	orderInfoClickEventRegister();
}

function changePriceDialog()
{
	dialog = $("#modifyw").dialog({
	      autoOpen: false,
	      closeText: "hide",
	      height: "auto",
	      width: "500px",
	      modal: true,
	      buttons: {
	       "确定": modifyPrice,
	       "取消": function() {
	          dialog.dialog( "close" );
	        }
	      },
	      close: function() {
//	        form[ 0 ].reset();
//	        allFields.removeClass( "ui-state-error" );
	      }
	    });
	
	$(".order-operate").on("click","#change_pay",function(){
		dialog.dialog( "open" );
	});
}

/**
 * 修改价格
 */
function modifyPrice()
{
	var orderId=$("#orderId").val();
	var currencyId=$("#currencyId").val();
	var changePrice=$("#sellerDiscount").val();
	var discountReason=$("#sellerDiscountText").val();
	
	if(checkInputChangePrice(changePrice))
	{//输入的数值校验通过
		saveModifyPrice(currencyId,orderId,changePrice,discountReason);
	}
	else
	{
		alert("请输入正确的数值！！");
	}
}

/**
 * 保存给用户的折扣信息
 * @param orderId 订单id
 * @param changePrice 价格-10，或者+20
 * @param discountReason 原因
 */
function saveModifyPrice(currencyId,orderId,changePrice,discountReason)
{
	var actionUrl="saveDiscountInfoForOrder.action";

	var params=
	{
		"orderId":orderId,
		"reduceFee":changePrice, 
		"discountReason":discountReason,
		"currencyId":currencyId
	};
	
	$.ajax( { // 获取信息
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
//				alert("服务器原因，获取信息失败，请稍后再试!!!!");
			}
			else if(data.status=="500")
			{	
				alert("Sorry,please try again!!!!");
			}
		},
		success : function(data) 
		{
			if(data.errCode=="200")
			{
				dialog.dialog( "close" );
				alert("修改成功！！");
				location.reload();
			}
			else
			{
				alert("请稍后重试");
			}
			
		}
	});// end of ajax
}



/**
 * 显示订单详细信息
 */
function showOrderDetail(olist)
{
	productDetail(olist);//订单中的商品信息
	
	paymentDetail(olist);//订单中的付款信息
}

/**
 * 显示订单商品详细信息
 */
function productDetail(olistInfo)
{
	var htmldata=buildUpInformation(olistInfo);  //构建具体需要显示的信息

	document.getElementById("listshowID").innerHTML=htmldata;
	
	totalAmountInPage(olistInfo);//页面中显示总的信息
	
}

/**
 * 页面中显示总的价格信息
 */
function totalAmountInPage(orderShowvo)
{
	//汇率等信息
	currencyele = orderShowvo.currency;
	var orderCurrencyShowSybol = currencyele.currencyname + " "+currencyele.currencysymbol;
	// var orderCurrencyRate = orderShowvo.order.currencyrate;
	var orderCurrencyRate = 1;
	productAmount = (parseFloat(orderShowvo.order.countprice)-parseFloat(orderShowvo.order.mailfee)).toFixed(2)
	// var productAmountToShow=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(productAmount,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
	var productAmountToShow=orderCurrencyShowSybol+" "+productAmount
	$(".ProductAmount").html(productAmountToShow);
	// var shippingCostToShow=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(shippingCost,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
	shippingCost = parseFloat(orderShowvo.order.mailfee).toFixed(2)
	var shippingCostToShow=orderCurrencyShowSybol+" "+shippingCost
	$(".ShippingCost").html(shippingCostToShow);
	var allTotal=parseFloat(productAmount)+parseFloat(shippingCost); //商品费用+运费
	// var allTotalToShow=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(allTotal,orderCurrencyRate);
	var allTotalToShow=orderCurrencyShowSybol+" "+parseFloat(allTotal).toFixed(2)
	$(".TotalAmount").html(allTotalToShow);
}



/**
 * 该函数的作用是构建具体需要显示的信息
 * @param entireTransInfoArgs
 * @returns {String}
 * 
 */
function  buildUpInformation(entireTransInfoArgs)
{
	var html = "";
	html+=generateXiangXiInfo(entireTransInfoArgs.order,entireTransInfoArgs.odsvo,entireTransInfoArgs.uinfo,entireTransInfoArgs.currency);//获取订单的详细信息（主要是商品信息），参数是一个list，代表各个商品
	return html;
}

/**
 * 生成需要在表格中显示的具体信息
 * 参数格式为：
 */
function generateXiangXiInfo(order,odsvoList,uinfo,currencyArgs)
{
	var html="";
	var len=odsvoList.length;
	var orderCurrencyShowSybol = currencyArgs.currencyname + " "+currencyArgs.currencysymbol;
	// var orderCurrencyRate = order.currencyrate;
	// var orderCurrencyRate = 1;
	var orderCurrencyRate = order.productCurrencyRate;
	for(var i=0;i<len;i++)
	{
		odsvo=odsvoList[i];//商品详情
		od=odsvo.od;//某一个商品详情
		cpi=odsvo.cpi;//商品图片地址
		var usermessage=od.usermessage;
		if(usermessage==""||usermessage==null)
		{
			html+="<tr class='order-bd' id='item"+od.id+"'>";
		}
		else
		{
			html+="<tr class='order-bd  has-comment' id='item"+od.id+"'>";
		}
		//宝贝描述信息
		html+=" <td  class='baobei'>";
		html+="<a class='pic s50' href='client/productShow.action?id="+od.id+"' title='' hidefocus='true' target='_blank'> "; //商品地址
		var productimageaddr="";
		if(cpi!=null)
		{
			productimageaddr=cpi.productimageaddr;
		}
		html+="<img src='"+productimageaddr+"' alt=''>";//图片地址
		html+=" </a>";
		//描述
		html+="<span class='desc'>";
		html+="<a href='client/productShow.action?id="+od.id+"' target='_blank' class='baobei-name' productid='"+od.id+"' title='"+od.productname+"'>"+od.productname+"</a>";
		html+="</span>";
		
		//属性信息
		html+="<div class='spec'>Properties: ";
		html+=getProductProperties(odsvo.odpa);//商品属性信息
		html+="</div>";
		//seller info
		html+="<div class='seller-sign'>("+uinfo.username+")</div>";
		html+="<div class='other-info'></div>";
		html+="</td>";
		//price

		// var tempprice=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(od.price,orderCurrencyRate);//calculateFeeByExchangeRate in math.js

		var productPrice = parseFloat(calculateFeeByExchangeRate(od.price,orderCurrencyRate)).toFixed(2)
		var tempprice=orderCurrencyShowSybol+" "+productPrice;//calculateFeeByExchangeRate in math.js

		html+="<td  class='price'>"+tempprice+"</td>";
		//数量
		html+="<td  class='quantity'>"+od.ordercount+"</td>";
		
		//支付总金额
		//price
		// var tempAmount=od.price*od.ordercount;
		productPrice = parseFloat(productPrice)
		var tempAmount=productPrice*od.ordercount;
		productAmount=productAmount+tempAmount//商品总价格
		// var tempAmountEx= parseFloat(calculateFeeByExchangeRate(tempAmount,orderCurrencyRate)).toFixed(2)
		var tempAmountEx= parseFloat(tempAmount).toFixed(2)
		var tempAmountPrice=orderCurrencyShowSybol+" "+tempAmountEx;//calculateFeeByExchangeRate in math.js
		// var tempAmountPrice=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(tempAmount,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
		html+="<td class='amount'>";
		html+="<span>"+tempAmountPrice+"</span>";
		html+="</td>";
		
		//交易状态
		html+="<td class='trade-status'>";
		html+="<span>"+convertPayment(order.paymenttype)+"</span>";
		html+="</td>";
		
		var rowspanlen;
		if(usermessage==""||usermessage==null)
		{
			rowspanlen=1;
		}
		else
		{
			rowspanlen=2;
		}
		
		var ship=odsvo.ship;//某一个商品详情
		//货运类型
		html+="<td rowspan='"+rowspanlen+"' class='shipping'>";
		html+="<p class='ship-type'><strong class='order-target'>";
		html+=ship.name;
		html+="</strong></p>";
		//货运价格
		var shipfee=od.shipfee;
		var tempShipFeePrice="Free Shipping";
		if(shipfee!=""&&shipfee!=null)
		{
			shippingCost=shippingCost+shipfee;//货运总价格
			// tempShipFeePrice=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(shipfee,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
			var tempShipEx=parseFloat(calculateFeeByExchangeRate(shipfee,orderCurrencyRate)).toFixed(2);
			tempShipFeePrice=orderCurrencyShowSybol+" "+tempShipEx
		}
		html+="<p class='ship-price'>";
		html+="<span class='ship-free'>"+tempShipFeePrice+"</span>";
		html+="</p>";
		//time
		var shiptime=od.shiptime;
		if(shiptime=="")
		{
			shiptime="15-60";
		}
		html+="<p class='ship-info'>";
		html+="Estimated Delivery Time:<span class='ship-value'>"+shiptime+" Days</span>";
		html+="</p>";
		//process time
		html+="<p class='ship-info'>";
		html+="Processing Time:<span class='ship-value'>6 Days</span>";
		html+="</p>";
		
		html+="</td>";
		html+="</tr>"
		
			
			
		//user message
		if(usermessage!=""&&usermessage!=null)
		{
			html+="<tr class='comment-tr'>";
			html+="<td colspan='5'>";
			html+=" <div class='comment-cell'>";
			html+="<em>Comments:</em>";
			html+=usermessage;
			html+="</div>";
			html+="</td>";
			html+="</tr>";
		}
	}
	return html;
}

/**
 * 
 * @param order
 */
function convertPayment(paymenttype)
{
	if(paymenttype==0||paymenttype==null||paymenttype==""||paymenttype==undefined)
		return "No Payment";
	else if(paymenttype==1)
		return "PayPal Payment";
}

/**
 * 得到商品属性信息
 */
function getProductProperties(attrList)
{
	var html="";
	var len=attrList.length;
	for(var i=0;i<len;i++)
	{
		var attrEle=attrList[i];
		var attrvalue=attrEle.attrvalue;
		if(i==0)
		{
			html="<span class='val'>"+attrvalue+"</span>";
		}
		else
		{
			html+="+"+"<span class='val'>"+attrvalue+"</span>";
		}
	}
	return html;
}

/**
 * 显示订单金额详细信息
 */
function paymentDetail(olistInfo)
{
	// allTotal=productAmount+shippingCost; //商品费用+运费
	var allTotal=parseFloat(productAmount)+parseFloat(shippingCost); //商品费用+运费

	//汇率等信息
	currencyele = olistInfo.currency;
	var orderCurrencyShowSybol = currencyele.currencyname + " "+currencyele.currencysymbol;
	var orderCurrencyRate = 1;
	// var orderCurrencyRate = olistInfo.order.currencyrate;
	// var orderCurrencyRate = olistInfo.currency.currencyrate;


	//使用的积分
	var jifen=olistInfo.order.usejifen;
	allTotal=allTotal-(jifen*0.01);//总价格减去积分
	allRealTotal=allTotal;
	$(".allRealTotal").html(orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(allRealTotal,orderCurrencyRate));//修改价格框中的实际价格
	$(".Point").html(jifen);
	
	//给用户减免或者增加的费用
	var reduceFee=olistInfo.order.reducefee;
	var realReduceFee=0;//实际给用户增加或者减少的价格，没有+号或者-号
	if(reduceFee!=""&&reduceFee!=null&&reduceFee!=undefined)
	{
		var tempAdjustPrice;
		
		var reduceFeeArray;
		if(reduceFee.indexOf("+") ==0 )
		{//增加金额
			reduceFeeArray=reduceFee.split("+");
			realReduceFee=reduceFeeArray[1];
			realReduceFee=parseFloat(realReduceFee);
			tempAdjustPrice="+"+calculateFeeByExchangeRate(realReduceFee,orderCurrencyRate)+" "+orderCurrencyShowSybol;

		}
		else if(reduceFee.indexOf("-") == 0 )
		{//减少金额
			reduceFeeArray=reduceFee.split("-");
			realReduceFee=reduceFeeArray[1];
			realReduceFee=parseFloat(realReduceFee);
			tempAdjustPrice="-"+calculateFeeByExchangeRate(realReduceFee,orderCurrencyRate)+" "+orderCurrencyShowSybol;
		}
		
		
		if(reduceFee.indexOf("+") ==0 )
		{//增加金额
			allTotal=allTotal+realReduceFee; //实际商品价格
		}
		else if(reduceFee.indexOf("-") == 0 )
		{//减少金额
			allTotal=allTotal-realReduceFee; //实际商品价格
		}
		$(".AdjustPrice").html(tempAdjustPrice);
	}

	orderCurrencyRate = 1;
	//所有的总价格
	var allTotalToShow=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(allTotal,orderCurrencyRate);
	$(".Total-Amount").html(allTotalToShow);
	
	//是否已经支付
	var isPayment=olistInfo.order.orderstate;
	if(isPayment!=0)
		$(".Received").html(allTotalToShow);
	
	//支付方式
	var paymentType=olistInfo.order.paymenttype;
	if(paymentType==1)
		$(".PaymentMethod").html("PayPal");
	
}

/**
 * 输入的价格
 */
function inputChangePrice(ele)
{
	var changePrice=$(ele).val();
	
	if(checkInputChangePrice(changePrice))
	{//输入的数值校验通过
		var changePriceArray,realchangePrice;
		var userRealPay=allRealTotal;
		if(changePrice.indexOf("+") ==0 )
		{//增加金额
			changePriceArray=changePrice.split("+");
			realchangePrice=changePriceArray[1];
			realchangePrice=parseFloat(realchangePrice);
			if(!isNaN(realchangePrice))
			{//是数值
				userRealPay=userRealPay+realchangePrice;
			}
		}
		else if(changePrice.indexOf("-") == 0 )
		{//减少金额
			changePriceArray=changePrice.split("-");
			realchangePrice=changePriceArray[1];
			realchangePrice=parseFloat(realchangePrice);
			if(!isNaN(realchangePrice))
			{//是数值
				userRealPay=userRealPay-realchangePrice;
			}
		}
		
		//买家应付价格
		var pricePayFor=currencyShowSymbol+" "+calculateFeeByExchangeRate(userRealPay,currencyRate);
		$("#price-payfor").html(pricePayFor);
		$("#price-get").html(pricePayFor);
	}
	

}

/**
 * 校验输入的数值，是否可以计算
 * @param changePrice
 */
function checkInputChangePrice(changePriceParams)
{
	if(changePriceParams.indexOf("+") ==0 )
	{//增加金额
		var changePriceArray=changePriceParams.split("+");
		var realchangePrice=changePriceArray[1];
		realchangePrice=parseFloat(realchangePrice);
		if(isNaN(realchangePrice))
		{//不是数值
			return false;
		}
		else
		{//是数值
			return true;
		}
		
	}
	else if(changePriceParams.indexOf("-") == 0 )
	{//减少金额
		var changePriceArray=changePriceParams.split("-");
		var realchangePrice=changePriceArray[1];
		realchangePrice=parseFloat(realchangePrice);
		if(isNaN(realchangePrice))
		{//不是数值
			return false;
		}
		else
		{//是数值
			return true;
		}
	}
	else
	{
		return false;
	}
}



/**
 * 点击不同的页面菜单时，显示订单的不同信息
 */
function orderInfoClickEventRegister()
{
	//点击相应的支付方式时，出现相应的支付信息
	$(".ui-tab-nav").on("click","li",function(){		
		$(".ui-tab-nav li").each(function(){
			$(this).removeClass("ui-tab-active");
		});
		$(this).addClass("ui-tab-active");
		index=$(this).index();//获取位置
		
		//隐藏其余元素，显示相应的元素
		$(".ui-tab-pane").each(function(){
			$(this).css("display","none");
		});

		$(".ui-tab-pane").eq(index).css("display","block");

	});

}