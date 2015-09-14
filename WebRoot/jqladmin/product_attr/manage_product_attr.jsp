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
        
        <link rel="stylesheet" type="text/css" href="jqladmin/css/product_category.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/product_attribute.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/iframe_manage_product_attr.css">
        
         <link rel="stylesheet" type="text/css" href="css/admin_full.css">
        
        <link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
        <!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/inputstyle.css">
        
        <script type="text/javascript" src="jqladmin/js/json2.js"></script>
         <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>  
        <!--<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>-->
        <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
        <link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
        <link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
        <script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
        <script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
        <script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
        
        <script src="jqladmin/js/left-right.js" type="text/javascript"></script>
        
        <!-- 加载多语言的js -->
        <script type="text/javascript" src="jqladmin/js/language.js"></script>
        
        <!--给添加的多语言添加事件的js函数 -->
        <script type="text/javascript" src="jqladmin/js/addrentclick.js"></script>
         
        <!-- 修改属性时的事件 -->
        <script type="text/javascript" src="jqladmin/js/modify_product_attr.js"></script>
        
        <!-- 添加多国语言属性的相关信息时需要的js函数 -->
        <script type="text/javascript" src="jqladmin/js/insertMultiLanEditHtml.js"></script>
        
       <script type="text/javascript" src="jqladmin/js/iframe_mange_product_attr.js"></script>
        

        
        
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
                                        <table style="width:  90%" border=0 cellspacing=0 cellpadding=3 align=center  class="altrowstable">
                                                <tr>
                                                    <td valign=middle colspan=2 align=center>
                                                                                                                                        请选择需要编辑的属性范围
                                                    </td>
                                                </tr>
                                                
                                                 <tr style="">
                                                    <td valign=middle  align=right class="table_td1">
                                                                                                                                        是否全局属性：
                                                    </td>
                                                    <td valign=middle>
                                                        <input type="radio" name="globalattrshow" class="globalattrshow" value="1" >
                                                                                                                                       是
                                                        <input type="radio" name="globalattrshow" class="globalattrshow"  value="0" checked="checked">
                                                                                                                                       否
                                                    </td>
                                                </tr>
                                                <tr style="">
                                                    <td valign=middle  align=right class="table_td1">
                                                                                                                                        请选择属性所属类别：
                                                    </td>
                                                    <td valign=middle>
                                                        <div>
				                                            <ul style="margin-bottom: 0px;">
				                                                <li class="title">
				                                                  <input id="sel_category_name" type="text" readonly value="" style="width:120px;"/>
				                                                  <input id="sel_category_id" type="text" readonly value="" style="display:none;width:120px;"/>
				                                                  <a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a>
				                                                  <label><font color="#FF0000">"如果为全局属性，则不必选择该选项"</font></label>
				                                                </li>
				                                            </ul>
				                                        </div>
                                                    </td>
                                                </tr>
                                        </table>
                           

								        
							            <div id="show_div" style="margin-top: 20px;">
							               <table id="show_table" style="width:1000px"></table>
							            </div> <!-- 显示商品属性 -->
								        

							                
										<div id="modify_product_attr" class="easyui-window" title="修改商品属性"
										     data-options="modal:true,closed:true"
											style="width:  90%; min-height: 500px; padding: 10px;">
											<table style="width:  100%" border=0 cellspacing=0 cellpadding=3 align=center  class="altrowstable">
												<tr>
							    					<td valign=middle colspan=2 align=center class="partition">
							    					 	基本信息
							    					</td>
							 					</tr>
												
												 <tr style="display: none;">
							                        <td valign=middle  align=right class="table_td1">
							                                                                                属性id：
							                        </td>
							                        <td valign=middle>
							                            <INPUT id=attrId name=attrId type=text type="width: 233;">
							                        </td>
							                    </tr>
												<tr style="display: none;">
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
													<td valign=middle  align=right class="table_td1">
														属性名称：
													</td>
													<td valign=middle>
														<INPUT id=name name=name type=text type="width: 233px;">
													</td>
												</tr>
							                    <tr>
							                        <td valign=middle  align=right class="table_td1">
							                                                                           能否进行检索：
							                        </td>
							                        <td valign=middle>
														<input type="radio" name="search" value="1">
							                                                                             是
														<input type="radio" name="search" value="0">
														  否
							                        </td>
							                    </tr>	
							                    <tr>
							                        <td valign=middle  align=right class="table_td1">
							                                                                           状态：
							                        </td>
							                        <td valign=middle>
														<input type="radio" name="status"  value="1" >
							                                                                             可用 
														<input type="radio" name="status" value="0">
														  不可用 
							                        </td>
							                    </tr>	
							                    
												<tr>
							    					<td valign=middle colspan=2 align=center>
							    					 	<button class="add_button" onclick="javascript:saveBasicAttrInfo()">保存 </button> 
							    					</td>
							 					</tr>
							                    
							                    <tr>
							    					<td valign=middle colspan=2 align=center  class="partition">
							    					 	详细信息
							    					</td>
							 					</tr>
							                     <tr>
	                                                <td valign=middle  align=right>
	                                                                                                   属性具体信息：
	                                                </td>
	                                                <td id="addMultiLan" valign="top" class="colume2" style="height: 315px;">
			                                            <div id="detailedcontainer">
			                                                <ul id="modnavigation">
			                                                </ul>
			                                            </div>
			                                        </td>
	                                                </td>
                                            </tr>  

										<!-- 		
												<tr>
							    					<td valign=middle colspan=2 align=center>
							    					 	<button class="add_button" onclick="javascript:saveAttrValues()">保存 </button> 
							    					</td>
							 					</tr>	
							 			-->	
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
            
            <!-- 添加属性值div -->
	           <%@ include file="addAttrValues.jsp"%>
	        <!-- end of 添加属性值 -->

        </div>
        
		<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
        </div>  <!-- 显示商品分类 -->

    </body>
</html>