$(document).ready(function() 
{   //******************************************
	//delete the attribute values
/*	$(".close").on("click","a .close",
			function()
			{
				var spanElement=$(this).parent('.attr_value_span');
				spanElement.remove(); 
				return false;
			}
	);*/
	//******************************************

});// end of $(document).ready(function() {

function add_language()
{
	var actionUrl = "add_language.action";
	
	 var languagename=$.trim($("#languagename").val());
	 var foreignername=$.trim($("#foreignername").val());
	 var languagecode=$.trim($("#languagecode").val());
	 var countrycode=$.trim($("#countrycode").val());
	 var show=$('input[name="show"]:checked').val();

	 
	 var params=
	 {
            "languagename":languagename,
            "foreignername":foreignername,
            "languagecode":languagecode,
            "countrycode":countrycode,
            "show":show,
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

function getAllLanguage()
{
	var actionUrl = "getAllLanguage.action";
	$.ajax( { // 取语言
		url : actionUrl,
		type : "post",
		dataType : "json",
		error : function(data) 
		{
			alert("由于服务器原因，请稍后再试。。。");
			
		},
		success : function(data) 
		{
//			alert("添加成功！");
			return data;
		}
	});// end of ajax
}