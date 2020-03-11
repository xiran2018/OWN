///////////////////////////////////////////////global variables
//the following variables is for shipping-show

var productAmount=0;//商品总价
var shippingCost=0; //运费总价


//一下三个变量，保存getSelectShipName函数中得到的信息，以便在后面计算货运费用的时间的时候使用
	
///////////////////////////////////////////////end of global variables

$(document).ready(function () {
	eventRegister();//事件注册
	showOrderDetail(orderList);
	
});


function eventRegister()
{
	orderInfoClickEventRegister();
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
	var orderCurrencyRate = orderShowvo.order.currencyrate;

	var productAmountToShow=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(productAmount,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
	$(".ProductAmount").html(productAmountToShow);
	var shippingCostToShow=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(shippingCost,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
	$(".ShippingCost").html(shippingCostToShow);
	var allTotal=productAmount+shippingCost; //商品费用+运费
	var allTotalToShow=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(allTotal,orderCurrencyRate);
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
	html+=generateXiangXiInfo(entireTransInfoArgs.order,entireTransInfoArgs.odsvo,entireTransInfoArgs.currency);//获取订单的详细信息（主要是商品信息），参数是一个list，代表各个商品
	return html;
}

/**
 * 生成需要在表格中显示的具体信息
 * 参数格式为：
 */
function generateXiangXiInfo(order,odsvoList,currencyArgs)
{
	var html="";
	var len=odsvoList.length;
	var orderCurrencyShowSybol = currencyArgs.currencyname + " "+currencyArgs.currencysymbol;
	var orderCurrencyRate = order.currencyrate;
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
		html+="<div class='seller-sign'>(999OWN)</div>";
		html+="<div class='other-info'></div>";
		html+="</td>";
		//price

		var tempprice=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(od.price,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
		html+="<td  class='price'>"+tempprice+"</td>";
		//数量
		html+="<td  class='quantity'>"+od.ordercount+"</td>";
		
		//支付总金额
		//price
		var tempAmount=od.price*od.ordercount;
		productAmount=productAmount+tempAmount//商品总价格
		var tempAmountPrice=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(tempAmount,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
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
			tempShipFeePrice=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(shipfee,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
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
		html+=devilyTime+":<span class='ship-value'>"+shiptime+" "+days+"</span>";
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
	var allTotal=productAmount+shippingCost; //商品费用+运费

	//汇率等信息
	currencyele = olistInfo.currency;
	var orderCurrencyShowSybol = currencyele.currencyname + " "+currencyele.currencysymbol;
	var orderCurrencyRate = olistInfo.order.currencyrate;
	
	//使用的积分
	var jifen=olistInfo.order.usejifen;
	allTotal=allTotal-(jifen*0.01);//总价格减去积分
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