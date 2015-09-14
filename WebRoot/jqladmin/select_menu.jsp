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
	<TITLE> ZTREE DEMO - select menu</TITLE>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="jqladmin/js/jquery-1.9.1.js"></script>
        <script type="text/javascript" src="js/jquery.easyui.min.js"></script>


        <link rel="stylesheet" href="jqladmin/css/demo.css" type="text/css">
        <link rel="stylesheet" href="jqladmin/css/zTreeStyle/zTreeStyle.css"
            type="text/css">
        <script type="text/javascript" src="jqladmin/js/jquery.ztree.core-3.5.js"></script>
        <script type="text/javascript"
            src="jqladmin/js/jquery.ztree.excheck-3.5.js"></script>
        <script type="text/javascript"
            src="jqladmin/js/jquery.ztree.exedit-3.5.js"></script>
	<SCRIPT type="text/javascript">
		<!--
		var setting = {
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeClick: beforeClick,
				onClick: onClick
			}
		};

		var zNodes =[
			{id:1, pId:0, name:"åäº¬"},
			{id:2, pId:0, name:"å¤©æ´¥"},
			{id:3, pId:0, name:"ä¸æµ·"},
			{id:6, pId:0, name:"éåº"},
			{id:4, pId:0, name:"æ²³åç", open:true},
			{id:41, pId:4, name:"ç³å®¶åº"},
			{id:42, pId:4, name:"ä¿å®"},
			{id:43, pId:4, name:"é¯é¸"},
			{id:44, pId:4, name:"æ¿å¾·"},
			{id:5, pId:0, name:"å¹¿ä¸ç", open:true},
			{id:51, pId:5, name:"å¹¿å·"},
			{id:52, pId:5, name:"æ·±å³"},
			{id:53, pId:5, name:"ä¸è"},
			{id:54, pId:5, name:"ä½å±±"},
			{id:6, pId:0, name:"ç¦å»ºç", open:true},
			{id:61, pId:6, name:"ç¦å·"},
			{id:62, pId:6, name:"å¦é¨"},
			{id:63, pId:6, name:"æ³å·"},
			{id:64, pId:6, name:"ä¸æ"}
		 ];

		function beforeClick(treeId, treeNode) {
			var check = (treeNode && !treeNode.isParent);
			if (!check) alert("åªè½éæ©åå¸...");
			return check;
		}
		
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getSelectedNodes(),
			v = "";
			nodes.sort(function compare(a,b){return a.id-b.id;});
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].name + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
		}

		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

			$("body").bind("mousedown", onBodyDown);
		}
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}

		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		//-->
	</SCRIPT>
	<style type="text/css">
	</style>
 </HEAD>

<BODY>
<h1>ä¸æèå</h1>
<h6>[ æä»¶è·¯å¾: super/select_menu.html ]</h6>
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul class="list">
			<li class="title">&nbsp;&nbsp;<span class="highlight_red">éæ©åå¸æ¶ï¼æä¸ Ctrl é®å¯ä»¥è¿è¡å¤é</span></li>
			<li class="title">&nbsp;&nbsp;åå¸ï¼<input id="citySel" type="text" readonly value="" style="width:120px;"/>
		&nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">éæ©</a></li>
		</ul>
	</div>
	<div class="right">
		<ul class="info">
			<li class="title"><h2>å®ç°æ¹æ³è¯´æ</h2>
				<ul class="list">
				<li>ç¨ zTree å®ç°è¿ç§ä¸æèåï¼åºè¯¥è¯´æ¯æ¯è¾å®¹æçï¼ä½ åªéè¦æ§å¶ zTree æå¨å®¹å¨çéè/æ¾ç¤ºï¼ä»¥åä½ç½®å³å¯ã</li>
				<li class="highlight_red">zTree v3.x å®ç°äºå¤ç¹éä¸­åè½ï¼å æ­¤å¯¹äºéè¦å¤éçä¸æèåä¹æå¦åæã</li>
				<li class="highlight_red">å©ç¨ setting çåé¡¹éç½®åæ°ï¼å®å¨å¯ä»¥æ»¡è¶³å¤§é¨åçåè½éæ±ã</li>
				</ul>
			</li>
		</ul>
	</div>
</div>

<div id="menuContent" class="menuContent" style="display:none; position: absolute;">
	<ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
</div>
</BODY>
</HTML>