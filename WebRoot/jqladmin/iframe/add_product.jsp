<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" type="text/css" href="jqladmin/css/iframe_add_brand_series.css">
		<link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
        <link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
        <link rel="stylesheet" href="jqladmin/css/add_product_attribute.css" type="text/css">
        
        
		<link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
		
		
		
		<script type="text/javascript" src="jqladmin/js/iframe_add_product.js"></script>
		<script type="text/javascript" src="jqladmin/js/loadcategory.js"></script>
		<script type="text/javascript">
		
		</script>
		<style type="text/css">
			.ztree li span.button.add 
			{
				margin-left: 2px;
				margin-right: -1px;
				background-position: -144px 0;
				vertical-align: top; *
				vertical-align: middle
			}
			
			#alternatecolor
			{
			 margin: 20px;
			}
</style>

	</head>
	<body >
		<div>
		 <center>
			<table class="altrowstable" id="alternatecolor">
			<tr class="oddrowcolor">
			    <th class="colume1" valign=middle align=right>操作名称</th><th class="colume2">请选择</th>
			</tr>
			<tr class="oddrowcolor">
                <td class="colume1" valign=middle align=right>上传路径</td>
                <td class="colume2">
                <INPUT id="uploadpath" name="uploadpath" type=text type="width: 233;">
                "上传路径为从UploadFiles文件夹开始的路径"
                </td>
            </tr>
			<tr class="categorytr evenrowcolor">
			    <td class="colume1" valign=middle align=right> 请选择添加的商品所属类别</td>
			    <td class="colume2">
			     <input id="sel_category_name" type="text" readonly value="" style="width:120px;"/>
                      <input id="sel_category_id" type="text" readonly value="" style="display:none;width:120px;"/>
                    <a id="menuBtn" href="#" onclick="showMenu(); return false;">选择</a>
			    </td>
			</tr>
			<tr class="oddrowcolor">
                <td class="colume1" valign=middle align=right>品牌系列</td>
                <td class="colume2"><INPUT id="brand" name="brand" type=text type="width: 233;"></td>
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
			    <INPUT id="nowprice" name="nowprice" type=text type="width: 233;">
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
                    <textarea id="beizhu" name="beizhu" cols="30" rows="5" style="resize: none;"></textarea>
                </td>
            </tr>
            <tr class="oddrowcolor">
			    <td class="colume1" valign=middle align=right>商品名称</td>
			    <td class="colume2"><INPUT id=name name=name type=text type="width: 233;"></td>
			</tr>
			<tr class="oddrowcolor">
			    <td class="colume1" valign=middle align=right>商品描述</td>
			    <td class="colume2">
			    <INPUT id="description" name="description" type=text type="width: 233;">
			    </td>
			</tr>
			<tr class="evenrowcolor">
			    <td class="colume1" valign=middle align=right>英文名称</td>
			    <td class="colume2"><INPUT id=other_name name=other_name type=text type="width: 233;"></td>
			</tr>
			 <tr class="oddrowcolor">
                        <td  class="colume1" valign=middle align=right>
                            Title
                        </td>
                        <td class="colume2" valign=middle>
                            <textarea id=title name=title cols="30" rows="5" style="resize: none;"></textarea>
                        </td>
               </tr>   
                    
                <tr class="evenrowcolor">
                        <td class="colume1" valign=middle align=right>
                            Keywords
                        </td>
                        <td class="colume2" valign=middle>
                            <textarea id=keywords name=keywords cols="30" rows="5" style="resize: none;"></textarea>
                        </td>
                 </tr>
                    
                 <tr  class="oddrowcolor">
                        <td class="colume1" valign=middle align=right>
                            Description
                        </td>
                        <td class="colume2" valign=middle>
                            <textarea id=description name=description cols="30" rows="5" style="resize: none;"></textarea>
                        </td>
                  </tr>
                   <tr class="evenrowcolor">
                        <td valign=middle colspan=2 align=center>
                            <button class="add_button" onclick="javascript:save_product()">添加 </button> 
                        </td>
                   </tr>   
			</table>
		 
	        

	        
	        <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	            <ul id="category_tree" class="ztree" style="margin-top:0; width:160px;"></ul>
	        </div>  <!-- 显示商品分类，一定不能删除 -->



			</center>
		</div>
	</body>
</html>