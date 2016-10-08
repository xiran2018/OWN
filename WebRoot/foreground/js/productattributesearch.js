/***********************global variables********************************************/
var flag = 0;//当点击更多标签时的事件
var map = null;  //存储属性信息，在属性查找时使用
var change = false;
/*******************************************************************/
$(document).ready(function() {
	map = new Map();
});
function addAttributeLabel(selectString,elem) {
	var appendString = "<li class='crumbAttr'><span class='selectAttrValue'>"+ selectString+ "</span><span atrid='"+elem.attr("atrid")+"' atrvid='"+elem.attr("atrvid")+"' class='crumbDelete'></span> </li>";
	$(".crumbSlide-con").append(appendString);
	getPageData(0,map,categoryid,startPrice,endPrice,true);
}

/**
 * 点击相应的属性时的动作
 * @param categoryid
 */
function registEvents(categoryid)
{
	$("div.j_NavAttrs").on("click","li",function() { //点击相应的属性时，把属性添加上页面上
		var selectString = $(this).children("a").html();
		var elem = $(this).children("a");
		
		if(map.get(elem.attr("atrid"))==null){
			var atrArgs = new List();
			map.put(elem.attr("atrid"), atrArgs);
			atrArgs.add(elem.attr("atrvid"));
			addAttributeLabel(selectString,elem);
		} else {
			var atrArgs = map.get(elem.attr("atrid"));
			if(!atrArgs.constains(elem.attr("atrvid"))) {
				atrArgs.add(elem.attr("atrvid"));
				addAttributeLabel(selectString,elem);
			}
		}
		
		if(map.size()!=0){
			change = true;
			totalNumber = getTotalNumber(map,categoryid,startPrice,endPrice,change);
			buildPageTable(totalNumber);
		}
		return;
	});

	$("#selectAttrs").on("click", ".crumbDelete", function() { // 点击删除按钮时移除选择的属性
		var elem = $(this);
		if(map.get(elem.attr("atrid"))!=null){
			var atrArgs = map.get(elem.attr("atrid"));
			atrArgs.remove(atrArgs.getIndex(elem.attr("atrvid")));
			if(atrArgs.size()==0){
				map.remove(elem.attr("atrid"));
			}
		}
		
		if(map.size()==0){
			change = false;
			$("#sellerul").empty();
			getPageData(0,map,categoryid,startPrice,endPrice,false);
		} else{
			getPageData(0,map,categoryid,startPrice,endPrice,true);
		}
		totalNumber = getTotalNumber(map,categoryid,startPrice,endPrice,change);
		buildPageTable(totalNumber);
		$(this).parent(".crumbAttr").remove();
		return;
	});
}

/**
 * 更多标签时的事件
 * @param element
 */
function moreChange(element) {
	if (flag == 0) {
		$(element).children(".ui-more-drop-l-arrow").css({
			"background-position" : "-2px -84px"
		});
		$(element).children(".opentiontext").text("收起");
		flag = 1;
	} else if (flag == 1) {
		
		$(element).children(".ui-more-drop-l-arrow").css({
			"background-position" : "-2px -78px"
		});
		$(element).children(".opentiontext").text("更多");
		flag = 0;
	}

}

function getAllAttribute(categoryid) {
	$.getJSON("category/category_getAllAttribute.action?categoryid="+categoryid, function(data) {
		var html = "";
		$.each(data, function(index,atrv) {
			html += "<div class='propAttrs'><div class='j_Prop attr hotspot' data-mindiffrow='2'>";
			html += "<div class='attrKey' atrid='"+atrv.atr.attrId+"'>"+atrv.atr.attrName+"</div>";
			html += "<div class='attrValues'>";
			html += "<ul class='av-collapse'>";
			$.each(atrv.valueList, function(index,value) {
				html += "<li  class='test'><a atrid='"+value.atrValue.attrId+"' atrvid='"+value.atrValue.attrValueId+"' href='javascript:void(0)'>"+value.atrValue.attrValueName+"</a></li>";
			});
			html += "</ul></div></div></div>";
		});
		$("#allatr").append(html);
	});
	
}