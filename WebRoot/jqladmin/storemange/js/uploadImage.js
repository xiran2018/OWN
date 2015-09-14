	function uploadImage() 
	{
        var options = {
            url : "uploadFileJson.action",
            type : "POST",
            dataType : "json",
            success : function(msg) {
                if (msg.indexOf("#") > 0) 
                {
                	$("#tipDiv").css("display","none");//出错提示信息部分隐藏
//                	console.log(msg);
                    var data = msg.split("#");
                    $("#tipDiv").html(data[0]);
                    $("#image").val(data[2]);
                    $("#preimage").val(data[2]);//下次提交的时候，提交至后台，以便删除以前上传的图片
//                    console.log(data[2]);
                    $("#showImage").html("<img style='width:100px;height:100px' src='showImageJson.action?imageUrl="+data[1]+"'/>");
                    $("#showImage").css("display","");
                } else 
                {
                	 $("#showImage").css("display","none");
                	 
                    $("#tipDiv").html(msg);
                    $("#tipDiv").css("display","");
                }
            },//end of success
            
            error : function(msg) {
    			if(msg.status=="200")
    			{
    				alert("请再试一次!!!!");
    			}
    			else if(msg.status=="500")
    			{	
    				alert("由于服务器原因，上传失败!!!!");
    			}
            }//end of error
        };
        $("#form2").ajaxSubmit(options);
        return false;
	}
	function uploadModifyImage() 
	{
        var options = {
            url : "uploadModifyFileJson.action",
            type : "POST",
            dataType : "json",
            success : function(msg) {
                if (msg.indexOf("#") > 0) 
                {
                	$("#modify_tipDiv").css("display","");//出错提示信息部分隐藏
                    var data = msg.split("#");
                    $("#modify_tipDiv").html(data[0]);
                    $("#modify_image").val(data[2]);
                    $("#modify_preimage").val(data[2]);//下次提交的时候，提交至后台，以便删除以前上传的图片
                    $("#modify_showImage").html("<img style='width:100px;height:100px' src='showImage.action?imageUrl="+data[1]+"'/>");
                    $("#modify_showImage").css("display","");
                } else 
                {
                	$("#modify_showImage").css("display","none");
                    $("#modify_tipDiv").html(msg);
                    $("#modify_tipDiv").css("display","");
                }
            },// //end of success
            
            error : function(msg) {
    			if(msg.status=="200")
    			{
    				alert("请再试一次!!!!");
    			}
    			else if(msg.status=="500")
    			{	
    				alert("由于服务器原因，上传失败!!!!");
    			}
            }//end of error
        };
        $("#modify_form2").ajaxSubmit(options);
        return false;
	}