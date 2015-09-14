<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<!-- saved from url=(0053)http://www.smartcar-ev.com:8080/trunk/login/login.php -->
<HTML><HEAD><TITLE>登录</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type><LINK 
rel=stylesheet type=text/css href="css/main.css" media=screen>
<SCRIPT type=text/javascript src="js/jquery.js"></SCRIPT>

<SCRIPT type=text/javascript src="js/util.js"></SCRIPT>

<SCRIPT type=text/javascript>	

	function keyPress(event)
	{
		if(event.keyCode == 13) login();
	}

	function login()
	{	
		document.forms[0].submit();
	}

	function handelLoginFailed(str)
	{
		alert(str);
		$('#userName').val('');
		$('#password').val('');
	}
	
	$(document).ready(function(){
		  $("#userName").focus();
		});
</SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.6001.18702"></HEAD>
<BODY>
<FORM id=loginForm  action="login.action"  
method=post>
<TABLE align=center>
  <TBODY>
  <TR>
    <TD>
      <DIV 
      style="BACKGROUND-IMAGE: url(images/loginHeader.jpg); WIDTH: 1024px; HEIGHT: 109px" 
      id=header></DIV></TD></TR>
  <TR>
    <TD 
    style="BACKGROUND-IMAGE: url(images/loginBg.png); z-index:-3; WIDTH: 1024px; HEIGHT: 680px" 
    align=right><div style=" z-index:9999999; MARGIN-TOP: -70px; MARGIN-RIGHT: 150px" >
      <TABLE 
       border=0 cellSpacing=0 
      cellPadding=3>
        <TBODY>
        <TR>
          <TD align=left style="font-size:12px; color:#FFFFFF">用户名：</TD>
          <TD><INPUT style="WIDTH: 140px" id="userName" type="text" name="userName"></TD></TR>
        <TR>
          <TD align=left style="font-size:12px; color:#FFFFFF">密码：</TD>
          <TD><INPUT style="WIDTH: 140px" onKeyDown="keyPress(event)" id="password" 
            type="password" name="password" ></TD></TR>
        <TR height=65>
          <TD vAlign=bottom colSpan=2 align=right><INPUT style="BACKGROUND-IMAGE: url(images/loginBtn.png); WIDTH: 80px; HEIGHT: 35px" class="fontStyle1 buttonStyle1" onclick=javascript:login() value=登录 type=button> 
          </TD></TR></TBODY></TABLE><div></TD></TR></TBODY></TABLE>
		  </FORM>
		  </BODY></HTML>
