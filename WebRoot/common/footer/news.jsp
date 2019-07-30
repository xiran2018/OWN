<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>


<!-- header以下布局 -->
<link href="common/css/secondstyle.css" rel="stylesheet" type="text/css" />

<!--商品分类侧边栏 -->
<link href="common/css/secondsider.css" rel="stylesheet" type="text/css" />

<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" />

<!-- 接受id参数 -->
<% 
                  String id=request.getParameter("id");
%> 

<script type="text/javascript">
	var id=<%=id %> <!-- 此id为点击的栏目的id -->
</script>

<!-- ------------------------------和本网页相关--------------------------------------- -->

        
<script type="text/javascript" src="common/footer/js/template.js"></script>
		
<!-- ------------------------------和本网页相关--------------------------------------- -->

</head>

<body>

	<div id="header">
        <%@ include file="../header/headermenu.jsp" %>
		<%@ include file="../header/secondheader.jsp"%>

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">

			<div class="lagout-three-r">
			<div id="footerInfoContent" class="footerInfoContent" ></div>
			</div>

			<div class="lagout-three-l">
				<!--<h2 class="menu-title">商品服务分类</h2>-->
				<div class="second-cateogry-list">
					<div class="m" id="sortlist">

						<div id="navigationdiv" class="mc">
							<div id="navContentDiv" class="item fore1" clstag="bag|keycount|zbxb|a1">
							</div>
						</div>
					</div>
					<!-- end of m -->
				</div>
				<!-- end of second-cateogry-list -->
			</div>
		</div>
		<!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="../header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
</body>
</html>
