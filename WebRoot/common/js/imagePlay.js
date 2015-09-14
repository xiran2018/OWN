/**
 * 图片轮播代码，调用imagePlay()函数即可
 */

////////////////////////////////////////////////////////图片轮播相关变量
var picTimer; 
var sWidth; //获取焦点图的宽度（显示面积）
var len; //获取焦点图个数
var index = 1; //默认这个地方为0

//显示图片函数，根据接收的index值显示相应的内容
function showPics(index) { //普通切换
	// var nowLeft = -index*sWidth; //根据index值计算ul元素的left值  //用了隐藏的方式，所以这里不需要了
	// $("#focus ul").stop(true,false).animate({"left":nowLeft},300); //通过animate()调整ul元素滚动到计算出的position  //用了隐藏的方式，所以这里不需要了
	$("#focus ul").stop(true, true);
	$("#focus ul li").filter(":visible").fadeOut(500).parent()
			.children().eq(index).stop(true, true).fadeIn(500);
	//$("#focus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
	$("#focus .btn span").stop(true, false).animate({
		"opacity" : "0.4"
	}, 300).eq(index).stop(true, false).animate({
		"opacity" : "1"
	}, 300); //为当前的按钮切换到选中的效果
}

function imagePlay()
{
	sWidth = $("#focus").width(); //获取焦点图的宽度（显示面积）
	len = $("#focus ul li").length; //获取焦点图个数
	
	//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
	var btn = "<div class='btnBg'></div><div class='btn'><div class='left'><div class='container'></div></div><div class='mid'><div class='container'>";
	for ( var i = 0; i < len; i++) {
		if (i == 0) {
			btn += "<span class='firstbtn'></span>";
		} else {
			btn += "<span></span>";
		}

	}
	btn += "</div></div><div class='right'><div class='container'></div></div></div><div class='preNext pre'></div><div class='preNext next'></div>";
	$("#focus").append(btn);
	$("#focus .btnBg").css("opacity", 0.5);

	//为小按钮添加鼠标滑入事件，以显示相应的内容
	$("#focus .btn span").css("opacity", 0.4).mouseenter(function() {
		index = $("#focus .btn span").index(this);
		showPics(index);
	});
	$("#focus .btn span:first").animate({
		"opacity" : "1"
	}, 300);
	;

	//上一页、下一页按钮透明度处理
	$("#focus .preNext").css("opacity", 0.2).hover(function() {
		$(this).stop(true, false).animate({
			"opacity" : "0.5"
		}, 300);
	}, function() {
		$(this).stop(true, false).animate({
			"opacity" : "0.2"
		}, 300);
	});

	//上一页按钮
	$("#focus .pre").click(function() {
		index -= 1;
		if (index == -1) {
			index = len - 1;
		}
		showPics(index);
	});

	//下一页按钮
	$("#focus .next").click(function() {
		index += 1;
		if (index == len) {
			index = 0;
		}
		showPics(index);
	});

	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
	//$("#focus ul").css("width",sWidth * (len));  //用了隐藏的方式，所以这里不需要了

	$("#focus").hover(function() {
		//console.log("foucus hover in  取消轮播");
		$("#focus ul").stop(true, true);
		clearInterval(picTimer);
	}, function() {
		picTimer = setInterval(function() {
			//console.log("foucus hover out  开始轮播");
			//console.log("foucus index="+index);
			showPics(index);
			index++;
			if (index == len) {
				index = 0;
			}

		}, 2000); //此4000代表自动播放的间隔，单位：毫秒
	});
	
	picTimer = setInterval(function() {
		//	console.log("start index="+index);
		showPics(index);
		index++;
		if (index == len) {
			index = 0;
		}
	}, 2000); //此4000代表自动播放的间隔，单位：毫秒
}

/////////////////////////////////////////////////////////