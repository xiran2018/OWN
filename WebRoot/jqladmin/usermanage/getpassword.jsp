<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<title>用户添加</title>
        <!-- 网页整体布局样式 ，，超链接样式-->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
        <!-- header导航栏样式 -->
        <link rel="stylesheet" type="text/css" href="css/admin_full.css">

        <!-- 左边导航栏，超链接样式 -->
        <link rel="stylesheet" type="text/css" href="jqladmin/usermanage/css/common.css">
        
        <!-- 表格和字体 -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">

        <!-- 点击之后，隐藏左右两边的导航窗口 -->
        <script src="jqladmin/js/left-right.js" type="text/javascript"></script>
        
        <!-- js和jquery相关 -->
        <script type="text/javascript" src="jqladmin/js/json2.js"></script>
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
        
        <!-- 左边导航栏点击之后隐藏动作 -->
        <script src="jqladmin/usermanage/js/common.js" type="text/javascript"></script>
        
        
        <!-- ------------------------------和本网页相关--------------------------------------- -->
        <!-- 添加用户信息操作等 -->
		<script src="jqladmin/usermanage/js/getuserpassword.js" type="text/javascript"></script>
        <!-- ------------------------------和本网页相关--------------------------------------- -->
		
        <script type="text/javascript">

        

        </script>
		<style type="text/css">
		
		</style> 
        
	</head>
	<body>
		<div id="header">
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper" style=" min-height: 100%;">
			<div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
					<div id="show_content_div" >
				   	
						<div>
				         <center>
				            <table class="altrowstable" id="alternatecolor" >
				            <tr class="oddrowcolor">
				                <th colspan="2" class="colume1" valign=middle align=middle>找回密码</th>
				            </tr>
				            

				            <tr class="categorytr evenrowcolor">
				                <td class="colume1" valign=middle align=right>请输入邮箱</td>
				                <td class="colume2">
				                 <INPUT id="mail" name="mail"  type="text" onblur="checkIsMail(this)" style="width: 233px;">
                                <font color="#FF0000">*</font>
<!--  				                 
				                 <textarea id="beizhu" name="beizhu" style="margin: 2px; width: 277px; height: 100px;" ></textarea>
-->
				                </td>
				            </tr>

				            
		                   <tr class="evenrowcolor">
		                        <td valign=middle colspan=2 align=center>
		                            <button class="add_button" onclick="javascript:getPassword()">确定 </button> 
		                        </td>
		                   </tr>   
				            </table>

				            </center>
				        </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="common.jsp"%>
                </center>


			</div>
			
			
			<div id="rightSide">					

			</div>

		</div>
	</body>
	<!-- <script type="text/javascript" src="jqladmin/js/rentclick.js"></script> -->
</html>