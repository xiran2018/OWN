<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>welcom poplanding store</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<!-- header以下布局 -->
		<link  href="common/css/style.css" rel="stylesheet" type="text/css"/>
		
		<!--商品分类侧边栏 -->
		<link  href="common/css/silder.css" rel="stylesheet" type="text/css"/>
		
		<!-- 首页header页面滚动图布局样式css -->
        <link  href="common/css/leftmidright.css" rel="stylesheet" type="text/css"/>
        
        <!-- js和jquery相关 -->
        <script type="text/javascript" src="js/json2.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
        
        
        <!-- 字体-->
        <link rel="stylesheet" type="text/css" href="css/font.css"> 
        
        
        <!-- 图片轮播 -->
        <script type="text/javascript" src="common/js/imagePlay.js"></script>
        
        
        <!-- 多tab需要的样式
        <link rel="stylesheet" type="text/css" href="css/rentclick.css">
        <script type="text/javascript" src="js/rentclick.js"></script> 
		-->
        
        <!-- ------------------------------和本网页相关--------------------------------------- -->

        
		<script type="text/javascript" src="js/index.js"></script>
		
        <!-- ------------------------------和本网页相关--------------------------------------- -->
		
		

		<style type="text/css">

		</style> 
        
  </head>
  
  <body>
  		<div id="header">
			<%@ include file="common/header/headermenu.jsp" %>
			<%@ include file="common/header/header.jsp" %>
			 
		</div>
		

<!-- ----------------------------------------------------------------------------------- -->
		<div id="category-menu">
		     <div id="category-image-paly">
		        <div id="focus">
		            <ul nowrap="nowrap" class="imagePlayContainerUL">
		            </ul>
		        </div>
		     </div><!-- end of category-image-paly -->
		    <div id="lagout-three">
		    
		    <div class="lagout-three-r">
		                             <div class="rightsmall">
		                                
		                            </div>
		    </div>
		    
		     <div class="lagout-three-l">
		       <h2 class="menu-title"><s:text name="www.product.category"></s:text></h2>
		       <div class="product-list">                                                 
		                <div id="sidebar-menu"> 
		                    <ul class="catgoryContainerUL"> 
		                    </ul> 
		                    </div> <!--  end of menu sidebar-menu-->
		       </div><!-- end of product-list -->
		       </div>
		  </div> <!-- end of lagout-three -->
		  </div>
		  <div class='category-floors'>

  
          </div><!--  end of category-floors -->
  
  
  <div class="clearboth"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="common/header/footer.jsp" %>
             
            </div>
  </body>
</html>
