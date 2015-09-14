<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'imagePlay.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript">
	   
	   $(document).ready(function() 
			   {   //******************************************
		           $("#d").click(function(){
		               
		              // alert("sldfj");
		               var h=$("#language-config").height();
		               var w=$("#language-config").width();
		               var tablew=$("table").width();
		               var leftd=$("table a").eq(15).position().left;
		               console.log(h);
		               console.log(w);
		               console.log(tablew);
		               console.log(leftd);
		               
		               //$("table").css("margin-left","-200px");
		               
		           });

			   });// end of $(document).ready(function() {
	</script>
	
	<style type="text/css">
	a {
		color: #333;
		text-decoration: none;
	}
	
	.language-config a.litb-icon-lang-left-arraw:hover, .language-config a.litb-icon-lang-right-arraw:hover {
	margin: 0;
	padding: 0;
	background-color: #696969;
	}
	.language-config a.litb-icon-lang-left-arraw, .language-config a.litb-icon-lang-right-arraw {
position: absolute;
top: 0;
left: 1342px;
cursor: pointer;
display: none;
padding: 0;
margin: 0;
}

.litb-icon-lang-right-arraw:hover {
background-position: -176px -342px;
}

.litb-icon-lang-right-arraw {
width: 30px;
height: 30px;
background: url(images/normal.png) -56px -342px no-repeat;
}

	.language-config a:hover {
	border-bottom: 2px solid #da333a;
	}
	div, div:focus, a:hover, a:active, a:focus, input:focus 
	{
	   outline: 0!important;
	}
	.language-config 
	{
		background: #333;
		color: #fff;
		margin: 0 auto;
		min-width: 802px;
		padding: 0 95px;
		text-align: center;
		font: 12px Helvetica;
		height: 30px;
		overflow: hidden;
		position: relative;
		direction: ltr;
	}
	
	.language-config a, .language-config a:hover 
	{
		color: #d3d3d3;
		line-height: 30px;
		padding: 6px 11px;
		white-space: nowrap;
	}
	.language-config a.selected {
	border-bottom: 2px solid #da333a;
	}
	.language-config a.selected 
	{
	color: #fff;
	font-weight: bold;
	}
	.language-config a:hover {
	color: #fff;
	text-decoration: none;
	}
	table 
	{
		border-collapse: collapse;
		border-spacing: 0;
	}
	.language-config td 
	{
	   text-align: left;
	}
</style>

  </head>
  
  <body style="zoom: 1;">
  <button id="d">dianjiwo</button>
<div class="widget language-config ctr-info ctr-track-a language-config-carousel" id="language-config" ctr="{area:'language_banner',from_lan:'en'}">
    <a class="litb-icon-lang-left-arraw" ctr="{'entity':'left_language','type':'left'}" style="display: none;"></a>
    <a class="litb-icon-lang-right-arraw" ctr="{'entity':'right_language','type':'right'}" style="display: inline;"></a>
    <table align="left">
        <tbody>
        <tr>
            <td>    
                    <a class="selected" ctr="{'to_lan':'en'}" href="/" style="/* display: inline; */">English</a>
                    <a ctr="{'to_lan':'fr'}" href="/fr/" style="display: inline;">Français</a>
                    <a ctr="{'to_lan':'es'}" href="/es/" style="display: inline;">Español</a>
                    <a ctr="{'to_lan':'de'}" href="/de/" style="display: inline;">Deutsch</a>
                    <a ctr="{'to_lan':'it'}" href="/it/" style="display: inline;">Italiano</a>
                    <a ctr="{'to_lan':'pt'}" href="/pt/" style="display: inline;">Português</a>
                    <a ctr="{'to_lan':'ja'}" href="/ja/" style="display: inline;">日本語</a>
                    <a ctr="{'to_lan':'ru'}" href="/ru/" style="display: inline;">Русский</a>
                    <a ctr="{'to_lan':'nl'}" href="/nl/" style="display: inline;">Nederlands</a>
                    <a ctr="{'to_lan':'no'}" href="/no/" style="display: inline;">Norsk</a>
                    <a ctr="{'to_lan':'da'}" href="/da/" style="display: inline;">Dansk</a>
                    <a ctr="{'to_lan':'sv'}" href="/sv/" style="display: inline;">Svenska</a>
                    <a ctr="{'to_lan':'ko'}" href="/ko/" style="display: inline;">한국어</a>
                    <a ctr="{'to_lan':'fi'}" href="/fi/" style="display: inline;">Suomi</a>
                    <a ctr="{'to_lan':'he'}" href="/he/" style="display: inline;">עברית</a>
                    <a ctr="{'to_lan':'tr'}" href="/tr/" style="display: inline;">Türkçe</a>
                    <a ctr="{'to_lan':'pl'}" href="/pl/" style="display: inline;">Polski</a>
                    <a ctr="{'to_lan':'cz'}" href="/cz/" style="display: inline;">Čeština</a>
                    <a ctr="{'to_lan':'gr'}" href="/gr/" style="display: inline;">Ελληνικά</a>
                    <a ctr="{'to_lan':'hr'}" href="/hr/" style="display: inline;">Hrvatski</a>
                    <a ctr="{'to_lan':'ro'}" href="/ro/" style="display: inline;">Română</a>
                    <a ctr="{'to_lan':'hu'}" href="/hu/" style="display: inline;">Magyar</a>
                    <a ctr="{'to_lan':'th'}" href="/th/" style="display: inline;">ไทย</a>
                    <a ctr="{'to_lan':'id'}" href="/id/" style="display: inline;">Bahasa Indonesia</a>
                    <a ctr="{'to_lan':'ms'}" href="/ms/" style="display: inline;">Bahasa Malaysia</a>
                    <a ctr="{'to_lan':''}" href="http://www.shamsbox.com/" style="display: inline;">عربي</a>
            </td>
        </tr>
    </tbody>
    </table>
</div>
  </body>
</html>
