<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>Full Layout - jQuery EasyUI Demo</title>
		<link rel="stylesheet" type="text/css" href="css/easyui.css">
		<link rel="stylesheet" type="text/css" href="css/icon.css">

		<link rel="stylesheet" type="text/css" href="css/demo.css">

		<link rel="stylesheet" type="text/css" href="css/admin_full.css">

		<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>


		<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css"
			type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript"
			src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript"
			src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>

		<SCRIPT type="text/javascript">

	///////////////////
	var prev; //变换菜单栏的颜色

	$(function() {
		$("#product").click(function() {
			//alert("dsljf");

				if (prev != undefined) {
					prev.css('background-position', 'left -45px');
				}
				$(this).css('background-position', 'left top');
				prev = $(this);
				//console.log("dsjf");

			});//end of click

		$("#product_category").click(function() {
			//alert("dsljf");

				if (prev != undefined) {
					prev.css('background-position', 'left -45px');
				}
				$(this).css('background-position', 'left top');
				prev = $(this);
				//console.log("dsjf");
				/*
				var actionUrl = "category_show.action";
				$.ajax( {
					url : actionUrl,
					type : "post",
					dataType : "json",
					error : function() {
						alert("请求失败！");
					},
					success : function(data) {
						//alert("请求成功！");
					//alert(data.list);
					$.fn.zTree.init($("#category_tree"), category_setting,data.list);
				}
				});//end of ajax
				*/
			});//end of click

		$("#product_category2").click(function() {
			//alert("dsljf");

				if (prev != undefined) {
					prev.css('background-position', 'left -45px');
				}
				$(this).css('background-position', 'left top');
				prev = $(this);
				//console.log("dsjf");

			});//end of click
	});
	//-->
</SCRIPT>
		<style type="text/css">
.ztree li span.button.add {
	margin-left: 2px;
	margin-right: -1px;
	background-position: -144px 0;
	vertical-align: top; *
	vertical-align: middle
}
</style>

	</head>
	<body class="easyui-layout">
		<%@ include file="Header.jsp"%>
		<!-- 
	 
		<div data-options="region:'north',border:false"
			style="height: 80px; background: #B3DFDA; padding: 10px">
			<div style="">
				<ul id="menu" style="list-style-type: none;">
					<li id="product">
						<a href="jqladmin/product.jsp">商品管理</a>
					</li>
					<li id="product_category">
						<a href="jqladmin/product_category.jsp">商品类目管理</a>
					</li>
					<li id="product_category2">
						商品类目管理
					</li>
					<li id="product_category3">
						商品类目管理
					</li>
					<li id="product_category4">
						商品类目管理
					</li>

				</ul>

			</div>

		</div>
		 -->

		<div  id="center">
			<div id="category_show">

				<div class="">
					<center>
						<ul id="category_tree" class="ztree"></ul>
					</center>

				</div>
			</div>


			
			<div id="modifyw" class="easyui-window" title="修改商品类目"
                data-options="modal:true,closed:true,iconCls:'icon-save'"
                style="width: 500px; height: 450px; padding: 10px;">
                <table style="width: 500" border=0 cellspacing=0 cellpadding=3 align=center>
                    <tr style="display: none">
                        <td valign=middle  align=right>
                            <b>本元素值id:</b>
                        </td>
                        <td valign=middle>
                            <input id="self_id" type=text>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td valign=middle  align=right>
                            <b>父元素值id:</b>
                        </td>
                        <td valign=middle>
                            <input id="modify_father_id" type=text>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle  align=right>
                            <b>类别名称：</b>
                        </td>
                        <td valign=middle>
                            <INPUT id=modify_category_name name=category_name type=text>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle  align=right>
                            <b>类别别名：</b>
                        </td>
                        <td valign=middle>
                            <INPUT id=modify_category_other_name name=category_other_name type=text>
                        </td>
                    </tr>                   
                    <tr>
                        <td valign=middle align=right>
                            <b>Title：</b>
                        </td>
                        <td valign=middle>
                            <textarea id=modify_category_title name=category_title cols="30" rows="5"></textarea>
                        </td>
                    </tr>   
                    
                    <tr>
                        <td valign=middle align=right>
                            <b>Keywords：</b>
                        </td>
                        <td valign=middle>
                            <textarea id=modify_category_keywords name=category_keywords cols="30" rows="5"></textarea>
                        </td>
                    </tr>
                    
                    <tr>
                        <td valign=middle align=right>
                            <b>Description：</b>
                        </td>
                        <td valign=middle>
                            <textarea id=modify_category_description name=category_description cols="30" rows="5"></textarea>
                        </td>
                    </tr>
                                    
                    <tr>
                        <td valign=middle colspan=2 align=center>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:modify_product_category()">保存</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#modifyw').window('close')">取消</a>
                        </td>
                    </tr>   

                </table>
            </div>
			
		</div>
		<script type="text/javascript">
			
			
			
			function modify_product_category() {
                //获取数据，执行入库操作
                
                 var selfID =$("#self_id").val();
                 var fatherID =$("#modify_father_id").val();
                 var category_name=$.trim($("#modify_category_name").val());
                 var category_other_name=$.trim($("#modify_category_other_name").val());
                 var category_title=$.trim($("#modify_category_title").val());
                 var category_keywords=$.trim($("#modify_category_keywords").val());
                 var category_description=$.trim($("#modify_category_description").val());
                 
                 
                 //var category_name=encodeURI(category_name1);
        //       var category_title=encodeURI(category_title1);
            //   var category_other_name=encodeURIComponent(category_other_name1);
                // var category_description=encodeURI(encodeURI(category_description1));
                 
                 if(!fatherID && typeof(fatherID)!="undefined"){
                    alert("没有选择父元素");
                    return;
                 }
                 if(!category_name && typeof(category_name)!="undefined")
                 {
                    alert("请填写需要加入的类别名称");
                    return;
                 }
                 if(!category_other_name && typeof(category_other_name)!="undefined")
                 {
                    alert("请填写需要加入的别名");
                    return;
                 }
                 else
                 {
                    $('#modifyw').window('close');

                    var actionUrl="category_modify.action";
                     var params={
                     /*
                             "category.categoryFatherId":fatherID,
                             "category.categoryName":category_name,
                             "category.categoryOtherName":category_other_name,
                             "category.title":category_title,
                             "category.keyword":category_keywords,
                             "category.description":category_description
                    */
                             "selfId":selfID,
                             "categoryFatherId":fatherID,
                             "categoryName":category_name,
                             "categoryOtherName":category_other_name,
                             "title":category_title,
                             "keyword":category_keywords,
                             "description":category_description
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

                            //  alert(data.list);
                            //在前台图形中添加节点   modifyTreeId, modifytempTreeNode
                            var zTree = $.fn.zTree.getZTreeObj("category_tree");
                            modifytempTreeNode.name=category_other_name;
                            zTree.updateNode(modifytempTreeNode);
                            
                            alert("修改成功");
                        }
                    });//end of ajax
                     
                 }
            }

			//-->
		</script>


	</body>
</html>