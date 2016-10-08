<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
<link rel="stylesheet" type="text/css" href="css/admin_full.css">

<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
<link rel="stylesheet" type="text/css" href="jqladmin/css/inputstyle.css">

<script type="text/javascript" src="jqladmin/js/json2.js"></script>
<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" 	src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
<script type="text/javascript"	src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>

<script type="text/javascript" src="jqladmin/js/product.js"></script>
<script src="jqladmin/js/left-right.js" type="text/javascript"></script>

<script type="text/javascript" src="jqladmin/product/commoditymanagement/addproductloadcategory.js"></script>
<script type="text/javascript" src="jqladmin/product/commoditymanagement/loadbrand.js"></script>

<!--  ueditor 编辑器需要的js -->
<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"></script>
<link rel="stylesheet" type="text/css"	href="ueditor/themes/default/css/ueditor.css" />

<!-- 本页需要的css -->
<link rel="stylesheet" href="jqladmin/product/css/showinfo.css" type="text/css">

<SCRIPT type="text/javascript">
	var success=${success};
	if(success){
		$(document).ready(function() {
			alert("修改成功");
		});
	}
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
							<form action="cm/management_updateCommodity" method="post">
								<input type="hidden" name="products.p_id" value="${pvo.products.p_id}"/>
								<table border="1" class="altrowstable">
									<tr>
										<td  colspan="5" class="tipRow">基本属性信息</td>
									</tr>
									<tr>
										<td>名称</td>
										<td>重量</td>
										<td>采购价格</td>
										<td>原始价格</td>
										<td>现价</td>
									</tr>
									<tr>
										<td><input type="text" name="products.p_name" value="${pvo.products.p_name}" /></td>
										<td><input type="text" name="products.p_weight" value="${pvo.products.p_weight}" /></td>
										<td><input type="text" name="products.p_purchaprice" value="${pvo.products.p_purchaprice}" /></td>
										<td><input type="text" name="products.p_originprice" value="${pvo.products.p_originprice}" /></td>
										<td><input type="text" name="products.p_nowprice" value="${pvo.products.p_nowprice}" /></td>
									</tr>
									<tr>
										
										<td>商品分类ID</td>
										<td>品牌ID</td>
										<td>产品来源厂家</td>
										<td>厂家编号</td>
										<td>运费模板</td>
									</tr>
									<tr>
										
										<td>
											
											<input id="sel_category_name" type="text" readonly name="sel_category_name" value="${pvo.category}" />
												<input type="hidden" name="Op_categoryid" value="${pvo.products.p_categoryid}"/>
											<input id="sel_category_id" type="hidden" readonly name="products.p_categoryid" value="" />
					                    	<a id="menuBtn" href="javascript:void(0)" onclick="javascript:showMenu(); return false;">选择</a>
										</td>
										<td>
											<input id="brand_name" type="text" name="brand" readonly value="${pvo.brand}" />
											<input type="hidden" name="Op_brandid" value="${pvo.products.p_brandid}"/>
											<input id="brand_id" type="text" name="products.p_brandid"  value="" style="display:none;width:120px;"/>
					                		<a id="brandmenuBtn" href="javascript:void(0)" onclick="brandshowMenu(); return false;">选择</a>
										
										</td>
										<td><input type="text" name="products.p_fromcompany" value="${pvo.products.p_fromcompany}" /></td>
										<td><input type="text" name="products.p_companyserinum" value="${pvo.products.p_companyserinum}" /></td>
										<td>
											<select name="products.p_freight_templet" >
												<c:forEach items="${templates}" var="opt">
													<c:if test="${opt.id==pvo.products.p_freight_templet}">
														<option selected="selected" value="${opt.id}">${opt.name}</option>
													</c:if>
													<c:if test="${opt.id!=pvo.products.p_freight_templet}">
														<option value="${opt.id}">${opt.name}</option>
													</c:if>
												</c:forEach>
											</select>
											<input type="hidden" name="Op_categoryid" value="${pvo.products.p_freight_templet}"/>
										</td>
									</tr>
									<tr>
										<td>自编号</td>
										<td>厂家网址</td>
										<td>库存数目</td>
										<td>最少购买数量</td>
										<td>是否免邮</td>
									</tr>
									<tr>
										<td><input type="text" name="products.p_myserialnumber" value="${pvo.products.p_myserialnumber}" /></td>
										<td><input type="text" name="products.p_fromnetaddress" value="${pvo.products.p_fromnetaddress}" /></td>
										<td><input type="text" name="products.p_storenumber" value="${pvo.products.p_storenumber}" /></td>
										<td><input type="text" name="products.p_minbuyamount" value="${pvo.products.p_minbuyamount}" /></td>
										<td>
											<input type="radio" name="products.p_freemail" value="1" <c:if test="${pvo.products.p_freemail==1}">checked="checked"</c:if>/>是
											<input type="radio" name="products.p_freemail" value="0" <c:if test="${pvo.products.p_freemail==0}">checked="checked"</c:if>/>否
										</td>
									</tr>
									<tr>
										<td>积分</td>
										<td>是否热销</td>
										<td>是否推荐</td>
										<td>是否新品</td>
										<td>产品状态</td>
									</tr>
									<tr>
										
										<td><input type="text" name="products.p_jifen" value="${pvo.products.p_jifen}" /></td>
										<td>
											<input type="radio" name="products.p_hot" value="1"  <c:if test="${pvo.products.p_hot==1}">checked="checked"</c:if>/>是
											<input type="radio" name="products.p_hot"  value="0" <c:if test="${pvo.products.p_hot==0}">checked="checked"</c:if>/>否
										</td>
										<td>
											<input type="radio" name="products.p_recommend" value="1" <c:if test="${pvo.products.p_recommend==1}">checked="checked"</c:if>/>是
											<input type="radio" name="products.p_recommend" value="0" <c:if test="${pvo.products.p_recommend==0}">checked="checked"</c:if>/>否
										</td>
										<td>
											<input type="radio" name="products.p_new"  value="1"  <c:if test="${pvo.products.p_new==1}">checked="checked"</c:if>/>是
											<input type="radio" name="products.p_new"  value="0" <c:if test="${pvo.products.p_new==0}">checked="checked"</c:if>/>否
										</td>
										<td>
											<input type="radio" name="products.p_status"  value="1"  <c:if test="${pvo.products.p_status==1}">checked="checked"</c:if>/>上架
											<input type="radio" name="products.p_status"  value="0" <c:if test="${pvo.products.p_status==0}">checked="checked"</c:if>/>下架
										</td>
									</tr>
									<tr><td colspan="7"><center><input type="submit" /></center> </td></tr>
									<input type="hidden" value="${pvo.products.p_date_added}" name="p_date_added"/>
								<!-- <fmt:formatDate value="${pvo.products.p_last_modified}" pattern="yyyy-MM-dd" type="date" dateStyle="long" /> -->
									<input type="hidden" value="${pvo.products.p_last_modified}" name="p_last_modified"/>
								</table>
							</form>
							<!-- <hr> -->
							<form action="cm/managementmultatr_updateAttribute" method="post">
								<table border="1" class="altrowstable">
									<tr>
										<td  colspan="3" class="tipRow">详细属性信息</td>
									</tr>
									<tr>
										<td>属性名</td>
										<td>属性详情</td>
										<td>属性值</td>
									</tr>
									<c:forEach items="${atrslist}" var="atrs">
										<c:forEach items="${atrs}" var="atr">
											<tr>
												<td>${atr.atr.attrName}</td>
												<td>
												[类别：${atr.catecoryName}]
												[输入方式：
													<c:if test="${atr.atr.inputStyle==1}">手工输入</c:if> 
													<c:if test="${atr.atr.inputStyle==2}">列表选择</c:if>
													<c:if test="${atr.atr.inputStyle==3}">
														多行文本框  | 显示方式：
														<c:if test="${atr.atr.isPopup==0}">不弹框</c:if> 
														<c:if test="${atr.atr.isPopup==1}">弹框</c:if>
													</c:if>
													<c:if test="${atr.atr.inputStyle==4}">选择框</c:if>]
												</td>

												<td>
												
													<c:if test="${atr.atr.inputStyle==1}">
														<!-- 判断单行input的显示逻辑 input里不要展开代码，否则输入框里会多很多空白 ，第一个文本框存放原先的文本内容内容的id，方便后台后续处理对边比-->												
														<input type="hidden" id="${atr.atr.attrId}ID" name="${atr.atr.attrId}ID" value="<c:forEach items="${atr.valueList}" var="atvl"><c:if test="${atvl.have==true}">${atvl.atrValue.attrValueId}</c:if></c:forEach>" />
														<input type="text" id="${atr.atr.attrId}"  name="${atr.atr.attrId}"  value="<c:forEach items="${atr.valueList}" var="atvl"><c:if test="${atvl.have==true}">${atvl.atrValue.attrValueName}</c:if></c:forEach>" />
														<c:forEach items="${atr.valueList}" var="atvl">
														<c:if test="${atvl.have==true}">
															<a href="cm/managementmultatr_beforeInsertMultAttribute?p_id=${p_id}&atrName_id=${atr.atr.attrId}&texttype=1&attrValue_id=<c:forEach items='${atr.valueList}' var='atvl'><c:if test='${atvl.have==true}'>${atvl.atrValue.attrValueId}</c:if></c:forEach>">多语言</a>
															<a class='multiLanguageOperate'  href="cm/managementmultatr_delMultAttribute?p_id=${p_id}&atrName_id=${atr.atr.attrId}&texttype=3&attrValue_id=<c:forEach items='${atr.valueList}' var='atvl'><c:if test='${atvl.have==true}'>${atvl.atrValue.attrValueId}</c:if></c:forEach>">清空</a>
														</c:if>
														</c:forEach>
													</c:if> 
													<!----------------------------------------------------- 3 ------------------------->
													<c:if test="${atr.atr.inputStyle==3}">
													<!-- 多行文本框,第一个文本框存放原先的文本内容的id，方便后台后续处理对边比-->
														<input type="hidden" id="${atr.atr.attrId}ID"  name="${atr.atr.attrId}ID" value="<c:forEach items="${atr.valueList}" var="atvl"><c:if test="${atvl.have==true}">${atvl.atrValue.attrValueId}</c:if></c:forEach>" />
														<textarea rows="5" cols="20"  id="${atr.atr.attrId}" name="${atr.atr.attrId}"><c:forEach items="${atr.valueList}" var="atvl"><c:if test="${atvl.have==true}">${atvl.atrValue.attrValueName}</c:if></c:forEach></textarea>
														<c:forEach items="${atr.valueList}" var="atvl">
															<c:if test="${atvl.have==true}">
																<a class='multiLanguageOperate' href="cm/managementmultatr_beforeInsertMultAttribute?p_id=${p_id}&atrName_id=${atr.atr.attrId}&texttype=3&attrValue_id=<c:forEach items='${atr.valueList}' var='atvl'><c:if test='${atvl.have==true}'>${atvl.atrValue.attrValueId}</c:if></c:forEach>">多语言</a>
																<a class='multiLanguageOperate'  href="cm/managementmultatr_delMultAttribute?p_id=${p_id}&atrName_id=${atr.atr.attrId}&texttype=3&attrValue_id=<c:forEach items='${atr.valueList}' var='atvl'><c:if test='${atvl.have==true}'>${atvl.atrValue.attrValueId}</c:if></c:forEach>">清空</a>
															</c:if>
														</c:forEach>
														<script  type="text/javascript">
														    var editor = UE.getEditor("${atr.atr.attrId}",{
														    	 //autoHeightEnabled: true,
														    	 autoFloatEnabled: true,
														    	 initialFrameWidth: 400,
														         initialFrameHeight: 100,
														    });
														</script>
													</c:if>
													<!----------------------------------------------------- 2 --------------------------->
													<!-- checkbox-->
													 <c:if test="${atr.atr.inputStyle==2}">
														<c:forEach items="${atr.valueList}" var="atvl">
															<c:if test="${atvl.have==true}">
																<input type="hidden" name="${atvl.atrValue.attrValueId}Have" value="${atvl.have}" />	
																<input type="checkbox" name="${atr.atr.attrId}" value="${atvl.atrValue.attrValueId}" checked="checked">${atvl.atrValue.attrValueName}
															</c:if>
															<c:if test="${atvl.have==false}">
																<input type="hidden" name="${atvl.atrValue.attrValueId}Have" value="${atvl.have}" />
																<input type="checkbox" name="${atr.atr.attrId}" value="${atvl.atrValue.attrValueId}">${atvl.atrValue.attrValueName}
															</c:if>
														</c:forEach>
													</c:if>
													
													<!----------------------------------------------------- 4 --------------------------->
													<!-- select-->
													 <c:if test="${atr.atr.inputStyle==4}">
														<select name="${atr.atr.attrId}">
															<option value=-1>	</option>
															<c:forEach items="${atr.valueList}" var="atvl">
																<c:if test="${atvl.have==true}">
																	<option selected="selected" value="${atvl.atrValue.attrValueId}">${atvl.atrValue.attrValueName}</option>
																</c:if>
																<c:if test="${atvl.have==false}">
																	<option value="${atvl.atrValue.attrValueId}">${atvl.atrValue.attrValueName}</option>
																</c:if>
															</c:forEach>
														</select>
													</c:if></td>
											</tr>
										</c:forEach>
									</c:forEach>
									<tr>
										<td colspan="3">
											<center>
												<input type="submit" /> 
											</center>
										</td>
									</tr>
								</table>
								
							</form>
							<a href="cm/sku_showInfo?product.p_id=${pvo.products.p_id}&product.p_name=${pvo.products.p_name}"><button>SKU</button></a>

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

        <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
        </div>  <!-- 显示商品分类，一定不能删除 -->

        <div id="brandContent" class="menuContent" style="left: 281px; top: 178px;display:none; position: absolute;">
            <ul id="brand_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
        </div>  <!-- 显示商品品牌列表，一定不能删除 -->
</body>
</html>
