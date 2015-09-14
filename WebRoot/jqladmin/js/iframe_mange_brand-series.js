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

	loadBrand();// 显示选择的商品类别对应的品牌系列
}

function loadBrand() 
{
	var cityObjId = $("#sel_category_id");
	id = cityObjId.val();
	// alert(id);
	// 执行ajax请求，显示分类
	var actionUrl = "brand_fecth.action";
	var params = {
		"categoryId" : id
	};
	$.ajax( {
		url : actionUrl,
		data : params,
		type : "POST",
		dataType : "json",
		error : function() {
			alert("由于服务器原因，获取品牌数据失败，请稍后再改动!!!!");
		},
		success : function(data) {
			// 处理返回的json数据
			if(data!="")
			{
				var obj = eval('(' + data + ')');
				var datagrid="<table style='BORDER-COLLAPSE: collapse;height:50px;line-height:50px;'  cellSpacing=0  border=1><tr align='center'><th class='brand_name'>名称</th><th class='brand_description'>品牌描述</th><th class='brand_show'>是否显示</th><th class='brand_operate'>操作</th></tr>";// 需要显示的数据表格
				var ss=[{"brandId":"1","classId":"2","brandName":"lv","parentBrandId":"0","isParent":"1","brandLogo":"","brandDescription":"sdfasfasfasfds","brandStatus":"","createTime":"2014-01-11 14:48:05.0","children":[{"brandId":"3","classId":"2","brandName":" 老花","parentBrandId":"1","isParent":"0","brandLogo":"","brandDescription":"sdfasfasfasfasf","brandStatus":"","createTime":"2014-01-11 14:49:02.0"},{"brandId":"4","classId":"2","brandName":"方格","parentBrandId":"1","isParent":"0","brandLogo":"","brandDescription":"fjalsjdlfjsldjf","brandStatus":"","createTime":"2014-01-12 12:54:37.0"}]},{"brandId":"2","classId":"2","brandName":"gucci","parentBrandId":"0","isParent":"1","brandLogo":"","brandDescription":"safsafasfsafsdfasf","brandStatus":"","createTime":"2014-01-11 14:48:28.0"}];
				$('#brand_series_show_table').treegrid({
				    data: obj,
				    idField:'brandId',
				    treeField:'brandId',
				    columns:[[
				        {field:'brandId',title:'序号',width:"200"},
				        {field:'brandName',title:'名称',width:"200"},
				        {field:'brandDescription',title:'描述',width:"200"},
				        {field:'brandStatus',title:'状态',width:"100",formatter:statusFunction},
				        {field:'parentBrandId',title:'操作',width:"100",formatter:operateFunction}
				    ]]
				});
			}
			else
			{
				alert("改分类下没有品牌系列，请添加！");
			}

	}
	});// end of ajax
}





/**
 * value: the field value. rowData: the row record data.
 * 
 * @param value
 * @param rowData
 * @return
 */
function statusFunction(value,rowData)
{
	// alert(value+" "+rowData.brandStatus);
	var content;
	if(value==1)
	{	
		content="<span>显示</span>";
	}
	else
	{
		content="<span>不显示</span>";
	}
	return content;
}

/**
 * value: the field value. rowData: the row record data.
 * 
 * @param value
 * @param rowData
 * @return
 */
function operateFunction(value,rowData)
{
	// alert(value+" "+rowData.brandStatus);
	var content="<a class='add_series' href='javascript:void(0);' onclick='javascript:BrandAdd(this);'    name="+rowData.brandName+" value="+rowData.brandId+" >添加</a>|<a  href='javascript:void(0)'   onclick='javascript:BrandEdit(this);return false' name="+rowData.brandName+" value="+rowData.brandId+" >编辑</a>|<a  href='javascript:void(0)' onclick='javascript:BrandRemove(this);return false' name="+rowData.brandName+" value="+rowData.brandId+">删除</a>";
	return content;
}

function BrandRemove(obj)
{
	if(confirm("确认删除该品牌以及所有的子品牌吗？"))
	{
		var idvalue=$(obj).attr("value");
		//alert(idvalue);
		var actionUrl="brand_delete.action";
	    var params={
	            "brandId":idvalue
	    }; 
	    
	    $.ajax( {
	       url : actionUrl,
	       data:params,
	       type : "POST",
	       dataType : "json",
	       error : function() {
	           alert("修改失败!!!!");
	       },
	       success : function(data) {
	    	   var node = $('#brand_series_show_table').treegrid('remove',idvalue);
	    	   alert("删除成功!!!!");
	       }
	   });//end of ajax

	}

}

function BrandAdd(obj)
{
	var name=$(obj).attr("name");
	var idvalue=$(obj).attr("value");
	$("#belong_brand").html(name);
	$("#parent_id").val(idvalue);
	
	$('#add_brand_series').window('open');
}

function save_product_brand() {
	//获取数据，执行入库操作
	 var fatherID =$("#parent_id").val();
	 var brand_name=$.trim($("#brand_name").val());

	 var classid=$.trim($("#sel_category_id").val());
	 var status=$('input[name="status"]:checked').val();

     var multiLanguage=getMultiInfo();
	 var multiLanString=JSON.stringify(multiLanguage);
	 //alert(multiLanString);
	 
	 if(!fatherID && typeof(fatherID)!="undefined"){
	 	alert("没有选择父元素");
	 	return;
	 }
	 if(!brand_name && typeof(brand_name)!="undefined")
	 {
	 	alert("请填写需要加入的类别名称");
	 	return;
	 }
	 else
	 {
       $('#add_brand_series').window('close');

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
				
				// append some nodes to the selected row
				var node = $('#brand_series_show_table').treegrid('getSelected');
				$('#brand_series_show_table').treegrid('append',{
					parent: node.brandId,  // the node has a 'id' value that defined through 'idField' property
					data: [{
						brandId: data.brandId,
						brandName: brand_name,
						brandDescription:brand_description,
						brandStatus:1,
						parentBrandId:fatherID
					}]
				});
			}
		});//end of ajax
		 
	 }
}
/**
 * 该函数暂时不用了
 */

function modify_product_brand() {
    //获取数据，执行入库操作
    
     var selfID =$("#self_id").val();
     var brand_name=$.trim($("#modify_brand_name").val());
     var brand_title=$.trim($("#modify_brand_title").val());
     var brand_keywords=$.trim($("#modify_brand_keywords").val());
     var brand_description=$.trim($("#modify_brand_description").val());
     

     
     if(!brand_name && typeof(brand_name)!="undefined")
     {
        alert("请填写需要加入的类别名称");
        return;
     }
     else
     {
        $('#modify_brand_series').window('close');

        var actionUrl="brand_modify.action";
         var params={
                 "selfId":selfID,
                 "brandName":brand_name,
                 "title":brand_title,
                 "keyword":brand_keywords,
                 "description":brand_description
         }; 
         
         $.ajax( {
            url : actionUrl,
            data:params,
            type : "POST",
            dataType : "json",
            error : function() {
                alert("修改失败!!!!");
            },
            success : function(data) {

                alert("修改成功");
				var node = $('#brand_series_show_table').treegrid('getSelected');
				$('#brand_series_show_table').treegrid('update',{
					
					id:node.brandId,
					row: {
						brandName: brand_name,
						brandDescription:brand_description,
						brandStatus:1
					}
					
				});
            }
        });//end of ajax
         
     }
}
/**
 * 根据多国语言信息获取相应的name，title等
 * @param obj
 */
function getMultiInfo()
{
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
	 
	 return multiLanguage;
}
//填充修改内容
function BrandEdit(obj)
{
	var idvalue=$(obj).attr("value");
	var node = $('#brand_series_show_table').treegrid('getSelected');
//	var id=node.brandId;
//	alert(id);
	var actionUrl="brand_fecth_byBrandId.action";
    var params={
            "brandId":idvalue
    }; 
    
    $.ajax( {
       url : actionUrl,
       data:params,
       type : "POST",
       dataType : "json",
       error : function() {
           alert("修改失败!!!!");
       },
       success : function(data) {
           $("#self_id").val(data.brand.brandId);
           $("#modify_brand_name").val(data.brand.brandName);
           $(":radio[name=modstatus][value='"+data.brand.brandStatus+"']").attr("checked","true");
           insertEditHtml(data.cml);  //  //这个函数在insertBrandSeriesMultiLanEditHtml.js文件中
           
           $('#modify_brand_series').window('open');
       }
   });//end of ajax
	
}

function showMenu() {
	var cityObj = $("#sel_brand_name");
	var cityOffset = $("#sel_brand_name").offset();
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