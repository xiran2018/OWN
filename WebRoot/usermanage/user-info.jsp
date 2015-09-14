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

<script type="text/javascript">
</script>

<!-- ------------------------------和本网页相关--------------------------------------- -->

<link href="usermanage/css/caption.common.css" rel="stylesheet" type="text/css" />
<link href="usermanage/css/user.info.css" rel="stylesheet" type="text/css" />
        
<script type="text/javascript" src="usermanage/js/user.info.js"></script>
		
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
						<h2><s:text name="www.user.profile"></s:text></h2>	
					</div>
					<div id="page960" class="main-box">
						<table cellspacing="0" cellpadding="0" width="100%" class="tables V" border="0" id="preview-form">
					        <tbody><tr>
					            <th width="157">
					    			<span><s:text name="www.user.contactName"></s:text>:</span>
					    		</th>
					            <td>
									<div class="column subHead">
										<s:property value="uinfo.username" />
									</div>
								</td>
					        </tr>
					                <tr>
					            <th width="157">
					    			<span><s:text name="www.user.gender"></s:text>:</span>
					    		</th>
					            <td nowrap="" id="usersex">
								</td>
					        </tr>
					         <tr>
					    		<th width="157"><span><s:text name="www.user.emailAddress"></s:text>:</span></th>
					    		<td>
					    			<s:property value="uinfo.usermail" />
									<span class="remark email-remark hide" >
										(<b style="color:#339933;">Email address confirmed</b>)
					                </span>
					    		</td>
					        </tr>
					         <tr display="none">
								<th><span><s:text name="www.user.alternativeEmailAddress"></s:text>:</span></th>
								<td>
									
								</td>
					        </tr>
							<tr  display="none">
					            <th><span><s:text name="www.user.contactAddress"></s:text>:</span></th>
					            <td>
			
					            </td>
					        </tr>
					
					
					    	<tr>
					        	<th><s:text name="www.user.mobile"></s:text>:</th>
					            <td>
					        		<s:property value="uinfo.usertel" />	
					        	</td>
					        </tr>
							
					        <tr>
					            <th>
					    			<s:text name="www.user.point"></s:text>:
					    		</th>
					            <td >
					            	<s:property value="uinfo.jifen" />	    
								</td>
					        </tr>
					
							<tr>
							</tr>
							<tr>
									<td colspan="2" class="button-wrap">
					    				<a href="javascript:void(0)" class="dpl-btn to-edit-btn"> 
					    				   	<s:text name="www.userInfo.edit"></s:text> 
					    				</a>
					    			</td>
							</tr>
							
					        </tbody>
					      </table>
					</div>
					
					<!-- modify userinfo -->
					<div id="modifyw" class="main-box ui-widget"  title='<s:text name="www.userProfile.changeTitle"></s:text>'>
						<table cellspacing="0" cellpadding="0" width="100%" class="tables V" border="0" id="preview-form">
					        <tbody>
					        <input id="userid" name="userid" value='<s:property value="uinfo.userid"  escape="false" />'    type="text" style="display:none">
					        <tr>
					            <th width="157">
					    			<span><s:text name="www.user.contactName"></s:text>:</span>
					    		</th>
					            <td>
									<div class="column subHead">
										<input id="username" disabled="disabled" name="username" value='<s:property value="uinfo.username"  escape="false" />'  onblur="checkUserName(this)"   type="text" class="redborder" placeholder="name&nbsp;" maxlength="128" tabindex="2" style="background-color: rgb(228, 228, 250);">
										<div id="name-tipbox" class="error-tipbox hide">Please enter your  name or the name has already registered before</div>
									</div>
								</td>
					        </tr>
					                <tr>
					            <th width="157">
					    			<span><s:text name="www.user.gender"></s:text>:</span>
					    		</th>
					            <td nowrap="">
				                    <input type="radio" name="sex" value="0" >Female
					            	<input type="radio" name="sex" value="1">Male
					            	<script type="text/javascript">
										var sex='<s:property value="uinfo.sex" />'
										if(sex=="0")
										{
											$("#usersex").html("Female");
										}
										else if(sex=="1")
										{
											$("#usersex").html("Male");
										}
										$("input[type='radio'][value="+sex+"]").prop("checked", "true");
									</script>
								</td>
					        </tr>
					                <tr>
					    		<th width="157"><span><s:text name="www.user.emailAddress"></s:text>:</span></th>
					    		<td>
									 <input id="mail" name="mail" value='<s:property value="uinfo.usermail"   escape="false" />'  onblur="checkIsMail(this)"  type="text" tabindex="1" autocomplete="off" maxlength="128" class="redborder">
					    			 <div id="email-tipbox" class="error-tipbox hide">
					    			 	Please enter a valid Email Address or the email has already registered before
					    			 </div>
					    		</td>
					        </tr>
					        <tr style="display: none;">
								<th><span>Alternative Email Address:</span></th>
								<td>
									
								</td>
					        </tr>
							<tr  style="display: none;">
					            <th><span>Contact Address:</span></th>
					            <td>
			
					            </td>
					        </tr>
					
					
					    	<tr>
					        	<th><s:text name="www.user.mobile"></s:text>:</th>
					            <td>
					        		<input id="usertel" name="usertel" value='<s:property value="uinfo.usertel"   escape="false" />'    type="text" tabindex="1" autocomplete="off" maxlength="128" class="redborder">
					    			
					        	</td>
					        </tr>
							
					
							<tr>
							</tr>
							<tr>
									<td colspan="2" class="button-wrap">
										
					    				   <a href="javascript:void(0)" class="dpl-btn dpl-btn-save"> save </a>
					    				   <a href="javascript:void(0)" class="dpl-btn dpl-btn-cancel" style="margin-left: 20px;"> cancel </a>
					    				
					    			</td>
							</tr>
							
					        </tbody>
					      </table>
					</div><!--end of  modify userinfo -->
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
