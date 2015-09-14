$(function() {
	loadFooterInfo();
	loadCopyRightInfo();
});

/**
 * 加载版权等信息
 */
function loadCopyRightInfo()
{
	var actionUrl = "client/getCopyRightInfo.action";
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
			insertCopyRightInfoInPage(data);
		}
	});// end of ajax
}
/**
 **
 * @param data
 * 
 */
function insertCopyRightInfoInPage(data)
{
	$("#copy-right").append(data);
}
/**
 * 加载页脚上面的信息
 */
function loadFooterInfo()
{
	var actionUrl = "client/getShowStoreFooterInfo.action";
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
			insertFooterInfoInPage(data);
		}
	});// end of ajax
}
/**
 **
 * @param data
 * 
 */
function insertFooterInfoInPage(data)
{
	var insertHtml="";
	var len=data.length;
	for(var i=0;i<len;i++)
	{
		insertHtml+="<li>";
		
		var oneElement=data[i];
		var firstLevel=oneElement.fatherFooterInfo;
		
		var name=firstLevel.name;
		insertHtml+="<a class='current' href='javascript:void(0)' onclick='return false;' style='cursor:text'>"+name+"</a>";
		
		var childFooterInfo=oneElement.childFooterInfo;
		var menuPanelHtml=getSecondFooterInfoHtml(childFooterInfo);
		insertHtml+=menuPanelHtml;
		
		insertHtml+="</li>";
	
	}
	
	$(".footer-info").append(insertHtml);
	//console.log("insertHtml="+insertHtml);

}

/**
 * 得到二级分类
 * @param secondLevelList
 * createtime: null
description: "售前"
fatherid: null
id: 13
image: "upload/categoryImage/2014111116121862319.jpg"
keyword: "售前"
name: "sales"
pagename: null
status: null
title: "售前"
 *
 */
function getSecondFooterInfoHtml(secondLevelList)
{
	var insertHtml="";
	var len=secondLevelList.length;
	for(var i=0;i<len;i++)
	{
		
		var oneElement=secondLevelList[i];
		
		var pagename=oneElement.pagename;
		var name=oneElement.name;
		var id=oneElement.id;
		
		insertHtml+="<a href="+pagename+"?id="+id+">"+name+"</a>";
			
	}
	return insertHtml;
}