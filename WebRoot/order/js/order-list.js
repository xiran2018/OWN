//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||该区域函数的代码不需要改动

/**
 * 该分页程序使用的时候，页面中需要包含相应的css文件，显示的内容需要包含id为listshowID的元素，
 * 同时需要<div class="digg" id="diggId">  </div>  <!-- 显示分页按钮时需要的div -->
 */
$().ready(
		function() 
		{
			
			registerEventLister(); //register the event to listen for the element
			showInformaton(); //show  information
		}
		
);//end  of ready


//********************************************************************************************
/**
 * the global Variable
 * 页面分页显示相关
 */
//默认：1  2	3	4	5	6	7	8	9...50
//重新组装分页：1 	2 ... 9 10 11 12 13 14...50
var flag=0;//表示，显示的页数是否发生了相应的变化，如果发生了变化再执行重新组装分页，然后进行显示,0表示无重新组装，1表示已经重新组装
//var totalPageToShow=12;//第一次页面显示时，在页面中需要显示的页的数量
var leftPageToShow=2;//左面需要显示的页数，默认：3
var middPageToShow=1; //此数值必须为一个奇数，默认：7
var rightPageToShow=2;//右面需要显示的页数，默认：3
var totalPageToShow=leftPageToShow+middPageToShow+rightPageToShow;//第一次页面显示时 和 页面分页改变以后，页面显示时，在页面中需要显示的页的数量
var realLeftNumCount;  //实际组装过程中，中间左面已经显示的数据

//********************************************************************************************


/**
 */
function registerEventLister()
{
	//点击上一页按钮时的动作
	$("#diggId").on("click","#prePage",
			function()
			{
				var currentPageElement=$("#diggId .current")[0];//当前选中的是第几页
				
				var currentPageNumber=parseInt($("#diggId .current").html());//当前选中的是第几页
				
				if(currentPageNumber==1)
				{					
					alert("Already the first one！");
					return;
				}
				else
				{
					var willingShowElement=$("#diggId .current").prev()[0];//即将显示的页，dom元素
					var clickPageNumber=currentPageNumber-1;
					handlePageClick(clickPageNumber,willingShowElement,currentPageElement);//改变下面分页栏
					
					var pageNum=currentPageNumber-1;
					
					getPageData(pageNum);//加载相应的数据  
					
				}
			}
	);
	//点击下一页按钮时的动作
	$("#diggId").on("click","#nextPage",
			function()
			{
				var currentPageElement=$("#diggId .current")[0];//当前选中的是第几页
				var allPageNumber=parseInt($(".lastPage").html());//the total number to show
				var currentPageNumber=parseInt($("#diggId .current").html());//当前选中的是第几页
				
				if(currentPageNumber==allPageNumber)
				{					
					alert("Already the last one！");
				}
				else
				{
					var willingShowElement=$("#diggId .current").next()[0];//即将显示的页，dom元素
					
					var pageNum=currentPageNumber+1;
					
					handlePageClick(pageNum,willingShowElement,currentPageElement);//改变下面分页栏
					

					
					getPageData(pageNum);//加载相应的数据 
					
				}
			}
	);
	
	//点击相应的某一页按钮时的动作
	$("#diggId").on("click",".listdata",
		function()
		{
			var currentPageElement=$("#diggId .current")[0];//当前选中的是第几页
			var clickPageNumber=parseInt($(this).html());//点击的是第几页
			
			handlePageClick(clickPageNumber,this,currentPageElement);
			
			
			getPageData(clickPageNumber);//加载相应的数据
		}//end of function
	
	);//end of click
	
}



/**
 * 第一次加载的时候，按照淘宝等的形式，构建分页需要的  上一页:1:2:3:4:下一页    这样的分页形式的信息
 * @param totalNumberArgs 共有多少页需要显示
 */
function  buildUpListData(totalNumberPageArgs)
{
	var totalNumber=totalNumberPageArgs;
//	console.log("totalNumber="+totalNumber);
	if(totalNumber<=1)
	{//只有大于一页参会显示分页,如果小于一页则不显示分页
		return;
	}
	var listDataHtml="";
	if(totalNumber!=1)
	{		
		listDataHtml+="<span id='prePage' class='disabled'>&lt;Prev</span>";
		listDataHtml+="<span class='current'>"+1+"</span>"; //the first element's class is current
	}
	else
	{//如果只有一页，则不显示上一页按钮
		listDataHtml+="<span class='current'>"+1+"</span>";
	}
	if(totalNumber>totalPageToShow)
	{
		for(var i=2;i<totalPageToShow;i++)
		{
			listDataHtml+="<span class='listdata'>"+i+"</span>";
		}
		listDataHtml+="...<span class='listdata lastPage'>"+totalNumber+"</span>";
	}
	else
	{
		for(var i=2;i<totalNumber;i++)
		{
			listDataHtml+="<span class='listdata'>"+i+"</span>";
		}
		if(totalNumber>1)
		{
			listDataHtml+="<span class='listdata lastPage'>"+totalNumber+"</span>";
		}
		
	}
	
	if(totalNumber!=1)//如果不仅仅只有一页，则显示下一页按钮
	{		
		listDataHtml+="<span class='' id='nextPage'>Next&gt;</span>";
	}
	return listDataHtml;
}

/**
 * 处理点击相应页面的情形
 * @param wantToShowPageArgs 点击的是第几页，具体的数字
 * @param theElement 点击的元素
 * @param currentPageElement 当前在显示的元素
 */
function handlePageClick(wantToShowPageArgs,theElement,currentPageElement)
{
//	console.log($(currentPageElement).html());
	if(isNaN(wantToShowPageArgs))
	{  
	    return;
	}
	//点击页去除listdata属性
	$(theElement).removeClass("listdata");
	//当前选中的页重新增加listdata属性
	$(currentPageElement).addClass("listdata");
	
	var allPageNumber=parseInt($(".lastPage").html());//the total number to show
	var clickPageNumber=wantToShowPageArgs;//即将要显示的页数
//	console.log("totalPageToShow:"+totalPageToShow);
	
	if(totalPageToShow>=allPageNumber)//说明不需要分页，只需要相应的改变css即可
	{
		if(clickPageNumber==1)//如果是第一页，改变上一页和下一页按钮的css样式
		{
			$("#prePage").removeClass("listdata");
			$("#prePage").addClass("disabled");
			
			$("#nextPage").addClass("listdata");
			$("#nextPage").removeClass("disabled");
		}
		else if(clickPageNumber==allPageNumber)//说明是最后一页被点击，，改变上一页和下一页按钮的css样式
		{
			$("#prePage").addClass("listdata");
			$("#prePage").removeClass("disabled");
			
			$("#nextPage").removeClass("listdata");
			$("#nextPage").addClass("disabled");
		}
		else//其他情况，把第一页或者最后一页的disable样式，去掉就可以了
		{
			$("#prePage").removeClass("disabled");
			$("#nextPage").removeClass("disabled");
		}
		
		$("#diggId .current").removeClass("current");
		$(theElement).addClass("current");
		
		//getPageData(clickPageNumber);//加载相应的数据  
		
		return;
		
	}
	
	var listDataHtml="";
	if(allPageNumber>totalPageToShow)//以下是大于需要显示页数时的处理方式
	{
		if(flag==0)//说明还没有重新组装分页
		{
			var preTotalPageToShow=totalPageToShow-3;//没有重新组装之前，符号“...”之前的页，点击该页需要重新组装分页
			if(clickPageNumber<preTotalPageToShow)//如果点击的是左边的页数，则不需要重新组装，直接改变相应的css模式即可
			{
				if(clickPageNumber==1)//如果是第一页，改变上一页按钮的css样式
				{
					$("#prePage").removeClass("listdata");
					$("#prePage").addClass("disabled");
				}
				else//不是第一页，改变上一页按钮的css样式
				{
					$("#prePage").removeClass("disabled");
					$("#prePage").addClass("listdata");
				}
				$("#diggId .current").removeClass("current");
				$(theElement).addClass("current");
			}
			else//第一次重新组装
			{
				flag=1;//重新组装赋值为1
				listDataHtml=genernateListData(allPageNumber,clickPageNumber);
				$("#diggId").empty();
				$(listDataHtml).appendTo($("#diggId"));
				
			}//END OF ELSE
			//getPageData(clickPageNumber);//加载相应页面的数据  
		}
		else//说明已经重新组装分页
		{	
					listDataHtml=genernateListData(allPageNumber,clickPageNumber);
					
					$("#diggId").empty();
					$(listDataHtml).appendTo($("#diggId"));
				
				   //getPageData(clickPageNumber);//加载相应页面的数据  
				
		}//end of else
	}
}

/**
 * 当点击了某一个页的时候，按照淘宝等的形式，构建分页需要的  上一页:1:2:3:4:下一页    这样的分页形式的信息
 * @param totalNumberArgs
 * 
 */
function genernateListData(allPageNumberArgs,clickPageNumberArgs)
{
	var allPageNumber=allPageNumberArgs;
	var clickPageNumber=clickPageNumberArgs;
	var currentSelectedPageNumber=parseInt($("#diggId .current").html());//当前被选择的页数
	var listDataHtml="";
	//以下的代码为开始重新组装的代码，点击的页尽量作为中间页显示
	//首先，改变上一页按钮的css样式，因为肯定不是点击的前面的几页，点击前面几页的时候调用这个函数之前已经拦截
	
	if(1==clickPageNumber)//如果点击的是第一页
	{
			listDataHtml+="<span id='prePage' class='disabled'>&lt;Prev</span>";//不显示上一页按钮
			listDataHtml+="<span class='listdata  current'>"+1+"</span>";
	}
	else
	{
			listDataHtml+="<span id='prePage' class=''>&lt;Prev</span>";
			listDataHtml+="<span class='listdata'>"+1+"</span>";
	}

	
	//首先，组装左边要显示的信息,从第一页开始组装
	for(var i=2;i<leftPageToShow+1;i++)
	{
		if(i==clickPageNumber)
		{
			 
				 listDataHtml+="<span class='current'>"+i+"</span>";
		}
		else
		{
			listDataHtml+="<span class='listdata'>"+i+"</span>";
		}
	}
	
	//然后，组装中间要显示的信息,点击的那一页尽量作为中间页显示

	listDataHtml+=genernateMiddLeftListData(clickPageNumber,allPageNumber);
	listDataHtml+=genernateMiddRightListData(realLeftNumCount,clickPageNumber,allPageNumber);
	
	
	//然后，组装最后要显示的信息
	//首先计算从那一页开始显示
	var firstLastPage=allPageNumber-rightPageToShow+1;
	for(var j=firstLastPage;j<allPageNumber;j++)
	{
		if(j==clickPageNumber)
		{
			 
				 listDataHtml+="<span class='current'>"+j+"</span>";
		}
		else
		{
			listDataHtml+="<span class='listdata'>"+j+"</span>";
		}
	}
	if(allPageNumber==clickPageNumber)//如果点击的是最后一页
	{
			listDataHtml+="<span class='listdata lastPage current'>"+allPageNumber+"</span>";
			listDataHtml+="<span id='nextPage' class='disabled'>Next&gt;</span>"; //不显示下一页按钮
	}
	else
	{
			listDataHtml+="<span class='listdata lastPage'>"+allPageNumber+"</span>";
			listDataHtml+="<span id='nextPage' class=''>Next&gt;</span>";
	}

	return listDataHtml;
}

/**
 * 生成分页列表左边需要显示的页数信息
 * @param clickPageNumber
 * @returns {String}
 */
function genernateMiddLeftListData(clickPageNumber,allPageNumber)
{
	var listDataHtml="";
	//首先，计算中间部分显示时，点击的那一页左右两边所要显示的页数
	var totalMiddNumCount=middPageToShow-1;  //中间还需要显示的数据

//	var realLeftNumCount;  //实际组装过程中，中间左面已经显示的数据
	
	var tempMiddPageToShow=totalMiddNumCount/2; //理论上，点击页的左右两边，需要显示的页数
	var templeftTempMidd=leftPageToShow+tempMiddPageToShow;//此数是为了判断中间部分左边要显示的页数是否够用
	
	if(templeftTempMidd>=clickPageNumber)//左面的数据说明不够用
	{	
		realLeftNumCount=clickPageNumber-leftPageToShow;
		if(realLeftNumCount<0)
			realLeftNumCount=0;
		//左面的数据说明不够用
//		var temp=clickPageNumber-1;
		//开始组装左面的数据
		for(var s=leftPageToShow+1;s<clickPageNumber;s++)
		{
			listDataHtml+="<span class='listdata'>"+s+"</span>";
		}
		if(clickPageNumber>leftPageToShow)
		{			
			listDataHtml+="<span class='current'>"+clickPageNumber+"</span>";
		}
	}
	else
	{

		realLeftNumCount=tempMiddPageToShow;
		//开始组装左面的数据
		//计算左面第一个要显示的数据页号码
		var tempMiddLeftNum=clickPageNumber-tempMiddPageToShow;
		
		var tmeps=leftPageToShow+1;
		if(tempMiddLeftNum!=tmeps)//如果中间部分最左边的数和   最左面的一个数是连续的，则不加"..."，如果是不连贯的则加"..."
		{
			listDataHtml+="...";
		}
		
		var endNum=clickPageNumber;
		var tempNum=allPageNumber-rightPageToShow+1;//次数表示了最左边的显示的页数中的第一个页数号码
		
		if(endNum>=tempNum)
		{
			endNum=tempNum;
		}
		
		//计算左面已经组装了多少数据
		for(var s=tempMiddLeftNum;s<endNum;s++)
		{
			listDataHtml+="<span class='listdata'>"+s+"</span>";
		}
		
		if(clickPageNumber<tempNum)
		{
			listDataHtml+="<span class='current'>"+clickPageNumber+"</span>";
		}
	}
	return listDataHtml;
}


/**
 * 生成分页列表右边需要显示的页数信息
 * @param clickPageNumber
 * @returns {String}
 */
function genernateMiddRightListData(realLeftNumCount,clickPageNumber,allPageNumber)
{
	var listDataHtml="";
	//开始组装右面的数据，右面的数据可能也有不够的情况
	//右面需要的数据个数为：
	var rightNum=middPageToShow-1-realLeftNumCount;
	
	var tempRightTempMidd=clickPageNumber+rightNum;//此数是为了判断中间部分右边要显示的页数是否够用
	
	var tempNum=allPageNumber-rightPageToShow+1;//次数表示了最左边的显示的页数中的第一个页数号码
	
	if(tempRightTempMidd>=tempNum)//右面的数据说明不够用
	{
		var tempRightStart=clickPageNumber+1;//从哪一个页开始生成
		if(leftPageToShow>=tempRightStart)//leftPageToShow的页数已经在genernateListData函数中生成了，所以这里必须要从大于这个数值的地方开始)
		{
			tempRightStart=leftPageToShow+1;
		}
		
		for(var t=tempRightStart;t<tempNum;t++)
		{
			listDataHtml+="<span class='listdata'>"+t+"</span>";
		}
	}
	else//右面的数据说明够用
	{
		var tempRightToNum=clickPageNumber+rightNum+1;
		var tempRightStart=clickPageNumber+1;//从哪一个页开始生成

		if(leftPageToShow>=tempRightStart)//leftPageToShow的页数已经在genernateListData函数中生成了，所以这里必须要从大于这个数值的地方开始)
		{
			tempRightStart=leftPageToShow+1;
		}
		for(var t=tempRightStart;t<tempRightToNum;t++)
		{
			listDataHtml+="<span class='listdata'>"+t+"</span>";
		}
		if(tempNum!=tempRightToNum)//如果中间部分最右边的数和   最右面的第一个数是连续的，则不加"..."，如果是不连贯的则加"..."
		{
			
			listDataHtml+="...";
		}
	}
	
	return listDataHtml;
	

}
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||end of该区域函数的代码不需要改动

//************************************************以下是需要改动的代码!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

$().ready(
		function() 
		{
			
			registerEventListerForPageEle(); //register the event to listen for the element
		}
		
);//end  of ready

/**
 * 为页面元素注册事件
 */
function registerEventListerForPageEle()
{
	$(".order-list-search").on("click","#search-btn",queryOrderByParment);
}

/**
 * 根据选定的参数获取订单信息，和showInformaton函数对应，showInformaton函数的作用是在页面初始化时显示信息
 */
function queryOrderByParment()
{
	getPageDataFromParams(1);
}

/**
 * 该函数在页面加载时，初始化页面需要分页显示的信息
 */
function showInformaton()
{
	
	//ask for the server to return the data to show,这里可以使用各种请求获取相应的信息，本js用的是直接从页面获取数据，也可以用ajax获取数据
	
	if(errCode==100) //it means that the data is wrong, errCode is in order-list.jsp
	{
		return;
	}
	//the following code is to show the  data  entireTransInfo
	var entireTransInfo=orderList; //orderList is in order-list.jsp
	
	var dataRowsLength = entireTransInfo.length;
	if(dataRowsLength==0)
	{
		document.getElementById("listshowID").innerHTML="Sorry,there is no data to show!!!";
		return;
	}
	
//********************************************************这里的代码需要根据具体显示的数值改动
	var htmldata=buildUpInformation(entireTransInfo);  //构建具体需要显示的信息

	document.getElementById("listshowID").innerHTML=htmldata;
//********************************************************
	
//next code is to show the list-data，也就是分页的按钮:  pre page::1::2::3::next page
//********************************************************这里的代码不需要改动，需要根据实际却动totalNmuberPage的值
	var listDataHtml=buildUpListData(totalNumber); //totalNumber is in order-list.jsp
	$(listDataHtml).appendTo($("#diggId"));
//********************************************************

}


/**
 * 该函数的作用是构建具体需要显示的信息
 * @param entireTransInfoArgs
 * @returns {String}
 * 
 */
function  buildUpInformation(entireTransInfoArgs)
{
//	console.log("yes!!!!!!!");
	var entireTransInfo=entireTransInfoArgs;
	var dataRows = entireTransInfo.length;
//	alert(dataRows);
	var html = "";
	for ( var i1 = 0; i1 < dataRows; i1++)
	{
		var allInfo=entireTransInfo[i1];
		var transInfo=allInfo;
		//add the td's info
		html+=generateBasicInfo(transInfo.order,transInfo.currency);//获取订单基本信息
		html+=generateXiangXiInfo(transInfo.order,transInfo.odsvo,transInfo.currency);//获取订单的详细信息（主要是商品信息），参数是一个list，代表各个商品
	}//end of for
	return html;
}

/**
 * 获取订单基本信息
 */
function generateBasicInfo(order,currency)
{
	var html = "<tr class='order-hd'>";
	html+=" <td colspan='7'>";
	//订单编号
	html+="<span class='no'>";
	html+="<label>";
	html+="Order NO:<span class='order-num'>";
	html+="<a id='order-number' target='_blank' href='javascript:void(0)'>"+order.ordernumber+ "</a>";
	html+="</span> ";
	html+=" </label></span>";
	//订单时间
	html+="<span class='deal-time'> Order Time: "+timeStamp2String(order.ordercreatetime.time)+"</span> ";
	
	//销售者
	html+="<span class='seller'>999OWN";
	//html+="<a title='Leave me a message' id1='201057893' class='atm16grey alitalk' from='12' alitalk='cn1000555724' memberid='' rel='nofollow' href='javascript:void(0);' online='0'>Offline</a>";
	html+="<span class='separator'>|</span>";
	//留言信息
	html+="<span class='order-message'>";
	html+=" <a class='message'  target='_blank' href=''>";
	html+="<strong class='none'>0</strong>New Messages";
	html+="</a> ";
	html+="</span>";
	//contact
	html+=" <span class='separator'>|</span>";
	html+="<a href='javascript:void(0)' class='feedback'>Contact</a>";
	html+="</span>";
	//amount
	html+="<span class='amount'>";
	//currencyShowSymbol is in common/js/product.price.js
	var orderCurrencyShowSymbol = currency.currencyname+" "+currency.currencysymbol;
	var ordercurrencyRate = order.currencyrate;

	var tempprice=orderCurrencyShowSymbol+" "+calculateFeeByExchangeRate(order.countprice,ordercurrencyRate);//calculateFeeByExchangeRate in math.js
	html+="Amount: <strong>"+tempprice+"</strong>";
	html+=" </span>";
	
	html+="</td>";
	html+="</tr>";
	
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
	for(var i=0;i<len;i++)
	{
		odsvo=odsvoList[i];//商品详情
		od=odsvo.od;//某一个商品详情
		cpi=odsvo.cpi;//商品图片地址
		html+="<tr class='order-bd' id='item"+od.id+"'>";
		//宝贝描述信息
		html+=" <td colspan='2' class='baobei'>";
		html+="<a class='pic s50' href='client/productShow.action?id="+od.productid+"' title='' hidefocus='true' target='_blank'> "; //商品地址
		var productimageaddr="";
		if(cpi!=null)
		{
			productimageaddr=cpi.productimageaddr;
		}
		html+="<img src='"+productimageaddr+"' alt=''>";//图片地址
		html+=" </a>";
		//描述
		html+="<div class='desc'>";
		html+="<a href='client/productShow.action?id="+od.productid+"' target='_blank' class='baobei-name' productid='"+od.id+"' title='"+od.productname+"'>"+od.productname+"</a>";
		html+="</div>";
		
		//属性信息
		html+="<div class='spec'>Properties: ";
		html+=getProductProperties(odsvo.odpa);//商品属性信息
		html+="</div>";
		//seller info
		html+="<div class='seller-sign'>(999OWN)</div>";
		html+="<div class='other-info'></div>";
		html+="</td>";
		//price
		var orderCurrencyShowSybol = currencyArgs.currencyname + " "+currencyArgs.currencysymbol;
		var orderCurrencyRate = order.currencyrate;
		var tempprice=orderCurrencyShowSybol+" "+calculateFeeByExchangeRate(od.price,orderCurrencyRate);//calculateFeeByExchangeRate in math.js
		html+="<td  class='price'>"+tempprice+"</td>";
		//数量
		html+="<td  class='quantity'>"+od.ordercount+"</td>";
		
		//支付方式
		html+="<td class='after-service'>";
		html+="<span>"+convertPayment(order.paymenttype)+"</span>";
		html+="</td>";
		if(i==0)
		{
			//订单详情
			html+="<td rowspan='"+len+"' class='trade-status'>";
			html+="<span class='f-left'>";
			html+=orderState(order.orderstate)+"</span>";
			html+="<span> <a class='detail-link TP_MakePoint' target='_blank' href='order/orderDetail.action?orderId="+order.id+"'>View Detail</a> </span>";
			html+="</td>";
			//operate
			html+="<td rowspan='"+len+"' class='operate'>";
			html+="<a href='payment-control/checkout.action?orderId="+order.id+"' style='width: 75px;height: 15px;' class='ui-button ui-button-normal-s button_reAddToCart' button_action='Payment' orderid='30066712523310' type='button'>";
			html+="Payment</a>";
			
			html+="<div>";
			html+="<a href='http://www.facebook.com' target='_blank' rel='nofollow' target='_blank'>Share on  <span style='color: #db6e53;'>www.facebook.com</span></a>";
			html+="</div>";
			html+="</td>";
		}
		html+="</tr>";
	}
	return html;
}

function orderState(orderstate)
{
	if(orderstate==2)
	{
		return "closed";
	}
	else
		return "";
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
 * 
 * @param order
 */
function convertPayment(paymenttype)
{
	if(paymenttype==0||paymenttype==null||paymenttype==""||paymenttype==undefined)
		return "No Payment";
		//return '<s:text name="www.order.noPayment" default="No Payment"></s:text>';
	else if(paymenttype==1)
		return "PayPal Payment";
}

/**
 * 转换函数
 * @param param
 * @returns
 */
function paramConvert(param)
{
	if(param==null)
	{
		return "";
	}
	else
	{
		return param;
	}
}

//********************************************************该区域函数的代码需要改动，根据点击的页数，获取数据显示
/**
 * 
 * @param pageNum 需要搜索的某页数的位置信息
 * @param posInPage 一页中某公司的位置信息
 * @param pricePageNum 公司的价格位置信息(即将从数据库中取出的页数)
 * @param userAction 用户的行为，目前只有一种："turnToPage"
 * @param companyId  公司的id信息
 * 
 */
function getPageData(pageNum)
{
	
		var actionUrl="order/showAllOrders.action";
		
		//ask for the server to return the data to show
	
		var params=
		{
			"returnType":"1",
			"productName":productName, //the following parmeter is in order-list.jsp
			"orderNo":orderNo,
			"orderStatus":orderStatus,
			"gmtBeginDate":gmtBeginDate,
			"gmtEndDate":gmtEndDate,
			"pagenum":pageNum
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
//					alert("服务器原因，获取信息失败，请稍后再试!!!!");
				}
				else if(data.status=="500")
				{	
					alert("Sorry,please try again!!!!");
				}
			},
			success : function(data) 
			{
				var errCode=data.errCode;
				if(errCode==100) //it means that the data is wrong
				{
					var errMessage=data.errMessage;
					alert("Sorry,please try again!!!!");
					return;
				}
				//the following code is to show the  data  entireTransInfo
				var entireTransInfo=data.orderList;
				
				var dataRowsLength = entireTransInfo.length;
				if(dataRowsLength==0)
				{
					alert("Sorry,please try again!!!!");
					return;
				}
				
			//********************************************************这里的代码需要根据具体显示的数值改动
				var htmldata=buildUpInformation(entireTransInfo);  //构建具体需要显示的信息
				document.getElementById("listshowID").innerHTML=htmldata;
			//********************************************************

			}
		});// end of ajax
}

/**
 * 根据用户的选择，获取参数显示
 */
function getPageDataFromParams(pageNum)
{
	
	var actionUrl="order/showAllOrders.action";
	
	//ask for the server to return the data to show
	//the following parmeter is in order-list.jsp
	productName=$.trim($("#productName").val());
	orderNo=$.trim($("#orderNo").val());
	orderStatus=$.trim($("#orderStatus").val());
	gmtBeginDate=$.trim($("#gmtBeginDate").val());
	gmtEndDate=$.trim($("#gmtEndDate").val());

	var params=
	{
		"returnType":"1",
		"productName":productName, 
		"orderNo":orderNo,
		"orderStatus":orderStatus,
		"gmtBeginDate":gmtBeginDate,
		"gmtEndDate":gmtEndDate,
		"pagenum":pageNum
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
			var errCode=data.errCode;
			if(errCode==100) //it means that the data is wrong
			{
				var errMessage=data.errMessage;
				alert("Sorry,please try again!!!!");
				return;
			}
			//the following code is to show the  data  entireTransInfo
			var entireTransInfo=data.orderList;
			
			var dataRowsLength = entireTransInfo.length;
			if(dataRowsLength==0)
			{
				alert("Sorry,please try again!!!!");
				return;
			}
			
		//********************************************************这里的代码需要根据具体显示的数值改动
			var htmldata=buildUpInformation(entireTransInfo);  //构建具体需要显示的信息
			document.getElementById("listshowID").innerHTML=htmldata;
		//********************************************************
			if(pageNum==1)  //只有第一页才会显示页数，其他的不用显示页数，直接改变页数的颜色即可
			{
				//next code is to show the list-data，也就是分页的按钮:  pre page::1::2::3::next page
				//********************************************************这里的代码不需要改动，需要根据实际却动totalNmuberPage的值
				var listDataHtml=buildUpListData(data.totalNumberPage); //totalNumber is in order-list.jsp
				$("#diggId").empty();
				$(listDataHtml).appendTo($("#diggId"));
				//********************************************************
			}

		}
	});// end of ajax
}


//************************************************end of 以下是需要改动的代码!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

/**
 * 把java中的timestamp类型转换为响应的数据显示，其中，参数time即是timestamp中的time属性的值
 * @param time timestamp中的time属性的值
 * @returns {String}
 */
function timeStamp2String(time){
    var datetime = new Date();
    datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
}