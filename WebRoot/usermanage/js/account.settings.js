///////////////////////////////////////////////global variables
//the following variables is for shipping-show


//一下三个变量，保存getSelectShipName函数中得到的信息，以便在后面计算货运费用的时间的时候使用
	
///////////////////////////////////////////////end of global variables

$(document).ready(function () {
	eventRegister();//事件注册
	
});

function eventRegister()
{
	orderInfoClickEventRegister();
}

/**
 * 点击不同的页面菜单时，显示订单的不同信息
 */
function orderInfoClickEventRegister()
{
	//点击相应的支付方式时，出现相应的支付信息
	$(".ui-tab-nav").on("click","li",function(){		
		$(".ui-tab-nav li").each(function(){
			$(this).removeClass("ui-tab-active");
		});
		$(this).addClass("ui-tab-active");
		index=$(this).index();//获取位置
		
		//隐藏其余元素，显示相应的元素
		$(".ui-tab-pane").each(function(){
			$(this).css("display","none");
		});

		$(".ui-tab-pane").eq(index).css("display","block");

	});

}