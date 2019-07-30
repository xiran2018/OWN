<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
 <%@ taglib prefix ="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>邮件发送信息</title>
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
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		<script src="jqladmin/js/left-right.js" type="text/javascript"></script>
	
		
		<!-- math相关 -->
        <script src="js/math.js" type="text/javascript"></script>
		
        <!-- 下拉菜单相关 -->
        <script src="jqladmin/storemange/js/common.js" type="text/javascript"></script>
        
        <!-- 下拉菜单相关 -->
        <script type="text/javascript" src="jqladmin/storemange/js/emailManage.js"></script>
		
		
		<SCRIPT type="text/javascript">
		

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
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper" style=" min-height: 100%;">
			<div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
					<div id="show_content_div" >
				   	
						<div>
				         <center>
				        	 <form action="updateEmailInfo.action" method="post">
						            <table class="altrowstable" id="alternatecolor" >
						            <tr class="oddrowcolor">
						                <th colspan="2" class="colume1" valign=middle align=middle>邮件发送参数信息</th>
						            </tr>
						            						            
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>主机名称</td>
						                <td class="colume2">
							                <input id="ee.hostName" name="ee.hostName"  type=text style="width: 300px;" value=<s:property value='ee.hostName'/> >
						                </td>
						            </tr>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>端口号</td>
						                <td class="colume2">
						                	<input id="ee.smtpPort" name="ee.smtpPort"  type=text style="width: 300px;" value="<s:property value='ee.smtpPort'/>">
						                </td>
						            </tr>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>用户名</td>
						                <td class="colume2">
						                	<input id="ee.hostUserName" name="ee.hostUserName"  type=text style="width: 300px;" value="<s:property value='ee.hostUserName'/>">
						                </td>
						            </tr>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>用户密码</td>
						                <td class="colume2">
						         	       <input id="ee.hostPassword" name="ee.hostPassword"  type=text style="width: 300px;" value="<s:property value='ee.hostPassword'/>">
						                </td>
						            </tr>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>是否开启ssl验证</td>
						                <td class="colume2">
						                	<input type="radio" name="ee.sslOnConnect" value="true" checked="checked">
						                                                                             是
						                    <input type="radio" name="ee.sslOnConnect" value="false">
						                                                                            否
						                </td>
						            </tr>
						            <script type="text/javascript">
						            	var sslOnConnect="<s:property value='ee.sslOnConnect'/>";
						            	$(document).ready(function () {
						            		//if(sslOnConnect=="false")
												//$("[id='ee.smtpPort']").val(); 
						            		    $(":radio[name='ee.sslOnConnect'][value='"+sslOnConnect+"']").attr("checked","true");  
						            	});
						            </script>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>发送方邮件地址</td>
						                <td class="colume2">
						         	       <input id="ee.from" name="ee.from"  type=text style="width: 300px;" value="<s:property value='ee.from'/>">
						                </td>
						            </tr>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>发送方名称</td>
						                <td class="colume2">
						         	       <input id="ee.fromName" name="ee.fromName"  type=text style="width: 300px;" value="<s:property value='ee.fromName'/>">
						                </td>
						            </tr>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>附件文件路径</td>
						                <td class="colume2">
						                <input id="ee.attachmentFilePath" name="ee.attachmentFilePath"  type=text style="width: 300px;" value="<s:property value='ee.attachmentFilePath'/>">
						                "附件可以是图标，相对路径，如：/upload/emailAttachImage/logo.jpg"
						                </td>
						            </tr>
						            <tr class="categorytr evenrowcolor">
						                <td class="colume1" valign=middle align=right>附件描述信息</td>
						                <td class="colume2">
						                 <input id="ee.attachmentDescription" name="ee.attachmentDescription"  type=text style="width: 300px;" value="<s:property value='ee.attachmentDescription'/>">
						                </td>
						            </tr>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>附件名称</td>
						                <td class="colume2">
						                <input id="ee.attachmentName" name="ee.attachmentName" type=text style="width: 300px;" value="<s:property value='ee.attachmentName'/>">
						                "附件名称必须包括扩展名，比如logo.jpg"
						                </td>
						            </tr>
						            <tr class="oddrowcolor">
						                <td class="colume1" valign=middle align=right>嵌入的图像基本地址</td>
						                <td class="colume2">
						                <input id="ee.imageBaseURL" name="ee.imageBaseURL" type=text style="width: 300px;" value="<s:property value='ee.imageBaseURL'/>">
						                "比如：http://www.888own.com"
						                </td>
						            </tr>
				                   <tr class="evenrowcolor">
				                        <td valign=middle colspan=2 align=center>
				                            <button class="add_button" onclick="javascript:email_mangage()">添加 </button> 
				                        </td>
				                   </tr>   
						            </table>
								</form>
				            </center>
				        </div>
					</div>
					
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