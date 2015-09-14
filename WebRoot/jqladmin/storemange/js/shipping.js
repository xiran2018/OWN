$(document).ready(function () {
      $("A.listdiv").click(function(){

      	//  $(this).find('ul').css("display","none");
          	
      	  $(this).next("ul.goods").slideToggle(300).siblings("ul.goods").slideUp("slow");
          	

        });
});

function add_shipping()
{
	var actionUrl = "add_shipping.action";
	
	 var name=$.trim($("#name").val());
	 var beizhu=$.trim($("#beizhu").val());
	 var status=$('input[name="status"]:checked').val();

	 
	 var params=
	 {
            "name":name,
            "beizhu":beizhu,
            "status":status
	 };
	 
	$.ajax( { // 添加语言
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			alert("添加失败!!!!");
		},
		success : function(data) 
		{
			alert("添加成功！");
		}
	});// end of ajax

}