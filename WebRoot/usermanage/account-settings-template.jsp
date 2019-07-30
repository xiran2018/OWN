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
<link href="usermanage/css/account.settings.css" rel="stylesheet" type="text/css" />
        
<script type="text/javascript" src="usermanage/js/account.settings.js"></script>
		
<!-- ------------------------------和本网页相关--------------------------------------- -->

</head>

<body>

	<div id="header">
        <%@ include file="../common/header/headermenu.jsp" %>
		<%@ include file="../common/header/secondheader.jsp"%>

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">

			<div class="lagout-three-r">
				<div class="main-wrap">
					    <div id="settings-panel">
					        <h4>My Personal Information</h4>
					        <ul class="settings-list">
					            <li><a target="_blank" href="http://accounts.alibaba.com/user/portrait/member_portrait.htm">Upload My Photo</a></li>
					            <li><a target="_blank" href="http://accounts.alibaba.com/user/organization/manage_person_profile.htm" data-spm-anchor-id="0.0.0.0">Edit Member Profile</a></li>
					        </ul>
					        <h4>Security Information Settings</h4>
					        <ul class="settings-list">
					            <li><a target="_blank" href="http://accounts.alibaba.com/user/company/change_email_security_prompt.htm">Change Email Address</a></li>
					            <li><a target="_blank" href="http://accounts.alibaba.com/user/company/change_password_security_prompt.htm">Change Password</a></li>
					            <li><a target="_blank" href="http://accounts.alibaba.com/user/company/pre_set_security_prompt.htm">Set Security Question</a></li>
					            <li><a target="_blank" href="http://accounts.alibaba.com/user/securtity_check.htm?tracelog=10007_secrity_check_from_membe">Security Levels</a></li>
					        </ul>
					        <h4>Email Notifications</h4>
					        <ul class="settings-list">
					            <li>
					             <a target="_blank" href="/wsuser/account/emailSubscriptionManagement.htm">Email Notifications</a>
					            </li>
					             <a target="_blank" href="/wsuser/account/emailSubscriptionManagement.htm">
					        	 </a>
					        </ul>
					            <a target="_blank" href="/wsuser/account/emailSubscriptionManagement.htm">
					    		</a>
					     </div>
					         <a target="_blank" href="/wsuser/account/emailSubscriptionManagement.htm">
						     </a>
				</div>
			</div><!-- end of lagout-three-r -->

			<div class="lagout-three-l">
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
