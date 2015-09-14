	function uploadCategoryImage() 
	{
        var options = {
            url : "categoryuploadimage.action",
            type : "POST",
            dataType : "script",
            success : function(msg) {
                if (msg.indexOf("#") > 0) 
                {
                	$("#tipDiv").css("display","none");//出错提示信息部分隐藏
                	
                    var data = msg.split("#");
                    $("#tipDiv").html(data[0]);
                    $("#preimage").val(data[2]);//下次提交的时候，提交至后台，以便删除以前上传的图片
                    $("#showImage").attr("src",data[2]);
                } else 
                {
                	$("#showImage").css("display","none");
                    $("#tipDiv").html(msg);
                    $("#tipDiv").css("display","");
                }
            }
        };
        $("#form2").ajaxSubmit(options);
        return false;
	}
	