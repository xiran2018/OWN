<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

<!-- ------------------------------和本网页相关--------------------------------------- -->
<link href="usermanage/css/registersuccess.css" rel="stylesheet" type="text/css" />

<!-- ------------------------------和本网页相关--------------------------------------- -->



</head>

<body>

	<div id="header">
        <%@ include file="../../common/header/headermenu.jsp" %>
		<%@ include file="../../common/header/secondheader.jsp"%>

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">
			<div id="forgotYourPassword">
				<div class="inner-box">
					<h2>
						<s:text name="RegisterSuccess"></s:text>
						<div class="suggest-words">
							<s:text name="www.registerSuccess.SuggestWords.0"></s:text>
							<span>
								<a href="login.action">
									<s:text name="www.registerSuccess.SuggestWords.1"></s:text>
								</a> 999OWN.
							</span>
								<s:text name="www.registerSuccess.SuggestWords.2"></s:text>
							<span>
								<a href="client/reSendActivateEmail.action?id=<s:property value='id' />">
									<s:text name="www.registerSuccess.SuggestWords.3"></s:text>
								</a>
							</span>
						 </div>
					</h2>
				</div>
			</div>
				
		</div><!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="../../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
<!-- ------------------------------和本网页相关--------------------------------------- -->

<!-- ------------------------------和本网页相关--------------------------------------- -->
</body>
</html>
