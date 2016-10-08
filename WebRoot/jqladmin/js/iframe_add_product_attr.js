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

function jqchk(strName){  //jquery获取复选框值    
	  var chk_value =[];    
	  $('input[name='+strName+']:checked').each(function(){    
	    chk_value.push($(this).val());    
	  });    
//	  alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);    
//	  alert(chk_value);    //数组可以按照1,2,3的形式显示
	  return chk_value;
}  


function save_product_attr() {

	//获取数据，执行入库操作
	 var globalattr=$('input[name="globalattr"]:checked').val();
	 var name=$.trim($("#name").val());
	 
	 var search=$('input[name="search"]:checked').val();
	 var popup=$('input[name="popup"]:checked').val();  //是否弹框显示
	 var status=$('input[name="status"]:checked').val();
	 var input_style=$('input[name="input_style"]:checked').val();
	 
	 //得到多国语言的属性信息
     var multiLanguage=getMultiInfo();
	 var multiLanString=JSON.stringify(multiLanguage);
	 
	 //得到多国语言的属性值信息
	 //attrForeignValue在iframe_add_product_attrValues.js中
	 var multiAttrValueString=JSON.stringify(attrForeignValue);
	 
	 var classid=$.trim($("#sel_category_id").val());
	 
	 if(globalattr==1)
	{
		 classid=1;
	}
	 
	 
	 if(globalattr==0 && !classid && typeof(classid)!="undefined"){
	 	alert("没有选择商品属性所属的商品分类，请选择");
	 	return;
	 }
	 if(!name && typeof(name)!="undefined")
	 {
	 	alert("请填写需要加入的属性名称");
	 	return;
	 }
	 else
	 {
		// return;
	 	var actionUrl="product_attr_insert.action";
		 var params={
				 "globalattr":globalattr,
                 "Name":name,
                 "categoryId":classid,
                 "attrStatus":status,
                 "isSearchAttr":search,
                 "isPopup":popup,
                 "InputStyle":input_style,
                 "multiLanString":multiLanString,
                 "multiAttrValueString":multiAttrValueString,
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

/**
 * 获取属性信息
 * 根据多国语言信息获取相应的name，title等
 * @param obj
 */
function getMultiInfo()
{
	 var multiLanguage=[];//按照json的格式，存储多语言的类别信息：json的格式如下所示：
	 //[{id(语言id）:1,other_name：“23”,other_title:,other_keywords:,other_desc:},{},{}]
	 len=multiforeigid.length; //multiforeigid在multilang.js中
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
	 
	 return multiLanguage;
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