function getRollImage() {
	
	$.getJSON("fg/secondforegroundpage_getSecondLevelCategoryRollImage.action?categoryid="+categoryid, function(data) {
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

function getNavigation(categoryid) {
	$.getJSON("fg/secondforegroundpage_getSecondLevelNavigation.action?categoryid="+categoryid, function(data) {
		$.each(data, function(key, vo) {
			var ulhtml = "<ul><li><span class='whole'>全部分类</span>";
			var html = "<div class='item fore1 moreitem' clstag='bag|keycount|zbxb|a1'>" +
			"<h3><a title='"+vo.fatherCategory.categoryName +"' href='fg/secondforegroundpage_showAll.action?categoryid="+vo.fatherCategory.categoryId+"'><s class='i1'></s>"+vo.fatherCategory.categoryName+"</a></h3><div class='con'>";
			var maxcount = 0;
			$.each(vo.chileCategories, function(i,value) {
				maxcount += 1;
				if(maxcount>5){
					ulhtml += "<a href='fg/thirdforegroundpage_showAll.action?categoryid="+value.categoryId+"' title='"+value.categoryName+"'>"+value.categoryName+"</a>";
				} else {
					html += "<a title='"+value.categoryName+"' href='fg/thirdforegroundpage_showAll.action?categoryid="+value.categoryId+"'>"+value.categoryName+"</a>";
				}
					
			});
			ulhtml += "</ul>";
			if(maxcount>5){
				html += "<span class='clr'></span></div>"+ulhtml+"</div>";
			}else{
				html += "<span class='clr'></span></div></div>";
				html = html.replace("moreitem","");
			}
			$("#navigationdiv").append(html);
		});
	});
}

