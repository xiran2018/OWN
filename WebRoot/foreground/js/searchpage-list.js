//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||该区域函数的代码不需要改动

/**
 * 该分页程序使用的时候，页面中需要包含相应的css文件，显示的内容需要包含id为sellerul的元素， 同时需要<div class="digg"
 * id="diggId"> </div> <!-- 显示分页按钮时需要的div -->
 */
$().ready(
	function() 
	{
		registerEventLister(); 
		registerPriceLister(true);
		// ********************************************************这里的代码不需要改动，需要根据实际却动totalNmuberPage的值
		buildPageTable(totalNumber);
		getSearchProducts(0,searchMsg,startPrice,endPrice);// 加载相应的数据
		// ********************************************************
	}
);

// ********************************************************************************************

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
					getSearchProducts(pageNum,searchMsg,startPrice,endPrice);// 加载相应的数据
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
					getSearchProducts(pageNum,searchMsg,startPrice,endPrice);// 加载相应的数据
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
			getSearchProducts(clickPageNumber,searchMsg,startPrice,endPrice);// 加载相应的数据
			return false;
		}// end of function
	);// end of click
}

// ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||end


