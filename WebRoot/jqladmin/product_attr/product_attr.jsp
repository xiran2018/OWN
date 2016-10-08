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
		
		            <!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
		
		<!-- 加载多语言的js -->
        <script type="text/javascript" src="jqladmin/js/language.js"></script>
		
        <!--给添加的多语言添加事件的js函数 -->
		<script type="text/javascript" src="jqladmin/js/addrentclick.js"></script>
		
		<!-- 按照多语言增添相应内容的时候，展示的内容 -->
        <script type="text/javascript" src="jqladmin/js/multilang.js"></script>
		
        <!-- 添加属性时的事件 -->
        <script type="text/javascript" src="jqladmin/js/iframe_add_product_attr.js"></script>      

        <!-- 添加属性值时的事件 -->
        <script type="text/javascript" src="jqladmin/js/iframe_add_product_attrValues.js"></script> 
		
		<SCRIPT type="text/javascript">
		

		</SCRIPT>
		<style type="text/css">
		.ztree li span.button.add 
		{
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

						            
						            <div id="add_product_attr"  title="添加商品属性"
						                style="width: 90%; min-height: 700px; padding: 10px;">
						                <table style="width: 100%" border=0 cellspacing=0 cellpadding=3 align=center class="altrowstable">
                                            <tr>
                                                <td valign=middle  align=right>
                                                                                                   是否全局属性：
                                                </td>
                                                <td valign=middle>
                                                    <input type="radio" name="globalattr" value="1" >
                                                                                                     是
                                                    <input type="radio" name="globalattr" value="0" checked="checked">
                                                                                                    否
                                                    <label><font color="#FF0000">"如果为全局属性，则不必选择属性所属的类别"</font></label>
                                                </td>
                                            </tr>						                  
						                   <tr>
                                                <td valign=middle  align=right>
                                                   请选择需要添加的属性所属的商品类别：
                                                </td>
                                                <td valign=middle>
                                                    <input id="sel_category_name" type="text" readonly value="" style="width:120px;"/>
                                              <input id="sel_category_id" type="text" readonly value="-1" style="display:none;width:120px;"/>
                                            <a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a></li>
                                                </td>
                                            </tr>
						                    <tr>
						                        <td valign=middle  align=right>
						                            属性名称：
						                        </td>
						                        <td valign=middle>
						                            <INPUT id=name name=name type=text type="width: 233;">
						                        </td>
						                    </tr>
 
						                    <tr>
						                        <td valign=middle  align=right>
						                                                                           能否进行检索：
						                        </td>
						                        <td valign=middle>
						                            <input type="radio" name="search" value="1" checked="checked">
						                                                                             是
						                            <input type="radio" name="search" value="0">
						                              	否
						                        </td>
						                    </tr>  
						                    <tr>
						                        <td valign=middle  align=right>
						                                                                           是否弹框显示：
						                        </td>
						                        <td valign=middle>
						                            <input type="radio" name="popup" value="1">
						                                                                             是
						                            <input type="radio" name="popup" value="0"  checked="checked">
						                              	否
						                            <span>(*该选项只对多行文本框有效)</span>
						                        </td>
						                    </tr>   
						                    <tr>
						                        <td valign=middle  align=right>
						                                                                           状态：
						                        </td>
						                        <td valign=middle>
						                            <input type="radio" name="status" value="1" checked="checked">
						                                                                             可用 
						                            <input type="radio" name="status" value="0">
						                              不可用 
						                        </td>
						                    </tr>   

  
						                   <tr>
                                                <td valign=middle  align=right>
                                                                                                   属性具体信息：
                                                </td>
                                                <td id="addMultiLan" valign="top" class="colume2" style="height: 280px;">
		                                            <div id="detailedcontainer">
		                                                <ul id="navigation">
		                                                </ul>
		                                            </div>
		                                        </td>
                                                </td>
                                            </tr>  
						                    
						                      <tr>
						                        <td valign=middle  align=right>
						                                                                           该属性值的录入方式：   
						                        </td>
						                        <td valign=middle>
						                            <input type="radio" name="input_style" value="1" >
						                                                                                         手工录入 
						                            <input type="radio" name="input_style" value="2">
						                                                                                        从下面的列表中选择（一行代表一个可选值）
						                            <input type="radio" name="input_style" value="3" checked="checked">
						                                                                                        多行文本框
						                            <input type="radio" name="input_style" value="4">
						                                   	下拉列表框
						                        </td>
						                    </tr>            
 
						                    <tr>
                                                <td valign=middle  align=right>
                                                                                                                                可选值列表：   
                                                </td>
                                                <td valign=middle style="width: 700px;">
                                                    <div id="attr_values">
                                                        <span id="attr_value_span">
                                                        <!-- 
                                                            <input type="text"  id="attr_value_input" value="请输入" onFocus="if(value==defaultValue){value='';this.style.color='#000'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999999"/>
                                                            <a id="add_value" href="javascript:void(0);" onclick="addAttrValues(this)" class="" id="add_but"></a>
                                                        -->
                                                            <div>
                                                               <button class="" onclick="javascript:buttonAddAttrValues(this)">添加属性值 </button> 
                                                            </div>
                                                        </span>
                                                    </div>
                                                    
                                                   <div id="input_attr_values">
                        
                                                   </div>
                                                    
                                                    <!-- 
                                                    <textarea id=attr_values name=attr_values cols="30" rows="5" style="resize: none;"></textarea>   
                                                     -->
                                                                                             
                                                </td> 
                                            </tr> 
                                            <tr>
                                                <td valign=middle colspan=2 align=center>
                                                    <button class="add_button" onclick="javascript:save_product_attr()">添加 </button> 
                                                </td>
                                            </tr>  
						                </table>
						            </div>
                       </center>
				      </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="Common.jsp"%>
                </center>


			</div>
	
		</div>
		
		<!-- 添加属性值div -->
        <%@ include file="addAttrValues.jsp"%>
        <!-- end of 添加属性值 -->
        
        <!-- 修改页面中的属性值div -->
        <%@ include file="editAttrValues.jsp"%>
        <!-- end of 修改页面中的属性值 -->
        
		
        <div id="menuContent" class="menuContent" style="display:none; position: absolute;z-index: 9000;">
            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
        </div>  <!-- 显示商品分类 -->
	</body>
</html>