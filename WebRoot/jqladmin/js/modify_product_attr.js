function saveBasicAttrInfo()
{
    var selfID =$("#attrId").val();
    var name=$.trim($("#name").val());
	 var status=$('input[name="status"]:checked').val();
	 var search=$('input[name="search"]:checked').val();
	 var globalattr=$('input[name="globalattr"]:checked').val();
    if(!name && typeof(name)!="undefined")
    {
       alert("请填写需要名称");
       return;
    }
    else
    {

       var actionUrl="attr_modify_basic.action";
        var params={
                "id":selfID,
                "Name":name,
                "isSearchAttr":search,
                "isglobalattr":globalattr,
                "status":status
        }; 
        
        $.ajax( {
           url : actionUrl,
           data:params,
           type : "POST",
           dataType : "json",
           error : function() {
               alert("修改失败!!!!");
           },
           success : function(data) {

               alert("修改成功");
				var node = $('#show_table').datagrid('getRowIndex');
				$('#show_table').datagrid('updateRow',{
					
					index:node,
					row: {
						attrName: name,
						isSearchAttr:search,
						attrStatus:status,
						
					}
					
				});
           }
       });//end of ajax
        
    }
}

function modify_xiangxi(element)
{
    var selfID =$(element).attr("mainid");
	 tempname=selfID+"_modname";
	 other_name=$.trim($("#"+tempname).val());
	 
	 temptitle=selfID+"_modtitle";
	 other_title=$.trim($("#"+temptitle).val());
	 
	 tempkeywords=selfID+"_modkeywords";
	 other_keywords=$.trim($("#"+tempkeywords).val());
	 
	 tempdesc=selfID+"_moddescription";
	 other_desc=$.trim($("#"+tempdesc).val());
	 
    if(!other_name && typeof(other_name)!="undefined")
    {
       alert("请填写需要加入的类别名称");
       return;
    }
    else
    {

       var actionUrl="attr_modify_xiangxi.action";
        var params={
                "id":selfID,
                "Name":other_name,
                "title":other_title,
                "keyword":other_keywords,
                "description":other_desc
        }; 
        
        $.ajax( {
           url : actionUrl,
           data:params,
           type : "POST",
           dataType : "json",
           error : function() {
               alert("修改失败，稍后再试!!!!");
           },
           success : function(data) {
               alert("修改成功");
           }
       });//end of ajax
        
    }
}


function saveAttrValues()
{
	//获取新增加的属性值
	var tempNewAttrValue="";
	$(".new_attr_value").each(
		function(index)
		{
			if(tempNewAttrValue=="")
			{
				tempNewAttrValue+=$(this).val();
			}
			else
			{
				tempNewAttrValue+="\n"+$(this).val();
			}
		}
	
	);
	
	//获取删除的属性值
	var tempdelAttrValue="";
	$(".attr_value_span:hidden").each(
		function(index)
		{
			var tempInput=$(this).children(".attr_value_id");
			if(tempdelAttrValue=="")
			{
				tempdelAttrValue+=tempInput.val();
			}
			else
			{
				tempdelAttrValue+="\n"+tempInput.val();
			}
		}
	
	);
	
//	alert(tempNewAttrValue+tempdelAttrValue);
//	return;

	//获取数据，执行入库操作
	 var id=$("#attrId").val();
	 var name=$.trim($("#name").val());
	 var other_name=$.trim($("#other_name").val());
	 var search=$('input[name="search"]:checked').val();
	 var status=$('input[name="status"]:checked').val();
	 var input_style=$('input[name="input_style"]:checked').val();
	 var title=$.trim($("#title").val());
	 var keywords=$.trim($("#keywords").val());
	 var description=$.trim($("#description").val());
	 var classid=$.trim($("#sel_category_id").val());
	 
	 //var attrValues=$.trim($("#attr_values").val());
	// alert(attrValues);
//	 var test=jqchk("style");
//	 alerStr="";
//	 for(var i=0;i<test.length;i++)
//	 {
//		 alerStr=alerStr+test[i];
//	 }
//	 alert(alerStr);
	 
	 if(!classid && typeof(classid)!="undefined"){
	 	alert("没有选择商品属性所属的商品分类，请选择");
	 	return;
	 }
	 if(!name && typeof(name)!="undefined")
	 {
	 	alert("请填写需要加入的属性名称");
	 	return;
	 }
	 if(!name && typeof(name)!="undefined")
	 {
	 	alert("请填写需要加入的属性别名");
	 	return;
	 }
	 else
	 {
	 	var actionUrl="modify_product_attr.action";
		 var params={
				 "id":id,
                 "Name":name,
                 "OtherName":other_name,
                 "categoryId":classid,
                 "attrStatus":status,
                 "isSearchAttr":search,
                 "InputStyle":input_style,
                 "title":title,
                 "keywords":keywords,
                 "description":description,
                 "newattrValues":tempNewAttrValue,
                 "delattrValues":tempdelAttrValue,
		 };	
		 
		 $.ajax( {
			url : actionUrl,
			data:params,
			type : "POST",
			dataType : "json",
			error : function() {
				alert("修改失败!!!!");
			},
			success : function(data) {
				//删除隐藏的元素，否则，第二次点击修改的时候会报错
				//获取删除的属性值
				$(".attr_value_span:hidden").each(
					function(index)
					{
						var tempInput=$(this).remove();
					}
				
				);
				//对于已经增加了的元素，删除class：
				$(".new_attr_value").each(
						function(index)
						{
								tempNewAttrValue+=$(this).removeClass("new_attr_value");
						}
					
					);
				//提示用户修改成功
				alert("修改成功");
			}
		});//end of ajax
		 
	 }
    
    
}