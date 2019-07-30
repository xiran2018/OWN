// ********************************************************************************************
/**
 * the global Variable 页面分页显示相关
 */
// 默认：1 2 3 4 5 6 7 8 9...50
// 重新组装分页：1 2 ... 9 10 11 12 13 14...50
var flag=0;// 表示，显示的页数是否发生了相应的变化，如果发生了变化再执行重新组装分页，然后进行显示,0表示无重新组装，1表示已经重新组装和页面分页改变以后，页面显示时，在页面中需要显示的页的数量
var realLeftNumCount;  // 实际组装过程中，中间左面已经显示的数据

var leftPageToShow=3;// 左面需要显示的页数，默认：3

var middPageToShow=7; // 此数值必须为一个奇数，默认：7
var rightPageToShow=3;// 右面需要显示的页数，默认：3
var totalPageToShow=leftPageToShow+middPageToShow+rightPageToShow;// 第一次页面显示时

function buildPageTable(totalNumber) {
	$("#diggId").empty();
	var listDataHtml=buildUpListData(totalNumber);
	$(listDataHtml).appendTo($("#diggId"));
}
/**
 * 第一次加载的时候，按照淘宝等的形式，构建分页需要的 上一页:1:2:3:4:下一页 这样的分页形式的信息
 * 
 * @param totalNumberArgs
 *            共有多少页需要显示
 */
function  buildUpListData(totalNumberPageArgs)
{
	var totalNumber=totalNumberPageArgs;
// console.log("totalNumber="+totalNumber);
	if(totalNumber<=1)
	{// 只有大于一页参会显示分页,如果小于一页则不显示分页
		return;
	}
	var listDataHtml="";
	if(totalNumber!=0)
	{		
		listDataHtml+="<span id='prePage' class='disabled'>&lt;Prev</span>";
		listDataHtml+="<span class='current'>"+1+"</span>"; // the first
															// element's class
															// is current
	}
	else
	{// 如果只有一页，则不显示上一页按钮
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
	
	if(totalNumber!=1)// 如果不仅仅只有一页，则显示下一页按钮
	{		
		listDataHtml+="<span class='' id='nextPage'>Next&gt;</span>";
	}
	return listDataHtml;
}

/**
 * 处理点击相应页面的情形
 * 
 * @param wantToShowPageArgs
 *            点击的是第几页，具体的数字
 * @param theElement
 *            点击的元素
 * @param currentPageElement
 *            当前在显示的元素
 */
function handlePageClick(wantToShowPageArgs,theElement,currentPageElement)
{
	if(isNaN(wantToShowPageArgs))
	{  
	    return;
	}
	// 点击页去除listdata属性
	$(theElement).removeClass("listdata");
	// 当前选中的页重新增加listdata属性
	$(currentPageElement).addClass("listdata");
	
	var allPageNumber=parseInt($(".lastPage").html());// the total number to
														// show
	var clickPageNumber=wantToShowPageArgs;// 即将要显示的页数
	
	if(totalPageToShow>=allPageNumber)// 说明不需要分页，只需要相应的改变css即可
	{
		if(clickPageNumber==1)// 如果是第一页，改变上一页和下一页按钮的css样式
		{
			$("#prePage").removeClass("listdata");
			$("#prePage").addClass("disabled");
			
			$("#nextPage").addClass("listdata");
			$("#nextPage").removeClass("disabled");
		}
		else if(clickPageNumber==allPageNumber)// 说明是最后一页被点击，，改变上一页和下一页按钮的css样式
		{
			$("#prePage").addClass("listdata");
			$("#prePage").removeClass("disabled");
			
			$("#nextPage").removeClass("listdata");
			$("#nextPage").addClass("disabled");
		}
		else// 其他情况，把第一页或者最后一页的disable样式，去掉就可以了
		{
			$("#prePage").removeClass("disabled");
			$("#nextPage").removeClass("disabled");
		}
		
		$("#diggId .current").removeClass("current");
		$(theElement).addClass("current");
		
		return;
		
	}
	
	var listDataHtml="";
	if(allPageNumber>totalPageToShow)// 以下是大于需要显示页数时的处理方式
	{
		if(flag==0)// 说明还没有重新组装分页
		{
			var preTotalPageToShow=totalPageToShow-3;// 没有重新组装之前，符号“...”之前的页，点击该页需要重新组装分页
			if(clickPageNumber<preTotalPageToShow)// 如果点击的是左边的页数，则不需要重新组装，直接改变相应的css模式即可
			{
				if(clickPageNumber==1)// 如果是第一页，改变上一页按钮的css样式
				{
					$("#prePage").removeClass("listdata");
					$("#prePage").addClass("disabled");
				}
				else// 不是第一页，改变上一页按钮的css样式
				{
					$("#prePage").removeClass("disabled");
					$("#prePage").addClass("listdata");
				}
				$("#diggId .current").removeClass("current");
				$(theElement).addClass("current");
			}
			else// 第一次重新组装
			{
				flag=1;// 重新组装赋值为1
				listDataHtml=genernateListData(allPageNumber,clickPageNumber);
				$("#diggId").empty();
				$(listDataHtml).appendTo($("#diggId"));
				
			}// END OF ELSE
			// getPageData(clickPageNumber);//加载相应页面的数据
		}
		else// 说明已经重新组装分页
		{	
					listDataHtml=genernateListData(allPageNumber,clickPageNumber);
					
					$("#diggId").empty();
					$(listDataHtml).appendTo($("#diggId"));
				
				   // getPageData(clickPageNumber);//加载相应页面的数据
				
		}// end of else
	}
}

/**
 * 当点击了某一个页的时候，按照淘宝等的形式，构建分页需要的 上一页:1:2:3:4:下一页 这样的分页形式的信息
 * 
 * @param totalNumberArgs
 * 
 */
function genernateListData(allPageNumberArgs,clickPageNumberArgs)
{
	var allPageNumber=allPageNumberArgs;
	var clickPageNumber=clickPageNumberArgs;
	var currentSelectedPageNumber=parseInt($("#diggId .current").html());// 当前被选择的页数
	var listDataHtml="";
	// 以下的代码为开始重新组装的代码，点击的页尽量作为中间页显示
	// 首先，改变上一页按钮的css样式，因为肯定不是点击的前面的几页，点击前面几页的时候调用这个函数之前已经拦截
	
	if(1==clickPageNumber)// 如果点击的是第一页
	{
			listDataHtml+="<span id='prePage' class='disabled'>&lt;Prev</span>";// 不显示上一页按钮
			listDataHtml+="<span class='listdata  current'>"+1+"</span>";
	}
	else
	{
			listDataHtml+="<span id='prePage' class=''>&lt;Prev</span>";
			listDataHtml+="<span class='listdata'>"+1+"</span>";
	}

	
	// 首先，组装左边要显示的信息,从第一页开始组装
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
	
	// 然后，组装中间要显示的信息,点击的那一页尽量作为中间页显示

	listDataHtml+=genernateMiddLeftListData(clickPageNumber,allPageNumber);
	listDataHtml+=genernateMiddRightListData(realLeftNumCount,clickPageNumber,allPageNumber);
	
	
	// 然后，组装最后要显示的信息
	// 首先计算从那一页开始显示
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
	if(allPageNumber==clickPageNumber)// 如果点击的是最后一页
	{
			listDataHtml+="<span class='listdata lastPage current'>"+allPageNumber+"</span>";
			listDataHtml+="<span id='nextPage' class='disabled'>Next&gt;</span>"; // 不显示下一页按钮
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
 * 
 * @param clickPageNumber
 * @returns {String}
 */
function genernateMiddLeftListData(clickPageNumber,allPageNumber)
{
	var listDataHtml="";
	// 首先，计算中间部分显示时，点击的那一页左右两边所要显示的页数
	var totalMiddNumCount=middPageToShow-1;  // 中间还需要显示的数据

// var realLeftNumCount; //实际组装过程中，中间左面已经显示的数据
	
	var tempMiddPageToShow=totalMiddNumCount/2; // 理论上，点击页的左右两边，需要显示的页数
	var templeftTempMidd=leftPageToShow+tempMiddPageToShow;// 此数是为了判断中间部分左边要显示的页数是否够用
	
	if(templeftTempMidd>=clickPageNumber)// 左面的数据说明不够用
	{	
		realLeftNumCount=clickPageNumber-leftPageToShow;
		if(realLeftNumCount<0)
			realLeftNumCount=0;
		// 左面的数据说明不够用
// var temp=clickPageNumber-1;
		// 开始组装左面的数据
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
		// 开始组装左面的数据
		// 计算左面第一个要显示的数据页号码
		var tempMiddLeftNum=clickPageNumber-tempMiddPageToShow;
		
		var tmeps=leftPageToShow+1;
		if(tempMiddLeftNum!=tmeps)// 如果中间部分最左边的数和
									// 最左面的一个数是连续的，则不加"..."，如果是不连贯的则加"..."
		{
			listDataHtml+="...";
		}
		
		var endNum=clickPageNumber;
		var tempNum=allPageNumber-rightPageToShow+1;// 次数表示了最左边的显示的页数中的第一个页数号码
		
		if(endNum>=tempNum)
		{
			endNum=tempNum;
		}
		
		// 计算左面已经组装了多少数据
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
 * 
 * @param clickPageNumber
 * @returns {String}
 */
function genernateMiddRightListData(realLeftNumCount,clickPageNumber,allPageNumber)
{
	var listDataHtml="";
	// 开始组装右面的数据，右面的数据可能也有不够的情况
	// 右面需要的数据个数为：
	var rightNum=middPageToShow-1-realLeftNumCount;
	
	var tempRightTempMidd=clickPageNumber+rightNum;// 此数是为了判断中间部分右边要显示的页数是否够用
	
	var tempNum=allPageNumber-rightPageToShow+1;// 次数表示了最左边的显示的页数中的第一个页数号码
	
	if(tempRightTempMidd>=tempNum)// 右面的数据说明不够用
	{
		var tempRightStart=clickPageNumber+1;// 从哪一个页开始生成
		if(leftPageToShow>=tempRightStart)// leftPageToShow的页数已经在genernateListData函数中生成了，所以这里必须要从大于这个数值的地方开始)
		{
			tempRightStart=leftPageToShow+1;
		}
		
		for(var t=tempRightStart;t<tempNum;t++)
		{
			listDataHtml+="<span class='listdata'>"+t+"</span>";
		}
	}
	else// 右面的数据说明够用
	{
		var tempRightToNum=clickPageNumber+rightNum+1;
		var tempRightStart=clickPageNumber+1;// 从哪一个页开始生成

		if(leftPageToShow>=tempRightStart)// leftPageToShow的页数已经在genernateListData函数中生成了，所以这里必须要从大于这个数值的地方开始)
		{
			tempRightStart=leftPageToShow+1;
		}
		for(var t=tempRightStart;t<tempRightToNum;t++)
		{
			listDataHtml+="<span class='listdata'>"+t+"</span>";
		}
		if(tempNum!=tempRightToNum)// 如果中间部分最右边的数和
									// 最右面的第一个数是连续的，则不加"..."，如果是不连贯的则加"..."
		{
			
			listDataHtml+="...";
		}
	}
	return listDataHtml;
}


/**
 */
function registerEventLister()
{
	
	/*点击具体属性时的动作*/
//	$("#filterPanelLeft ").on("click","li",
//		function(){
//			var classString=$(this).attr("class");
//			if(classString.indexOf("selected") != -1)
//			{//已经被选中，转为不选中
//				$(this).removeClass("selected");
//				
//			}
//			else
//			{
//				$(this).addClass("selected");
//			}
//
//			
//		}
//	
//	);
	
	
	
	/*点击属性折叠按钮时的动作*/
//	$("#filterPanelLeft").on("click",".filter-title",
//		function(){
//			var classString=$(this).parents(".filterblock").attr("class");
//			if(classString.indexOf("filter-active") != -1)
//			{//已经显示，转为不显示
////				$(this).parents(".filterblock").children(".selectorsblock").css("display","none");
//				$(this).parents(".filterblock").removeClass("filter-active");
//				$(this).parents(".filterblock").find(".arrow-icon").addClass("arrow-icon-open");
//				
//			}
//			else
//			{
//				$(this).parents(".filterblock").addClass("filter-active");
//				$(this).parents(".filterblock").find(".arrow-icon").removeClass("arrow-icon-open");
//			}
//
//			
//		}
//	
//	);
	
	// 点击上一页按钮时的动作
	$("#diggId").on("click","#prePage",
		function()
		{
			var currentPageElement=$("#diggId .current")[0];// 当前选中的是第几页
			var currentPageNumber=parseInt($("#diggId .current").html());// 当前选中的是第几页
			if(currentPageNumber==1)
			{					
				alert("Already the first one！");
				return;
			}
			else
			{
				var willingShowElement=$("#diggId .current").prev()[0];// 即将显示的页，dom元素
				var clickPageNumber=currentPageNumber-1;
				handlePageClick(clickPageNumber,willingShowElement,currentPageElement);// 改变下面分页栏
				var pageNum=currentPageNumber-1;
				getPageData(pageNum,map,categoryid,startPrice,endPrice,change);// 加载相应的数据
				
			}
			
			return false;
		}
	);
	// 点击下一页按钮时的动作
	$("#diggId").on("click","#nextPage",
		function()
		{
			var currentPageElement=$("#diggId .current")[0];// 当前选中的是第几页
			var allPageNumber=parseInt($(".lastPage").html());// the total
			var currentPageNumber=parseInt($("#diggId .current").html());// 当前选中的是第几页
			
			if(currentPageNumber==allPageNumber)
			{					
				alert("Already the last one！");
			}
			else
			{
				var willingShowElement=$("#diggId .current").next()[0];// 即将显示的页，dom元素
				var pageNum=currentPageNumber+1;
				handlePageClick(pageNum,willingShowElement,currentPageElement);// 改变下面分页栏
				getPageData(pageNum,map,categoryid,startPrice,endPrice,change);// 加载相应的数据
				
			}
			return false;
		}
	);
	
	// 点击相应的某一页按钮时的动作
	$("#diggId").on("click",".listdata",
		function()
		{
			var currentPageElement=$("#diggId .current")[0];// 当前选中的是第几页
			var clickPageNumber=parseInt($(this).html());// 点击的是第几页
			if(isNaN(clickPageNumber))
			{  
			    return;
			}
			handlePageClick(clickPageNumber,this,currentPageElement);
			getPageData(clickPageNumber,map,categoryid,startPrice,endPrice,change);
			// 加载相应的数据，productinfoservice。js ；change in productattributesearch.js
			return false;
		}// end of function
	
	);// end of click
	
}