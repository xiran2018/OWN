$(function() {
	registerCommonEvents();// 事件注册

});


/**
 * 注册事件
 */
function registerCommonEvents()
{
	//registerSilderEvent();
}
/**
 * header部分下拉菜单部分
 */
function registerSilderEvent()
{
	$("#sidebar-menu > ul > li").hover(function() { 
		$(this).addClass("selected"); 
		$(".menu-panel", this).addClass("selected"); 
		var bgImg = $(".menu-item", this).css("background-image"); 
		bgImg = bgImg.replace(".", "-hover."); 
		//$(".menu-item", this).css("background-image", bgImg); 
		}, function() { 
		$(this).removeClass("selected"); 
		$(".menu-panel", this).removeClass("selected"); 
		var bgImg = $(".menu-item", this).css("background-image"); 
		bgImg = bgImg.replace("-hover.", "."); 
		//$(".menu-item", this).css("background-image", bgImg); 
		});
}