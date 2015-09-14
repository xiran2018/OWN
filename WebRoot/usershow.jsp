<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0058)http://www.smartcar-ev.com:8080/trunk/realTime/display.php -->
<HTML>
	<HEAD>
		<TITLE>商品展示测试</TITLE>
		<META content="text/html; charset=utf-8" http-equiv=Content-Type>

		<META name=GENERATOR content="MSHTML 8.00.6001.18702">
		<script src="js/jquery-1.10.2.min.js"></script>
		<SCRIPT type="text/javascript">
	$(function() {
		$("#test").click(function() {
			alert("dsljf");
		});
	});
</SCRIPT>
<STYLE type="text/css">
th{
    background: rgb(187, 221, 229);
    font-style: normal;
    font-weight: normal;
  }
table {
	border-collapse: separate;
	border-spacing: 2px;
	border-color: rgb(128, 128, 128);
	}

tr:hover td {
background: rgb(187, 221, 129);
}
</STYLE>
	</HEAD>
	<BODY style="MARGIN: 0px auto">
		<p>
			用户信息
		</p>
		<table style="BORDER-COLLAPSE: collapse;height:50px;line-height:50px;"  cellSpacing=0  border=1>
			     <tr align="center">
                    <th >
                                                                编号
                    </th>
                    <th >
                                                                 用户名
                    </th>
                    <th>
                                                                用户密码
                    </th>
                    <th >
                                                                用户类型
                    </th>
                    <th>
                                                                时间
                    </th>
                    <th>
                                                                最后登录时间
                    </th>
                </tr>
			<s:iterator value="userlist">
				<tr align="center">
					<td >
						<s:property value="UId" />
					</td>
					<td >
						<s:property value="UName" />
					</td>
					<td>
						<s:property value="UPassword" />
					</td>
					<td >
						<s:property value="UType" />
					</td>
					<td>
						<s:property value="zctime" />
					</td>
					<td>
						<s:property value="lasttime" />
					</td>
				</tr>
			</s:iterator>
		</table>

		<s:debug></s:debug>

		<table border="1">
			<tr>
				<th>
					Month
				</th>
				<th>
					Savings
				</th>
			</tr>
			<tr>
				<td>
					January
				</td>
				<td>
					$100
				</td>
			</tr>
			<tr>
			 <th>
			  <img alt="" src="/own/upload/images/gucci/269955%208659-1.jpg" style="height:400px; width:600px">
			 </th>
			</tr>
		</table>


	</BODY>
</HTML>
