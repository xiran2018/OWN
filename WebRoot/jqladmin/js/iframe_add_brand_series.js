var setting = {
	view : {
		dblClickExpand : false
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		beforeClick : beforeClick,
		onClick : onClick
	}
};

$(document).ready(function() {
	
	var actionUrl = "category_show.action";
	$.ajax( { // 获取商品分类
		url : actionUrl,
		type : "post",
		dataType : "json",
		error : function() {
			alert("请求失败!!!!");
		},
		success : function(data) {
			// alert("请求成功！");
		// alert(data.list);
		$.fn.zTree.init($("#category_tree"), setting, data.list);
	}
	});// end of ajax
});// end of $(document).ready(function() {

function beforeClick(treeId, treeNode) {
	// var check = (treeNode && !treeNode.isParent);
	// if (!check)
	// alert("只能选择城市...");
	return true;
}

function onClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("category_tree");
	nodes = zTree.getSelectedNodes();
	if (nodes.length > 1) {
		alert("只能选择一个分类！");
		return false;
	}
	var Testnode = nodes[0].getParentNode();
	if(Testnode==null)
	{
		alert("只能选择分类，不能选择根节点！");
		return false;
	}
	v = "";
	nodes.sort(function compare(a, b) {
		return a.id - b.id;
	});
	for ( var i = 0, l = nodes.length; i < l; i++) {
		v += nodes[i].name + ",";
	}
	if (v.length > 0)
		v = v.substring(0, v.length - 1);
	id = treeNode.id;
	var cityObj = $("#sel_brand_name");
	var cityObjId = $("#sel_category_id");
	cityObj.attr("value", v);
	cityObjId.val(id);

	hideMenu();// 隐藏商品类别树

}
function showMenu() 
{
	var cityObj = $("#sel_brand_name");
	var cityOffset = $("#sel_brand_name").offset();
	var left = cityOffset.left;
	var top = cityOffset.top;
	// console.log(left);
	// console.log(top);
	$("#menuContent").css( {
//		left : left + "px",
//		top : top + cityObj.outerHeight() + "px"
	}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() 
{
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) 
{
	if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(
			event.target).parents("#menuContent").length > 0)) {
		hideMenu();
	}
}

function save_product_brand() 
{
	//获取数据，执行入库操作
	 var multiLanguage=[];//按照json的格式，存储多语言的类别信息：json的格式如下所示：
	 //[{id(语言id）:1,other_name：“23”,other_title:,other_keywords:,other_desc:},{},{}]
	 len=multiforeigid.length;
	 for(var j=0;j<len;j++)
     {
		 obj={};
		 tempid=multiforeigid[j];
		 obj.id=tempid;
		 
		 tempname=tempid+"_name";
		 other_name=$.trim($("#"+tempname).val());
		 obj.other_name=other_name;
		 
		 temptitle=tempid+"_title";
		 other_title=$.trim($("#"+temptitle).val());
		 obj.other_title=other_title;
		 
		 tempkeywords=tempid+"_keywords";
		 other_keywords=$.trim($("#"+tempkeywords).val());
		 obj.other_keywords=other_keywords;
		 
		 tempdesc=tempid+"_description";
		 other_desc=$.trim($("#"+tempdesc).val());
		 obj.other_desc=other_desc;
		 multiLanguage.push(obj);
     }
	 
	 var multiLanString=JSON.stringify(multiLanguage);
	 console.log(multiLanString);
	 
	
	
	 var fatherID=0;//商品分类的第一级品牌，所以这个地方为0
	 var brand_name=$.trim($("#brand_name").val());  //中文名称
	 var classid=$.trim($("#sel_category_id").val());
	 var status=$('input[name="status"]:checked').val();
	 
	 if(!classid && typeof(classid)!="undefined"){
	 	alert("没有选择品牌所属的商品分类，请选择");
	 	return;
	 }
	 if(!brand_name && typeof(brand_name)!="undefined")
	 {
	 	alert("请填写需要加入的类别名称");
	 	return;
	 }
	 else
	 {
	 	var actionUrl="brand_series_insert.action";
		 var params={
		         "brandFatherId":fatherID,
                 "brandName":brand_name,
                 "classId":classid,
                 "status":status,
                 "multiLanString":multiLanString
		 };	
		 
		 $.ajax( {
			url : actionUrl,
			data:params,
			type : "POST",
			dataType : "json",
			error : function() {
				alert("添加失败!!!!");
			},
			success : function(data) {
				alert("添加成功");
			}
		});//end of ajax
		 
	 }
}