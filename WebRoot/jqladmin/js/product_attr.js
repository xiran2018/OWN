$(document).ready(function() {
	$("#add_product_attr").click(function(){
		
		$("#show_content").attr("src","admin/iframe/add_product_attr.jsp")
	});
	
	$("#manger_product_attr").click(function(){
		
		$("#show_content").attr("src","admin/iframe/mange_product_attr.jsp")
	});
});// end of $(document).ready(function() {