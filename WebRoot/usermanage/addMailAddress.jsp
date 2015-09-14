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
<link href="usermanage/css/addMailAddress.css" rel="stylesheet" type="text/css" />
        
<script type="text/javascript" src="usermanage/js/addMailAddress.js"></script>
		
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
						<h2><s:text name="www.user.addShippingAddress"></s:text></h2>	
					</div>
					<div id="page960" class="main-box">
							<div class="edit-address-title">
								<s:text name="www.user.modifyShippingAddressNotice"></s:text>
							</div>
						    <div class="order-address-item">
								<div class="order-address-manage">
									<div id="address-edit-box" class="address-info-box notranslate">
										<dl class="address-info-item ui-form-item">
											<dt class="ui-form-label">
												<s:text name="www.user.contactName"></s:text>:
											</dt>
											<dd class="ui-form-control util-clearfix" id="ui-contactName-item">
											<input type="text" data-type="contactName" maxlength="128" class="ui-textfield ui-textfield-system" id="contact-name" name="contact-name" value="">
											<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="contact-name-tips" style="display:none;">
												<s:text name="www.user.contactNameNotice"></s:text>
											</p>
											</dd>
										</dl>
										<dl class="address-info-item ui-form-item">
											<dt class="ui-form-label">
												<s:text name="www.shippingAddress.countryRegion"></s:text>:
											</dt>
											<dd class="ui-form-control util-clearfix">
												<select data-type="countryRegion" id="country-region-select" class="select-txt" name="_fmo.m._0.co">
													<option value="">
														<s:text name="www.shippingAddress.countryRegionSelectNotice"></s:text>...
													</option>
													<s:iterator value="sc">
														<option value="<s:property value="id"/>">
															<s:property value="name"/>	
														</option>
													</s:iterator>
												 </select>
												 <p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="country-id-tips" style="display:none;">
												 	<s:text name="www.shippingAddress.countryRegionNotice"></s:text>
												 </p>
											</dd>
										  </dl>
									<dl class="address-info-item ui-form-item">
										<dt class="ui-form-label">
											<s:text name="www.shippingAddress.streetAddress"></s:text>:
										</dt>
										<dd>
											<div class="address-info-line ui-form-control util-clearfix">
												<input type="text" class="ui-textfield ui-textfield-system" maxlength="256" id="street-address" data-type="streetAddress" name="street-address" value="" placeholder="Street address">
												<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="street-address-tips" style="display:none;">
													<s:text name="www.shippingAddress.streetAddressNotice"></s:text>
												</p>
											</div>
											<div class="address-info-line ui-form-control util-clearfix">
												<input type="text" class="ui-textfield ui-textfield-system" maxlength="256" id="streetAddressOther" data-type="streetAddressOther" name="streetAddressOther" value="" placeholder="Apartment, suite, unit etc. (optional)">
											</div>
										</dd>
									</dl>
									 
									<dl class="address-info-item city-address-item ui-form-item" id="city-address-item">
										<dt class="ui-form-label">
											<s:text name="www.shippingAddress.city"></s:text>:
										</dt>
										<dd class="ui-form-control util-clearfix">
											<input type="text" class="ui-textfield ui-textfield-system" maxlength="64" data-type="addressCity" name="addressCity" id="addressCity" value="">
											</input>
											<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="address-city-tips" style="display:none;">
												<s:text name="www.shippingAddress.cityNotice"></s:text>
											</p>
										</dd>
									</dl>
									 
									 
									<dl class="address-info-item ui-form-item">
										<dt class="ui-form-label">
											<s:text name="www.shippingAddress.zipPostalCode"></s:text>:
										</dt>
										<dd class="ui-form-control util-clearfix">
											<input type="text" class="ui-textfield ui-textfield-system" maxlength="9" data-type="adressPostalCode" id="adressPostalCode" name="adressPostalCode" value="">
											<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="address-postal-tips" style="display:none;">
												<s:text name="www.shippingAddress.zipPostalCodeNotice"></s:text>
											</p>
										</dd>
										<dd>
											<p class="tips-txt">
												<s:text name="www.shippingAddress.zipPostalCodeTips"></s:text>
											</p>
										</dd>
									 </dl>
									
									
									<dl class="address-info-item ui-form-item" id="telphone-info-item">
										<dt class="ui-form-label">
											<s:text name="www.shippingAddress.tel"></s:text>:
										</dt>
										<dd class="ui-form-control util-clearfix">
											<input type="text" class="ui-textfield ui-textfield-system ui-countryNumber" data-type="numberCountry" maxlength="8" name="countryNumber" id="countryNumber" value="">
											<input type="text" class="ui-textfield ui-textfield-system ui-areaNumber" data-type="numberArea" maxlength="8" name="areaNumber"  id="areaNumber"  value="">
											<input type="text" class="ui-textfield ui-textfield-system ui-localNumber" data-type="numberPhone" maxlength="36" name="localNumber"  id="localNumber"  value="">
										</dd>
										<dd>
											<p class="tips-txt">
												<s:text name="www.shippingAddress.telTips"></s:text>
											</p>
										</dd>
									</dl>
									<dl class="address-info-item ui-form-item" id="mobile-info-item">
										<dt class="ui-form-label">
											<s:text name="www.shippingAddress.mobile"></s:text>:
										</dt>
										<dd class="ui-form-control util-clearfix">
											<input type="text" class="ui-textfield ui-textfield-system" data-type="phoneNumber" id="mobile-input-ele" maxlength="16" name="mobile-input-ele" value="">
											<p class="ui-form-help ui-feedback ui-feedback-addon ui-feedback-error ui-feedback-body" id="mobile-tips" style="display:none;">
												<s:text name="www.shippingAddress.mobileNotice"></s:text>
												
											</p>
										</dd>
									</dl>
									<div class="address-field-buttons">
										<a class="ui-button ui-button-primary ui-button-medium address-btn-enter" data-action="submitAddress" href="javascript:;">
											<s:text name="www.shippingAddress.save"></s:text>
										</a>
										
									</div>
								</div>
							</div>
						</div>
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
