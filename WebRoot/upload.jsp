<%@ page language="java" import="java.util.*"
    contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	       <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
	       <script type="text/javascript" src="<%=path%>/js/jquery.form.js"></script>
  </head>
  <script type="text/javascript">        
  function uploadImage() {
                        var options = {
                           //url : "<%=path%>/uploadFile.action",
                            type : "POST",
                            dataType : "script",
                            success : function(msg) {
                                if (msg.indexOf("#") > 0) {
                                    var data = msg.split("#");
                                    $("#tipDiv").html(data[0]);
                                    $("#showImage").html("<img src='<%=path%>/showImage.action?imageUrl="+data[1]+"'/>");
                                } else {
                                    $("#tipDiv").html(msg);
                                }
                            }
                        };
                        $("#upload").ajaxSubmit(options);
                        return false;
}
function addMore()
{
    var td = document.getElementById("more");
    
    var br = document.createElement("br");
    var input = document.createElement("input");
    var button = document.createElement("input");
    
    input.type = "file";
    input.name = "file";
    
    button.type = "button";
    button.value = "Remove";
    
    button.onclick = function()
    {
        td.removeChild(br);
        td.removeChild(input);
        td.removeChild(button);
    }
    td.appendChild(br);
    td.appendChild(input);
    td.appendChild(button);
}

            $(document).ready(function()
            {
                  $("#uploadOne_0").click(
                  
                    function()
                    {
                        var ss=$("#file").val();
                        alert(ss);
                    }
                  );
            });
</script>
  
  <body>
    <input type="file" name="file" id="file"/> 
           <s:form action="upload" theme="simple" enctype="multipart/form-data">
            <table align="center" width="50%" border="1">
                <tr>
                    <td>username</td>
                    <td><s:textfield name="username"></s:textfield></td>
                </tr>
                <tr>
                    <td>password</td>
                    <td><s:password name="password"></s:password></td>
                </tr>
                <tr>
                    <td>file</td>
                    <td id="more">
                        <s:file name="file"></s:file>
                        <input type="button" value="Add More.." onclick="addMore()">
                    </td>
                </tr>
                <tr>
                
                    <td><s:submit value=" submit "></s:submit></td>  
                    <!--
                    <td>
                      <input type="button" class="right-button02"
                            onclick="uploadImage()" value="上传" />
                    
                    </td>
                    -->
                    <td><s:reset value=" reset "></s:reset></td>
                </tr>
            </table>
        </s:form>

          <s:form action="uploadOne" method="post" enctype="multipart/form-data">
            <s:file name="file" label="文件1"></s:file>
            <s:file name="file" label="文件2"></s:file>
            <s:file name="file" label="文件3"></s:file>
            <s:file name="file" label="文件4"></s:file>
            <s:submit label="上传"/>
        </s:form>
  <s:property value="test"/>
  <s:debug></s:debug>
    </body>
</html>
