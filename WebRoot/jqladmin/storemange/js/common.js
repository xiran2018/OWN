$(document).ready(function () {
      $("A.listdiv").click(function(){

      	//  $(this).find('ul').css("display","none");
          	
      	  $(this).next("ul.goods").slideToggle(300);
          	

        });
});