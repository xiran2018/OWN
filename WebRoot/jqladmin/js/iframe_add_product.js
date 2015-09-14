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
	 var brand=$.trim($("#brand").val());
	 var name=$.trim($("#name").val());
	 var other_name=$.trim($("#other_name").val());
	 var originprice=$.trim($("#originprice").val());
	 var nowprice=$.trim($("#nowprice").val());
	 var storenumber=$.trim($("#storenumber").val());
	 var minbuynumber=$.trim($("#minbuynumber").val());	 
	 var status=$('input[name="status"]:checked').val();
	 
	 var newproduct=$('input[name="new"]:checked').val();
	 var hot=$('input[name="hot"]:checked').val();
	 var recommand=$('input[name="recommand"]:checked').val();
	 
	 var beizhu=$.trim($("#beizhu").val());
	 var title=$.trim($("#title").val());
	 var keywords=$.trim($("#keywords").val());
	 var description=$.trim($("#description").val());

	 if(!uploadpath && typeof(uploadpath)!="undefined"){
		 	alert("没有选择上传商品的路径，请选择");
		 	return;
		 }
	 if(!classid && typeof(classid)!="undefined"){
	 	alert("没有选择商品属性所属的商品分类，请选择");
	 	return;
	 }
	 if(!name && typeof(name)!="undefined")
	 {
	 	alert("请填写需要加入的属性名称");
	 	return;
	 }
	 if(!other_name && typeof(other_name)!="undefined")
	 {
	 	alert("请填写需要加入的属性别名");
	 	return;
	 }
	 else
	 {
	 	var actionUrl="product_upload.action";
		 var params={
				 "uploadpath":uploadpath,
				 "categoryId":classid,
				 "brand":brand,
                 "Name":name,
                 "OtherName":other_name,
                 "originprice":originprice,
                 "nowprice":nowprice,
                 "storenumber":storenumber,
                 "minbuynumber":minbuynumber,
                 "status":status,
                 "newproduct":newproduct,
                 "hot":hot,
                 "recommand":recommand,
                 "beizhu":beizhu,
                 "title":title,
                 "keywords":keywords,
                 "description":description
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