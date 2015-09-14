function getTotalSearchNumber(searchMsg,startPrice,endPrice) {
	$.ajax({type:'POST',
		url:"fg/searchcommodity_returnTotalNumber.action", 
		data:{searchMsg:searchMsg,startPrice:startPrice,endPrice:endPrice},
		success:function (result){
		totalNumber = result;
		},
		dataType:"json",
		async:false	
	});
	return totalNumber;
}

function getTotalNumber(map,categoryid,startPrice,endPrice,change) {
	var attributedata = $.toJSON(map.elements);
	$.ajax({type:'POST',
		url:"fg/productfilter_returnTotalNumber.action", 
		data:{Args:attributedata,categoryid:categoryid,startPrice:startPrice,endPrice:endPrice,isChange:change},
		success:function (result){
		totalNumber = result;
		},
		dataType:"json",
		async:false	
	});
	return totalNumber;
}

function getProducts(nowPage,map,categoryid,startPrice,endPrice) {
	var data = $.toJSON(map.elements);
	var html = "";
	$.post("fg/productfilter_getProducts.action", {initPage:nowPage,Args:data,categoryid:categoryid,startPrice:startPrice,endPrice:endPrice},     
		function (result){
			$("#sellerul").empty();
			$.each(result, function(index,productVO) {
				html += "<li><a href='client/productShow.action?id="+productVO.products.p_id+"'>" +
						"<img src="+productVO.showURL+" width='"+imagewidth+"' height='"+imageheight+"' /> </a> <br/>" +
						"<a class='productTitle' href='client/productShow.action?id="+productVO.products.p_id+"' style='width: "+imagewidth+"px;'>"+productVO.products.p_name+"</a><br/>" +
						"<a href='client/productShow.action?id="+productVO.products.p_id+"'>"+currencySymbol+"<span>"+calculateFeeByExchangeRate(productVO.products.p_originprice,currencyRate)+"</span></a>"+currencySymbol;
						"<a href='client/productShow.action?id="+productVO.products.p_id+"'>' class='orange'>"+calculateFeeByExchangeRate(productVO.products.p_nowprice,currencyRate)+"</a></li>";
			});
			$("#sellerul").append(html);
		},"json");

	return;
}

function getSearchProducts(pageNum,searchMsg,startPrice,endPrice){
	$.ajax({type:'POST',
		url:"fg/searchcommodity_getSearchCommodity.action", 
		data:{searchMsg:searchMsg,initPage:pageNum,startPrice:startPrice,endPrice:endPrice},
		success:function (result){
			$("#sellerul").empty();
			var html = "";
			$.each(result, function(index,productVO) {
				html += "<li><a href='client/productShow.action?id="+productVO.products.p_id+"'>" +
						"<img src="+productVO.showURL+" width='"+imagewidth+"' height='"+imageheight+"' /> " +
						"</a> <br/> <a class='productTitle' href='client/productShow.action?id="+productVO.products.p_id+"' style='width: "+imagewidth+"px;'>"+productVO.products.p_name+"</a><br/>" +
						"<a href='client/productShow.action?id="+productVO.products.p_id+"'>"+currencySymbol+"<span>"+calculateFeeByExchangeRate(productVO.products.p_originprice,currencyRate)+"</span></a>"+currencySymbol+"" +
						"<a href='client/productShow.action?id="+productVO.products.p_id+"' class='orange'>"+calculateFeeByExchangeRate(productVO.products.p_nowprice,currencyRate)+"</a>";
			});
			$("#sellerul").append(html);
		},
		dataType:"json",
		async:true	
	});
	return;
}
/**
 * 该函数在页面加载时，初始化页面需要分页显示的信息
 */
function getExhibitionProducts(nowPage,map,categoryid,startPrice,endPrice)
{
	var htmldata = "";
	$.post("fg/productfilter_getExhibitionProducts.action",{initPage:nowPage,categoryid:categoryid,startPrice:startPrice,endPrice:endPrice},
	function(data) {
		$("#sellerul").empty();
		$.each(data, function(index,atrv) {
			
			htmldata += "<li>";
			htmldata += "<a href='client/productShow.action?id="+atrv.products.p_id+"'><img src="+atrv.showURL+" width='"+imagewidth+"' height='"+imageheight+"'> </a><br/>";
			htmldata += "<a class='productTitle' href='client/productShow.action?id="+atrv.products.p_id+"' style='width: "+imagewidth+"px;'>"+atrv.products.p_name+"</a><br/>";
			htmldata += "<a href='client/productShow.action?id="+atrv.products.p_id+"'>"+currencySymbol+"<span>"+calculateFeeByExchangeRate(atrv.products.p_originprice,currencyRate)+"</span></a>"+currencySymbol;
			htmldata += "<a href='client/productShow.action?id="+atrv.products.p_id+"' class='orange'>"+calculateFeeByExchangeRate(atrv.products.p_nowprice,currencyRate)+"</a></a>";
			htmldata += "</li>";
		});
		$("#sellerul").append(htmldata);
	});
}
function getPageData(nowPage,map,categoryid,startPrice,endPrice,change)
{
	if(change==false) {
		getExhibitionProducts(nowPage,map,categoryid,startPrice,endPrice);
	}else{
		getProducts(nowPage,map,categoryid,startPrice,endPrice,change);
	}
}
