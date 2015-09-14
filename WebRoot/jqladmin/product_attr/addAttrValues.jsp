<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

	</head>
	<body>
		<!-- 添加属性值div -->
        <div id="addattrw" class="easyui-window" title="添加属性值"
            data-options="modal:true,closed:true,iconCls:'icon-save'"
            style="width: 90%; min-height: 500px; padding: 10px;">
            <table style="width: 100%" border=0 cellspacing=0 cellpadding=3 align=center class="altrowstable">
                <tr>
                    <td valign=middle colspan=2 align=center>
                                                                    请填写以下属性值信息
                    </td>
                </tr>
                <tr>
                    <td valign=middle  align=right class="colume1">
                                                          属性值名称:
                    </td>
                    <td valign=middle class="colume2">
                        <INPUT id=attr_value_name name=attr_value_name type=text><label><font color="#FF0000">"此属性为必填项，且不可重复"</font></label>
                    </td>
                </tr>                  
                <tr>
                    <td valign=middle  align=right class="colume1">
                                                          详细信息:
                    </td>
                    <td id="modMultiLan" valign="top"  style="height: 275px;" valign=middle  align=center>
                        <div id="moddetailedcontainer">
                            <ul id="modnavigation">
                            </ul>
                        </div>
                    </td>
                </tr>   
                <tr>
                    <td valign=middle colspan=2 align=center>
                        <button class="" onclick="javascript:save_product_attr_value()">添加 </button> 
                    </td>
                </tr>

            </table>
        </div> 
        <!-- end of 添加属性值 -->
	</body>
</html>