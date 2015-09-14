//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||该区域函数的代码不需要改动

/**
 * 该分页程序使用的时候，页面中需要包含相应的css文件，显示的内容需要包含id为listshowID的元素，
 * 同时需要<div class="digg" id="diggId">  </div>  <!-- 显示分页按钮时需要的div -->
 */
$().ready(
		function() 
		{
			
			registerEventLister(); //register the event to listen for the element
			showInformaton(0); //show  information
			//next code is to show the list-data，也就是分页的按钮:  pre page::1::2::3::next page
			//********************************************************这里的代码不需要改动，需要根据实际却动totalNmuberPage的值
				var listDataHtml=buildUpListData(totalNumber); //totalNumber is in order-list.jsp
				$(listDataHtml).appendTo($("#diggId"));
			//********************************************************
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
var leftPageToShow=3;//左面需要显示的页数，默认：3
var middPageToShow=7; //此数值必须为一个奇数，默认：7
var rightPageToShow=3;//右面需要显示的页数，默认：3
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
					getPageData(pageNum,true);//加载相应的数据  
					
				}
				
				return false;
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
					

					
					getPageData(pageNum,false);//加载相应的数据 
					
				}
				
				return false;
			}
	);
	
	//点击相应的某一页按钮时的动作
	$("#diggId").on("click",".listdata",
		function()
		{
			var currentPageElement=$("#diggId .current")[0];//当前选中的是第几页
			var clickPageNumber=parseInt($(this).html());//点击的是第几页
			
			
			if(isNaN(clickPageNumber))
			{  
			    return;
			}
			
			handlePageClick(clickPageNumber,this,currentPageElement);
			
			
			getPageData(clickPageNumber);//加载相应的数据
			
			return false;
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

//************************************************以下是需要改动的代码!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

///////////////////////////////////////临时的全局变量，以后可能还是会更改////////////////////////////////////////
var currencyShowSymbol="USD $";
var currencyRate=1;

///////////////////////////////////////临时的全局变量，以后可能还是会更改////////////////////////////////////////


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
function showInformaton(nowPage)
{
	var htmldata = "<table border='1' class='altrowstable'>"+
	"<tr><td>PID</td><td>图片</td><td>名称</td><td>重量</td><td>采购价格</td><td>原始价格</td><td>现价</td><td>品牌ID</td><td>商品分类ID</td><td>产品来源厂家</td><td>厂家编号</td><td>自编号</td><td>厂家网址</td><td>库存数目</td><td>最少购买数量</td><td>是否免邮</td><td>积分</td><td>是否热销</td><td>是否推荐</td><td>是否新品</td><td>产品状态</td><td>操作</td></tr>";
	$.post("cm/management_returnCommoditys.action",{initPage:nowPage},function(data) {
		$.each(data, function(index,atrv) {
			htmldata += "<tr><td>"+atrv.products.p_id+"</td><td><img style='width:70px;height:70px;' src='"+atrv.showURL+"'></td><td>"+atrv.products.p_name+"</td><td>"+atrv.products.p_weight+"</td><td>"+atrv.products.p_purchaprice+"</td><td>"+atrv.products.p_originprice+"</td><td>"+atrv.products.p_nowprice+"</td><td>"+atrv.brand+"</td><td>"+atrv.category+"</td><td>"+atrv.products.p_fromcompany+"</td><td>"+atrv.products.p_companyserinum+"</td><td>"+atrv.products.p_myserialnumber+"</td><td>"+atrv.products.p_fromnetaddress+"</td><td>"+atrv.products.p_storenumber+"</td><td>"+atrv.products.p_storenumber+"</td><td>"+atrv.products.p_freemail+"</td><td>"+atrv.products.p_jifen+"</td><td>"+atrv.products.p_hot+"</td><td>"+atrv.products.p_recommend+"</td><td>"+atrv.products.p_new+"</td><td>"+atrv.products.p_status+"</td>" +
					"<td><a href='cm/managementmultatr_showInfo?p_id="+atrv.products.p_id+" 'target='_blank'>属性</A> |" +
						"<a href='cm/managementimg_showImg?p_id="+atrv.products.p_id+" 'target='_blank'>图片</A> |" +
						"<a href='cm/multilanguage_showAll?product_id="+atrv.products.p_id+" ' target='_blank'>多语言</A> |" +
						"<a href='cm/sku_showAll?product.p_id="+atrv.products.p_id+" 'target='_blank'>SKU</A>" +
						"<hr/>"+
						"<a href='cm/management_delete?p_id="+atrv.products.p_id+" '>删除</A></td></tr>" ;
		});
		htmldata +="</table>";
		//the following code is to show the  data  entireTransInfo
		var entireTransInfo=[1,1]; //orderList is in order-list.jsp
		
		var dataRowsLength = entireTransInfo.length;
		if(dataRowsLength==0)
		{
			document.getElementById("listshowID").innerHTML="sorry,there is no data to show!!!";
			return;
		}
		
//********************************************************这里的代码需要根据具体显示的数值改动
		
		document.getElementById("listshowID").innerHTML=htmldata;
//********************************************************
	});
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
function getPageData(pageNum,isUP)
{
	showInformaton(pageNum);
		
}
