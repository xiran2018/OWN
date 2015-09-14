var setting = 
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
		beforeClick : beforeClick,
		onClick : onClick
	}
};

$(document).ready(function() 
{   //******************************************
	//delete the attribute values
/*	$(".close").on("click","a .close",
			function()
			{
				var spanElement=$(this).parent('.attr_value_span');
				spanElement.remove(); 
				return false;
			}
	);*/
	//******************************************
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
	var cityObj = $("#sel_category_name");
	var cityObjId = $("#sel_category_id");
	cityObj.attr("value", v);
	cityObjId.val(id);

	hideMenu();// 隐藏商品类别树

}





function showMenu() {
	var cityObj = $("#sel_category_name");
	var cityOffset = $("#sel_category_name").offset();
	var left = cityOffset.left;
	var top = cityOffset.top;
	// console.log(left);
	// console.log(top);
	$("#menuContent").css( {
		left : left + "px",
		top : top + cityObj.outerHeight() + "px"
	}).slideDown("fast");

	$("body").bind("mousedown", onBodyDown);
}
function hideMenu() {
	$("#menuContent").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}
function onBodyDown(event) {
	if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(
			event.target).parents("#menuContent").length > 0)) {
		hideMenu();
	}
}