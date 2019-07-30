
/**
 * 根据输入的信息，检索商品的数量
 * @param searchMsg
 * @param startPrice
 * @param endPrice
 * @returns {___anonymous_totalNumber}
 */
function getTotalSearchNumber(searchMsg,startPrice,endPrice) {
	$.ajax({type:'POST',
		url:"category/searchcommodity_returnTotalNumber.action", 
		data:{searchMsg:searchMsg,startPrice:startPrice,endPrice:endPrice},
		success:function (result){
		totalNumber = result;
		},
		dataType:"json",
		async:false	
	});
	return totalNumber;
}

/**
 * 基于输入的信息，查询具体的商品信息
 * @param pageNum
 * @param searchMsg
 * @param startPrice
 * @param endPrice
 */
function getSearchProducts(pageNum,searchMsg,startPrice,endPrice){
	$.ajax({type:'POST',
		url:"category/searchcommodity_getSearchCommodity.action", 
		data:{searchMsg:searchMsg,initPage:pageNum,startPrice:startPrice,endPrice:endPrice},
		success:function (result){
			$("#sellerul").empty();
			var html = "";
			$.each(result, function(index,productVO) {
				html += "<li><a target='_blank'  href='client/productShow.action?id="+productVO.products.p_id+"'>" +
						"<img src='"+productVO.showURL+"' width='"+imagewidth+"' height='"+imageheight+"' /> " +
						"</a> <br/> <a target='_blank'  class='productTitle' href='client/productShow.action?id="+productVO.products.p_id+"' style='width: "+imagewidth+"px;'>"+productVO.products.p_name+"</a><br/>" +
						"<a target='_blank'  href='client/productShow.action?id="+productVO.products.p_id+"'><span>"+currencySymbol+calculateFeeByExchangeRate(productVO.products.p_originprice,currencyRate)+"</span></a>"+currencySymbol+"" +
						"<a target='_blank'  href='client/productShow.action?id="+productVO.products.p_id+"' class='orange'>"+calculateFeeByExchangeRate(productVO.products.p_nowprice,currencyRate)+"</a>";
			});
			$("#sellerul").append(html);
		},
		dataType:"json",
		async:true	
	});
	return;
}

/**
 * 根据选择的属性，检索商品的数量
 * @param map
 * @param categoryid
 * @param startPrice
 * @param endPrice
 * @param change
 * @returns {___anonymous_totalNumber}
 */
function getTotalNumber(map,categoryid,startPrice,endPrice,change) {
	var attributedata = JSON.stringify(map.elements);
	$.ajax({type:'POST',
		url:"category/productfilter_returnTotalNumber.action", 
		data:{Args:attributedata,categoryid:categoryid,startPrice:startPrice,endPrice:endPrice,isChange:change},
		success:function (result){
		totalNumber = result;
		},
		dataType:"json",
		async:false	
	});
	return totalNumber;
}

function unactiveWindowModle()
{
	$("#catalog-overlay").css("display","");
}

function activeWindowModle()
{
	$("#catalog-overlay").css("display","none");
}

/**
 * 基于属性等信息，检索具体的商品信息，点击了具体的属性时使用
 * @param nowPage
 * @param map
 * @param categoryid
 * @param startPrice
 * @param endPrice
 */
function getProducts(nowPage,map,categoryid,startPrice,endPrice) {
	unactiveWindowModle(); //是页面不可操作，知道产生商品信息
	var data = JSON.stringify(map.elements);
	var html = "";
	$.post("category/productfilter_getProducts.action", {initPage:nowPage,Args:data,categoryid:categoryid,startPrice:startPrice,endPrice:endPrice},     
		function (result){
			$("#sellerul").empty();
			$.each(result, function(index,productVO) {
				html += "<li><a target='_blank' href='client/productShow.action?id="+productVO.products.p_id+"'>" +
						"<img src='"+productVO.showURL+"' width='"+imagewidth+"' height='"+imageheight+"' /> </a> <br/>" +
						"<a target='_blank'  class='productTitle' href='client/productShow.action?id="+productVO.products.p_id+"' style='width: "+imagewidth+"px;'>"+productVO.products.p_name+"</a><br/>" +
						"<a target='_blank'  href='client/productShow.action?id="+productVO.products.p_id+"'><span>"+currencySymbol+calculateFeeByExchangeRate(productVO.products.p_originprice,currencyRate)+"</span></a>"+currencySymbol+
						"<a target='_blank'  href='client/productShow.action?id="+productVO.products.p_id+"' class='orange'>"+calculateFeeByExchangeRate(productVO.products.p_nowprice,currencyRate)+"</a></li>";
			});
			$("#sellerul").append(html);
			activeWindowModle(); //使页面可操作
			
		},"json");

	return;
}

/**
 * 基于价格参数，查找具体的商品显示，页面初始化时使用
 * @param url
 * @param nowPage
 * @param map
 * @param categoryid
 * @param startPrice
 * @param endPrice
 */
function getBaseProducts(url,nowPage,map,categoryid,startPrice,endPrice) {
	unactiveWindowModle(); //是页面不可操作，知道产生商品信息
	var data = JSON.stringify(map.elements);
	var htmldata = "";
	$.post("category/productfilter_"+"getProducts"+".action",{initPage:nowPage,Args:data,categoryid:categoryid,startPrice:startPrice,endPrice:endPrice},
	function(data) {
		$("#sellerul").empty();
		$.each(data, function(index,atrv) {
			
			htmldata += "<li>";
			htmldata += "<a href='client/productShow.action?id="+atrv.products.p_id+"'><img src='"+atrv.showURL+"' width='"+imagewidth+"' height='"+imageheight+"'> </a><br/>";
			htmldata += "<a class='productTitle' href='client/productShow.action?id="+atrv.products.p_id+"' style='width: "+imagewidth+"px;'>"+atrv.products.p_name+"</a><br/>";
			htmldata += "<a href='client/productShow.action?id="+atrv.products.p_id+"'><span>"+currencySymbol+calculateFeeByExchangeRate(atrv.products.p_originprice,currencyRate)+"</span></a>"+currencySymbol;
			htmldata += "<a href='client/productShow.action?id="+atrv.products.p_id+"' class='orange'>"+calculateFeeByExchangeRate(atrv.products.p_nowprice,currencyRate)+"</a></a>";
			htmldata += "</li>";
		});
		$("#sellerul").append(htmldata);
		activeWindowModle(); //使页面可操作
	});
	return;
}
function getHotProducts(nowPage,map,categoryid,startPrice,endPrice) {
	getBaseProducts("getHotProducts",nowPage,map,categoryid,startPrice,endPrice);
	return;
}
function getRecommendProducts(nowPage,map,categoryid,startPrice,endPrice) {
	getBaseProducts("getRecommendProducts",nowPage,map,categoryid,startPrice,endPrice);
	return;
}
function getNewProducts(nowPage,map,categoryid,startPrice,endPrice) {
	getBaseProducts("getNewProducts",nowPage,map,categoryid,startPrice,endPrice);
	return;
}


/**
 * 该函数在页面加载时，初始化页面需要分页显示的信息 
 */
function getExhibitionProducts(nowPage,map,categoryid,startPrice,endPrice)
{//
//	getBaseProducts("getExhibitionProducts",nowPage,map,categoryid,startPrice,endPrice);
	getProducts(nowPage,map,categoryid,startPrice,endPrice);
}

//这里需要优化!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
function getPageData(nowPage,map,categoryid,startPrice,endPrice,change)
{
	if(change==false) 
	{//没有需要检索的商品属性
		getExhibitionProducts(nowPage,map,categoryid,startPrice,endPrice);
	}else
	{//根据商品属性查找商品显示
		getProducts(nowPage,map,categoryid,startPrice,endPrice,change);
	}
}
