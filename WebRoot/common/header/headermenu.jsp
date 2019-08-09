<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
	
		<!-- Yandex.Metrika counter --> <script type="text/javascript"> (function (d, w, c) { (w[c] = w[c] || []).push(function() { try { w.yaCounter40550355 = new Ya.Metrika({ id:40550355, clickmap:true, trackLinks:true, accurateTrackBounce:true, webvisor:true, trackHash:true, ut:"noindex", ecommerce:"dataLayer" }); } catch(e) { } }); var n = d.getElementsByTagName("script")[0], s = d.createElement("script"), f = function () { n.parentNode.insertBefore(s, n); }; s.type = "text/javascript"; s.async = true; s.src = "https://mc.yandex.ru/metrika/watch.js"; if (w.opera == "[object Opera]") { d.addEventListener("DOMContentLoaded", f, false); } else { f(); } })(document, window, "yandex_metrika_callbacks"); </script> <!-- /Yandex.Metrika counter -->
	   
	    <!-- headermenu布局 -->
        <link  href="common/header/css/headermenu.css" rel="stylesheet" type="text/css"/>
	
        <!-- language导航栏样式 -->
        <link rel="stylesheet" type="text/css" href="common/header/css/language.css">
        <script type="text/javascript">
        	//about lanuage
            var temp=<%=session.getAttribute("languageId")%>;
            var selectLanguageId =parseInt(temp);   //选择的语言id   
            
            //about currency
            var tempCurrency=<%=session.getAttribute("currencyId")%>;
            var selectCurrencyId =parseInt(tempCurrency);   //选择的货币的id  
            
            tempCurrency=<%=session.getAttribute("currencyRate")%>;
            var currencyRate =parseFloat(tempCurrency);
            
            var currencyName ="<%=session.getAttribute("currencyName")%>";
            
            //about currency currencySymbol
            var currencySymbol="<%=session.getAttribute("currencySymbol")%>";
            
            //about prepage
            var customerRequestPage = '<%=session.getAttribute("customerRequestPage")%>';
            
            //about userid
            var customeruserid = <%=session.getAttribute("customeruserid")%>;
            
            //about username
            var customerusername = '<%=session.getAttribute("customerusername")%>';

            //about token
            var customeruserToken = '<%=session.getAttribute("customeruserToken")%>';
        </script>
        <script type="text/javascript" src="common/header/js/language.js"></script>
        <script type="text/javascript" src="common/header/js/currency.js"></script>
        <script type="text/javascript" src="common/js/silder.js"></script>
        <script type="text/javascript">
        function getShowLoginInfo()
        {
        	var insertHtml="";
            if(customeruserid==null||customeruserid==undefined)
            {//没有登录
            	insertHtml='<s:text name="www.web.welcome"></s:text><span><a target="_blank" class="sn-login" href="login.action"><s:text name="www.web.login"></s:text></a></span><span><a target="_blank"  class="sn-register" href="client/newCustomerRegister"><s:text name="www.web.register"></s:text></a></span>';
            }
            else
            {//登陆
            	insertHtml='Hello, <a target="_blank" href="client-center/buyerIndex.action" >'+customerusername+'</a><span><a target="_blank" class="sn-logout" href="client/userLogout.action"><s:text name="www.web.logout"></s:text></a></span>';
	           
            	//隐藏购物车右边的登陆信息
	            $(".account-unsigned").css("display","none");
	            //隐藏登陆按钮
	            $(".flyout-user-signIn").css("display","none");
	            //隐藏注册按钮
	            $(".flyout-visitors-login").css("display","none");
	            
	            //显示用户登录信息
	            var userNameHtml="Hi, <b>"+customerusername+"</b>";
	            $(".account-name").css("display","inline");
	            $(".account-name").html(userNameHtml);
	            //显示sign-out按钮
	            $(".flyout-user-signout").css("display","block");
	            //显示welcome信息
	            //var welcomeInfo="";
	            //$(".flyout-welcome-text").css("display","");
            }
            $("#login-info").append(insertHtml);
            
            

            
        }
        function registerHeaderMenuEvent()
        {
        	$("#nav-user-account").hover( function () {
        	    $(this).addClass("user-account-unfold");
        	  },
        	  function () {
        	    $(this).removeClass("user-account-unfold");
        	  });
        }
        function getCartInfo()
        {
        	var actionUrl = "client/getCartTotal.action";
        	$.ajax( { 
        		url : actionUrl,
        		type : "post",
        		dataType : "json",
        		error : function(data) 
        		{
        			if(data.status=="200")
        			{
        				alert(messageResourceErrorTips);
        			}
        			else if(data.status=="500")
        			{	
        				alert(messageResourceErrorTips);
        			}
        			
        		},
        		success : function(data) 
        		{
        			$(".shop-cart-number").html(data);
        		}
        	});// end of ajax
        }
        $(document).ready(function() 
        		{   
                   getShowLanguage();
                   getShowLoginInfo();
                   registerHeaderMenuEvent();
                   getCartInfo();
        		});
        </script>
	</head>
	<body>
		<div id="im">
			<%@ include file="../../webIm/cWebIm.jsp"%>
		</div>
		<div>
			<div id="site-nov">
			     <div class="site-nov-con">
                    <!--  <p class="phone"><a href="#">语言</a></p>-->
                    <!--  <p class="language"><a href="#">语言</a></p> -->
			        <p class="login" id="login-info"></p>
			        <ul class="quick-menu">
			          <li class="downmenu languagedownmenu">
                       </li>
                       
                       <li class="downmenu currencydownmenu">
                       </li>
                       
			           <!--<li><a href=""><s:text name="www.web.home"></s:text></a></li> -->
			           <!--  
			           <li class="downmenu">
			                <a href="" class="downmenu">我的淘宝</a>
			                <ul>
			                   <li><a href="#">新闻</a></li>
			                   <li><a href="#">新闻</a></li>
			                   <li><a href="#">新闻</a></li>
			                   <li><a href="#">新闻</a></li>                                     
			                 </ul>
			           </li>
			           -->
			           <!-- <li class="service"><a href=""><s:text name="www.web.contact.us"></s:text></a></li>  -->
			           <!-- 
			           <li>
			           		<a href="shopcart/cart.jsp" >
			           			<s:text name="www.web.shopcart"></s:text>
			           			<strong class="shop-cart-number">0</strong>
			           		</a>
			           </li> -->
			           <!--  <li><a href=""><s:text name="www.web.wishlist"></s:text></a></li> -->
			           <!-- 
			           <li   class="downmenu">
			                <a href=""   class="downmenu">收藏夹</a>
			                <ul>
			                   <li><a href="#">新闻</a></li>
			                   <li><a href="#">新闻</a></li>
			                   <li><a href="#">新闻</a></li>
			                   <li><a href="#">新闻</a></li>                                     
			                 </ul>
			           
			           </li>
			           
			           <li class=" no-bg">
				           <a href="#">
					           <s:text name="system.language.en_US"></s:text>
				           </a>
			           </li>
			            -->
			   
			        </ul>
			     </div>
			  </div>
			  <div id="layout-one">
			     <h2><a href="#"><img src="images/logo.jpg" width="294" height="65" /></a></h2>
			     <!-- 搜索 -->
			     <div class="search">
			         <ul>
			            <li class="current"><s:text name="www.web.product"></s:text></li>
			         </ul>
			         <div class="sea-cen">
			         	<form action="category/searchcommodity_showAll" method="post" target="_blank">
			             <span></span>
			             <input name="searchMsg" type="text"  class="txt" placeholder='<s:text name="www.web.searchmsgtips"></s:text>'/>
			             <input type="submit" value="" class="btn"/>
			             </form>
			         </div>
			     </div><!-- end of 搜索 -->
			     <!-- 购物车 -->
			     <div class="nav-cart">
			     	<a href="shopcart/cart.jsp" data-spm-anchor-id="2114.11010108.0.26">
			     		<span class="text"><s:text name="www.web.shopcart"></s:text></span>
			     	</a>
			     	<span id="nav-cart-num" class="cart-number shop-cart-number">0</span>
			     </div> <!-- end of 购物车 -->
			     <!-- wish list -->
			     <div class="nav-wishlist" data-hover="1">
				     <a href="#">
				     <span class="text hidden-sm"><s:text name="www.web.wishlist"></s:text></span>
				     </a>
				     <div id="navWishlistCtn" class="nav-wishlist-ctn">
					     <div class="nav-wishlist-msg">
					    	 <ul id="navWishListMsg">
					     	 </ul>
					     </div>
				     </div>
			     </div><!-- end of wish list -->
			     
			     <!-- sign in -->
			     <div class="nav-user-account" id="nav-user-account" data-widget-cid="widget-10">
								<div class="user-account-info" data-role="user-account-top">
									<div class="user-account-inner hidden-sm">
										<span class="account-unsigned" data-role="unsigned">
											<a rel="nofollow" href="login.jsp" data-role="sign-link"><s:text name="www.web.login"></s:text></a>
											<span class="ua-line">|</span>
											<a rel="nofollow" href="client/newCustomerRegister" data-role="join-link"><s:text name="www.web.register"></s:text></a>
										</span>
										<span class="account-name" data-role="username"></span>
										<div class="myaliexpress" data-role="myaliexpress">
											<span data-role="myaliexpress-link"><s:text name="www.web.my"></s:text> 999OWN</span><b><!--  (<span class="shop-cart-number">0</span>)--></b>
										</div>
									</div>
								</div>
								<div class="user-account-main" data-role="user-account-main">
									<div class="flyout-user-signout" data-role="signout-btn">
										<a rel="nofollow" href="client/userLogout.action">
											<s:text name="www.web.logout"></s:text>
										</a>
									</div>
									<div class="flyout-user-signIn" data-role="user-signIn" style="display: block;">
										<p class="flyout-welcome-text" data-role="flyout-welcome" style="display: none;">Welcome back</p>
										<p>
											<a rel="nofollow" href="login.jsp" class="sign-btn" data-role="sign-link">
												<s:text name="www.web.login"></s:text>
											</a>
										</p>
										<p class="flyout-signIn-type" style="display:none">
											<span>Sign in with</span>
											<a class="nus-icon nus-facebook" data-role="login-type" rel="nofollow" href="http://thirdparty.aliexpress.com/login.htm?type=fb&amp;tracelog=ws_fb_topbar" title="facebook"></a>
				                          	<a class="nus-icon nus-vk" data-role="login-type" rel="nofollow" href="http://thirdparty.aliexpress.com/login.htm?type=vk&amp;tracelog=ws_vk_topbar" title="vk"></a>
										</p>
									</div>
									<dl class="flyout-visitors-login" data-role="user-login" style="display: block;">
										<!--<dt><s:text name="www.user.new"></s:text></dt>  -->
										<dd><a rel="nofollow" href="client/newCustomerRegister" class="join-btn" data-role="join-link"><s:text name="www.web.register"></s:text></a></dd>
									</dl>
									<div id="flyout-remind-list" class="flyout-remind-list"></div>
									<ul class="flyout-quick-entry" data-role="quick-entry">
										<li><a rel="nofollow" href="client-center/buyerIndex.action">
											<s:text name="www.user.center"></s:text></a>
										</li>
										<li><a rel="nofollow" href="order/showAllOrders.action">
											<s:text name="www.user.order"></s:text></a>
										</li>
										<li><a rel="nofollow" href="javascript:void(0)"><s:text name="www.user.message"></s:text></a></li>
										<li><a rel="nofollow" href="javascript:void(0)"><s:text name="www.web.wishlist"></s:text></a></li>
										<li><a href="client-center/userPoints.action">
											<s:text name="www.user.point"></s:text></a
										></li>
										<li><a rel="nofollow" href="javascript:void(0)"><s:text name="www.user.coupons"></s:text></a></li>
									</ul>
								</div>
				  </div>
			     <!-- end of sign in -->
			  </div>
		</div>
	</body>
</html>