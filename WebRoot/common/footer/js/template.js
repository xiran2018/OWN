$(document).ready(function () {
	loadDetailedInfo();
});

/**
 * 加载页面详细的信息
 */
function loadDetailedInfo()
{
	var actionUrl = "client/getShowDetailedInfo.action";
	var params={
		"id":id
	};
	$.ajax( { 
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
				// alert(messageResourceErrorTips);
			}
			else if(data.status=="500")
			{	
				// alert(messageResourceErrorTips);
			}
			
		},
		success : function(data) 
		{
			insertFooterNavInfoInPage(data.ccs);
			insertFooterContentInPage(data.content);
		}
	});// end of ajax
}

/**
 * 插入页面内容
 * @param content
 */
function insertFooterContentInPage(content)
{
	var contentInfo=content.content;
	$("#footerInfoContent").append(contentInfo);
}

/**
 **插入页面左侧导航信息
 * @param data
 * 
 */
function insertFooterNavInfoInPage(data)
{
	var insertHtml="";
	var len=data.length;
	for(var i=0;i<len;i++)
	{
		insertHtml+="<h3>";
		
		var oneElement=data[i];
		var firstLevel=oneElement.fatherFooterInfo;
		
		var name=firstLevel.name;
		insertHtml+="<a title="+name+" class='current' href='javascript:void(0)' onclick='return false;' style='cursor:text'>"+name+"</a>";
		insertHtml+="</h3>";
		
		var childFooterInfo=oneElement.childFooterInfo;
		var menuPanelHtml=getSecondNavInfoHtml(childFooterInfo);
		insertHtml+=menuPanelHtml;
		
	
	}
	
	$("#navContentDiv").append(insertHtml);
	console.log("insertHtml="+insertHtml);

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
function getSecondNavInfoHtml(secondLevelList)
{
	var insertHtml="<div class='con'>";
	var len=secondLevelList.length;
	for(var i=0;i<len;i++)
	{
		
		var oneElement=secondLevelList[i];
		
		var pagename=oneElement.pagename;
		var name=oneElement.name;
		var id=oneElement.id;
		
		insertHtml+="<div><a title="+name+"  href="+pagename+"?id="+id+">"+name+"</a></div>";
			
	}
	insertHtml+="</div>";
	return insertHtml;
}