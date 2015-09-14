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
        <link rel="stylesheet" type="text/css" href="jqladmin/css/iframe_brand_series.css">
        <link rel="stylesheet" type="text/css" href="css/admin_full.css">
        
        <link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
        <!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
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
        
        <!-- 加载多语言的js -->
        <script type="text/javascript" src="jqladmin/js/language.js"></script>
        
        <!--给添加的多语言添加事件的js函数 -->
        <script type="text/javascript" src="jqladmin/js/addrentclick.js"></script>
        
        <!-- 按照多语言增添相应内容的时候，展示的内容--> 
        <script type="text/javascript" src="jqladmin/js/multilang.js"></script>
        
        <!-- 在页面元素中添加关于多国语言的信息 -->
        <script type="text/javascript" src="jqladmin/js/insertBrandSeriesMultiLanEditHtml.js"></script>
        
        <!-- 添加品牌系列时的事件 -->.js
        <script type="text/javascript" src="jqladmin/js/iframe_mange_brand-series.js"></script>
        
        <!-- 修改品牌系列时的事件 -->
        <script type="text/javascript" src="jqladmin/js/modify_product_brand.js"></script>
        

        
        
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
                             <div>
                                <ul>
                                    <li class="title" style="position:relative">
			                                                                 请选择需要显示的品牌所属的商品类别：<input id="sel_brand_name" type="text" readonly value="" style="width:120px;"/>
	                                      <input id="sel_category_id" type="text" readonly value="" style="display:none;width:120px;"/>
	                                    <a id="menuBtn" href="#" onclick="showMenu(); return false;" style="">选择
	

	                                    
	                                    </a>
                                    </li>
                                </ul>
                              </div>
                              <div id="brand_series_show">
                                <table id="brand_series_show_table" style=""></table>
                              </div> <!-- 显示商品品牌 -->
                              

                              
                              <!-- 添加商品品牌 -->
                               <div id="add_brand_series" class="easyui-window" title="添加商品品牌系列" data-options="modal:true,closed:true,iconCls:'icon-save'"
                                    style="width: 90%; min-height: 500px; padding: 10px;">
                                    <table style="width: 100%"  cellspacing=0 cellpadding=3 align=center class="altrowstable">
                                        <tr>
                                            <td valign=middle  align=right>
                                                                                       所属品牌:
                                            </td>
                                            <td valign=middle>
                                                <span id="belong_brand"></span>
                                            </td>
                                        </tr>
                                        <tr style="display: none">
                                            <td valign=middle  align=right>
                                                                                       父元素值id:
                                            </td>
                                            <td valign=middle>
                                                <input id="parent_id" type=text>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign=middle  align=right>
                                                                                       品牌(系列)名称：
                                            </td>
                                            <td valign=middle>
                                                <INPUT id=brand_name name=brand_name type=text>
                                            </td>
                                        </tr>               

	                                   <tr >
	                                        <td class="colume1" valign=middle align=right>是否显示</td>
	                                        <td class="colume2">
	                                           <input type="radio" name="status" value="1">
	                                        显示
	                                           <input type="radio" name="status" value="0" checked="checked">
	                                                不显示
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
                                                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:save_product_brand()">保存</a>
                                                <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#add_brand_series').window('close')">取消</a>
                                            </td>
                                        </tr>   
                    
                                    </table>
                                </div>
                              <!-- end of 添加商品品牌 -->
                              
                              <!-- 修改商品品牌的div -->
					            <div id="modifyw" class="easyui-window" title="修改商品类目"
					                data-options="modal:true,closed:true,iconCls:'icon-save'"
					                style="width: 90%; min-height: 500px; padding: 10px;">
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
					                            <input id="brand_father_id" type=text>
					                        </td>
					                    </tr>
					                    <tr>
					                        <td valign=middle  align=right class="colume1">
					                            <b>品牌(系列)名称：</b>
					                        </td>
					                        <td valign=middle class="colume2">
					                            <INPUT id=modify_brand_name name=modify_brand_name type=text>
					                        </td>
					                    </tr>
					                    <tr >
                                            <td class="colume1" valign=middle align=right>是否显示</td>
                                            <td class="colume2">
                                               <input type="radio" name="modstatus" value="1">
                                            显示
                                               <input type="radio" name="modstatus" value="0">
                                                    不显示
                                            </td>
                                        </tr>  
					                    <tr>
					                        <td valign=middle colspan=2 align=center>
					                            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:modify_brand_basic()">保存</a>
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
					            <!-- end of 修改商品品牌div -->
                              
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
        
        <div id="menuContent" class="menuContent" style="display:none;position:absolute;z-index: 1000">
                     <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
        </div>  <!-- 显示商品分类 -->
    </body>
</html>