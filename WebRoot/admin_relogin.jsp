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
		<base href="<%=basePath%>" >

		<title>管理员登录</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<LINK rel=stylesheet type=text/css href="css/main.css" media=screen>

		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/util.js"></script>
		
		<script type="text/javascript">	
          
			function keyPress(event)
			{
				if(event.keyCode == 13) 
				{
					login();
				}
			}
		
			function login()
			{	
				document.forms[0].submit();
			}
			
			$(document).ready(function()
			{
				  $("#userName").focus();
			});
			
			
		</script>

	</head>

	<body>
		<FORM id=loginForm action="admin_login.action" method=post>
			<TABLE align=center>
				<TBODY>
					<TR>
						<TD>
							<DIV style="BACKGROUND-IMAGE: url(); WIDTH: 1024px; HEIGHT: 109px" id=header></DIV>
						</TD>
					</TR>
					<TR>
						<TD
							style="BACKGROUND-IMAGE: url(); z-index: -3; WIDTH: 1024px; HEIGHT: 680px"
							align=right>
							<div style="z-index: 9999999; MARGIN-TOP: -70px; MARGIN-RIGHT: 150px">
								<TABLE border=0 cellSpacing=0 cellPadding=3>
									<TBODY>
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
												<INPUT style="WIDTH: 140px" onKeyDown="keyPress(event)"
													id="password" type="password" name="password">
											</TD>
										</TR>
										<TR id="randomCodeTR" style="">
                                            <TD align=left style="font-size: 12px;">
                                                                                                                                             验证码:
                                            </TD>
                                            <TD>
                                                <input type="text" style="WIDTH: 140px" name="randomCode" id="randomCode" onKeyDown="keyPress(event)"/>
                                                <img style="padding: 1px 0px;margin: -7px 0px;" title="点击更换" onclick="javascript:refresh(this);" src="Security/SecurityCodeImageAction"><br/>
                                                <span>看不清,点击图片更换一张</span> 
                                            </TD>
                                        </TR>
										<TR height=65>
											<TD vAlign=bottom colSpan=2 align=right>
												<INPUT style="WIDTH: 80px; HEIGHT: 35px"
													 onclick=javascript:login()
													value="登录" type=button>
											</TD>
										</TR>
									</TBODY>
								</TABLE>
								</div>
						</TD>
					</TR>
				</TBODY>
			</TABLE>
		</FORM>
	</body>
</html>
