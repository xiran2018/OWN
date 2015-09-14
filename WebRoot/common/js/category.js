$(function() {
	loadCategory();
});


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
			insertCategoryInPage(data);
			insertCategoryFloors(data);
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
		for(var i=0;i<len;i++)
		{
			var floorSize=i+1;
			insertHtml+="<div class='category-item'>";
			insertHtml+="<div class='shopping'><span class='floor-number'><em class='solid-color-arrow'></em>"+floorSize+"F</span>";
			var oneElement=data[i];
			var firstLevel=oneElement.firstLevelCategory;
			
			var image=firstLevel.image;
			var categoryName=firstLevel.categoryName;
			var categoryId=firstLevel.categoryId;
			
			insertHtml+="<h2 class='floor-title  ctr-track-a'><a href=fg/secondforegroundpage_showAll.action?categoryid="+categoryId+">"+categoryName+"</a></h2></div>";

			//添加下面的分类
			insertHtml+="<div class='seller index-floor'><div class='floor-12 floor-items-list'><ul class='floor-left'>";
			//左面大图
			insertHtml+="<li class='floor-big-img ctr-track'><a href=fg/secondforegroundpage_showAll.action?categoryid="+categoryId+"><img src='"+image+"' width='285' height='452'></a></li></ul>";
			
			//右面小图
			insertHtml+="<div class='floor-right  ctr-track-a clearfix'>";
			
			var secondLevelList=oneElement.secondLevelList;
			var floorRightHtml=getCategoryFloorRightHtml(secondLevelList);
			insertHtml+=floorRightHtml;
			
			insertHtml+="</div></div></div></div><div class='clearboth'></div>";
		
		}
		
		$(".category-floors").append(insertHtml);

		//console.log("insertHtml="+insertHtml);
	} 
}
/**
 * 插入楼层右面的分类
 * @param secondLevelList
 */
function getCategoryFloorRightHtml(secondLevelList)
{
	var insertHtml="";
	var len=secondLevelList.length;
	for(var i=0;i<len;i++)
	{
		var oneElement=secondLevelList[i];
		var secondLevel=oneElement.secondLevelCategory;
		
		var categoryName=secondLevel.categoryName;
		var categoryId=secondLevel.categoryId;
		var image=secondLevel.image;
		
		insertHtml+="<a href=fg/secondforegroundpage_showAll.action?categoryid="+categoryId+" class='floor-right-item trigger-hover img-box'>";
		insertHtml+="<img class='item-img' data-lazy='' src='"+image+"' alt='"+categoryName+"'>";
		insertHtml+="<h3 class='floor-item-name'><span class='item-name'>"+categoryName+"</span></h3>";
		insertHtml+="</a>";
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
		insertHtml+="<span><a class='categoryName' href=fg/secondforegroundpage_showAll.action?categoryid="+categoryId+">"+categoryName+"</a></span></div> ";
		
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
		insertHtml+="<li><h2><a class='secondlevel-categoryName' href=fg/secondforegroundpage_showAll.action?categoryid="+categoryId+">"+categoryName+"</a></h2>";
		
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
		insertHtml+="<div class='link-wrapper'><span>|</span><a class='thirdlevel-categoryName' href=fg/thirdforegroundpage_showAll.action?categoryid="+categoryId+">"+categoryName+"</a></div> ";
	
	}
	return insertHtml;
	
	console.log("getLinkItemHtml  insertHtml="+insertHtml);
}