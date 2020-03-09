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

<script type="text/javascript">
</script>

<!-- ------------------------------和本网页相关--------------------------------------- -->

<link href="usermanage/css/caption.common.css" rel="stylesheet" type="text/css" />
<link href="usermanage/css/change.password.css" rel="stylesheet" type="text/css" />
        
<script type="text/javascript" src="usermanage/js/change.password.js"></script>
		
<!-- ------------------------------和本网页相关--------------------------------------- -->

</head>

<body>
	<div style="display: none">
        <%@ include file="../common/language/multiLanguage.jsp" %>
	</div>

	<div id="header">
        <%@ include file="../common/header/headermenu.jsp" %>
		<%@ include file="../common/header/secondheader.jsp"%>

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">

			<div class="lagout-three-r">
				<div class="main-wrap">
					<div class="caption clearfix">
						<h2><s:text name="www.user.changePassword"></s:text></h2>	
					</div>
					<div id="page960" class="main-box">
						<div class="h1line"></div>
						<div align="right">
							<span class="required">
								<s:text name="www.user.changePasswordTips"></s:text>
							</span>
						</div>
							<table border="0" cellpadding="0" cellspacing="0" width="100%" class="tables V">
								<tbody>
								<tr>
									<th width="26%">
										<span class="required">
											<s:text name="www.changePassword.currentPassword"></s:text>
										</span>
									</th>
									<td>
										<input type="password" name="curpassword" id="curpassword" value="" style="width: 208px;" maxlength="20">   							  							  
										<div id="curpassword-tipbox" class="error-tipbox hide">
											<s:text name="www.changePassword.currentPasswordNotice"></s:text>
											
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<span class="required">
											<s:text name="www.changePassword.newPassword"></s:text>
										</span>
									</th>
									<td>
										<input type="password" name="password" id="password"  onblur="getPassword(this)"   value="" style="width: 208px;" maxlength="20">
										<div id="password-tipbox" class="error-tipbox hide">
											<s:text name="www.changePassword.newPasswordNotice"></s:text>
										</div>
										<ul id="passLevel" class="checkPassword" style="display:none">
											<li class="strength1">Low</li>
											<li class="strength2">Medium</li>
											<li class="strength3">High</li>
										</ul>
					
					
										<div id="pwSecurityId" style="color:green"></div>
										<div id="password_info_new" class="dpl-board-error" style="display:none"></div>
										<div class="dpl-board-notice">
											<s:text name="www.changePassword.newPasswordTips"></s:text>
										</div>
									</td>
								</tr>
								<tr>
									<th>
										<span class="required">
											<s:text name="www.changePassword.newPasswordAgain"></s:text>
										</span>
									</th>
									<td>
										<input type="password" name="checkpassw" id="checkpassw"  onblur="checkPassword(this)"   value="" style="width: 208px;" maxlength="20">
										<div id="confirm-password-tipbox" class="error-tipbox hide">
											<s:text name="www.changePassword.newPasswordAgainNotice"></s:text>
										</div>
										<div id="confirm_password_info_new" class="dpl-board-error" style="display:none"></div>
									</td>
								</tr>
								<tr>
									<td colspan="2" class="formButton">
										<input type="button" id="form-submit-btn" class="dpl-btn" name="Change" value='<s:text name="www.changePassword.submit"></s:text>'>
										<input type="button" id="form-reset-btn" class="dpl-btn-gray" name="Reset" onclick="clearInput()" value='<s:text name="www.changePassword.reset"></s:text>'>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div><!-- end of lagout-three-r -->

			<div class="lagout-three-l">
				<%@ include file="../order/common.jsp"%>
				<%@ include file="account-settings-common.jsp"%>
			</div>
		</div><!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                 <%@ include file="../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
</body>
</html>
