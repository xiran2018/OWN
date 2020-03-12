///////////////////////////////////////////////global variables
//the following variables is for checkout
var index=0;//index 代表做选择的支付方式，0表示用paypal支付
var totalPaymentAmount=0; //总的支付金额,以美元表示的价格，没有转换汇率
var totalPaymentAmountByExchangeRate=0; //总的支付金额,不是以美元表示的价格，按照相应的转换得到的结果
var orderId;//订单id
///////////////////////////////////////////////end of global variables

$(document).ready(function () {
	eventRegister();//事件注册
	insertOrderInfo();
});


function insertOrderInfo()
{
	insertOrderBasicInfo(orderInfo);//在页面中插入一些基本信息，包括价格，名称等，orderInfo is in jsp
}

function eventRegister()
{
	paymentClickEventRegister(); //点击支付方式事件注册
}


function insertOrderBasicInfo(orderInfoParams)
{
	var order=orderInfoParams.order;//订单信息
	orderId=order.id;
	
	var realpay=order.realpay; //实际付款的价格=所有价格（商品价格+运费）-积分,这个实际价格已经在生成订单的时候算好了，所以这里可以直接使用

	// var orderCurrencyRate = order.currencyrate;
	var orderCurrencyRate = 1;
	var orderCurrencyShowSymbol = orderInfoParams.currency.currencysymbol

	var	reduceFee=order.reducefee;
	var realReduceFee=0;
	if(reduceFee!=""&&reduceFee!=null&&reduceFee!=undefined)
	{
		var reduceFeeArray;
		if(reduceFee.indexOf("+") ==0 )
		{//增加金额
			reduceFeeArray=reduceFee.split("+");
			realReduceFee=reduceFeeArray[1];
			realReduceFee=parseFloat(realReduceFee);

		}
		else if(reduceFee.indexOf("-") == 0 )
		{//减少金额
			reduceFeeArray=reduceFee.split("-");
			realReduceFee=reduceFeeArray[1];
			realReduceFee=parseFloat(realReduceFee);
		}
		
		
		if(reduceFee.indexOf("+") ==0 )
		{//增加金额
			realpay=realpay+realReduceFee; //实际商品价格
		}
		else if(reduceFee.indexOf("-") == 0 )
		{//减少金额
			realpay=realpay-realReduceFee; //实际商品价格
		}
		
	}
	
	totalPaymentAmount=realpay;
	totalPaymentAmountByExchangeRate=calculateFeeByExchangeRate(totalPaymentAmount,orderCurrencyRate);
	//calculateFeeByExchangeRate in math.js  and currencyShowSymbol is in common/js/product.price.js
	var tempprice=orderCurrencyShowSymbol+" "+parseFloat(totalPaymentAmountByExchangeRate).toFixed(2);
	
	$(".order-total-amount").html(tempprice);
	$(".order-item-r").html(tempprice);
	
	//order number
	var orderNumber=order.ordernumber;
	$(".order-no").html(orderNumber);
	
	//order product description
	var orderDetail=orderInfoParams.odsvo;
	insertProductName(orderDetail);
}

function insertProductName(orderDetailParams)
{
	var productDesc="";
	var len=orderDetailParams.length;
	for(var i=0;i<len;i++)
	{
		var orderDetailShowVOEle=orderDetailParams[i];
		var orderDetail=orderDetailShowVOEle.od;
		var productname=orderDetail.productname;
		if(productDesc=="")
		{
			productDesc=productname;
		}
		else
		{
			productDesc+="&"+productname;
		}
	}
	
	$(".order-item-title").html(productDesc);
	$(".order-item-title").attr("title",productDesc);
	
}

/**
 * 点击不同的支付方式时，显示不同的支付页面
 */
function paymentClickEventRegister()
{
	//点击相应的支付方式时，出现相应的支付信息
	$(".container").on("click",".j-channel-item",function(){		
		$(".j-channel-item").each(function(){
			$(this).removeClass("channel-active");
		});
		$(this).addClass("channel-active");
		index=$(this).index();//获取位置
		
		//隐藏其余元素，显示相应的元素
		$(".channel-panel").each(function(){
			$(this).addClass("fn-hide");
		});
		if(index!=0)
		{//第一个是paypal，不需要显示其他的相关信息，所以隐藏显示相应信息的form表单
			$(".channel-panel").eq(index).removeClass("fn-hide");
		}
	});
	
	//点击支付按钮时的相应动作
	$(".container").on("click","#j-paynow",function(){		
		payment();
	});
}

/**
 * 支付动作
 */
function payment()
{
	if(index==0)
	{
		//paypalPayment is in payment.js
		//selectCurrencyId is in headermenu.jsp
		paypalPayment(totalPaymentAmount,totalPaymentAmountByExchangeRate,orderId,selectCurrencyId);
	}
}