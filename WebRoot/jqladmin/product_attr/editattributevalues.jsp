<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <base href="<%=basePath%>">
        <meta charset="UTF-8">
		
		<link rel="stylesheet" type="text/css" href="css/easyui.css">
		

		<script type="text/javascript" src="jqladmin/js/json2.js"></script>
		<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
		<script type="text/javascript" src="js/jquery.easyui.min.js"></script>
        
        <!-- 按照多语言增添相应内容的时候，展示的内容,修改时需要呈现时需要的css -->
        <link rel="stylesheet" type="text/css" href="jqladmin/css/rentclick.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/editrentclick.css">
        
        
        <!-- 按照多语言增添相应内容的时候，展示的内容 -->
        <script type="text/javascript" src="jqladmin/js/multilang.js"></script>
        
        <!--给添加的多语言添加事件的js函数 -->
		<script type="text/javascript" src="jqladmin/js/addrentclick.js"></script>
        

		
		<!-- 添加属性值时的事件 -->
        <script type="text/javascript" src="jqladmin/js/iframe_add_product_attrValues.js"></script> 
        
                <!--修改属性值的事件的js函数 -->
		<script type="text/javascript" src="jqladmin/js/modify_product_attrValues.js"></script>
        
        <script type="text/javascript" src="jqladmin/js/editattributevalues.js"></script>
        <link rel="stylesheet" type="text/css" href="jqladmin/css/iframe_manage_product_attr.css">
        <link rel="stylesheet" type="text/css" href="jqladmin/css/table.css">
        
        <style type="text/css">
			.panel
			{
			  width:90% !important;
			  left: 7px !important;
			}
		</style> 

	</head>
	<body>
		<center>

        <div id="attrValuesInfo"     style="width: 90%; min-height: 200px; padding: 10px;">
            <table style="width: 100%" border=0 cellspacing=0 cellpadding=3 align=center class="altrowstable">
                <tr>
                    <td valign=middle colspan=2 align=center>
                             <font size="">属性值信息</font>
                    </td>
                </tr>
                <tr style="display: none;">
                    <td valign=middle  align=right class="table_td1">
                                                                            属性id：
                    </td>
                    <td valign=middle>
                        <INPUT id=attrId name=attrId type=text value="<s:property  value="attribute.attrId" />" style="width: 233;">
                    </td>
                </tr>
                <tr style="display: none;">
                    <td valign=middle  align=right class="table_td1">
                                                                            所属分类id：
                    </td>
                    <td valign=middle>
                         <input id="sel_category_id" type="text" readonly value="<s:property  value="attribute.categoryId" />" style="width:120px;"/>
                    </td>
                </tr>
                <tr>
                   <td valign=middle  align=right class="table_td1">
                                                                      属性值录入方式：   
                   </td>
                   <td valign=middle>
                       <input  class="radioItem" type="radio" name="input_style" onclick="" value="1">
                                                                                    手工录入 
                       <input  class="radioItem" type="radio" name="input_style" onclick="" value="2">
                                                                                   从下面的列表中选择（一行代表一个可选值）
                       <input  class="radioItem" type="radio" name="input_style" onclick="" value="3">
                                                                                   多行文本框
                       <input  class="radioItem" type="radio" name="input_style" onclick="" value="4">
                                                                                   多行文本框
                   </td>
                   <script type="text/javascript">
			          //global variable
			            var storInputStyle;//存储属性值的输入方式，当用户改变时，需要提示用户，属性值的方式发了变化
			            //以下的代码是设置属性值的录入方式单选框
			            storInputStyle=<s:property  value="attribute.InputStyle" default="1"/>;
			            $(":radio[name=input_style][value='"+storInputStyle+"']").attr("checked","true");
			            //****************************
			       </script>
               </tr> 
                <tr>
                    <td valign=middle  align=right class="colume1">
                                                          属性值名称:
                    </td>
                    <td valign=middle class="colume2">
                    <!-- 
                         <s:iterator value="attrValueList"  id="avl"   status="s">  
                         	<s:property  value="#s.index" />
                         	<s:property  value="#s.count" />
                         	<s:property  value="#avl.attrValueName" />
                         </s:iterator>    
                         
                          <s:property value="attrValueList[0].attrValueName"/>  -->
                        
                       <div id="attr_values">
                           <span id="attr_value_span">
                               <button class="" onclick="javascript:buttonAddAttrValues(this)">添加属性值 </button> 
                           </span>
                       </div>
                       
                      <div id="input_attr_values">
                        <s:iterator value="attrValueList"  id="avl"   status="s">  
                            <span class="attr_value_span">
	                            <input type="text" class="attr_value" readonly="readonly" style="width: 154px;background-color: #B4C7C7;" value="<s:property  value="#avl.attrValueName" />"  />
	                           <script type="text/javascript">
	                           		//把属性值放入数组中，以便后续的比较
	                           		tempValue="<s:property  value="#avl.attrValueName" />";
	                           		attrValueInDB.push(tempValue)
	                           </script>
	                            <input type="text" class="attr_value_id"  style="display:none;" value="<s:property  value="#avl.attrValueId" />" />
	                            <a class="close" href="javascript:void(0)" onclick="deleteOldAttribute(this)" title="删除该属性值"></a>
	                            <a class="attrvalueedit" href="javascript:void(0)" onclick="editOldAttribute(this)" title="编辑该属性值"></a>
                            </span>
                       </s:iterator> 
                      </div>
                        
                    </td>
                </tr> 
                
                <tr>
                   <td valign=middle colspan=2 align=center>
                       <button class="add_button" onclick="javascript:save_product_attrValues()">保存 </button> 
                   </td>
               </tr>          

            </table>
        </div> 
        
        
        <!-- 添加属性值div -->
        <%@ include file="addAttrValues.jsp"%>
        <!-- end of 添加属性值 -->
        
        <!-- 修改页面中的属性值div -->
        <%@ include file="editAttrValues.jsp"%>
        <!-- end of 修改页面中的属性值 -->
        
        
	   <div id="modifyw" class="easyui-window"  title="修改商品属性"
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
		                                                                             属性值id：
		                     </td>
		                     <td valign=middle>
		                         <INPUT id=attrValueId name=attrValueId type=text type="width: 233;">
		                     </td>
		                 </tr>
						                  
				<tr>
					<td valign=middle  align=right class="table_td1">
						属性值名称：
					</td>
					<td valign=middle>
						<INPUT id=name  name=name  type=text type="width: 233px;">
					</td>
				</tr>	
				<tr>
		 					<td valign=middle colspan=2 align=center>
		 					 	<button class="add_button" onclick="javascript:saveBasicAttrValueInfo()">保存 </button> 
		 					</td>
					</tr>
		                 
		                 <tr>
		 					<td valign=middle colspan=2 align=center  class="partition">
		 					 	详细信息
		 					</td>
					</tr>
		              <tr>
                            <td valign=middle  align=right>
                                                                                      属性值具体信息：
                            </td>
                            <td id="addMultiLan" valign="top" class="colume2" style="height: 315px;">
                                 <div id="detailedcontainer">
                                     <ul id="navigation">
                                     </ul>
                                 </div>
                             </td>
		               </tr>

		
			</table>
		</div>
		</center>
		

	</body>
</html>