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
	                <a href="http://www.tmall.com" target="_self"><img src="data:image/png;base64,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" alt="Tmall.com天猫"></a>
	        </div>
	    </div>
	</div>
	
	<div id="main-content" class="clearfix">
	    <div class="pic" data-spm="6799321">
	      <a href="http://www.tmall.com/go/market/promotion-act/foodcny.php?spm=3.69280.189029.1&amp;abbucket=&amp;acm=tt458c5f41462feb3908766b8ef1067b4a.1003.8.177573&amp;aldid=177573&amp;abtest=&amp;scm=1003.8.tt458c5f41462feb3908766b8ef1067b4a.OTHER_1422028597855_177573&amp;pos=1" target="_blank">
	        <img id="j_mediaImg" src="http://gtms01.alicdn.com/tps/i1/TB1XG5nHXXXXXXtXpXXBf9A4FXX-435-276.jpg" style="width:435px;height:276px;">
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
