<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>Full Layout - jQuery EasyUI Demo</title>
		<link rel="stylesheet" type="text/css" href="css/easyui.css">
		<link rel="stylesheet" type="text/css" href="css/icon.css">
		<link rel="stylesheet" type="text/css" href="css/demo.css">
		
		<link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/product_category.css">
		<link rel="stylesheet" type="text/css" href="css/admin_full.css">
		
		<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
		      <!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
		<link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/inputstyle.css">
		
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		
		<script src="jqladmin/js/left-right.js" type="text/javascript"></script>
		
		<!-- 用树形结构展示相应的内容 -->
        <script type="text/javascript" src="jqladmin/js/product_category.js"></script>
        <script type="text/javascript" src="jqladmin/js/modify_product_category.js"></script>
        <script type="text/javascript" src="jqladmin/js/language.js"></script>
        
        <!-- 按照多语言增添相应内容的时候，展示的内容 -->
		<script type="text/javascript" src="jqladmin/js/addrentclick.js"></script>
		
		 <script type="text/javascript" src="js/jquery.form.js"></script>
		


		<SCRIPT type="text/javascript">

		    $(document).ready(function () {
		        
		    });
		

		</SCRIPT>
		<style type="text/css">
		.ztree li span.button.add {
			margin-left: 2px;
			margin-right: -1px;
			background-position: -144px 0;
			vertical-align: top; *
			vertical-align: middle
		}
		
		.panel
		{
		  width:90% !important;
		  left: 7px !important;
		}
		</style> 
        
	</head>
	<body>
		<div id="header">
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper">
			<div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
					<div id="show_content_div" >
				   	
						<div>
				         <center>
				            <label><font color="#FF0000">"如果删除商品分类，确保该分类下没有子分类，否则会出现错误！！"</font></label>
				            <ul id="category_tree" class="ztree"></ul><!-- 显示商品分类，一定不能删除 -->
				            
				
				            
<!-- 				            <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
				                <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
				            </div>   -->
				
				
				            </center>
				        </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="productCategoryCommon.jsp"%>
                </center>


			</div>
			
			<!-- 添加商品分类的div -->
            <div id="w" class="easyui-window" title="添加商品类目"
                data-options="modal:true,closed:true,iconCls:'icon-save'"
                style="width: 90%; height: 500px; padding: 10px;">
                <table style="width: 100%" border=0 cellspacing=0 cellpadding=3 align=center class="altrowstable">
                    
                   <tr>
                        <td valign=middle class="colume2"  colspan=2 align=center>
                            <font color='red'>上传图片时请确保该类目上传，否则会积累图片（以后更改）!</font>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>所属类别:</b>
                        </td>
                        <td valign=middle class="colume2">
                            <span id="belong_category"></span>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td valign=middle  align=right>
                            <b>父元素值id:</b>
                        </td>
                        <td valign=middle>
                            <input id="belong_id" type=text>
                        </td>
                    </tr>

                    <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>类别名称：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <INPUT id=category_name name=category_name type=text>
                        </td>
                    </tr>
                    
                   <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>是否显示：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <input type="radio" name="cshow" class=""  value="1"  checked="checked">
                                                                                                                                    是
                            <input type="radio" name="cshow" class=""  value="0" >
                                                                                                                                    否
                        </td>
                    </tr>
                   <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>请选择图片尺寸：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <select id="imagesize">
							  <option value ="1">176*176</option>
							  <option value ="2">210*210</option>
							  <option value="3">210*270</option>
							  <option value="4">254*390</option>
							</select>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>类别图标：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <span id="showIcon"  style="width:50px;height:50px"  style="display: none"></span>  <!-- 图片预览 -->
                            <input id="icon" name="icon" type="text"   style="display: none" value=""/>
                            <form id="iconform" method="post" enctype="multipart/form-data">
                                <input id="preicon" name="preicon" type="text"   style="display: none" value=""/>
                                <input id="iconImageupload" name="iconImageupload"  type="file"  onchange="javascript:uploadIcon()"/>
                            </form>
                            <span  id="iconTipDiv" style="display: none"></span>
                        </td>
                    </tr>
                     <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>类别图片：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <span id="showImage"  style="width:50px;height:50px"  style="display: none"></span>  <!-- 图片预览 -->
                            <input id="image" name="image" type="text"   style="display: none" value=""/>
                            <form id="form2" method="post" enctype="multipart/form-data">
                                <input id="preimage" name="preimage" type="text"   style="display: none" value=""/>
	                        	<input id="fileupload" name="fileupload"  type="file"  onchange="javascript:uploadImage()"/>
	                        </form>
	                        <span  id="tipDiv" style="display: none"></span>
                        </td>
                    </tr>
                    
                    <tr >
                        <td valign=middle  align=right class="colume1">
                            <b>具体信息：</b>
                        </td>
                        <td id="addMultiLan" valign="top" class="colume2" style="height: 280px;">
	                        <div id="detailedcontainer">
		                        <ul id="navigation">
		                        </ul>
	                        </div>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle colspan=2 align=center>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:save_product_category()">保存</a>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#w').window('close')">取消</a>
                        </td>
                    </tr>   

                </table>
            </div>
             <!-- end of 添加商品分类div -->
            
            <!-- 修改商品分类的div -->
            <div id="modifyw" class="easyui-window" title="修改商品类目"
                data-options="modal:true,closed:true,iconCls:'icon-save'"
                style="width: 90%; height: 500px; padding: 10px;">
                <table style="width: 100%" border=0 cellspacing=0 cellpadding=3 align=center class="altrowstable">
                    <tr>
                        <td valign=middle colspan=2 align=center>
                                                                        基本信息
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td valign=middle  align=right class="colume1">
                            <b>本元素值id:</b>
                        </td>
                        <td valign=middle class="colume2">
                            <input id="self_id" type=text>
                        </td>
                    </tr>
                    <tr style="display: none">
                        <td valign=middle  align=right>
                            <b>父元素值id:</b>
                        </td>
                        <td valign=middle>
                            <input id="modify_father_id" type=text>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>类别名称：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <INPUT id=modify_category_name name=category_name type=text>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>是否显示：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <input type="radio" name="modify_cshow" class=""  value="1"  checked="checked">
                                                                                                                                    是
                            <input type="radio" name="modify_cshow" class=""  value="0" >
                                                                                                                                    否
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>请选择图片尺寸：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <select id="modify_imagesize">
                              <option value ="1">176*176</option>
                              <option value ="2">210*210</option>
                              <option value="3">210*270</option>
                              <option value="4">254*390</option>
                            </select>
                        </td>
                    </tr>
                    
                     <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>类别图标：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <span id="modify_showIcon"  style="width:50px;height:50px"  style="display: none">
                            	<img id="showIconInDB" style='width:50px;height:50px' src=''/>
                            </span>  <!-- 图片预览 -->
                            <input id="modify_icon" name="modify_icon" type="text"   style="display: none" value=""/>
                            <form id="modify_iconform" method="post" enctype="multipart/form-data">
                                <input id="modify_icon_self_id" name="modify_icon_self_id" type="text"   style="display: none" value=""/>
                                <input id="modify_preicon" name="modify_preicon" type="text"   style="display: none" value=""/>
                                <input id="modify_iconupload" name="modify_iconupload"  type="file"  onchange="javascript:uploadModifyIcon()"/>
                            </form>
                            <span  id="modify_icon_tipDiv" style="display: none"></span>
                        </td>
                    </tr>
                     <tr>
                        <td valign=middle  align=right class="colume1">
                            <b>类别图片：</b>
                        </td>
                        <td valign=middle class="colume2">
                            <span id="modify_showImage"  style="width:50px;height:50px"  style="display: none">
                            	<img id="showImageInDB" style='width:50px;height:50px' src=''/></span>  <!-- 图片预览 -->
                            <input id="modify_image" name="modify_image" type="text"   style="display: none" value=""/>
                            <form id="modify_form2" method="post" enctype="multipart/form-data">
                                <input id="modify_self_id" name="modify_self_id" type="text"   style="display: none" value=""/>
                                <input id="modify_preimage" name="modify_preimage" type="text"   style="display: none" value=""/>
                                <input id="modify_fileupload" name="modify_fileupload"  type="file"  onchange="javascript:uploadModifyImage()"/>
                            </form>
                            <span  id="modify_tipDiv" style="display: none"></span>
                        </td>
                    </tr>
                    <tr>
                        <td valign=middle colspan=2 align=center>
                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:modify_product_category_basic()">保存</a>
                        </td>
                    </tr> 
                    <tr>
                        <td valign=middle colspan=2 align=center>
                                                                        详细信息
                        </td>
                    </tr>                  
                    <tr >
                        <td id="modMultiLan" valign="top"  style="height: 345px;" valign=middle colspan=2 align=center>
                            <div id="moddetailedcontainer">
                                <ul id="modnavigation">
                                </ul>
                            </div>
                        </td>
                    </tr>   

                </table>
            </div> 
            <!-- end of 修改商品分类div -->
            
            
		</div>
	</body>
</html>