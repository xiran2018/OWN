$().ready(
		function() 
		{
			
			registerEventLister(); //register the event to listen for the element
		}
		
);//end  of ready	

function registerEventLister()
{
	//点击上一页按钮时的动作
	$("#btn-submit").click(function(){
		
		var imageElements=$("#pi-dynamic-samples").children(".image-item");
//		var len=imageElements.length;
		
		var agrs="";
		
		$.each(imageElements,function(index,data){ 
			//或者console.info($(this).text()); 
			var sort=index+1;
			var tempArgs=$(this).attr("data-json"); //格式固定，就是 productId=128;imageId=246
			var tempArgsSplit=tempArgs.split(";");
			
			var productId=tempArgsSplit[0].split("=")[1];
			
			var imageId=tempArgsSplit[1].split("=")[1];
			
			
			
			if(agrs=="")
				agrs=productId+";"+imageId+";"+sort;
			else
				agrs+="#"+productId+";"+imageId+";"+sort;
		});
		
		//console.log(agrs);
		
		
		var actionUrl = "cm/managementimg_updateImage.action";
		var params = 
		{
			"imageElements" : agrs
		};
		$.ajax( {
			url : actionUrl,
			data : params,
			type : "POST",
			dataType : "json",
			error : function() {
				alert("由于服务器原因，请稍后再试!!!!");
			},
			success : function(data) {
				alert("保存成功");
			}
		});// end of ajax 
	 
	});//end of btn-submit 
}
	


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
                    var html="<li class='image-item' data-json='productId="+data[4]+";imageId="+data[3]+
                    "'><p class='sample-item'><img src='productshowImage.action?imageUrl="+data[1]+"' width='100px' height='100px'></p>"+
               		"<h3>"+data[1]+"</h3><a class='lnk-del-img' href='cm/managementimg_deleteImage?image.productId="+data[4]+"&image.id="+data[3]+"'>删除</a></li>"
                   $("#pi-dynamic-samples").append(html);
					
                } 
                else 
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

/**
 * 对图片排序,格式为：
 * 	                   					imageURLObject.productId=;
	                   					imageURLObject.imageId=;
	                   					imageURLObject.imageAddr=;
	                   					imageURLObject.imageSort=;
 * @param imageURLArray
 */
function imageURLSort(imageURLArray)
{
//	var len=imageURLArray.length;
	imageURLArray.sort(function(a,b){
        return a.imageSort-b.imageSort;});
	return imageURLArray;
}

/*组装后台图片显示需要的字符串
 * */
function getImageShowString(imageURLSorted)
{
	var html="";
	for(var i=0;i<imageURLSorted.length;i++)
	{
		html+="<li class='image-item' data-json='productId="+imageURLSorted[i].productId+";imageId="+imageURLSorted[i].imageId+
		"'><p class='sample-item'><img src='"+imageURLSorted[i].imageAddr+"' width='100px' height='100px'></p>"+
			"<h3 alt='"+imageURLSorted[i].imageAddr+"'>"+imageURLSorted[i].imageAddr+
			"</h3><a class='lnk-del-img' href='cm/managementimg_deleteImage?image.productId="+imageURLSorted[i].productId+"&image.id="+imageURLSorted[i].imageId+"'>删除</a></li>";
	}
	return html;
}

