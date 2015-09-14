//global variable
var storInputStyle;//存储属性值的输入方式，当用户改变时，需要提示用户，属性值的方式发了变化
//****************************
function deleteNewAttribute(element)
{
	//alert($(element).html());
	var spanElement=$(element).parent(".attr_value_span");
	if(! confirm(' 你确定要删除该属性吗? ' ) ) { return false; }
	spanElement.remove(); 
	return false;
}
/*
function deleteAttribute(element)
{
	//alert($(element).html());
	var spanElement=$(element).parent(".attr_value_span");
	if(! confirm(' 你确定要删除该属性吗? ' ) ) { return false; }
	spanElement.css("display","none"); 
	return false;
}
*/
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
	
	//给是否查看全局属性值信息的单选按钮注册事件
	//给单选按钮注册事件
	$(".globalattrshow").change(function() {
		
		var currentValue=$("input[name='globalattrshow']:checked").val();//选择了之后的值

		if(currentValue==1)
		{
			loadGlobalAttr();//加载全局属性值
		}
		

	});  //给单选按钮注册改变，当选择的单选按钮改变时，就会触发该程序
	
});// end of $(document).ready(function() {

/**
 * 加载全局属性值进行
 */
function loadGlobalAttr() {

	var actionUrl = "attribute_global_fecth.action";
	$.ajax( {
		url : actionUrl,
		type : "POST",
		dataType : "json",
		error : function() {
			alert("由于服务器原因，获取品牌数据失败，请稍后再改动!!!!");
		},
		success : function(data) {
			// 处理返回的json数据
			//alert("ok");

			if(data!="")
			{
				var obj = eval('(' + data + ')');

				$('#show_table').datagrid({
				    data: obj,
				    pagination:true,
				    rownumbers:true,
				    singleSelect:true,
				    columns:[[
				       // {field:'attrOtherName',title:'属性别名',width:"200"},
				        {field:'attrName',title:'属性名称',width:"200"},
				        {field:'inputStyle',title:'输入方式',width:"200",formatter:inputStyleFunction},
				        {field:'isSearchAttr',title:'是否检索',width:"100",formatter:searchFunction},
				        {field:'attrStatus',title:'状态',width:"100",formatter:statusFunction},
				        {field:'attrId',title:'操作',width:"200",formatter:operateFunction}
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
	
	flag=checkIsGlobalAttrShow();
	if(flag)
	{
		alert("目前选择的是全局属性");
		return;
	}

	hideMenu();// 隐藏商品类别树

	loadAttribute();// 显示选择的商品类别对应的品牌系列
}
function checkIsGlobalAttrShow()
{
	var currentValue=$("input[name='globalattrshow']:checked").val();//选择了之后的值
	if(currentValue==0)
	{
		return false;
	}
	else
	{
		return true;
	}
}
function loadAttribute() {
	var cityObjId = $("#sel_category_id");
	id = cityObjId.val();
	// alert(id);
	// 执行ajax请求，显示分类
	var actionUrl = "attribute_fecth.action";
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
			//alert("ok");
			var test=[{"attrId":1,"keywords":"","attrStatus":1,"categoryId":2,"isKeyAttr":0,"inputStyle":1,"isNecessary":0,"isColorAttr":0,"isMultiselect":0,"isSearchAttr":1,"title":"","attrOtherName":"颜色","description":"","attrName":"color","isSaleAttr":0,"sortNumber":0},{"attrId":2,"keywords":"","attrStatus":0,"categoryId":2,"isKeyAttr":0,"inputStyle":2,"isNecessary":0,"isColorAttr":0,"isMultiselect":0,"isSearchAttr":1,"title":"","attrOtherName":"大小","description":"","attrName":"size","isSaleAttr":0,"sortNumber":0},{"attrId":12,"keywords":"","attrStatus":1,"categoryId":2,"isKeyAttr":0,"inputStyle":1,"isNecessary":0,"isColorAttr":0,"isMultiselect":0,"isSearchAttr":1,"title":"","attrOtherName":"size","description":"","attrName":"color","isSaleAttr":0,"sortNumber":0},{"attrId":13,"keywords":"","attrStatus":1,"categoryId":2,"isKeyAttr":0,"inputStyle":2,"isNecessary":0,"isColorAttr":0,"isMultiselect":0,"isSearchAttr":1,"title":"","attrOtherName":"size","description":"","attrName":"color","isSaleAttr":0,"sortNumber":0}];
			var test1=[{"attrId":"1","attrName":"color","attrOtherName":"颜色","categoryId":"2","isColorAttr":"","InputStyle":"1","isKeyAttr":"","isSaleAttr":"","isSearchAttr":"1","isMultiselect":"","isNecessary":"","sortNumber":"","attrStatus":"1","createTime":"2014-01-18 20:01:34.0","title":"","keywords":"","description":""},{"attrId":"2","attrName":"size","attrOtherName":"大小","categoryId":"2","isColorAttr":"","InputStyle":"2","isKeyAttr":"","isSaleAttr":"","isSearchAttr":"1","isMultiselect":"","isNecessary":"","sortNumber":"","attrStatus":"0","createTime":"2014-01-18 20:02:50.0","title":"","keywords":"","description":""},{"attrId":"12","attrName":"color","attrOtherName":"size","categoryId":"2","isColorAttr":"","InputStyle":"1","isKeyAttr":"","isSaleAttr":"","isSearchAttr":"1","isMultiselect":"","isNecessary":"","sortNumber":"","attrStatus":"1","createTime":"2014-01-19 17:58:45.0","title":"","keywords":"","description":""},{"attrId":"13","attrName":"color","attrOtherName":"size","categoryId":"2","isColorAttr":"","InputStyle":"2","isKeyAttr":"","isSaleAttr":"","isSearchAttr":"1","isMultiselect":"","isNecessary":"","sortNumber":"","attrStatus":"1","createTime":"2014-01-19 17:59:13.0","title":"","keywords":"","description":""}];

			if(data!="")
			{
				var obj = eval('(' + data + ')');

				$('#show_table').datagrid({
				    data: obj,
				    pagination:true,
				    rownumbers:true,
				    singleSelect:true,
				    columns:[[
				       // {field:'attrOtherName',title:'属性别名',width:"200"},
				        {field:'attrName',title:'属性名称',width:"200"},
				        {field:'inputStyle',title:'输入方式',width:"200",formatter:inputStyleFunction},
				        {field:'isSearchAttr',title:'是否检索',width:"100",formatter:searchFunction},
				        {field:'attrStatus',title:'状态',width:"100",formatter:statusFunction},
				        {field:'attrId',title:'操作',width:"200",formatter:operateFunction}
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

function inputStyleFunction(value,rowData,index)
{
	// alert(value+" "+rowData.brandStatus);
	var content;
	if(value==1)
	{	
		content="<span>手工录入</span>";
	}
	else if(value==2)
	{
		content="<span>列表中选择</span>";
	}
	else
	{
		content="<span>多行文本框</span>";
	}
	return content;
}

function searchFunction(value,rowData,index)
{
	// alert(value+" "+rowData.brandStatus);
	var content;
	if(value==1)
	{	
		content="<span>是</span>";
	}
	else
	{
		content="<span>否</span>";
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
function statusFunction(value,rowData,index)
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
function operateFunction(value,rowData,index)
{
	var content="<a class='noline' href='javascript:void(0)'   onclick='javascript:Edit(this);return false' name="+rowData.attrName+" value="+rowData.attrId+">编辑</a>|<a  target='_blank' href='editAttrValues.action?id="+rowData.attrId+"'  name="+rowData.attrName+" value="+rowData.attrId+">编辑属性值</a>|<a class='noline' href='javascript:void(0)'   onclick='javascript:deleteAttributeInDB(this);return false' name="+rowData.attrName+" value="+rowData.attrId+">删除</a>";
	return content;
}




//填充修改内容
function Edit(obj)
{
	var idvalue=$(obj).attr("value");
//	var node = $('#brand_series_show_table').treegrid('getSelected');
//	var id=node.brandId;
//	alert(id);
	var actionUrl="attribute_fecth_byAttrId.action";
    var params={
            "Id":idvalue
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
    	   //获取属性值列表
    	   //var attrValueString=gernateAttrValue(data.attrValueList);
    	   //将属性值列表清空
    	   //$("#input_attr_values").empty();
    	   //将属性值列表添加到表格上
    	   //$("#input_attr_values").append(attrValueString);
    	   
    	   //$('input[name="search"]:checked').prop("checked","false");
    	   $('input[name="search"]:checked').attr("checked","false");
    	   $('input[name="status"]:checked').attr("checked","false");
    	   $('input[name="input_style"]:checked').attr("checked","false");
    	   
           $("#attrId").val(data.attribute.attrId);
           $("#name").val(data.attribute.attrName);
           $("#other_name").val(data.attribute.attrOtherName);
//           $("#search").val(data.isSearchAttr);
           //$(":radio[name=search][value='"+data.attribute.isSearchAttr+"']").attr("checked","true");
           $(":radio[name=globalattr][value='"+data.attribute.globalattr+"']").attr("checked","true");
           $(":radio[name=search][value='"+data.attribute.isSearchAttr+"']").attr("checked","true");
           $(":radio[name=status][value='"+data.attribute.attrStatus+"']").attr("checked","true");
          // $(":radio[name=input_style][value='"+data.attribute.inputStyle+"']").attr("checked","true");
           
           storInputStyle=data.attribute.inputStyle;
           
           //获取多国语言的属性信息，加入页面
           insertEditHtml(data.pamu); //这个函数在insertMultiLanEditHtml.js文件中
           
           


           $('#modify_product_attr').dialog('open');
       }
   });//end of ajax
	
}


//删除属性
function deleteAttributeInDB(obj)
{
	if(confirm("确认删除该属性以及所有的属性值吗？"))
	{
		var a = $('#show_table').datagrid('getSelected');
		if(a==null||a==undefined)
		{
			alert("还没有选中需要删除的行！");
			return;
		}
        var b = $('#show_table').datagrid('getRowIndex', a);
        
        
		var idvalue=$(obj).attr("value");
		
		var actionUrl="attribute_delete_byAttrId.action";
		var params={
				"id":idvalue
		}; 
		
		$.ajax( {
			url : actionUrl,
			data:params,
			type : "POST",
			dataType : "json",
			error : function() {
				alert("删除失败!!!!");
			},
			success : function(data) {
				alert("删除成功!!!!");
				$('#show_table').datagrid('deleteRow',b);
				$('#show_table').datagrid('reload');
			}
		});//end of ajax
	}
	
}
/*
function gernateAttrValue(attrValueList)
{
	var templength=attrValueList.length;
	var tempString='';
	for(var i=0;i<templength;i++)
	{
		tempAttrValue=attrValueList[i];
		tempString+='<span class="attr_value_span"><input type="text" class="attr_value" readonly="readonly" style="width: 154px;background-color: #B4C7C7;" value="'+tempAttrValue.attrValueName+'"  /><input type="text" class="attr_value_id"  style="display:none;" value="'+tempAttrValue.attrValueId+'" /><a class="close" href="javascript:void(0)" onclick="deleteAttribute(this)"></a></span>';
	}
	return tempString;
	//alert(tempString);
}
*/
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