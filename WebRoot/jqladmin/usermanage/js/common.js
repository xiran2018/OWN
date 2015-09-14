$(document).ready(function () {
      $("a.listdiv").click(function(){

      	//  $(this).find('ul').css("display","none");
          	
      	  $(this).next("ul.goods").slideToggle(500);


        });
      
  	  $("input").focus(function(){
    	    $(this).css("background-color","#FFFFCC");
    	  });
    	  
  	  $("input").blur(function(){
    	    $(this).css("background-color","#ffffff");
    	  });
});