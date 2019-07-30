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
<title>get password</title>


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

<link href="usermanage/css/handle.foregetpassword.css" rel="stylesheet" type="text/css" />

<!-- 密码，邮箱规则 -->
<script type="text/javascript" src="usermanage/js/user.util.js"></script>

<script src="usermanage/js/handle.foregetpassword.js" type="text/javascript"></script>
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
			<div id="handleforgotYourPassword">
				<div class="inner-box">
					<table  border="0" cellpadding="0" cellspacing="0" width="100%"  class="altrowstable input-box" id="alternatecolor" >
				            <tr class="oddrowcolor">
				                <th colspan="2" class="colume1" valign=middle align=middle>重置密码</th>
				            </tr>
				            

				            <tr class="oddrowcolor" style="display:none;" >
                                <td class="colume1" valign=middle align=right>userid</td>
                                <td class="colume2">
                                
								<input  id="userid" name="userid"   type="text"  value='<s:property  value="id" />' />
                                </td>
                            </tr>
                            <tr class="oddrowcolor" style="display:none;" >
                                <td class="colume1" valign=middle align=right>checkcode</td>
                                <td class="colume2">
                                
								<input  id="checkcodeforgetpass" name="checkcodeforgetpass"   type="text"  value='<s:property  value="checkcode" />' />
                                </td>
                            </tr>
				            <tr class="oddrowcolor">
                                <td class="colume1" valign=middle align=right>输入新密码</td>
                                <td class="colume2">
                                
                                <INPUT class="enterText" id="passw" name="passw" onblur="getPassword(this)" type="password" style="width: 233px;">
                                <font color="#FF0000">*</font>
                                </td>
                            </tr>
				            <tr class="oddrowcolor">
                                <td class="colume1" valign=middle align=right>再次输入新密码</td>
                                <td class="colume2">
                                
                                <INPUT class="enterText" id="checkpassw" name="checkpassw" onblur="checkPassword(this)" type="password" style="width: 233px;">
                                <font color="#FF0000">*</font>
                                </td>
                            </tr>
				      </table>
				      <div class="box-bottom">
				       <input class="fypButton" type="submit" value="Submit" onclick="javascript:resetPassword()">
				      </div>
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
