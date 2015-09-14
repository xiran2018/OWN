<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ueditor.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script src="ueditor/ueditor.config.js"></script>
	<script src="ueditor/ueditor.all.min.js"></script>
	<link rel="stylesheet" type="text/css" href="ueditor/themes/default/css/ueditor.css"/> 
	<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>


  </head>
  
  <body>
    <script id="container" name="content" type="text/plain">
       1121212
    </script>

    <script type="text/javascript">
        var ue = UE.getEditor('container',{
        initialFrameWidth: 800,
        initialFrameHeight: 300,
    	});

		/* var ue = UE.getContent(); */
		ue.ready(function() {
		    ue.setContent('hello');
		    var html = ue.getContent();
		    var txt = ue.getContentTxt();
		});
    </script>
    
    <textarea name="content" id="myEditor">这里写你的初始化内容</textarea>
	<script type="text/javascript">
	    var editor = new UE.ui.Editor();
	    editor.render("myEditor");
	    //1.2.4以后可以使用一下代码实例化编辑器
	    //UE.getEditor('myEditor')
	</script>
	<input id="submitB" type="button" value="提交"/>
	<input id="submitA" type="button" value="增加一个ueditor"/>
	<div id="ueditorappend" ></div>
    <script type="text/javascript">
    $(function(){
    	   $("#submitB").click(function()
    		        {
    		            alert("sdlfj");
    		            var ue1=UE.getEditor('myEditor'); 
    		            var html = ue1.getContent();
    		            alert(html);
    		            
                        var ue2=UE.getEditor('myAppendEditor'); 
                        var html1 = ue2.getContent();
                        alert(html1);
    		        }        
    		     
    		     );
    	   
           $("#submitA").click(function()
                   {
        	           var temphtml="<textarea name='content1' id='myAppendEditor'>新添加的ueditor</textarea>";
        	           $("#ueditorappend").append(temphtml);
        	           var editor1 = new UE.ui.Editor();
        	           editor1.render('myAppendEditor');
        	          
                   }        
                
                );
    });
  
    
    </script>
</body>

</html>