<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Yandex.Metrika counter --> <script type="text/javascript"> (function (d, w, c) { (w[c] = w[c] || []).push(function() { try { w.yaCounter40550355 = new Ya.Metrika({ id:40550355, clickmap:true, trackLinks:true, accurateTrackBounce:true, webvisor:true, trackHash:true, ut:"noindex", ecommerce:"dataLayer" }); } catch(e) { } }); var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () { n.parentNode.insertBefore(s, n); }; s.type = "text/javascript"; s.async = true; s.src = "https://mc.yandex.ru/metrika/watch.js"; if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); } })(document, window, "yandex_metrika_callbacks"); </script> <!-- /Yandex.Metrika counter -->

<!-- 用户登录布局 -->
<link href="userlogin/css/miniuserlogin.css" rel="stylesheet" type="text/css" />


<!-- 文字提示相关 -->
<script type="text/javascript" src="js/text.tip.js"></script>

<!-- 验证码刷新 -->
<script type="text/javascript" src="js/util.js"></script>

<!-- ------------------------------和本网页相关--------------------------------------- -->
<script type="text/javascript" src="userlogin/js/miniuserlogin.js"></script>
<!-- ------------------------------和本网页相关--------------------------------------- -->



</head>

<body>
<!-- ------------------------------------------about user login----------------------------------------- -->
<div id="login-dialog">
    <div id="page2">
	    <div id="content">
	        <div id="J_LoginBox" class="login-box   no-longlogin module-static">
	            <div class="bd">
	                    <div id="J_Message" style="display:none;" class="login-msg msg">
	                        
	                        <p class="error"><s:text name="www.login.tips"></s:text></p>
	                        
	                    </div>
	                    <!--登录的错误信息结束-->
	
	                    <!--标准登录框-->
	                   <div id="J_Static" class="static">
	                        <div class="field ph-hide username-field">
	                            <label for="TPL_username_1"><s:text name="www.login.account"></s:text>:</label>
	                            
	                            <span class="ph-label">手机号/会员名/邮箱</span>
	                            <input type="text" name="TPL_username" id="TPL_username_1" class="login-text J_UserName" value="" maxlength="32" tabindex="1" placeholder='<s:text name="www.login.accountTips"></s:text>'>              
	                        <span id="J_NickX1420787893107" class="nickx" href="javascript:void(0)" style="display: block;"></span></div>
	                            <div class="field pwd-field">
	                                <label id="password-label" for="TPL_password_1"><s:text name="www.login.password"></s:text>:</label>
	                                <a href="usermanage/foreget-password.jsp" target="_blank" id="forget-pw-safe" class="forget-pw">
	                                	<s:text name="www.login.forgotPassword"></s:text>?
	                                </a>
	                                <span id="J_StandardPwd">
	                                    <input type="password" aria-labelledby="password-label" name="TPL_password" id="TPL_password_1" class="login-text" maxlength="20" tabindex="2" placeholder='<s:text name="www.login.passwordTips"></s:text>'>
	                                </span>
	                                <span id="J_PasswordEdit" class="password-edit" style="display:none;"></span>      
	                                
	                                <strong id="J_CapsLockTip" class="warning-tip" style="display:none;">Caps Lock键正处于启用状态，<br>启用它可能导致密码输入错误。</strong>
	                            </div>
	                              <div class="field field-checkcode hidden" id="l_f_code" style="display:none;">
	                                  <!-- <span class="ph-label"><s:text name="www.login.checkCode"></s:text></span>  -->
	                                  <input id="J_CodeInput_i" type="text" class="login-text checkcode J_CheckCode" maxlength="4" name="TPL_checkcode" tabindex="3">
	                                  
	                                  <img style="padding: 1px 0px;margin: -9px 0px;" title="click to change" onclick="javascript:refresh(this);" src="Security/SecurityCodeImageAction">
	                                  
	                                  <a href="javascript:void(0)" class="change-code" id="J_StandardCode">
	                                  	<s:text name="www.login.checkCodeClick"></s:text>
	                                  </a>
	                                  <a href="javascript:void(0)" style="display:none;"  class="change-code" id="J_CheckCode_Message">
	                                  	<s:text name="www.login.tips"></s:text>
	                                  </a>
	                             </div>
	                            
	                            <!--安全插件checkbox-->
	                            
	                        
	                        <div class="submit">
	                            <button type="submit" class="J_Submit" tabindex="5" id="J_SubmitStatic">
	                            	<s:text name="www.login.logon"></s:text>
	                            </button>
	                        </div>
	                        <ul class="entries">
	                            
	                            
	                            <li id="registerUrl_1" class="register">
	                            	<a id="J_RegisterLink1" href="client/newCustomerRegister" target="_blank" tabindex="8">
	                            		<s:text name="www.login.join"></s:text>
	                            	</a>
	                            </li>
	                        </ul>
	                </div>
	                        
	
	
	                <!--快速登录-->
	                <div id="J_QuickLogin" class="quick-login ql-box ql-single" style="display: none;">
	                    <span class="title">检测到您已经登录的账户:</span>
	                    <form action="">
	                        <input type="hidden" value="http://www.taobao.com" id="el_redirectURL" name="redirectURL">
	                        <ul class="userlist">
	                        </ul>
	                        <div class="submit">
	                            <button type="submit" id="J_SubmitQuick">快速登录</button>
	                        </div>
	                        <ul class="entries">        
	                            <li><a class="module-switch" id="J_Quick2Static" data-target="static" href="#">使用其他账户登录</a></li>
	                        </ul>
	                    </form>
	                </div>
	                <!--快速登录结束-->
	            </div>
	        </div>
	    </div>
	</div>
</div>
<div id="loading-login" style="display:none;text-align: center;">
	<img alt="" src="images/loading.gif">                       
</div>
<!-- -------------------------------end of userLoing---------------------------------------------------- -->
</body>
</html>
