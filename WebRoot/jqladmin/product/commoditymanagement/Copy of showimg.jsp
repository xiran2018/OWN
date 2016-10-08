<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!-- 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">   -->

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>Full Layout - jQuery EasyUI Demo</title>
	<link rel="stylesheet" type="text/css" href="css/easyui.css">
		<link rel="stylesheet" type="text/css" href="css/icon.css">
		<link rel="stylesheet" type="text/css" href="css/demo.css">
		
		<link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/product_category.css">
		<link rel="stylesheet" type="text/css" href="css/admin_full.css">
		
		<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
		      <!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
		<link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/inputstyle.css">
		
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		
		<script src="jqladmin/js/left-right.js" type="text/javascript"></script>
		
        <script type="text/javascript" src="jqladmin/product/commoditymanagement/product_category.js"></script>
        <script type="text/javascript" src="jqladmin/js/modify_product_category.js"></script>
        <script type="text/javascript" src="jqladmin/js/language.js"></script>
         <script type="text/javascript" src="js/jquery.form.js"></script>
         
         <!--  拖拽排序需要的js -->
         <script type="text/javascript" src="jqladmin/js/Sortable.min.js"></script>

<!--  ueditor 编辑器需要的js -->
<script src="ueditor/ueditor.config.js"></script>
<script src="ueditor/ueditor.all.min.js"></script>
<link rel="stylesheet" type="text/css"	href="ueditor/themes/default/css/ueditor.css" />
<!-- 本页需要的css -->
<link rel="stylesheet" type="text/css"	href="jqladmin/product/commoditymanagement/css/table.css">
<link rel="stylesheet" type="text/css"	href="jqladmin/product/commoditymanagement/css/showimg.css">


<SCRIPT type="text/javascript">
	var isSuccess=${success};
	$().ready(function() {
		if(isSuccess){
			alert("修改成功");
		}
	});
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
							<div class="tipsDiv">图片管理</div>
							<div id="pi-dynamic-field">
							  <div class="opt-banner">
									<span id="showImage"  style="width:100px;height:100px"  style="display: none"></span>  <!-- 图片预览 -->
		                            <input id="image" name="image" type="text"   style="display: none" value=""/>
		                            <form id="form2" method="post" enctype="multipart/form-data">
		                                <input name="p_id" type="hidden" value="${pvo.products.p_id}"/>
			                        	<input id="fileupload" name="fileupload"  type="file"  onchange="javascript:uploadImage()"/>
			                        </form>
			                        <span  id="tipDiv" style="display: none"></span>
			                   </div>
			                   <ul id="pi-dynamic-samples" class="image-list clearfix">
			                   		<li class="image-item" data-json="{&quot;fileDestOrder&quot;:1,&quot;fileFlag&quot;:&quot;no&quot;,&quot;fileHeight&quot;:&quot;0&quot;,&quot;fileId&quot;:&quot;0&quot;,&quot;fileMd5&quot;:&quot;&quot;,&quot;fileName&quot;:&quot;http://ae01.alicdn.com/kf/&quot;,&quot;fileSavePath&quot;:&quot;&quot;,&quot;fileSize&quot;:&quot;0&quot;,&quot;fileSrcOrder&quot;:1,&quot;fileURL&quot;:&quot;http://ae01.alicdn.com/kf/HTB1KhyVKFXXXXcuXXXXq6xXFXXXD.jpg&quot;,&quot;fileWidth&quot;:&quot;0&quot;,&quot;imgURL&quot;:&quot;http://ae01.alicdn.com/kf/HTB1KhyVKFXXXXcuXXXXq6xXFXXXD.jpg_100x100.jpg&quot;,&quot;isError&quot;:false}" id="yui-gen0" data-rate-warn="true">
			                   		<p class="sample-item">
			                   			<img src="http://ae01.alicdn.com/kf/HTB1KhyVKFXXXXcuXXXXq6xXFXXXD.jpg" width="100" height="100">
			                   			<!-- <span class="rate-tip"></span> -->
			                   		</p>
			                   		<h3>http://ae....com/kf/</h3>
			                   		<a class="lnk-del-img" href="javascript:;">删除</a>
			                   		</li>
			                   		<li class="image-item" data-json="{&quot;fileDestOrder&quot;:1,&quot;fileFlag&quot;:&quot;no&quot;,&quot;fileHeight&quot;:&quot;0&quot;,&quot;fileId&quot;:&quot;0&quot;,&quot;fileMd5&quot;:&quot;&quot;,&quot;fileName&quot;:&quot;http://ae01.alicdn.com/kf/&quot;,&quot;fileSavePath&quot;:&quot;&quot;,&quot;fileSize&quot;:&quot;0&quot;,&quot;fileSrcOrder&quot;:1,&quot;fileURL&quot;:&quot;http://ae01.alicdn.com/kf/HTB1KhyVKFXXXXcuXXXXq6xXFXXXD.jpg&quot;,&quot;fileWidth&quot;:&quot;0&quot;,&quot;imgURL&quot;:&quot;http://ae01.alicdn.com/kf/HTB1KhyVKFXXXXcuXXXXq6xXFXXXD.jpg_100x100.jpg&quot;,&quot;isError&quot;:false}" id="yui-gen0" data-rate-warn="true">
			                   		<p class="sample-item">
			                   			<img src="http://ae01.alicdn.com/kf/HTB1KhyVKFXXXXcuXXXXq6xXFXXXD.jpg" width="100" height="100">
			                   			<!-- <span class="rate-tip"></span> -->
			                   		</p>
			                   		<h3>http://ae....com/kf/</h3>
			                   		<a class="lnk-del-img" href="javascript:;">删除</a>
			                   		</li>
							   </ul>
							   <div class="btn-banner">
							   		<p>提交前，请认真核对您填写的信息，您只能在审核后才可再次对此产品进行编辑。</p>
							   		<button type="button" class="yellowish-btn" id="btn-submit">提交</button>
							   </div>
			                        
								<table border="1" id='productImage' class="altrowstable">
									<tr>
										<td>展示图片</td>
										<td>是否封面</td>
										<td>操作</td>
										<td>展示图片</td>
										<td>是否封面</td>
										<td>操作</td>
									</tr>
									<c:forEach items="${pvo.imageURLs}" var="img" varStatus="status">
										<c:if test="${status.index%2==0}">
											<tr>
												<td>
													<img alt="" src="${img.imageAddr}" height="70px" width="70px">
												</td>
												<form action="cm/managementimg_updateImage" method="post">
													<input type="hidden" name="image.id" value="${img.id}">
													<input type="hidden" name="image.productId" value="${img.productId}">
													<td>
														<input type="radio" name="image.imageSort" value="1" <c:if test="${img.imageSort==1}">checked="checked"</c:if>/>是
														<input type="radio" name="image.imageSort" value="0" <c:if test="${img.imageSort!=1}">checked="checked"</c:if>/>否
													</td>
													<td><input type="submit" value="修改">|<a href="cm/managementimg_deleteImage?image.productId=${img.productId}&image.id=${img.id}">删除</a></td></td>
												</form>
										</c:if>
										
										<c:if test="${status.index%2!=0}">
												<td>
													<img alt="" src="${img.imageAddr}" height="70px" width="70px">
												</td>
												<form action="cm/managementimg_updateImage" method="post">
												<input type="hidden" name="image.id" value="${img.id}">
												<input type="hidden" name="image.productId" value="${img.productId}">
												<td>
													<input type="radio" name="image.imageSort" value="1" <c:if test="${img.imageSort==1}">checked="checked"</c:if>/>是
													<input type="radio" name="image.imageSort" value="0" <c:if test="${img.imageSort!=1}">checked="checked"</c:if>/>否
												</td>
												<td><input type="submit" value="修改">|<a href="cm/managementimg_deleteImage?image.productId=${img.productId}&image.id=${img.id}">删除</a></td>
												</form>
										</c:if>
									</c:forEach>
									
								</table>
							</div><!-- end of 展示图片 -->
							
							<!-- 在此页顺便展示了基本属性信息 -->
							<table border="1" class="altrowstable">
								<tr>
										<td  colspan="10" class="tipRow">基本属性信息</td>
								</tr>
								<tr>
									<td>PID</td>
									<td>名称</td>
									<td>重量</td>
									<td>采购价格</td>
									<td>原始价格</td>
									<td>现价</td>
									<td>品牌ID</td>
									<td>商品分类ID</td>
									<td>产品来源厂家</td>
									
									<td>自编号</td>
								
								</tr>
								<tr>
									<td>${pvo.products.p_id}</td>
									<td>${pvo.products.p_name}</td>
									<td>${pvo.products.p_weight}</td>
									<td>${pvo.products.p_purchaprice}</td>
									<td>${pvo.products.p_originprice}</td>
									<td>${pvo.products.p_nowprice}</td>
									<td>${pvo.brand}</td>
									<td>${pvo.category}</td>
									<td>${pvo.products.p_fromcompany}</td>
									<td>${pvo.products.p_myserialnumber}</td>
								</tr>
								<tr>
									<td>厂家编号</td>
									<td>厂家网址</td>
									<td>库存数目</td>
									<td>最少购买数量</td>
									<td>是否免邮</td>
									<td>积分</td>
									<td>是否热销</td>
									<td>是否推荐</td>
									<td>是否新品</td>
									<td>产品状态</td>
								</tr>
								<tr>
									<td>${pvo.products.p_companyserinum}</td>
									<td>${pvo.products.p_fromnetaddress}</td>
									<td>${pvo.products.p_storenumber}</td>
									<td>${pvo.products.p_storenumber}</td>
									<td>${pvo.products.p_freemail}</td>
									<td>${pvo.products.p_jifen}</td>
									<td>${pvo.products.p_hot}</td>
									<td>${pvo.products.p_recommend}</td>
									<td>${pvo.products.p_new}</td>
									<td>${pvo.products.p_status}</td>
								</tr>
							</table>
							
						</center>
					</div>
				</div>
<script>
var el = document.getElementById('pi-dynamic-samples');
var sortable = Sortable.create(el,{
    group: "name",
    sort: true,  // sorting inside list
    delay: 0, // time in milliseconds to define when the sorting should start
    disabled: false, // Disables the sortable if set to true.
    store: null,  // @see Store
    animation: 150,  // ms, animation speed moving items when sorting, `0` — without animation
    //handle: ".my-handle",  // Drag handle selector within list items
    //filter: ".ignore-elements",  // Selectors that do not lead to dragging (String or Function)
    draggable: ".image-item",  // Specifies which items inside the element should be draggable
    ghostClass: "sortable-ghost",  // Class name for the drop placeholder
    chosenClass: "sortable-chosen",  // Class name for the chosen item
    dragClass: "sortable-drag",  // Class name for the dragging item
    
    scroll: true, // or HTMLElement
    //scrollFn: function(offsetX, offsetY, originalEvent) { ... }, // if you have custom scrollbar scrollFn may be used for autoscrolling
    scrollSensitivity: 30, // px, how near the mouse must be to an edge to start scrolling.
    scrollSpeed: 10, // px
    
    setData: function (/** DataTransfer */dataTransfer, /** HTMLElement*/dragEl) {
        dataTransfer.setData('Text', dragEl.textContent); // `dataTransfer` object of HTML5 DragEvent
    },

    // Element is chosen
    onChoose: function (/**Event*/evt) {
        evt.oldIndex;  // element index within parent
        //alert(evt.oldIndex);
    },

    // Element dragging started
    onStart: function (/**Event*/evt) {
        evt.oldIndex;  // element index within parent
    },

    // Element dragging ended
    onEnd: function (/**Event*/evt) {
        evt.oldIndex;  // element's old index within parent
        evt.newIndex;  // element's new index within parent
    },

    // Element is dropped into the list from another list
    onAdd: function (/**Event*/evt) {
        var itemEl = evt.item;  // dragged HTMLElement
        evt.from;  // previous list
        // + indexes from onEnd
    },

    // Changed sorting within list
    onUpdate: function (/**Event*/evt) {
        var itemEl = evt.item;  // dragged HTMLElement
        // + indexes from onEnd
        //alert(itemEl);
    },

    // Called by any change to the list (add / update / remove)
    onSort: function (/**Event*/evt) {
        // same properties as onUpdate
    },

    // Element is removed from the list into another list
    onRemove: function (/**Event*/evt) {
        // same properties as onUpdate
    },

    // Attempt to drag a filtered element
    onFilter: function (/**Event*/evt) {
        var itemEl = evt.item;  // HTMLElement receiving the `mousedown|tapstart` event.
    },

    // Event when you move an item in the list or between lists
    onMove: function (/**Event*/evt, /**Event*/originalEvent) {
        // Example: http://jsbin.com/tuyafe/1/edit?js,output
        evt.dragged; // dragged HTMLElement
        evt.draggedRect; // TextRectangle {left, top, right и bottom}
        evt.related; // HTMLElement on which have guided
        evt.relatedRect; // TextRectangle
        originalEvent.clientY; // mouse position
        // return false; — for cancel
    },

    // Called when creating a clone of element
    onClone: function (/**Event*/evt) {
        var origEl = evt.item;
        var cloneEl = evt.clone;
    }
});
</script>				
				
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
