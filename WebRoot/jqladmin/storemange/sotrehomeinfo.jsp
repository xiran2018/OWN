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
		<title>商店页脚信息管理</title>
		
 		<!-- 网页整体布局样式 ，，超链接样式-->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
        <!-- header导航栏样式 -->
        <link rel="stylesheet" type="text/css" href="css/admin_full.css">

        
        
        <!-- 表格和字体 -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">

        <!-- 点击之后，隐藏左右两边的导航窗口 -->
        <script src="jqladmin/js/left-right.js" type="text/javascript"></script>
        
        <!-- js和jquery相关 -->
        <script type="text/javascript" src="jqladmin/js/json2.js"></script>
        <!-- <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> -->
        <script type="text/javascript" src="js/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="jquery-ui/jquery-ui.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery-ui/jquery-ui.css">
        
        
        <!-- ueditor相关 -->
        <script src="ueditor/ueditor.config.js"></script>
		<script src="ueditor/ueditor.all.min.js"></script>
		<link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css"/>
        
        <!-- 左边导航栏点击之后隐藏动作 -->
        <script src="jqladmin/usermanage/js/common.js" type="text/javascript"></script>
        
        <!-- 上传图片相关，这个jquery。form,貌似必须用1.4.2版本的jquery,经过我的改进（生成了uploadUtilActionJson.java类型，action配置文件中，返回了json格式数据），可以较为完美的兼容1.10.2-->
        <script type="text/javascript" src="js/jquery.form.js"></script>
        
        
        <!-- ————————————————————————————————————————————多语言需要的东西—————————————————————————————————————————————————————— -->
        <!-- 按照多语言增添相应内容的时候，需要的样式，以及点击的时候，需要的动作 -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
		<script type="text/javascript" src="jqladmin/js/addrentclick.js"></script>
		
		<!-- 按照多语言修改相应内容的时候,需要呈现时需要的css -->
		<link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
        <!-- —————————————————————————————————————————————多语言需要的东西———————————————————————————————————————————————————————— -->
        
        <!-- ------------------------------和本网页相关--------------------------------------- -->
        <!-- 按照多语言增添相应内容的时候，展示的内容 -->
		<script type="text/javascript" src="jqladmin/storemange/js/insertMultiLan.js"></script>
        <!-- ------------------------------和本网页相关--------------------------------------- -->
        
        <!-- jquery tree table 需要的-->
		<link href="css/jquerytreetable/jquery.treetable.css" rel="stylesheet" type="text/css" />
		<link href="css/jquerytreetable/jquery.treetable.theme.default.css" rel="stylesheet" type="text/css" />
		<script src="js/jquerytreetable/jquery.treetable.js"></script>
		
		
		<!-- ------------------------------上传图片相关--------------------------------------- -->
        <script type="text/javascript" src="jqladmin/storemange/js/uploadImage.js"></script>
        
        <!-- ------------------------------和本网页相关--------------------------------------- -->
		<script type="text/javascript" src="jqladmin/storemange/js/storehomeinfo.js"></script>
		<script>
		$(function(){
			
			
		
		});
		</script>
        <!-- ------------------------------和本网页相关--------------------------------------- -->
		
		

		<style type="text/css">
		
			.abutton{
				 
				border: 1px solid;
				padding: 3px 15px;

			}

		</style> 
        
	</head>
	<body>
		<div id="header">
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper" style=" min-height: 100%;">
			        <div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);"></div>
					<div id="show_content_div" >
				   	
						<div>
				         <center>
				         	<div style="width:90%;">
				         		  <div><button id="addElement">添加栏目</button></div>
				         	      <table id="storehomeinfo" class="altrowstable">
							        <tr>
							          <th class="fourColume1">名称</th>
							          <th class="fourColume2">图片</th>
							          <th class="fourColume3">状态</th>
							          <th class="fourColume4">操作</th>
							        </tr>
							      </table>
				         	
				         	</div>
							
							<!-- 添加栏目的div -->
				            <div id="addw" class="ui-widget;">
				                <table style="width: 100%" border=0 cellspacing=0 cellpadding=3 align=center class="altrowstable">
				                    
				                   <tr>
				                        <td valign=middle class="colume2"  colspan=2 align=center>
				                            <font color='red'>上传图片时请确保该栏目上传，否则会积累图片（以后更改）!</font>
				                        </td>
				                    </tr>
				                
				                    <tr style="display: none">
				                        <td valign=middle  align=right>
				                            <b>父元素值id:</b>
				                        </td>
				                        <td valign=middle>
				                            <input id="belong_id" name="belong_id" type=text readonly="readonly">
				                        </td>
				                    </tr>
				
				                    <tr>
				                        <td valign=middle  align=right class="colume1">
				                            <b>栏目名称：</b>
				                        </td>
				                        <td valign=middle class="colume2">
				                            <INPUT id=mui_input_name name=mui_input_name type=text>
				                        </td>
				                    </tr>
				
				                    <tr id=pageNameId style="display: none">
				                        <td valign=middle  align=right class="colume1">
				                            <b>页面名称：</b>
				                        </td>
				                        <td valign=middle class="colume2">
				                            <INPUT id=pageName name=pageName type=text>
				                            <font color="#FF0000">"此处的名称保存之后不可更改，填写页面的名称即可，如：contant-us.jsp（这个名字不要重复）"</font>
				                        </td>
				                    </tr>
				                    
				                   <tr>
				                        <td valign=middle  align=right class="colume1">
				                            <b>是否显示：</b>
				                        </td>
				                        <td valign=middle class="colume2">
				                            <input type="radio" name="mui_input_show" class=""  value="1"  checked="checked">
				                                                                                                                                    是
				                            <input type="radio" name="mui_input_show" class=""  value="0" >
				                                                                                                                                    否
				                        </td>
				                    </tr>
				                    
				                     <tr>
				                        <td valign=middle  align=right class="colume1">
				                            <b>栏目图片：</b>
				                        </td>
				                        <td valign=middle class="colume2">
				                            <span id="showImage"  style="width:100px;height:100px"  style="display: none"></span>  <!-- 图片预览 -->
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
				                            <a href="javascript:void(0)" class="abutton" onclick="javascript:addElement()">保存</a>
				                            <a href="javascript:void(0)" class="abutton" onclick="addDialog.dialog('close');">取消</a>
				                        </td>
				                    </tr>   
				
				                </table>
				            </div>
				             <!-- end of 添加商品分类div -->
				            
				            <!-- 修改加栏目的div -->
				            <div id="modifyw" class="ui-widget;">
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
				                            <b>栏目名称：</b>
				                        </td>
				                        <td valign=middle class="colume2">
				                            <INPUT id=modify_name name=modify_name type=text>
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
				                            <b>栏目图片：</b>
				                        </td>
				                        <td valign=middle class="colume2">
				                            <span id="modify_showImage"  style="width:100px;height:100px"  style="display: none"><img id="showImageInDB" style='width:100px;height:100px' src=''/></span>  <!-- 图片预览 -->
				                            <input id="modify_image" name="modify_image" type="text"   style="display: none" value=""/>
				                            <form id="modify_form2" method="post" enctype="multipart/form-data">
				                                <input id="modify_self_id" name="modify_self_id" type="text"   style="display: none" value=""/>
				                                <input id="modify_preimage" name="modify_preimage" type="text"   style="display: none" value=""/>
				                                <input id="modify_fileupload" name="modify_fileupload"  type="file"  onchange="javascript:uploadModifyImage()"/>
				                            </form>
				                            <!--<span  id="modify_tipDiv" style="display: none"></span>  -->
				                        </td>
				                    </tr>
				                    <tr>
				                        <td valign=middle colspan=2 align=center>
				                            <a href="javascript:void(0)" class="abutton" onclick="javascript:modify_storehomeinfo_basic()">保存</a>
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

				            </center>
				        </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="storeCommon.jsp"%>
                </center>


			</div>
			
			
			<div id="rightSide">					

			</div>

		</div>
	</body>
	<!-- <script type="text/javascript" src="jqladmin/js/rentclick.js"></script> -->
</html>