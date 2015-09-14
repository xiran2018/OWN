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
        <script type="text/javascript" src="<%=path%>/js/jquery-1.4.2.min.js"></script>
        <script type="text/javascript" src="<%=path%>/js/jquery.form.js"></script>
        
        <script type="text/javascript">
function uploadImage() {
                        var options = {
                            url : "<%=path%>/uploadFile.action",
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
                        $("#form2").ajaxSubmit(options);
                        return false;
}
</script>
    </head>

    <body>
    <center>
        <form id="form2" method="post" enctype="multipart/form-data">
            <table width="400" border="1" cellspacing="1" cellpadding="10">
                <tr>
                    <td height="25">
                        浏览图片：
                    </td>
                    <td>
                        <input id="fileupload" name="fileupload" type="file" />
                        <div id="tipDiv"></div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="button" class="right-button02"
                            onclick="uploadImage()" value="上传" />
                    </td>
                </tr>
            </table>
        </form>
        <br>
                     图片预览
        <div id="showImage"></div>
        </center>
    </body>
</html>
