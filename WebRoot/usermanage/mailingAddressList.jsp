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
<link href="usermanage/css/mailingAddressList.css" rel="stylesheet" type="text/css" />
        
<script type="text/javascript" src="usermanage/js/mailingAddress.js"></script>
		
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
					<div class="caption clearfix">
						<h2>
							<s:text name="www.user.shippingAddressSettings"></s:text><br>
				            <a href="client-center/addMailAddress.action?status=-1" style="color: #06c;">
				           	 	<s:text name="www.user.shippingAddressAdd"></s:text>
				            </a>
						</h2>	
					</div>
					<div id="page960" class="main-box">
						<table class="table-list widthfixed" width="100%" cellspacing="0" cellpadding="8">
					    	<thead class="thead-grey-gradient">
						        <tr>
						            <th width="5%">&nbsp;</th>
						            <th width="80%"><s:text name="www.user.shippingAddressDetails"></s:text></th>
						            <th width="15%" class="last">&nbsp;</th>
						        </tr>
							</thead>
							<s:iterator value="mailAddressList"  id='element' status="index">
								<tbody>
							        <tr valign="top">
							            <td align="right">
							                <strong><s:property value="#index.index+1"/></strong>
							            </td>
							            <td>
							                <ul>
							                	<li><span class="f14px"><s:property value="mailAddress.contactName"/></span></li>
							                	<li><s:property value="mailAddress.streetAdress"/></li>
							                	<li><s:property value="mailAddress.streetAddressOther"/></li>
							                	<li><s:property value="mailAddress.city"/></li>
							                	<li><s:property value="mailAddress.zipCode"/></li>
							                	<li><s:property value="shppingCountry.name"/></li>
							                	<li><s:text name="www.user.shippingAddressPhoneNumber"></s:text>:<s:property value="mailAddress.countryNumber"/>-<s:property value="mailAddress.areaNumber"/>-<s:property value="mailAddress.localNumber"/></li>
							                	<li><s:text name="www.user.shippingAddressMobileNumber"></s:text>:<s:property value="mailAddress.mobile"/></li>
							                </ul>
										</td>
							            <td>
											<a href="client-center/modifyMailAddress.action?id=<s:property value="mailAddress.id"/>" class="ui-button ui-button-normal-s button_pay">
												<s:text name="www.user.shippingAddressModify"></s:text>
											</a>
											<br>
							                <input type="button" onclick="javascript:deleteMyAddress('<s:property value="mailAddress.id"/>')" value='<s:text name="www.user.shippingAddressDelete"></s:text>' class="ui-button-normal-s button_pay">
							            </td>
							        </tr>
								</tbody>
							</s:iterator>
						
						</table>
					</div>
					
					
				</div><!-- end of main wrap -->
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
