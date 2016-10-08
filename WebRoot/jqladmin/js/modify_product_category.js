function modify_product_category_basic()
{
    var selfID =$("#self_id").val();
    var fatherID =$("#modify_father_id").val();
    var category_name=$.trim($("#modify_category_name").val());
    var modify_icon=$.trim($("#modify_icon").val());
    var modify_image=$.trim($("#modify_image").val());
    var modify_imagesize=$.trim($("#modify_imagesize").val());
	 var modify_isShow=$('input[name="modify_cshow"]:checked').val();
	 var modify_isInFloorshow=$('input[name="modify_isInFloorshow"]:checked').val();
    if(!category_name && typeof(category_name)!="undefined")
    {
       alert("请填写需要加入的类别名称");
       return;
    }
    else
    {

       var actionUrl="category_modify_basic.action";
        var params={
                "selfId":selfID,
                "categoryFatherId":fatherID,
                "categoryName":category_name,
                "modify_icon":modify_icon,
                "modify_image":modify_image,
                "modify_imagesize":modify_imagesize,
                "modify_isShow":modify_isShow,
                "modify_isInFloorshow":modify_isInFloorshow
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

               //  alert(data.list);
               //在前台图形中添加节点   modifyTreeId, modifytempTreeNode
               var zTree = $.fn.zTree.getZTreeObj("category_tree");
               modifytempTreeNode.name=category_name;
               zTree.updateNode(modifytempTreeNode);
               
               alert("修改成功");
               $('#modifyw').window('close');
               //document.location.reload();//当前页面
           }
       });//end of ajax
        
    }
}

function modify_product_category_xiangxi(element)
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

       var actionUrl="category_modify_xiangxi.action";
        var params={
                "selfId":selfID,
                "categoryName":other_name,
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
               $('#modifyw').window('close');
               //document.location.reload();//当前页面
           }
       });//end of ajax
        
    }
}

/**
 * 这个函数好像没有使用
 */
function modify_product_category() {
    //获取数据，执行入库操作
    
     var selfID =$("#self_id").val();
     var fatherID =$("#modify_father_id").val();
     var category_name=$.trim($("#modify_category_name").val());
     var category_other_name=$.trim($("#modify_category_other_name").val());
     var category_title=$.trim($("#modify_category_title").val());
     var category_keywords=$.trim($("#modify_category_keywords").val());
     var category_description=$.trim($("#modify_category_description").val());
     
     
     //var category_name=encodeURI(category_name1);
//       var category_title=encodeURI(category_title1);
//   var category_other_name=encodeURIComponent(category_other_name1);
    // var category_description=encodeURI(encodeURI(category_description1));
     
     if(!fatherID && typeof(fatherID)!="undefined"){
        alert("没有选择父元素");
        return;
     }
     if(!category_name && typeof(category_name)!="undefined")
     {
        alert("请填写需要加入的类别名称");
        return;
     }
     if(!category_other_name && typeof(category_other_name)!="undefined")
     {
        alert("请填写需要加入的别名");
        return;
     }
     else
     {
        $('#modifyw').window('close');

        var actionUrl="category_modify.action";
         var params={
         /*
                 "category.categoryFatherId":fatherID,
                 "category.categoryName":category_name,
                 "category.categoryOtherName":category_other_name,
                 "category.title":category_title,
                 "category.keyword":category_keywords,
                 "category.description":category_description
        */
                 "selfId":selfID,
                 "categoryFatherId":fatherID,
                 "categoryName":category_name,
                 "categoryOtherName":category_other_name,
                 "title":category_title,
                 "keyword":category_keywords,
                 "description":category_description
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

                //  alert(data.list);
                //在前台图形中添加节点   modifyTreeId, modifytempTreeNode
                var zTree = $.fn.zTree.getZTreeObj("category_tree");
                modifytempTreeNode.name=category_other_name;
                zTree.updateNode(modifytempTreeNode);
                
                alert("修改成功");
                $('#modifyw').window('close');
                //document.location.reload();//当前页面
            }
        });//end of ajax
         
     }
}