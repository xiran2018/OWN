//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||该区域函数的代码不需要改动

/**
 * 该分页程序使用的时候，页面中需要包含相应的css文件，显示的内容需要包含id为sellerul的元素， 同时需要<div class="digg"
 * id="diggId"> </div> <!-- 显示分页按钮时需要的div -->
 */
$().ready(
	function() 
	{
		registerEventLister();//左右条
		registerPriceLister(false);//价格区间
		getExhibitionProducts(0,map,categoryid,0,2147483647);
		// ********************************************************这里的代码不需要改动，需要根据实际却动totalNmuberPage的值
		buildPageTable(totalNumber);
		// ********************************************************
	}
		
);// end of ready


// ********************************************************************************************
/**
 * the global Variable 页面分页显示相关
 */
// 默认：1 2 3 4 5 6 7 8 9...50
// 重新组装分页：1 2 ... 9 10 11 12 13 14...50
var flag=0;// 表示，显示的页数是否发生了相应的变化，如果发生了变化再执行重新组装分页，然后进行显示,0表示无重新组装，1表示已经重新组装
// var totalPageToShow=12;//第一次页面显示时，在页面中需要显示的页的数量
var leftPageToShow=3;// 左面需要显示的页数，默认：3
var middPageToShow=7; // 此数值必须为一个奇数，默认：7
var rightPageToShow=3;// 右面需要显示的页数，默认：3
var totalPageToShow=leftPageToShow+middPageToShow+rightPageToShow;// 第一次页面显示时和页面分页改变以后，页面显示时，在页面中需要显示的页的数量
var realLeftNumCount;  // 实际组装过程中，中间左面已经显示的数据

// ********************************************************************************************
function buildPageTable(totalNumber) {
	$("#diggId").empty();
	var listDataHtml=buildUpListData(totalNumber);
	$(listDataHtml).appendTo($("#diggId"));
}

/**
 */
function registerEventLister()
{
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
			getPageData(clickPageNumber,map,categoryid,startPrice,endPrice,change);// 加载相应的数据
			return false;
		}// end of function
	
	);// end of click
	
}

