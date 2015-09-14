<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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

<link rel="stylesheet" type="text/css"
	href="jqladmin/css/product_attribute.css">
<link rel="stylesheet" type="text/css"
	href="jqladmin/css/product_category.css">
<link rel="stylesheet" type="text/css" href="css/admin_full.css">

<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css"
	type="text/css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
<!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
<link rel="stylesheet" type="text/css"
	href="jqladmin/css/editrentclick.css">
<link rel="stylesheet" type="text/css"
	href="jqladmin/css/inputstyle.css">

<script type="text/javascript" src="jqladmin/js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript"
	src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"
	src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>

<script src="jqladmin/js/left-right.js" type="text/javascript"></script>

<script type="text/javascript"
	src="jqladmin/product/commoditymanagement/product_category.js"></script>
<script type="text/javascript"
	src="jqladmin/js/modify_product_category.js"></script>
<script type="text/javascript" src="jqladmin/js/language.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>

<!--  ueditor 编辑器需要的js -->
<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="ueditor/themes/default/css/ueditor.css" />

<%--
		<script type="text/javascript" src="jqladmin/js/iframe_add_product.js"></script>
		<script src="jqladmin/js/mzone.cc.iframe.js" type="text/javascript"></script>
		--%>
	
</head>
<body>
	<div id="header">
		<%@ include file="../../Header.jsp"%>
	</div>
	
	<div id="container">
		<div id="content">
			<div id="contentInnerWraper">
				<div class="picBox" onclick="switchSysBar()" id="switchPoint"></div>
				<div id="show_content_div">
					<div>
						<center>
								<c:forEach items="${all}" var="pml">
								<hr/>
									<form action="cm/multilanguage_update" method="post">
								<table border="1"  class="altrowstable">
								<tr>
									<td>语种</td>
									<td>product_name</td>
									<td>title</td>
									<td>keywords</td>
									<td>description</td>
									<td>产品描述信息</td>
									<td>操作</td>
								</tr>
										<tr>
											<td>${pml.language.languageName}
												<input type="hidden" name="entity.id"
													value="${pml.productMultiLanguage.id}" />
													<input type="hidden" name="entity.product_id"
													value="${pml.productMultiLanguage.product_id}" />
											</td>
											<td><input type="text" name="entity.product_name"
												value="${pml.productMultiLanguage.product_name }" /></td>
											<td><input type="text" name="entity.title"
												value="${pml.productMultiLanguage.title }" /></td>
											<td><input type="text" name="entity.keywords"
												value="${pml.productMultiLanguage.keywords }" /></td>
											<td><input type="text" name="entity.description"
												value="${pml.productMultiLanguage.description}" /></td>
											<td>
											<textarea name="entity.product_desc">${pml.productMultiLanguage.product_desc }</textarea>
											<!-- 
												<textarea name="entity.description" id="Editor${pml.productMultiLanguage.id}" >${pml.productMultiLanguage.description }</textarea>
												<script  type="text/javascript">
												    var editor = UE.getEditor("Editor${pml.productMultiLanguage.id}",{
												    	toolbars: [
												    	           [
												    	               'undo', //撤销
												    	               'redo', //重做
												    	               'bold', //加粗
												    	              // 'indent', //首行缩进
												    	               'italic', //斜体
												    	               'underline', //下划线
												    	               'strikethrough', //删除线
												    	               'subscript', //下标
												    	               'fontborder', //字符边框
												    	               'superscript', //上标
												    	               //'formatmatch', //格式刷
												    	               'source', //源代码
												    	               //'blockquote', //引用
												    	               'pasteplain', //纯文本粘贴模式
												    	               'selectall', //全选
												    	               'horizontal', //分隔线
												    	               'removeformat', //清除格式
												    	               'time', //时间
												    	               'date', //日期
												    	               'unlink', //取消链接
												    	               //'insertrow', //前插入行
												    	               //'insertcol', //前插入列
												    	               //'mergeright', //右合并单元格
												    	               //'mergedown', //下合并单元格
												    	               //'deleterow', //删除行
												    	               //'deletecol', //删除列
												    	               //'splittorows', //拆分成行
												    	               //'splittocols', //拆分成列
												    	               //'splittocells', //完全拆分单元格
												    	               //'deletecaption', //删除表格标题
												    	               'inserttitle', //插入标题
												    	               //'mergecells', //合并多个单元格
												    	               //'deletetable', //删除表格
												    	               'cleardoc', //清空文档
												    	               //'insertparagraphbeforetable', //"表格前插入行"
												    	               //'insertcode', //代码语言
												    	               'fontfamily', //字体
												    	               'fontsize', //字号
												    	               'paragraph', //段落格式
												    	              // 'simpleupload', //单图上传
												    	               //'insertimage', //多图上传
												    	               //'edittable', //表格属性
												    	               //'edittd', //单元格属性
												    	               'link', //超链接
												    	               'emotion', //表情
												    	               'spechars', //特殊字符
												    	              // 'searchreplace', //查询替换
												    	              // 'insertvideo', //视频
												    	               'help', //帮助
												    	               'justifyleft', //居左对齐
												    	               'justifyright', //居右对齐
												    	               'justifycenter', //居中对齐
												    	               'justifyjustify', //两端对齐
												    	               'forecolor', //字体颜色
												    	             //  'backcolor', //背景色
												    	               'insertorderedlist', //有序列表
												    	               'insertunorderedlist', //无序列表
												    	               'fullscreen', //全屏
												    	               'directionalityltr', //从左向右输入
												    	               'directionalityrtl', //从右向左输入
												    	               'rowspacingtop', //段前距
												    	               'rowspacingbottom', //段后距
												    	               //'pagebreak', //分页
												    	              // 'imagenone', //默认
												    	             //  'imageleft', //左浮动
												    	               //'imageright', //右浮动
												    	               //'attachment', //附件
												    	               //'imagecenter', //居中
												    	               'lineheight', //行间距
												    	               'customstyle', //自定义标题
												    	               'autotypeset', //自动排版
												    	               'touppercase', //字母大写
												    	               'tolowercase', //字母小写
												    	              // 'background', //背景
												    	               'template', //模板
												    	           ]
												    	       ],
												    	 autoHeightEnabled: true,
												    	 autoFloatEnabled: true,
												    	 initialFrameWidth: 400,
												         initialFrameHeight: 100,
												    });
												</script>
												-->										
												</td>
											<td><input type="submit" value="修改"><a href="cm/multilanguage_editProductDetailDesc?entity.id=${pml.productMultiLanguage.id}">编辑产品详细描述</a></td>
										</tr>
											</table>
									</form>
								</c:forEach>
								<c:forEach items="${languages}" var="language">
								<hr/>
									<form action="cm/multilanguage_insert" method="post">
									<table  border="1"  class="altrowstable">
										<tr>
											<td>语种</td>
											<td>product_name</td>
											<td>title</td>
											<td>keywords</td>
											<td>description</td>
											<td>产品描述信息</td>
											<td>操作</td>
										</tr>
										<tr>
											<td>${language.languageName}
											<input type="hidden" name="entity.lan_id"
													value="${language.id}" />
											<input type="hidden" name="entity.product_id"
													value="${product_id}" />
											</td>
											<td><input type="text" name="entity.product_name"/></td>
											<td><input type="text" name="entity.title"/></td>
											<td><input type="text" name="entity.keywords"/></td>
											<td><input type="text" name="entity.description"/></td>
											<td>
											<textarea name="entity.product_desc"></textarea>
											<!-- 
												<textarea name="entity.description" id="Editor${language.id}" ></textarea>
												<script  type="text/javascript">
												    var editor = UE.getEditor("Editor${language.id}",{
												    	toolbars: [
												    	           [
												    	               'undo', //撤销
												    	               'redo', //重做
												    	               'bold', //加粗
												    	               'italic', //斜体
												    	               'underline', //下划线
												    	               'strikethrough', //删除线
												    	               'subscript', //下标
												    	               'fontborder', //字符边框
												    	               'superscript', //上标
												    	               'source', //源代码
												    	               'pasteplain', //纯文本粘贴模式
												    	               'selectall', //全选
												    	               'horizontal', //分隔线
												    	               'removeformat', //清除格式
												    	               'time', //时间
												    	               'date', //日期
												    	               'unlink', //取消链接
												    	               'inserttitle', //插入标题
												    	               'cleardoc', //清空文档
												    	               'fontfamily', //字体
												    	               'fontsize', //字号
												    	               'paragraph', //段落格式
												    	               'link', //超链接
												    	               'emotion', //表情
												    	               'spechars', //特殊字符
												    	               'help', //帮助
												    	               'justifyleft', //居左对齐
												    	               'justifyright', //居右对齐
												    	               'justifycenter', //居中对齐
												    	               'justifyjustify', //两端对齐
												    	               'forecolor', //字体颜色
												    	               'insertorderedlist', //有序列表
												    	               'insertunorderedlist', //无序列表
												    	               'fullscreen', //全屏
												    	               'directionalityltr', //从左向右输入
												    	               'directionalityrtl', //从右向左输入
												    	               'rowspacingtop', //段前距
												    	               'rowspacingbottom', //段后距
												    	               'lineheight', //行间距
												    	               'customstyle', //自定义标题
												    	               'autotypeset', //自动排版
												    	               'touppercase', //字母大写
												    	               'tolowercase', //字母小写
												    	               'template', //模板
												    	           ]
												    	       ],
												    	 autoHeightEnabled: true,
												    	 autoFloatEnabled: true,
												    	 initialFrameWidth: 400,
												         initialFrameHeight: 100,
												    });
												</script>	
												 -->
											</td>
											<td><input type="submit" value="添加"></td>
										</tr>
										</table>
									</form>
								</c:forEach>
							</table>
						</center>
					</div>
				</div>
				<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->

			</div>

		</div>
		<div id="side">
			<center>
				<%@ include file="../productCommon.jsp"%>
			</center>
		</div>
		<div id="rightSide"></div>
	</div>


</body>
</html>
