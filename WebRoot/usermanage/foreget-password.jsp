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

<!--去小数点等-->
<script type="text/javascript" src="js/math.js"></script>

<!-- ------------------------------和本网页相关--------------------------------------- -->
<link href="usermanage/css/foregetpassword.css" rel="stylesheet" type="text/css" />

<script src="usermanage/js/foregetpassword.js" type="text/javascript"></script>
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
			<div id="forgotYourPassword">
				<div class="inner-box">
					<h2><s:text name="www.user.reqPassChange"></s:text></h2>
					<div class="suggest-words">
						<s:text name="www.user.reqPassTips"></s:text>
					</div>
					  				
									
					<div class="input-box">		
						<table border="0" cellpadding="0" cellspacing="0" width="100%" class="input-box">
							<tbody>
								<tr>
									<th width="42%"><s:text name="www.user.emailID"></s:text>:</th>
								    <td style="padding-left:5px;">
								    <input class="enterText" id="mail" name="mail"  type="text" maxlength="128" value=""></td>
								</tr>
							
							</tbody>
						</table>
					</div>
					<div class="box-bottom">
					 <input class="fypButton" type="submit" value="Submit" onclick="javascript:getPassword(this)"></div>
				</div>
			</div>
				
		</div><!-- end of lagout-three -->
	</div>


	<div style="clear:both"></div>
<!-- ----------------------------------------------------------------------------------- -->
            <div id="footer">
                <%@ include file="../common/header/footer.jsp" %>
             
            </div>
<!-- ----------------------------------------------------------------------------------- -->
<!-- ------------------------------和本网页相关--------------------------------------- -->

<!-- ------------------------------和本网页相关--------------------------------------- -->
</body>
</html>
