<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>商店页脚信息管理</title>
		
 		<!-- 网页整体布局样式 ，，超链接样式-->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
        <!-- header导航栏样式 -->
        <link rel="stylesheet" type="text/css" href="css/admin_full.css">

        
        
        <!-- 表格和字体 -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">

        <!-- 点击之后，隐藏左右两边的导航窗口 -->
        <script src="jqladmin/js/left-right.js" type="text/javascript"></script>
        
        <!-- js和jquery相关 -->
        <script type="text/javascript" src="jqladmin/js/json2.js"></script>
        <!-- <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> -->
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
        
        
        <!-- ueditor相关 -->
        <script src="ueditor/ueditor.config.js"></script>
		<script src="ueditor/ueditor.all.min.js"></script>
		<link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css"/>
        
        <!-- 左边导航栏点击之后隐藏动作 -->
        <script src="jqladmin/usermanage/js/common.js" type="text/javascript"></script>
        
        
        <!-- ————————————————————————————————————————————多语言需要的东西—————————————————————————————————————————————————————— -->
        <!-- 按照多语言增添相应内容的时候，需要的样式，以及点击的时候，需要的动作 -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
		<script type="text/javascript" src="jqladmin/js/addrentclick.js"></script>
		
		<!-- 按照多语言修改相应内容的时候,需要呈现时需要的css -->
		<link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
        <!-- —————————————————————————————————————————————多语言需要的东西———————————————————————————————————————————————————————— -->


      
        
        <!-- ------------------------------和本网页相关--------------------------------------- -->
		<script type="text/javascript" src="jqladmin/storemange/js/editstorehomexiangxiinfo.js"></script>

        <!-- ------------------------------和本网页相关--------------------------------------- -->
		
		

		<style type="text/css">
		
			.abutton{
				 
				border: 1px solid;
				padding: 3px 15px;

			}

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
				            
				            <!-- 修改详细信息的div -->
				            <div id="modifyw" style="width:90%;">
				                <table style="width: 100%" border=0 cellspacing=0 cellpadding=3 align=center class="altrowstable">
				                    <tr style="display: none">
				                        <td valign=middle  align=right class="colume1">
				                            <b>本元素值id:</b>
				                        </td>
				                        <td valign=middle class="colume2">
				                            <input id="self_id" type=text>
				                        </td>
				                    </tr>
				                    <tr>
				                        <td valign=middle colspan=2 align=center>
				                                                                        详细信息
				                        </td>
				                    </tr>                  
				                    <tr>
				                        <td id="modMultiLan" valign="top"  style="height: 700px;" valign=middle colspan=2 align=left>
				                            <div id="moddetailedcontainer">
				                                <ul id="modnavigation">
				                                </ul>
				                            </div>
				                        </td>
				                    </tr>   
				
				                </table>
				            </div> 
				            <!-- end of 修改商品分类div -->
				            
							<script>
							$(function(){
								
								var cml=<s:property value="jo" escape="false"/>;
								console.log(cml);
								insertEditHtml(cml);
							});
							</script>

				            </center>
				        </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="storeCommon.jsp"%>
                </center>


			</div>
			
			
			<div id="rightSide">					

			</div>

		</div>
	</body>
	<!-- <script type="text/javascript" src="jqladmin/js/rentclick.js"></script> -->
</html>