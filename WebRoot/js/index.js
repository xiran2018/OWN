$(function() {
	

	registerEvents();// 事件注册
	
	loadImageToPaly(); // 加载轮播图片

});

/**
 *加载轮播图片并使其轮播
 *加载轮播图上面的右边小图片
 */
function loadImageToPaly()
{
	loadImage();
	loadSmallImage();
}

/**
 *加载轮播图上面的小图片
 */
function loadSmallImage()
{
	var actionUrl = "client/getIndexSmallImage.action";
	$.ajax( { // 取语言
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
			insertSmallImageInPage(data);
		}
	});// end of ajax
}
/**
 *  * id: 2
imghref: "2"
imgsrc: "upload/foregroundImage/2014111914255518522.jpg"
leftcolor: "wqe"
rightcolor: "qwe"
type: 1
used: 1
 * @param data
 */
function insertSmallImageInPage(data)
{

 
	var insertHtml="";

	var imghref=data.imghref;
	var imgsrc=data.imgsrc;
//	var tempName=data[i].foreignerName;
	insertHtml+="<a href='"+imghref+"' target='_blank'><img height='480' width='190' src='"+imgsrc+"' alt='' /></a>";
	
	$(".rightsmall").append(insertHtml);

}
/**
 *加载轮播图片
 */
function loadImage()
{
	var actionUrl = "client/getIndexPlayImage.action";
	$.ajax( { // 取语言
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
			insertImageInPage(data);
			imagePlay();
		}
	});// end of ajax
}

/**
 * 插入图片
 * 
 * @param data
 */
function insertImageInPage(data)
{

 
	var insertHtml="";
	var len=data.length;
	for(var i=0;i<len;i++)
	{
		var imghref=data[i].imghref;
		var imgsrc=data[i].imgsrc;
		var tempName=data[i].foreignerName;
		var leftcolor=data[i].leftcolor;
		var rightcolor=data[i].rightcolor;
		insertHtml+="<li>";
		insertHtml+="<div class='left'><div class='container' style='background-color: "+leftcolor+";'></div></div>";
		insertHtml+="<div class='mid'><div class='container'><a href='"+imghref+"' target='_blank'><img src='"+imgsrc+"' alt='CSS' /></a></div></div>";
		insertHtml+="<div class='right'><div class='container' style='background-color: "+rightcolor+";'></div></div>";
		insertHtml+="</li>";
		
		
	}
	
	insertHtml+="</ul>";
	
	$(".imagePlayContainerUL").append(insertHtml);

}

/**
 * 注册事件
 */
function registerEvents()
{

}