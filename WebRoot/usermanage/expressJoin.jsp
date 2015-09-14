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
<title>京东</title>

<!-- header以下布局 -->
<link href="common/css/secondstyle.css" rel="stylesheet" type="text/css" />

<!--商品分类侧边栏 -->
<link href="common/css/secondsider.css" rel="stylesheet" type="text/css" />

<!-- js和jquery相关 -->
<script type="text/javascript" src="js/json2.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css" /> 

<!-- 验证码刷新 -->
<script type="text/javascript" src="js/util.js"></script>

<!-- ------------------------------和本网页相关--------------------------------------- -->

<link href="usermanage/css/expressJoin.css" rel="stylesheet" type="text/css" />
        
<script type="text/javascript" src="usermanage/js/express.join.js"></script>


		
<!-- ------------------------------和本网页相关--------------------------------------- -->



</head>

<body>

	<div id="header">

	</div>


	<!--！！！！！！！！！！！！！！！！！！！ 之下的代码是你需要真正使用的，需要到时候用js（切记：因为js的用户体验非常好）生成！！！！！！！！！！！！！！！！！！-->
	<div id="second-category-menu">

		<div id="lagout-three">
			<div class="bg-gray">
			    <div id="header" class="header">
			        <div class="logo">
			            <a href="http://www.aliexpress.com" title="http://www.aliexpress.com">http://www.aliexpress.com</a>
			            <p>Smarter Shopping, Better Living!</p>
			        </div>
			
			        <div style="clear:both;"></div>
			    </div>
			    <!-- header -->
			
			    <div class="page">
				   <form action="client/newCustomerRegister.action" name="MemberJoinForm" method="post" id="join-form">
				           <div class="left-form">
				                <div class="form-head">
				                    <h2>Create a New Account</h2>
				                    <div>Already a Member? <a href="login.jsp" id="member-signin" class="member-signin" style="color: #06c;">Sign in</a></div>
								</div>
				
				                <div class="form-detail">
				                    <div class="summary">Sign up for an account using your email address.</div>
				                    <dl>
				                        <dt>Email address:</dt>
				                        <dd>
				                            <span id="email-ph" class="ph-label hide"></span>
				                            <input id="mail" name="mail" value='<s:property value="mail"  escape="false" />'  onblur="checkIsMail(this)"  type="text" tabindex="1" autocomplete="off" maxlength="128" class="redborder">
				                            <div id="email-tipbox" class="error-tipbox hide">Please enter a valid Email Address or the email has already registered before</div>
				                            <div id="email-prompt" class="email-prompt hide" data-index="-1">
				                                <ul>
				                                    <li data-domain="@gmail.com"></li>
				                                    <li data-domain="@hotmail.com"></li>
				                                    <li data-domain="@yahoo.com"></li>
				                                    <li data-domain="@mail.ru"></li>
				                                    <li data-domain="@aol.com"></li>
				                                    <li data-domain="@yandex.ru"></li>
				                                </ul>
				                            </div>
				                        </dd>
				
				                        <dt>Name:</dt>
				                        <dd>
				                            <span id="first-name-ph" class="ph-label hide">First&nbsp;name&nbsp;</span>
				                            <input id="username" name="username" value='<s:property value="username"  escape="false" />'  onblur="checkUserName(this)"   type="text" class="redborder" placeholder="name&nbsp;" maxlength="128" tabindex="2">
				                            <div id="name-tipbox" class="error-tipbox hide">Please enter your  name or the name has already registered before</div>
				                        </dd>
				
				                        <dt>Create password:</dt>
				                        <dd>
				                            <span id="password-ph" class="ph-label hide">6-20&nbsp;characters&nbsp;(letters&nbsp;or&nbsp;numbers&nbsp;only)</span>
				                            <input id="password" name="password" onblur="getPassword(this)"  value="" type="password" placeholder="6-20&nbsp;characters&nbsp;(letters&nbsp;or&nbsp;numbers&nbsp;only)" tabindex="4" maxlength="20">
				                            <div id="password-tipbox" class="error-tipbox hide">Please type the right password</div>
				                        </dd>
				
				                        <dt>Confirm your password:</dt>
				                        <dd>
				                            <span id="confirm-password-ph" class="ph-label hide">Enter password again</span>
				                            <input id="checkpassw" name="checkpassw"  onblur="checkPassword(this)"  value="" type="password" placeholder="Enter password again" tabindex="5" maxlength="20">
				                            <div id="confirm-password-tipbox" class="error-tipbox hide">Passwords are not the same</div>
				                        </dd>
				                        <dt>Enter&nbsp;the&nbsp;code&nbsp;below</dt>
				                        <dd>
				                            <span id="checkcode-ph" class="ph-label hide">Not&nbsp;case-sensitive  aaaaaaaaaaaaa true</span>
				                            <input id="checkcode" name="checkcode" value="" type="text" placeholder="Not&nbsp;case-sensitive" tabindex="6" data-valid="false">
				                            <div class="checkcode" id="refresh-checkcode-btn">
				                                <img onclick="javascript:clientRegisterRefresh(this);" src="Security/SecurityCodeImageAction?type=1" id="checkcode-img" align="absmiddle">
				                                <span>Refresh the code</span>
				                            </div>
				                            <div id="checkcode-tipbox" class="error-tipbox hide">Type the right characters you see in the picture</div>
				                            <script type="text/javascript">
												//about the code
												var codeError='<s:property value="codeError"  escape="false" />';
												function checkInputError()
												{
													if(codeError=="1")
													{//验证码是错误的
														$("#checkcode-tipbox").removeClass("hide");
													}
													else if(codeError=="2")
													{//用户名重复
														$("#name-tipbox").removeClass("hide");
													}
													else if(codeError=="3")
													{//邮箱重复
														$("#email-tipbox").removeClass("hide");
													}
												}
												checkInputError();
											</script>
				                        </dd>
				                    </dl>
				
				                    <div class="agreement-box" style="display:none">
				                        <label>
				                            <input type="checkbox" id="agree-ckb" tabindex="7" checked="">
				                             I agree to the AliExpress.com Free Membership Agreement.
				                        </label>
				                        <a target="_blank" href="http://news.alibaba.com/article/detail/help/100453670-1-alibaba.com-free-membership-agreement.html">View Agreement</a>
				                        <div id="agree-tipbox"></div>
				                    </div>
				                    <div class="submit-box">
				                        <input id="submit-btn" type="button" onclick="validate()" class="ui-button ui-button-primary ui-button-large" value="Create Your Account" tabindex="8">
				                    </div>
				                </div>
				            </div>
				        </form>
				</div>
			
			    <!-- page -->
			
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
