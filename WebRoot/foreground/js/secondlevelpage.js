/**
 * 滚动图片
 */
function getRollImage() {
	
	$.getJSON("category/category_getSecondLevelCategoryRollImage.action?categoryid="+categoryid, function(data) {
		var rollimg = "";
		var staticimg = "";
		$.each(data, function(index,image) {
			if(image.type==0) {
				rollimg += "<li><a href='"+image.imghref+"' target='_blank'><img style='width: 100%;' src='"+image.imgsrc+"' alt='CSS' /></a></li>";
			} else if (image.type==1) {
				staticimg += "<li><a href='"+image.imghref+"' ><img style='height:158.5px; width:333.3px;' src='"+image.imgsrc+"' alt='CSS' /></a></li>";
			}
				
		});
		$("#rollimg").append(rollimg);
		$("#staticimg").append(staticimg);
		//console.log(staticimg);

		//图片轮播
		imagePlay();
	});
}

/**
 * 获取子分类在左面显示
 * @param categoryid
 */
function getNavigation(categoryid) 
{

	var ulhtml = "";
	$.getJSON("category/category_getSecondLevelNavigation.action?categoryid="+categoryid, function(data) {
		
		$.each(data, function(key, vo) {
			
			html="";
			var flag=false; //是否在子分类中找到了某一个子分类点击了
			//categoryid IS IN JSP
			
			//首先是子分类的处理
			html += "<ul class=''>"
			$.each(vo.chileCategories, function(i,value) {  
				 
				if(categoryid==value.categoryId)//点击的是这个category
				{
					html += "<li class='selected hasnochild'><a href='category/category_showAll.action?categoryid="+value.categoryId+"'>"+value.categoryName+"</a></li>";
					flag=true;
				}
				else
				{
					html += "<li><a href='category/category_showAll.action?categoryid="+value.categoryId+"'>"+value.categoryName+"</a></li>";
				}
			});
			html += "</ul>";
			
			//categoryid IS IN JSP
			if(flag||categoryid==vo.fatherCategory.categoryId)//点击的是这个category
			{
				ulhtml += "<li class='selected hasnochild'>";
			}
			else
			{
				ulhtml += "<li class='hasnochild'>";
			}
			
			ulhtml += "<a href='category/category_showAll.action?categoryid="+vo.fatherCategory.categoryId+"'>"+vo.fatherCategory.categoryName+"</a>";
			
			
			if(flag||categoryid==vo.fatherCategory.categoryId)
			{//该子分类有被点击的，所以要显示
				ulhtml +=html;
			}
			
			ulhtml+="</li>";

		});//end of each
		
		$(".sidemenu").append(ulhtml);
	});//end of post
	
	
}

/**
 * 生成商品展示之上的一个小导航
 * @param routeCategoryIdArray  #分割的name
 * @param data  所有的商品分类信息
 */
function handleCategoryFloorTitle(routeCategoryFloorTitle)
{
	
	var categoryFloorTitle="";//routeCategoryIds is in jsp
	var routeCategoryIdNameArray=routeCategoryFloorTitle.split("#");
	for(var i=0;i<routeCategoryIdNameArray.length;i++)
	{
		
		if(categoryFloorTitle=="")
			categoryFloorTitle="<div><a href='' itemprop='url'><span itemprop='title'>"+routeCategoryIdNameArray[i]+"</span></a></div>";
		else
			categoryFloorTitle+="<span class='divider'>»</span>"+"<div><a href='' itemprop='url'><span itemprop='title'>"+routeCategoryIdNameArray[i]+"</span></a></div>";
	}
	$("#categoryFloorTitle").append(categoryFloorTitle);
}
