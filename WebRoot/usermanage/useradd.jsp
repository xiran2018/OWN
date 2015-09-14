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
		<script src="jqladmin/usermanage/js/user.js" type="text/javascript"></script>
		<!-- 生成验证码 -->
		<script type="text/javascript" src="js/util.js"></script>
        <!-- ------------------------------和本网页相关--------------------------------------- -->
		
        <script type="text/javascript">

        

        </script>
		<style type="text/css">
		
		</style> 
        
	</head>
	<body>
		<div id="header">
		    
			 <jsp:include page="../common/header/header.jsp"  />
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper" style=" min-height: 100%;">
			<div class="picBox" onclick="switchSysBar()" id="switchPoint"></div>
					<div id="show_content_div" >
				   	
						<div>
				         <center>
				            <table class="altrowstable" id="alternatecolor" >
				            <tr class="oddrowcolor">
				                <th colspan="2" class="colume1" valign=middle align=middle>添加用户信息</th>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>用户名</td>
				                <td class="colume2">
				                
				                <INPUT id="name" name="name"  type=text style="width: 233px;">
				                <font color="#FF0000">*</font>
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
                                <td class="colume1" valign=middle align=right>密码</td>
                                <td class="colume2">
                                
                                <INPUT id="passw" name="passw" onblur="getPassword(this)" type="password" style="width: 233px;">
                                <font color="#FF0000">*</font>
                                </td>
                            </tr>
				            <tr class="oddrowcolor">
                                <td class="colume1" valign=middle align=right>确认密码</td>
                                <td class="colume2">
                                
                                <INPUT id="checkpassw" name="checkpassw" onblur="checkPassword(this)" type="password" style="width: 233px;">
                                <font color="#FF0000">*</font>
                                </td>
                            </tr>
				            <tr class="categorytr evenrowcolor">
				                <td class="colume1" valign=middle align=right>邮箱</td>
				                <td class="colume2">
				                 <INPUT id="mail" name="mail"  type="text" onblur="checkIsMail(this)" style="width: 233px;">
                                <font color="#FF0000">*</font>
<!--  				                 
				                 <textarea id="beizhu" name="beizhu" style="margin: 2px; width: 277px; height: 100px;" ></textarea>
-->
				                </td>
				            </tr>

				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>是否可用</td>
				                <td class="colume2">
				                	<input type="radio" name="status" value="1" checked="checked">
				                                                                             是
				                   <input type="radio" name="status" value="0" >
				                                                                            否
				                </td>
				            </tr>
		                   <tr class="evenrowcolor">
		                        <td valign=middle colspan=2 align=center>
		                            <button class="add_button" onclick="javascript:addUser()">添加 </button> 
		                        </td>
		                   </tr>   
				            </table>
				            
				            <!-- 用户登录 -->
				            <div  id="modifyw" class="ui-widget;" style="z-index: 9999999; MARGIN-TOP: -70px; MARGIN-RIGHT: 150px">
				            	<FORM id=loginForm action="admin_login.action" method=post>
									<TABLE border=0 cellSpacing=0 cellPadding=3>
										<TBODY>
											<TR>
												<TD align=left style="font-size: 12px;">
													登录类型:
												</TD>
												<TD>
													<INPUT style="WIDTH: 140px" id="type" type="text" value="1"
														name="type">
												</TD>
											</TR>
											<TR>
												<TD align=left style="font-size: 12px;">
													用户名:
												</TD>
												<TD>
													<INPUT style="WIDTH: 140px" id="userName" type="text"
														name="userName">
												</TD>
											</TR>
											<TR>
												<TD align=left style="font-size: 12px;">
													密码:
												</TD>
												<TD>
													<INPUT style="WIDTH: 140px"
														id="password" type="password" name="password">
												</TD>
											</TR>
											<TR id="randomCodeTR" style="">
	                                            <TD align=left style="font-size: 12px;">
	                                                                                                                                             验证码:
	                                            </TD>
	                                            <TD>
	                                                <input type="text" name="randomCode" id="randomCode" onKeyDown="keyPress(event)"/>
	                                                <img title="点击更换" onclick="javascript:refresh(this);" src="Security/SecurityCodeImageAction"><br/>
	                                                <span>看不清,点击图片更换一张</span>
	                                               <!--
	                                                <INPUT style="WIDTH: 140px" onKeyDown="keyPress(event)"
	                                                    id="password" type="password" name="password">
	                                                 -->   
	                                            </TD>
	                                        </TR>
											
										</TBODY>
									</TABLE>
								</FORM>
							</div>
				            <!-- 用户登录 -->

				            </center>
				        </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                </center>


			</div>
			
			
			<div id="rightSide">					

			</div>

		</div>
	</body>
	<!-- <script type="text/javascript" src="jqladmin/js/rentclick.js"></script> -->
</html>