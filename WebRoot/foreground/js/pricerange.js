
var startPrice = -1;
var endPrice = -1;
function registerPriceLister(isSearch) {
	
	$("#pricebut").on("click",function(){
		startPrice = $("#start_priceipt").val();
		endPrice = $("#end_priceipt").val();
		if(isSearch){
			totalNumber = getTotalSearchNumber(searchMsg,startPrice,endPrice);
			getSearchProducts(0,searchMsg,startPrice,endPrice);// 加载相应的数据
		}else{
			totalNumber = getTotalNumber(map,categoryid,startPrice,endPrice,change);
			getPageData(0,map,categoryid,startPrice,endPrice,change);
		}
		buildPageTable(totalNumber);
	});
}