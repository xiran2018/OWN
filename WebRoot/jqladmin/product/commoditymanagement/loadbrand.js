function loadBrandbyCategoryId(id)
{
	var actionUrl = "brand_show_by_categoryId.action";
	var data={
		"id":id
	};
	$.ajax({ // 获取商品分类
		url : actionUrl,
		type : "post",
		data:data,
		dataType : "json",
		error : function() {
			alert("请求失败!!!!");
		},
		success : function(data) {
			
		MessageCode=data.messageCode;
		if(MessageCode=="200")
		{
			alert(data.message);
			return;
			
		}
		$.fn.zTree.init($("#brand_tree"), brandsetting, data.list);
	}
	});// end of ajax
}

var brandsetting = 
{
	view : {
		dblClickExpand : false
	},
	data : {
		simpleData : {
			enable : true
		}
	},
	callback : {
		beforeClick : brandbeforeClick,
		onClick : brandonClick
	}
};

$(document).ready(function() 
{   //******************************************

	//******************************************

});// end of $(document).ready(function() {

function brandbeforeClick(treeId, treeNode) {
	// var check = (treeNode && !treeNode.isParent);
	// if (!check)
	// alert("只能选择城市...");
	return true;
}

function brandonClick(e, treeId, treeNode) {
	var zTree = $.fn.zTree.getZTreeObj("brand_tree");
	nodes = zTree.getSelectedNodes();
	if (nodes.length > 1) {
		alert("只能选择一个分类！");
		return false;
	}
	//不用判断是不是根节点了，因为压根就没有根节点
/*	var Testnode = nodes[0].getParentNode();
	if(Testnode==null)
	{
		alert("只能选择分类，不能选择根节点！");
		return false;
	}*/
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
	var cityObj = $("#brand_name");
	var cityObjId = $("#brand_id");
	//cityObj.attr("value", v);
	cityObj.val(v);
	cityObjId.val(id);

	brandhideMenu();// 隐藏商品类别树

}





function brandshowMenu() {
	var cityObj = $("#brand_name");
	var cityOffset = $("#brand_name").offset();
/*	var left = 0;
	var top = 0;*/
	var left = cityOffset.left;
	var top = cityOffset.top;
	// console.log(left);
	// console.log(top);
	$("#brandContent").css( {
		left : left + "px",
		top : top + cityObj.outerHeight() + "px"
	}).slideDown("fast");

	$("body").bind("mousedown", brandonBodyDown);
}
function brandhideMenu() {
	$("#brandContent").fadeOut("fast");
	$("body").unbind("mousedown", brandonBodyDown);
}
function brandonBodyDown(event) {
	if (!(event.target.id == "brandmenuBtn" || event.target.id == "brandContent" || $(
			event.target).parents("#brandContent").length > 0)) {
		brandhideMenu();
	}
}