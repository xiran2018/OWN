$(function() {
	loadCategory();
});

var count=0;//计数器，楼层右面的分类是否到达了10个。


/**
 * 加载分类
 */
function loadCategory()
{
	var actionUrl = "client/getShowCategory.action";
	$.ajax( { 
		url : actionUrl,
		type : "post",
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
			insertCategoryInPage(data); //首页，全部商品分类下拉菜单
			insertCategoryFloors(data); //首页楼层动态图
		}
	});// end of ajax
}

/**
 * 插入楼层图
 * @param data
 */
function insertCategoryFloors(data)
{
	var value=$('.category-floors').length; 
	if(value>0)//说明有这个元素，除了首页之外的，都不需要这样操作
	{ 
		var insertHtml="";
		var len=data.length;
		var floorSize=0;//楼层号码
		for(var i=0;i<len;i++)
		{
			var oneElement=data[i];
			var firstLevel=oneElement.firstLevelCategory;
			var isInFloorshow=firstLevel.isInFloorshow;
			if(isInFloorshow==0||isInFloorshow==null||isInFloorshow==undefined)
				continue;
			else
			{
				floorSize=floorSize+1;
				insertHtml+="<div class='category-item'>";
				insertHtml+="<div class='shopping'><span class='floor-number'><em class='solid-color-arrow'></em>"+floorSize+"F</span>";
				
				var image=firstLevel.image;
				var categoryName=firstLevel.categoryName;
				var categoryId=firstLevel.categoryId;
				
				insertHtml+="<h2 class='floor-title  ctr-track-a'><a href=category/category_showAll.action?categoryid="+categoryId+">"+categoryName+"</a></h2></div>";
	
				//添加下面的分类
				insertHtml+="<div class='seller index-floor'><div class='floor-12 floor-items-list'><ul class='floor-left'>";
				//左面大图
				insertHtml+="<li class='floor-big-img ctr-track'><a href=category/category_showAll.action?categoryid="+categoryId+"><img src='"+image+"' width='285' height='452'></a></li></ul>";
				
				//右面小图,右面小图不仅仅是第二级别的名称，因为可能不够，影响美观，所以也需要第三级别的过来补充，但是最多就是10个
				insertHtml+="<div class='floor-right  ctr-track-a clearfix'>";
				
				var secondLevelList=oneElement.secondLevelList;
				var floorRightHtml=getCategoryFloorRightHtml(secondLevelList);
				insertHtml+=floorRightHtml;
				insertHtml+="</div></div></div></div><div class='clearboth'></div>";
			}
		
		}
		
		$(".category-floors").append(insertHtml);

		//console.log("insertHtml="+insertHtml);
	} 
}
/**
 * 插入楼层右面的分类，,右面小图不仅仅是第二级别的名称，因为可能不够，影响美观，所以也需要第三级别的过来补充，但是最多就是10个
 * @param secondLevelList
 */

function getCategoryFloorRightHtml(secondLevelList)
{
	count=0;//计数器，楼层右面的分类是否到达了10个。
	var insertHtml="";
	var len=secondLevelList.length;
	for(var i=0;i<len;i++)
	{
		if(count<8)//小于10个，可以继续构建
		{
			var oneElement=secondLevelList[i];
			var secondLevel=oneElement.secondLevelCategory;
			var isInFloorshow=secondLevel.isInFloorshow;
			if(isInFloorshow!=0&&isInFloorshow!=null&&isInFloorshow!=undefined)
			{//如果不让其在页面的楼层显示，则跳过这一个分类
				var categoryName=secondLevel.categoryName;
				var categoryId=secondLevel.categoryId;
				var image=secondLevel.image;
				insertHtml+="<a href=category/category_showAll.action?categoryid="+categoryId+" class='floor-right-item trigger-hover img-box'>";
				insertHtml+="<img class='item-img' data-lazy='' src='"+image+"' alt='"+categoryName+"'>";
				insertHtml+="<h3 class='floor-item-name'><span class='item-name'>"+categoryName+"</span></h3>";
				insertHtml+="</a>";
				count=count+1;//二级构建完毕了一个
			}
			//开始从第三级别里找要在右面显示的分类
			thirdLevelList=oneElement.thirdLevelList;
			insertHtml+=getCategoryFloorRightHtmlInThirdLevel(thirdLevelList)
		}
	}
	return insertHtml;
}



/**
 * 插入楼层右面的分类，构建第三级别的函数，但是最多就是10个
 * @param secondLevelList
 */

function getCategoryFloorRightHtmlInThirdLevel(thirdLevelList)
{
	var insertHtml="";
	var len=thirdLevelList.length;
	for(var i=0;i<len;i++)
	{
		if(count<10)//小于10个，可以继续构建
		{
			var oneElement=thirdLevelList[i];
			var isInFloorshow=oneElement.isInFloorshow;
			if(isInFloorshow!=0&&isInFloorshow!=null&&isInFloorshow!=undefined)
			{//如果不让其在页面的楼层显示，则跳过这一个分类
				var categoryName=oneElement.categoryName;
				var categoryId=oneElement.categoryId;
				var image=oneElement.image;
				insertHtml+="<a href=category/category_showAll.action?categoryid="+categoryId+" class='floor-right-item trigger-hover img-box'>";
				insertHtml+="<img class='item-img' data-lazy='' src='"+image+"' alt='"+categoryName+"'>";
				insertHtml+="<h3 class='floor-item-name'><span class='item-name'>"+categoryName+"</span></h3>";
				insertHtml+="</a>";
				count=count+1;//三级构建完毕了一个
			}
		}
	}
	return insertHtml;
}


/**
 **
 * @param data
 * 
 */
function insertCategoryInPage(data)
{
	var insertHtml="";
	var len=data.length;
	for(var i=0;i<len;i++)
	{
		var oneElement=data[i];
		var firstLevel=oneElement.firstLevelCategory;
		
		var icon=firstLevel.icon;
		if(i==0)
		{
			insertHtml+="<li class='first'> <div class='menu-item' style=''><span class='category-smallimg'><img  src='"+icon+"'/></span>";
		}
		else
		{
			insertHtml+="<li class=''> <div class='menu-item' style=''><span class='category-smallimg'><img  src='"+icon+"'/></span>";
		}
		
		var categoryName=firstLevel.categoryName;
		var categoryId=firstLevel.categoryId;
		insertHtml+="<span><a class='categoryName' href=category/category_showAll.action?categoryid="+categoryId+">"+categoryName+"</a></span></div> ";
		
		var secondLevelList=oneElement.secondLevelList;
		var menuPanelHtml=getMenuPanelHtml(secondLevelList);
		insertHtml+=menuPanelHtml;
	
		insertHtml+="</li>";
	}
	
	$(".catgoryContainerUL").append(insertHtml);
	registerSilderEvent();
	//console.log("insertCategoryInPage  insertHtml="+insertHtml);

}

/**
 * 得到二级分类
 * @param secondLevelList
 *
 */
function getMenuPanelHtml(secondLevelList)
{
	//console.log("********************secondLevelList************************");
	var insertHtml="<div class='menu-panel'><ul> ";
	var len=secondLevelList.length;
	for(var i=0;i<len;i++)
	{
		
		var oneElement=secondLevelList[i];
		var secondLevel=oneElement.secondLevelCategory;
		
		var categoryName=secondLevel.categoryName;
		var categoryId=secondLevel.categoryId;
		insertHtml+="<li><h2><a class='secondlevel-categoryName' href=category/category_showAll.action?categoryid="+categoryId+">"+categoryName+"</a></h2>";
		
		insertHtml+="<div class='link-list'>";
		
		var thirdLevelList=oneElement.thirdLevelList;
		var linkItemHtml=getLinkItemHtml(thirdLevelList);
		insertHtml+=linkItemHtml;
		insertHtml+="</div><div class='clear'></div></li>";
	
	}
	insertHtml+="</ul></div>";
	return insertHtml;
	console.log("getMenuPanelHtml  insertHtml="+insertHtml);
}

/**
 * 得到三级分类
 * @param thirdLevelList
 * 
 */
function getLinkItemHtml(thirdLevelList)
{
	//console.log("********************thirdLevelList************************");
	var insertHtml="";
	var len=thirdLevelList.length;
	for(var i=0;i<len;i++)
	{
		
		var oneElement=thirdLevelList[i];
		
		var categoryName=oneElement.categoryName;
		var categoryId=oneElement.categoryId;
		insertHtml+="<div class='link-wrapper'><span>|</span><a class='thirdlevel-categoryName' href=category/category_showAll.action?categoryid="+categoryId+">"+categoryName+"</a></div> ";
	
	}
	return insertHtml;
	
	console.log("getLinkItemHtml  insertHtml="+insertHtml);
}