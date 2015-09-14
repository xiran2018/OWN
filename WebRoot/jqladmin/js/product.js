$(document).ready(function() {
/*	$("#add_product").click(function(){
		
		
	});*/
});// end of $(document).ready(function() {

function jqchk(strName){  //jquery获取复选框值    
	  var chk_value =[];    
	  $('input[name='+strName+']:checked').each(function(){    
	    chk_value.push($(this).val());    
	  });    
//	  alert(chk_value.length==0 ?'你还没有选择任何内容！':chk_value);    
//	  alert(chk_value);    //数组可以按照1,2,3的形式显示
	  return chk_value;
}  


function save_product() 
{

	//获取数据，执行入库操作
	//获取上传路径
	 var uploadpath=$.trim($("#uploadpath").val());
	 var classid=$.trim($("#sel_category_id").val());
	 var brandid=$.trim($("#brand_id").val());
	 var companyname=$.trim($("#companyname").val());
	 var fromurl=$.trim($("#fromurl").val());
	 var companyorder=$.trim($("#companyorder").val());
	 var myorder=$.trim($("#myorder").val());
	 var buyprice=$.trim($("#buyprice").val());
	 var originprice=$.trim($("#originprice").val());
	 var nowprice=$.trim($("#nowprice").val());
	 var storenumber=$.trim($("#storenumber").val());
	 var minbuynumber=$.trim($("#minbuynumber").val());
	 var nomailtax=$('input[name="nomailtax"]:checked').val();
	 var status=$('input[name="status"]:checked').val();
	 var newproduct=$('input[name="new"]:checked').val();
	 var hot=$('input[name="hot"]:checked').val();
	 var recommand=$('input[name="recommand"]:checked').val();
	 var beizhu=$.trim($("#beizhu").val());
	 var jifen=$.trim($("#jifen").val());
	 
	 //英语信息
	 var en_other_name=$.trim($("#en_other_name").val());
	 //var en_product_description=$.trim($("#en_product_description").val());
     var ue1=UE.getEditor('en_product_description'); 
     var en_product_description = ue1.getContent();
	 
	 
	 var en_title=$.trim($("#en_title").val());
	 var en_keywords=$.trim($("#en_keywords").val());
	 var en_description=$.trim($("#en_description").val());
	 
	 //俄语信息
	 var ru_other_name=$.trim($("#ru_other_name").val());
//	 var ru_product_description=$.trim($("#ru_product_description").val());
     var ue2=UE.getEditor('ru_product_description'); 
     var ru_product_description = ue2.getContent();
	 var ru_title=$.trim($("#ru_title").val());
	 var ru_keywords=$.trim($("#ru_keywords").val());
	 var ru_description=$.trim($("#ru_description").val());

	 if(!uploadpath && typeof(uploadpath)!="undefined"){
		 	alert("没有选择上传商品的路径，请选择");
		 	return;
		 }
	 if(!classid && typeof(classid)!="undefined"){
	 	alert("没有选择商品所属的分类，请选择");
	 	return;
	 }
	 if(!classid && typeof(brandid)!="undefined"){
		 	alert("没有选择商品所属的品牌系列，请选择");
		 	return;
	}
	 else
	 {
	 	var actionUrl="product_upload.action";
		 var params=
		 {
				"uploadpath":uploadpath,
				"categoryId":classid,
				"brandId":brandid,
				"companyname":companyname,
				"fromurl":fromurl,
				"companyorder":companyorder,
				"myorder":myorder,
				"buyprice":buyprice,
				"originprice":originprice,
				"nowprice":nowprice,
	            "storenumber":storenumber,
	            "minbuynumber":minbuynumber,
	            "nomailtax":nomailtax,
               "status":status,
               "isNew":newproduct,
               "isHot":hot,
               "isRecommand":recommand,
               "beizhu":beizhu,
               "jifen":jifen,
               "en_other_name":en_other_name,
               "en_product_description":en_product_description,
               "en_title":en_title,
               "en_keywords":en_keywords,
               "en_description":en_description,
               "ru_other_name":ru_other_name,
               "ru_product_description":ru_product_description,
               "ru_title":ru_title,
               "ru_keywords":ru_keywords,
               "ru_description":ru_description
		 };	
		 
		 $.ajax( {
			url : actionUrl,
			data:params,
			type : "POST",
			dataType : "json",
			error : function() {
				alert("添加失败!!!!");
			},
			success : function(data) {
				alert("添加成功");
			}
		});//end of ajax
		 
	 }
}