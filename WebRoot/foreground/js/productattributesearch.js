/***********************global variables********************************************/
var flag = 0;//当点击更多标签时的事件
var map = null;  //存储属性信息，在属性查找时使用
var mapObj=null;
var change = false;  //表示是否有过滤属性
/*******************************************************************/
$(document).ready(function() {
	map = new Map();
	mapObj=new Map(); //初次加载时使用，存放属性值和名字等信息,key为attrid，value是一个map，存放为属性值的id和名称，当全部遍历完成属性时使用
});
/**
 * 点击商品属性值的动作
 * @param selectString
 * @param elem
 */
function addAttributeLabel(selectString,elem) 
{
	var attrid=elem.attr("atrid");
	var attrvalueId=elem.attr("atrvid");
	var attrVauleName=selectString;
	addAttrInpage(attrid,attrvalueId,attrVauleName);
//	var eleId="top-"+elem.attr("atrid")+"-"+elem.attr("atrvid");
//	var appendString = "<li id='"+eleId+"' class='crumbAttr'><span class='selectAttrValue'>"+ selectString+ "</span><span atrid='"+elem.attr("atrid")+"' atrvid='"+elem.attr("atrvid")+"' class='crumbDelete'></span> </li>";
//	$(".crumbSlide-con").append(appendString);
	getPageData(0,map,categoryid,startPrice,endPrice,true); //根据属性查找商品信息，productinfoservice。js
}
/**
 * 点击左边显示的商品属相过滤按钮时
 * 把右边的商品属性选中状态取消掉
 * @param atrid
 * @param atrvid
 */
function attrtopToDel(atrid,atrvid)
{
	var eleId="top-"+atrid+"-"+atrvid;
	$("#"+eleId).remove();
}

/**
 * 点击上边显示的商品属相过滤按钮时
 * 把左边的商品属性选中状态取消掉
 * @param atrid
 * @param atrvid
 */
function attrLeftToDel(atrid,atrvid)
{
	var eleId="left-"+atrid+"-"+atrvid;
	$("#"+eleId).removeClass("selected");
}

/**
 * //根据map得到所有的属性值信息，用；隔开
 * @param map
 */
function getfilterString(map)
{
	var temp="";
	var values=map.values(); // 获取MAP中所有VALUE的数组（ARRAY）,values本身是一个array，valuse里面的元素是list 在 jsmap。js中定义
	var len=values.length;
	for(var i=0;i<len;i++)
	{
		var listEle=values[i]; //ele 是一个list  在 jsmap。js中定义
		var size=listEle.size();
		for(var j=0;j<size;j++)
		{
			var ele=listEle.get(j);
			if(temp=="")
				temp=ele;
			else
				temp+=";"+ele;
		}

	}
	return temp;
}

function changeURL(map) //改变URL
{
	var attrFilterStr="";
	var attrString=getfilterString(map);
	if(attrString!="")
	{
		attrFilterStr="attrArgs="+attrString;
	}
	
	var customerRequestPageArray=customerRequestPage.split("&");
	var appendArgs="";
	for ( var args in customerRequestPageArray) {
		if(customerRequestPageArray[args].indexOf("attrArgs")==-1)
			appendArgs+=customerRequestPageArray[args];
	}
	if(attrFilterStr=="")
		window.history.pushState({},0,'http://'+window.location.host+'/'+appendArgs); 
	else
		window.history.pushState({},0,'http://'+window.location.host+'/'+appendArgs+'&'+attrFilterStr); 
}
/**
 * 点击取消属性值时的动作
 * @param obj
 */
function clickAttrValueToDel(obj)
{//点击删除按钮时，把选择的属性值删除
	
	var elem = $(obj);
	
	attrLeftToDel(elem.attr("atrid"),elem.attr("atrvid")); //把左边的商品属性选中状态取消掉
	
	if(map.get(elem.attr("atrid"))!=null)
	{
		var atrArgs = map.get(elem.attr("atrid"));  //根据属性id从map中查找 获取value，也就是属性值列表
		atrArgs.remove(atrArgs.getIndex(elem.attr("atrvid")));  //在属性值列表中，删除这个属性值
		if(atrArgs.size()==0)
		{//如果属性值列表等于0，删除该属性
			map.remove(elem.attr("atrid"));
		}
	}
	
	if(map.size()==0)
	{
		$("#shopping").css("display","none");  //没有属性值可以显示，隐藏掉
		change = false;  //是否有相应的用户过滤属性
		$("#sellerul").empty();
		getPageData(0,map,categoryid,startPrice,endPrice,false);
	} 
	else
	{
		getPageData(0,map,categoryid,startPrice,endPrice,true);
	}
	totalNumber = getTotalNumber(map,categoryid,startPrice,endPrice,change);
	buildPageTable(totalNumber);
	$(obj).parent(".crumbAttr").remove();
	
	changeURL(map); //改变URL
	
	return;
}
/**
 * 点击增加属性值时的动作
 * @param obj
 */
function clickAttrValueToAdd(obj) 
{ //点击相应的属性时，把属性添加页面上
	$("#shopping").css("display","");  //显示点击属性的地方可以显示
	var selectString = $(obj).children("a").attr("atrvname");  //得到属性值的名字
	var elem = $(obj).children("a");
	
	if(map.get(elem.attr("atrid"))==null)
	{//MAP 中还没有此属性信息
		var atrArgs = new List();
		map.put(elem.attr("atrid"), atrArgs);
		atrArgs.add(elem.attr("atrvid"));
		addAttributeLabel(selectString,elem);  //在上方增加属性信息
		
	} 
	else 
	{//MAP 中有此属性信息
		var atrArgs = map.get(elem.attr("atrid"));
		if(!atrArgs.constains(elem.attr("atrvid"))) 
		{//不包含此属性值，才进行添加
			atrArgs.add(elem.attr("atrvid"));
			addAttributeLabel(selectString,elem);
		}
		else
			return; //已经有次属性，直接返回
	}
	
	if(map.size()!=0)
	{
		getfilterString(map); //根据map得到所有的属性值信息，用；隔开
		change = true; //表示是否有过滤属性
		totalNumber = getTotalNumber(map,categoryid,startPrice,endPrice,change);
		buildPageTable(totalNumber);
	}
	changeURL(map); //改变URL
	return;
}

/**
 * 点击相应的属性时的动作
 * @param categoryid
 */
function registEvents(categoryid)
{
	
	/*点击属性折叠按钮时的动作*/
	$("#filterPanelLeft").on("click",".filter-title",
		function(){
			var classString=$(this).parents(".filterblock").attr("class");
			if(classString.indexOf("filter-active") != -1)
			{//已经显示，转为不显示
//				$(this).parents(".filterblock").children(".selectorsblock").css("display","none");
				$(this).parents(".filterblock").removeClass("filter-active");
				$(this).parents(".filterblock").find(".arrow-icon").addClass("arrow-icon-open");
				
			}
			else
			{
				$(this).parents(".filterblock").addClass("filter-active");
				$(this).parents(".filterblock").find(".arrow-icon").removeClass("arrow-icon-open");
			}

			
		}
	
	);
	
	/*点击具体属性时的动作*/
	$("#filterPanelLeft ").on("click","li",
		function(){
			var classString=$(this).attr("class");
			if(classString.indexOf("selected") != -1)
			{//已经被选中，转为不选中
				$(this).removeClass("selected");
				
				attrtopToDel($(this).attr("atrid"),$(this).attr("atrvid"));//把上边的商品属性取消掉
				
				clickAttrValueToDel(this);
				
			}
			else
			{//选中
				$(this).addClass("selected");
				clickAttrValueToAdd(this); 
			}

			
		}
	
	);
	


	$("#selectAttrs").on("click", ".crumbDelete", function() 
	{ // 点击删除按钮时移除选择的属性
		clickAttrValueToDel(this);
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



function getAllAttribute(categoryid) 
{
	
	$.getJSON("category/category_getAllAttribute.action?categoryid="+categoryid, function(data) {
		var html = "";
		$.each(data, function(index,atrv) {
			
			html += "<div class='filterblock wbsize show'>";
			//属性名字
			html += "<div class='filter-title'>";
			html += "<i class='arrow-icon arrow-icon-open'></i>"+atrv.atr.attrName+"<a class='reset'>Сбросить</a>";
			html += "</div>";
				
			//属性值
			html += "<div class='selectorsblock custom-scroll'>";
			html += "<ul id='wbsize_list_left' style='opacity: 1;'>";
			
			//属性值
			$.each(atrv.valueList, function(index,value) {
				//查找这个属性值是否用户选择的属性值
				initMap(atrv.atr.attrId,value.atrValue.attrValueId,value.atrValue.attrValueName);
				
				var eleId="left-"+atrv.atr.attrId+"-"+value.atrValue.attrValueId;
				if(attrStr.indexOf((""+value.atrValue.attrValueId))!=-1)
					html += "<li atrid='"+atrv.atr.attrId+"' atrvid='"+value.atrValue.attrValueId+"'  id='"+eleId+"' class='selected'><a atrid='"+atrv.atr.attrId+"' atrvid='"+value.atrValue.attrValueId+"' atrvname='"+value.atrValue.attrValueName+"' href='javascript:void(0)'>"+"<i class='pseudocheckbox'></i>"+value.atrValue.attrValueName+"<span style='display: none;'>(5)</span></a></li>";
				else
					html += "<li atrid='"+atrv.atr.attrId+"' atrvid='"+value.atrValue.attrValueId+"'  id='"+eleId+"' class=''><a atrid='"+atrv.atr.attrId+"' atrvid='"+value.atrValue.attrValueId+"' atrvname='"+value.atrValue.attrValueName+"' href='javascript:void(0)'>"+"<i class='pseudocheckbox'></i>"+value.atrValue.attrValueName+"<span style='display: none;'>(5)</span></a></li>";
			});
			html += "</ul><div class='progress' style='display: none;'></div></div>";					
			html += "</div>";
		});
		$("#filterPanelLeft").append(html);
		
		getExhibitionProducts(0,map,categoryid,0,2147483647);   // productinfoservice.js
		initAttrInPage(mapObj);//基于构建的mapObj信息，在页面上添加上属性信息
	});
	
}


/**
 * 页面初次加载时，把相应的属性添加到map上，做初始化操作
 * @param attrid
 * @param attrValueId
 * @param attrValueName
 */
function initMap(attrid,attrValueId,attrValueName) 
{ //点击相应的属性时，把属性添加页面上
	
	var attrStrArray=attrStr.split(";");
	var tempList=new List(); //一会比较时使用
	for(var i=0;i<attrStrArray.length;i++)
	{
		tempList.add(attrStrArray[i]);
	}
	
	var index=tempList.getIndex(attrValueId); //查找这个属性值是否是用户选择的属性
	if(index>=0)
	{	
		//加入到map中
		if(map.get(attrid)==null)
		{//MAP 中还没有此属性信息
			var atrArgs = new List();
			map.put(attrid, atrArgs);
			atrArgs.add(attrValueId);
		} 
		else 
		{//MAP 中有此属性信息
			var atrArgs = map.get(attrid);
			if(!atrArgs.constains(attrValueId))
			{//不包含此属性值，才进行添加
				atrArgs.add(attrValueId);
			}
		}
		
		//加入到 mapObj
		if(mapObj.get(attrid)==null)
		{//mapObj 中还没有此属性信息
			var atrArgs = new Map();
			atrArgs.put(attrValueId,attrValueName);
			mapObj.put(attrid, atrArgs);
			
		} 
		else 
		{//MAP 中有此属性信息
			var atrArgs = mapObj.get(attrid);
			atrArgs.put(attrValueId,attrValueName);
		}
	}

//	if(mapObj.size()!=0)
//	{
//		change = true; //表示是否有过滤属性
//	}
	return;
}

/**
 * //基于构建的map信息，在页面上添加上属性信息
 * @param map
 */
function initAttrInPage(obj)
{	
	var keys=obj.keys(); //keys 中元素 是属性id
	if(keys.length>0)
		$("#shopping").css("display","");  //显示点击属性的地方可以显示
	for(var i=0;i<keys.length;i++)
	{
		var attrId=keys[i];
		var values=obj.get(keys[i]);//values是一个map，存放的是属性值和对应的名字
		var valuesKeys=values.keys(); //keys 中元素 是属性id
		for(var j=0;j<valuesKeys.length;j++)
		{
			var attrValueId=valuesKeys[j];
			var attrVauleName=values.get(valuesKeys[j]);
			addAttrInpage(attrId,attrValueId,attrVauleName);
		}
	}
}

/**
 * 根据属性值信息添加到商品上方
 * @param attrid
 * @param attrvalueId
 * @param attrVauleName
 */
function addAttrInpage(attrid,attrvalueId,attrVauleName)
{
	var eleId="top-"+attrid+"-"+attrvalueId;
	var appendString = "<li id='"+eleId+"' class='crumbAttr'><span class='selectAttrValue'>"+ attrVauleName+ "</span><span atrid='"+attrid+"' atrvid='"+attrvalueId+"' class='crumbDelete'></span> </li>";
	$(".crumbSlide-con").append(appendString);
}