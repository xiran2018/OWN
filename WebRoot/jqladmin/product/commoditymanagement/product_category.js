	function uploadImage() 
	{
        var options = {
            url : "productuploadimage.action",
            type : "POST",
            dataType : "script",
            success : function(msg) {
                if (msg.indexOf("#") > 0) 
                {
                	$("#tipDiv").css("display","none");//出错提示信息部分隐藏
                	
                    var data = msg.split("#");
                    $("#tipDiv").html(data[0]);
                    $("#image").val(data[2]);
                    $("#preimage").val(data[2]);//下次提交的时候，提交至后台，以便删除以前上传的图片
                    $("#showImage").html("<img style='width:100px;height:100px' src='productshowImage.action?imageUrl="+data[1]+"'/>");
                    $("#showImage").css("display","");
                    var html="<tr><td><img style='width:100px;height:100px' src='productshowImage.action?imageUrl="+data[1]+"'/></td>"+
				"<form action='cm/management_updateImage' method='post'>"+
				"<input type='hidden' name='image.id' value='"+data[3]+"'>" + 
				"<input type='hidden' name='p_id' value='"+data[4]+"'>" + 
				"<td><input type='radio' name='image.imageSort' value='1'/>是<input type='radio' name='image.imageSort' value='0' checked='checked'/>否</td>" +
				"<td><input type='submit' value='修改'>|<a href='cm/management_deleteImage?p_id="+data[4]+"&image.id="+data[3]+"'>删除</a></td></form>";
                    $("#productImage").append(html);
					
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
	