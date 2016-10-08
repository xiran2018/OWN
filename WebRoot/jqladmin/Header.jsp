<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="jqladmin/css/header.css">
		<script  type="text/javascript" >
			//about the user name
	        var userName="<%=session.getAttribute("user")%>";
	    </script>
	</head>
	<body>
		<div id="headerDiv" style="">
			<div style="">
				<ul id="menu" style="list-style-type: none;">
					<a href="jqladmin/jqladmin-index/admin-index.action">
						<li id="home">
							首页
						</li> 
					</a>
					<a href="showAllOrdersForRoot.action">
						<li id="order">
							订单管理
						</li> 
					</a>
					<a href="jqladmin/product/product.jsp">
						<li id="product">
							商品管理
						</li> 
					</a>
					<a href="jqladmin/product_category/product_category.jsp">
						<li id="product_category">
							商品类目管理
						</li> 
					</a>
					<a href="jqladmin/brand_series/brand_series.jsp">
						<li id="brand_series">
							品牌系列管理
						</li> 
					</a>
					<a href="jqladmin/product_attr/product_attr.jsp">
						<li id="product_category3">
							商品属性管理
						</li>
					 </a>
					<a href="jqladmin/storemange/storemanage.jsp">
						<li id="storemange">
							商店管理
						</li> 
					</a>
					<a href="jqladmin/usermanage/usermanage.jsp">
                        <li id="usermanage">
                                                                        用户管理
                        </li> 
                    </a>
				</ul>
				<div id="profile-links">
					你好, <a class="profile-links-a" href="/newto.php/system/modifypassword" title="用户中心"><%=session.getAttribute("user")%></a>
	                | 
	                <a class="profile-links-a" href="admin_logout.action" title="退出">退出</a>
                </div> <!-- end of profile-links-->
			</div> <!-- end of tab menu content -->
		</div>
	</body>
</html>