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
<title>please login</title>


<!-- header以下布局 -->
<link href="common/css/secondstyle.css" rel="stylesheet" type="text/css" />


<!--本页相关布局-->
<link href="userlogin/css/login.css" rel="stylesheet" type="text/css" />


<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" />



<!-- ------------------------------和本网页相关--------------------------------------- -->

        
<script type="text/javascript" src="userlogin/js/login.js"></script>
		
<!-- ------------------------------和本网页相关--------------------------------------- -->

</head>

<body>
	<div id="header">
	    <div id="header-inner">
	        <div class="logo">
	                <a href="http://www.999own.ru" target="_self">
	                <img src="images/logo.png" alt="999OWN Store"></a>
	        </div>
	    </div>
	</div>
	
	<div id="main-content" class="clearfix">
	    <div class="pic" data-spm="6799321">
	      <a href="http://www.999own.ru" target="_blank">
	        <img id="j_mediaImg" src="images/loginLeft.png" style="width:435px;height:276px;">
		</a>
	    </div>
	    <div class="form">
	        <div class="form-inner">
	            <div class="form-content">
					<%@ include file="userlogin/login.jsp" %>	
	            </div>
	        </div>
	    </div>
	</div>



	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
</body>
</html>
