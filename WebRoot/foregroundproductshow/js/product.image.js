$(function() {
	
	registerEvents_ProductImage();// �¼�ע��

});


/**
 * ע���¼�
 */
function registerEvents_ProductImage()
{
	registerSwitchProductImageEvents();
}

function registerSwitchProductImageEvents()
{
	/*
	$(".lh li").on("mouseover","img",function(){
						var src=$(this).data('src') || $(this).attr('src');
						var test=$("#product-big-img").data('src') ||$("#product-big-img").attr('src');
						console.log("on mouserover"+test);
						$("#product-big-img").attr('src',src);
				});
	*/
}

//replace the image of the img div
function mui_replaceSmallImage (src) {
	//the real width and height of the image
	var img = new Image();
	img.src =src ;
	var imageWidth = img.width;
	var imageHeight = img.height;
	var widthZoom=imageWidth/350;
	var heightZoom=imageHeight/350;
	var relativeWidth,relativeHeight;
	if(widthZoom>heightZoom)
	{
		relativeWidth=imageWidth/widthZoom;
		relativeHeight=imageHeight/widthZoom;
	}
	else
	{
		relativeWidth=imageWidth/heightZoom;
		relativeHeight=imageHeight/heightZoom;
	}	
	//console.log("widthZoom="+relativeWidth+",heightZoom="+relativeHeight);
	//set width and height of the image element
	$("#product-big-img").attr('width',relativeWidth);
	$("#product-big-img").attr('height',relativeHeight);
	$("#product-big-img").attr('src',src);
}

(function($){
		var productSmallImageCount,maxOffSetLeft;
		var offset=0;
		

		
		$.fn.mui_productSmallImagePlay = function (options) {
			
			
			productSmallImageCount=$(this).find(".lh").find("li").size();
			
			maxOffSetLeft=(productSmallImageCount-5)*(-62);//������˵����ƫ����
			
			if(productSmallImageCount>5)
			{
				$("#spec-backward").removeClass("disabled");
				

			}
			
			//СͼƬ���¼�
			$(".lh").find("img").hover(
			  function () {
				  
				  	console.log("in hover");
					//ȡ�������Сͼ��ӵı߿���Ϣ
					$(".lh").find("img").each(function(){$(this).removeClass("img-hover");});
					
					//��ӱ߿�
					$(this).addClass("img-hover");
					
					var src=$(this).data('src') || $(this).attr('src');

					
					mui_replaceSmallImage(src);

			  }
			);
			
			//���Ұ�ť���¼�
			$(this).find("#spec-backward").hover(
			  function () {
				if ($(this).hasClass("disabled") )
				{	
					$("#spec-backward").css({"background-position":"-85px -139px"});
				}
				else
				{
					$("#spec-backward").css({"background-position":"-51px -139px"});
				}
			  },
			  function () {
				if ($(this).hasClass("disabled") )
				{	
					$("#spec-backward").css({"background-position":"-85px -139px"});
				}
				else
				{
					$("#spec-backward").css({"background-position":"-17px -139px"});
				}
			  }
			);
			
			$(this).find("#spec-backward").on("click",function(){
				
				if ( !$(this).hasClass("disabled") )
				{
					offset-=62;
					
					var tempcss={left:offset+"px"};
					
					$(".lh:not(:animated)").animate({ left: offset }, 100);
					
					if(offset<0)
					{
						$("#spec-forward").css({"background-position":"0 -139px"});
						//ȥ��disabled
						$("#spec-forward").removeClass("disabled");
						if(offset==maxOffSetLeft)
						{
							$("#spec-backward").css({"background-position":"-85px -139px"});
							$("#spec-backward").addClass("disabled");
						}
					}


				}
					

			});
			
			//����ť���¼�
			$(this).find("#spec-forward").hover(
			  function () {
				if ($(this).hasClass("disabled") )
				{	
					$("#spec-forward").css({"background-position":"-68px -139px"});
				}
				else
				{
					$("#spec-forward").css({"background-position":"-34px -139px"});
				}
			  },
			  function () {
				if ($(this).hasClass("disabled") )
				{	
					$("#spec-forward").css({"background-position":"-68px -139px"});
				}
				else
				{
					$("#spec-forward").css({"background-position":"0 -139px"});
				}
			  }
			);
			//����ť����¼�
			$(this).find("#spec-forward").on("click",function(){
				if ( !$(this).hasClass("disabled") )
				{
					offset+=62;
					
					var tempcss={left:offset+"px"};
					
					$(".lh:not(:animated)").animate({ left: "+=62" }, 100);
					
					if(offset>=0)
					{
						//ȥ��disabled
						$("#spec-backward").css({"background-position":"-17px -139px"});
						$("#spec-backward").removeClass("disabled");
						
						$("#spec-forward").css({"background-position":"-68px -139px"});
						$("#spec-forward").addClass("disabled");
						
						
					}
				}

			});


	};


})(jQuery)