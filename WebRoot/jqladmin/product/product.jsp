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
		<link rel="stylesheet" type="text/css" href="css/admin_full.css">
		
		<link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/font.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/inputstyle.css">
		
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
		<link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		
		<script type="text/javascript" src="jqladmin/js/product.js"></script>	
		<script src="jqladmin/js/left-right.js" type="text/javascript"></script>
		
        <script type="text/javascript" src="jqladmin/js/addproductloadcategory.js"></script>
        <script type="text/javascript" src="jqladmin/js/loadbrand.js"></script>
        
        <!--  ueditor 编辑器需要的js -->
       <script src="ueditor/ueditor.config.js"></script>
	   <script src="ueditor/ueditor.all.min.js"></script>
	   <link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css"/> 
        
		<%--
		<script type="text/javascript" src="jqladmin/js/iframe_add_product.js"></script>
		<script src="jqladmin/js/mzone.cc.iframe.js" type="text/javascript"></script>
		--%>
		
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
		</style> 
        
	</head>
	<body>
		<div id="header">
		    
			 <%@ include file="../Header.jsp"%>
			 
		</div>

		

		<div id="container">
			<div id="content">
			   <div id="contentInnerWraper">
			<div class="picBox" onclick="switchSysBar()" id="switchPoint"  style="background-image: url(../images/right.gif);background-position: 0 10%;"></div>
					<div id="show_content_div" >
				   	
						<div>
				         <center>
				            <table class="altrowstable" id="alternatecolor" >
				            <tr class="oddrowcolor">
				                <th class="colume1" valign=middle align=right>操作名称</th><th class="colume2">请选择</th>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>上传路径</td>
				                <td class="colume2">
				                productImage/
				                <INPUT id="uploadpath" name="uploadpath" class="inputpath" type=text type="width: 233;">
				                "上传路径为从productImage文件夹开始的路径"
				                </td>
				            </tr>
				            <tr class="categorytr evenrowcolor">
				                <td class="colume1" valign=middle align=right> 请选择添加的商品所属类别</td>
				                <td class="colume2">
				                 <input id="sel_category_name" type="text" readonly value="" style="width:120px;"/>
				                      <input id="sel_category_id" type="text" readonly value="" style="display:none;width:120px;"/>
				                    <a id="menuBtn" href="javascript:void(0)" onclick="showMenu(); return false;">选择</a>
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>品牌系列</td>
				                <td class="colume2">
				                <INPUT id="brand_name" name="brand_name" type=text readonly value="" type="width: 233;">
				                <input id="brand_id" type="text" readonly value="" style="display:none;width:120px;"/>
				                <a id="brandmenuBtn" href="javascript:void(0)" onclick="brandshowMenu(); return false;">选择</a>
				                <font style="font-weight: bold;" size="">"加载的稍慢，可以稍后点击......"</font>
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>厂家</td>
				                <td class="colume2">
				                <INPUT id="companyname" name="companyname" type=text type="width: 233;">
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>来源网址</td>
				                <td class="colume2">
				                <INPUT id="fromurl" name="fromurl" type=text type="width: 233;">
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>厂家编号</td>
				                <td class="colume2">
				                <INPUT id="companyorder" name="companyorder" type=text type="width: 233;">
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>自编号</td>
				                <td class="colume2">
				                <INPUT id="myorder" name="myorder" type=text type="width: 233;">
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>采购价格</td>
				                <td class="colume2">
				                <INPUT id="buyprice" name="buyprice" type=text type="width: 233;">
				                "默认价格为人民币"
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
				                <td class="colume1" valign=middle align=right>原价格</td>
				                <td class="colume2">
				                <INPUT id="originprice" name="originprice" type=text type="width: 233;">
				                "默认价格为美元"
				                </td>
				            </tr>
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>现价格</td>
				                <td class="colume2">
				                <INPUT id="nowPrice" name="nowPrice" type=text type="width: 233;">
				                "默认价格为美元"
				                </td>
				            </tr>
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>库存量</td>
				                <td class="colume2"><INPUT id="storenumber" name="storenumber" value="-1" type=text type="width: 233;">
				                 "-1 表示库存量为无限"
				                </td>
				            </tr>
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>最小购买量</td>
				                <td class="colume2"><INPUT id="minbuynumber" name="minbuynumber" value="1" type=text type="width: 233;">
				                </td>
				            </tr>
				            <tr class="oddrowcolor">
<!--                                <td class="colume1" valign=middle align=right>商品名称</td>
                                <td class="colume2"><INPUT id=name name=name type=text type="width: 233;"></td> -->
                                <td class="colume1" valign=middle align=right>商品积分</td>
                                <td class="colume2"><INPUT id=jifen name=jifen type=text value="1" type="width: 233;">
                                "默认积分规则是商品价格的100%，如果填写，请如下格式填写，商品价格的20%，可以写为0.2"
<!--                                    <select id=jifen name=jifen>  
                                      <option value ="0.1">Volvo</option>  
                                      <option value ="0.2">Saab</option>  
                                      <option value="0.3">Opel</option>  
                                      <option value="0.4">Audi</option>  
                                    </select> -->  
                                </td>
                            </tr>
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>是否免邮费</td>
				                <td class="colume2">
				                   <input type="radio" name="nomailtax" value="1">
				                                                                             是
				                   <input type="radio" name="nomailtax" value="0" checked="checked">
				                                                                            否
				                </td>
				            </tr>
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>是否上架</td>
				                <td class="colume2">
				                   <input type="radio" name="status" value="1">
				                                                                             上架
				                   <input type="radio" name="status" value="0" checked="checked">
				                                                                            下架
				                </td>
				            </tr>
				            
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>是否新品</td>
				                <td class="colume2">
				                   <input type="radio" name="new" value="1" >
				                                                                             是
				                   <input type="radio" name="new" value="0" checked="checked">
				                                                                            否
				                </td>
				            </tr>
				            
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>是否热卖</td>
				                <td class="colume2">
				                   <input type="radio" name="hot" value="1" >
				                                                                             是
				                   <input type="radio" name="hot" value="0" checked="checked">
				                                                                            否
				                </td>
				            </tr>
				            
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>是否推荐</td>
				                <td class="colume2">
				                   <input type="radio" name="recommand" value="1" >
				                                                                             是
				                   <input type="radio" name="recommand" value="0" checked="checked">
				                                                                            否
				                </td>
				            </tr>
				            
				            <tr class="evenrowcolor">
				                <td class="colume1" valign=middle align=right>备注</td>
				                <td class="colume2">
				                    <textarea id="beizhu" name="beizhu" cols="70" rows="5" style="resize: none;"></textarea>
				                </td>
				            </tr>

				                  
				            <tr  class="oddrowcolor" style="height: 795px;">
                                        <td class="colume1" valign=middle align=right>
                                                                                                                具体信息
                                        </td>
                                        <td class="colume2" valign=middle style="vertical-align: top;">
                                            <div id="detailedcontainer">
												<ul id="navigation">
												   <li class="show">
												        <a href="javascript: void(0)" class="index">英语</a>
													    <div class="content">
													      <table class="altrowstable">
													        <tr class="evenrowcolor">
								                                <td class="colume1" valign=middle align=right>英语名称</td>
								                                <td class="colume2"><INPUT id=en_other_name name=en_other_name class="productnameinput" type=text type="width: 233;"></td>
								                            </tr>
								                            <tr class="oddrowcolor">
								                                <td class="colume1" valign=middle align=right>商品描述</td>
								                                <td class="colume2">
								                                <textarea name="en_product_description" id="en_product_description"></textarea>
																    <script type="text/javascript">
																        var editor = new UE.ui.Editor();
																        editor.render("en_product_description");
																        //1.2.4以后可以使用一下代码实例化编辑器
																        //UE.getEditor('myEditor')
																    </script>
								                                </td>
								                            </tr>
								                             <tr class="oddrowcolor">
								                                        <td  class="colume1" valign=middle align=right>
								                                            Title
								                                        </td>
								                                        <td class="colume2" valign=middle>
								                                            <textarea id=en_title name=en_title cols="46" rows="5" style="resize: none;"></textarea>
								                                        </td>
								                               </tr>   
								                                    
								                                <tr class="evenrowcolor">
								                                        <td class="colume1" valign=middle align=right>
								                                            Keywords
								                                        </td>
								                                        <td class="colume2" valign=middle>
								                                            <textarea id=en_keywords name=en_keywords cols="46" rows="5" style="resize: none;"></textarea>
								                                        </td>
								                                 </tr>
								                                    
								                                 <tr  class="oddrowcolor">
								                                        <td class="colume1" valign=middle align=right>
								                                            Description
								                                        </td>
								                                        <td class="colume2" valign=middle>
								                                            <textarea id=en_description name=en_description cols="46" rows="5" style="resize: none;"></textarea>
								                                        </td>
								                                  </tr>
								                                </table>
													    </div>
												   </li>
												   <li>
												        <a href="javascript: void(0)" class="index">俄语</a>
													    <div class="content">
													      <table class="altrowstable">
                                                            <tr class="evenrowcolor">
                                                                <td class="colume1" valign=middle align=right>俄语名称</td>
                                                                <td class="colume2"><INPUT id=ru_other_name name=ru_other_name class="productnameinput" type=text type="width: 233;"></td>
                                                            </tr>
                                                            <tr class="oddrowcolor">
                                                                <td class="colume1" valign=middle align=right>商品描述</td>
                                                                <td class="colume2">
                                                                 <textarea name="ru_product_description" id="ru_product_description"></textarea>
                                                                    <script type="text/javascript">
                                                                        var editor = new UE.ui.Editor();
                                                                        editor.render("ru_product_description");
                                                                        //1.2.4以后可以使用一下代码实例化编辑器
                                                                        //UE.getEditor('myEditor')
                                                                    </script>
                                                                </td>
                                                            </tr>
                                                             <tr class="oddrowcolor">
                                                                        <td  class="colume1" valign=middle align=right>
                                                                            Title
                                                                        </td>
                                                                        <td class="colume2" valign=middle>
                                                                            <textarea id=ru_title name=ru_title cols="46" rows="5" style="resize: none;"></textarea>
                                                                        </td>
                                                               </tr>   
                                                                    
                                                                <tr class="evenrowcolor">
                                                                        <td class="colume1" valign=middle align=right>
                                                                            Keywords
                                                                        </td>
                                                                        <td class="colume2" valign=middle>
                                                                            <textarea id=ru_keywords name=ru_keywords cols="46" rows="5" style="resize: none;"></textarea>
                                                                        </td>
                                                                 </tr>
                                                                    
                                                                 <tr  class="oddrowcolor">
                                                                        <td class="colume1" valign=middle align=right>
                                                                            Description
                                                                        </td>
                                                                        <td class="colume2" valign=middle>
                                                                            <textarea id=ru_description name=ru_description cols="46" rows="5" style="resize: none;"></textarea>
                                                                        </td>
                                                                  </tr>
                                                                </table>
													
													    </div>
												   </li>
												</ul>
											</div>
                                        </td>
                            </tr>
				                  
				                   <tr class="evenrowcolor">
				                        <td valign=middle colspan=2 align=center>
				                            <button class="add_button" onclick="javascript:save_product()">添加 </button> 
				                        </td>
				                   </tr>   
				            </table>
				         
				            
				
				            

				
				            </center>
				        </div>
					</div>
	<!-- <div class="picBox1" onclick="switchSysBar1()" id="switchPoint1"></div> -->
					
			   </div>

			</div>
			
			
			<div id="side">					
                <center>
                    <%@ include file="productCommon.jsp"%>
                </center>


			</div>
			
			
			<div id="rightSide">					

			</div>

		</div>
		
        <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
        </div>  <!-- 显示商品分类，一定不能删除 -->

        <div id="brandContent" class="menuContent" style="left: 281px; top: 178px;display:none; position: absolute;">
            <ul id="brand_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
        </div>  <!-- 显示商品品牌列表，一定不能删除 -->
	</body>
	<script type="text/javascript" src="jqladmin/js/rentclick.js"></script>
</html>