///////////////////////////////////////////////global variables
/**
*保存根据从数据库中取出来的sku信息，初始化后的组合结果信息，也就是sku的组合和相应的价格等信息
*形式为：“10”；{count: 46，prices: [36，27]}
*/
var SKUResult = {};
var selectedIds = []; //保存选中的属性值中，支持sku的属性值id的组合
var allSelectIds = [];//保存所有被选中的属性值，不论是否支持sku
//////////////////////////////////////////////////////////////

/**
*keys数组保存sku的每一项，也就是这里的“10；20；30；40”
*获得对象的key
*/
function getObjKeys(obj) {
    if (obj !== Object(obj)) throw new TypeError('Invalid object');
    var keys = [];//keys数组保存sku的每一项key，也就是这里的“10:20:30:40”，sku每一项的value为        price:346,count: 3
    for (var key in obj)//对sku数组中的每一项都进行遍历
        if (Object.prototype.hasOwnProperty.call(obj, key))  //调用Object对象的hasownproperty方法，参数为key
            keys[keys.length] = key;
    return keys;
}

//把组合的key放入结果集SKUResult
function add2SKUResult(combArrItem, sku) {
	var key = combArrItem.join(";");
    if(SKUResult[key]) {//SKU信息key属性·,如果SKUResult中有这个key的信息，比如20;40,则只需要改变，这个key中的value即可，也就是改变价格和数量
        SKUResult[key].count += sku.count;
        SKUResult[key].prices.push(sku.price);
    } else {
	//如果没有，则需要重新生成该key的价格和数量
        SKUResult[key] = {
            count : sku.count,
            prices : [sku.price],
            imageAddr:sku.image_addr,
            sku_id:sku.sku_id
        };
    }
}

//初始化得到结果集
function initSKU() {
    var i, j, skuKeys = getObjKeys(skuInfos);//skuInfo is in the productshow.js
    for(i = 0; i < skuKeys.length; i++) {//针对每一个sku项进行遍历
        var skuKey = skuKeys[i];//一条SKU信息key
        var sku = skuInfos[skuKey];	//一条SKU信息value;skuInfo is in the productshow.js
        var skuKeyAttrs = skuKey.split(";"); //SKU信息key属性值数组，用逗号分隔sku的key，比如“10:20:30:40”
		skuKeyAttrs.sort(function(value1, value2) {
			return parseInt(value1) - parseInt(value2);
		});//对得到的每一个属性值进行排序，小的在前，大的在后

        //对每个SKU信息中的key属性值数组进行拆分组合，比如[10,20,30,40]
		var combArr = combInArray(skuKeyAttrs);
		for(j = 0; j < combArr.length; j++) {
			add2SKUResult(combArr[j], sku);
		}

        //因为在combInArray中，只是得到了最长为（skuKeyAttrs.len-1）的组合个数，也就是说当"10;20;38;40"作为参数时，取出来的结果集，最长的组合为3，比如"10;20;38"等
		//所以最后需要把最长的结果集，也就是"10;20;38;40"，放入SKUResult
        SKUResult[skuKeyAttrs.join(";")] = {
            count:sku.count,
            prices:[sku.price],
            imageAddr:sku.image_addr,
            sku_id:sku.sku_id
        };
    }
}

/**
 * 从数组中生成指定长度的组合
 * 方法: 先生成[0,1...]形式的数组, 然后根据0,1从原数组取元素，得到组合属性值数组
 */
function combInArray(aData) {
	if(!aData || !aData.length) {
		return [];
	}

	var len = aData.length;
	var aResult = []; //保存最后的结果集

	for(var n = 1; n < len; n++) {
		var aaFlags = getCombFlags(len, n);  //得到从len个数种取n个数的所有组合,形式为[[1,1，0，0],[0，0，1,1]]
		while(aaFlags.length) {
			var aFlag = aaFlags.shift();  //shift() 方法用于把数组的第一个元素从其中删除，并返回第一个元素的值。
			var aComb = [];
			for(var i = 0; i < len; i++) {
				aFlag[i] && aComb.push(aData[i]);  //把数组中为1的地方，换位相应的属性值，为0的地方则直接抛弃，注意：aComb数组中只会含有原有的属性值，不会含有0，因为当
				//aFlag[i] 为0时，aComb.push(aData[i])这句话不会执行
			}
			aResult.push(aComb);
		}
	}
	
	return aResult;
}


/**
 * 得到从 m 元素中取 n 元素的所有组合
 * 结果为[0,1...]形式的数组, 1表示选中，0表示不选
 */
function getCombFlags(m, n) {
	if(!n || n < 1) {
		return [];
	}

	var aResult = [];
	var aFlag = [];
	var bNext = true;
	var i, j, iCnt1;

	for (i = 0; i < m; i++) {
		aFlag[i] = i < n ? 1 : 0;
	}

	aResult.push(aFlag.concat());

	while (bNext) {
		iCnt1 = 0;
		for (i = 0; i < m - 1; i++) {
			if (aFlag[i] == 1 && aFlag[i+1] == 0) {
				for(j = 0; j < i; j++) {
					aFlag[j] = j < iCnt1 ? 1 : 0;
				}
				aFlag[i] = 0;
				aFlag[i+1] = 1;
				var aTmp = aFlag.concat();
				aResult.push(aTmp);
				if(aTmp.slice(-n).join("").indexOf('0') == -1) {
					bNext = false;
				}
				break;
			}
			aFlag[i] == 1 && iCnt1++;
		}
	}
	return aResult;
} 

/**
 * 判断属性是否支持sku
 * @param attrId
 */
function supportSku(attrId)
{
	var tempInt=parseInt(attrId);
	var len=skuAttrId.length;
	for(var i=0;i<len;i++)
	{
		var tempEle=skuAttrId[i];
		if(tempEle==tempInt)
		{
			return true;
		}
	}
	
	return false;
}

//初始化用户选择事件
function productSelectAttrValue() 
{
	initSKU(); //根据数据库得到的信息，初始化需要的信息
	//var endTime = new Date().getTime();
	$('.sku').each(function() {
		var self = $(this);
		var first_data_value = self.attr('data-value');
		var first_attrIdValueId = first_data_value.split(":");
		var first_attrId=first_attrIdValueId[0];
		if(skuFlag&&supportSku(first_attrId))
		{//该属性支持sku
			var first_attr_value_id = first_attrIdValueId[1];
			if(!SKUResult[first_attr_value_id]) //skuFlag is in the productshow.js
			{
				//遍历每一个属性值，如果某一个属性值，不在SKUResult中，则标记为不可用
				//self.attr('disabled', 'disabled');
				self.addClass("tb-out-of-stock");
			}
		}
	}).click(function() {
		//当某一个sku点击时的动作
		var self = $(this);

		if(self.hasClass("tb-out-of-stock")) return;
			
		//选中自己，兄弟节点取消选中
		//当选择的节点，再次点击的时候，就不会被选中了
		self.toggleClass('selected').siblings().removeClass('selected');
		
		//已经选择的节点,jquery对象
		var selectedObjs = $('.selected');

		if(selectedObjs.length) 
		{//选择了节点
			//获得组合key价格
			selectedIds = [];
			allSelectIds = [];
			selectedObjs.each(function() {
				var data_value = $(this).attr('data-value');
				var attrIdValueId = data_value.split(":");
				var attrId=attrIdValueId[0];
				var attr_value_id = attrIdValueId[1];
				allSelectIds.push(attr_value_id);
				if(supportSku(attrId))
				{//该属性支持sku
					selectedIds.push(attr_value_id);
				}
			});
			selectedIds.sort(function(value1, value2) {
				return parseInt(value1) - parseInt(value2);
			});
			var len = selectedIds.length;
			
			//operate the already-Select-ALL-Attr
			allSelectIds.sort(function(value1, value2) {
				return parseInt(value1) - parseInt(value2);
			});
			var allSelectLen=allSelectIds.length;
			var alreadySelectAttrString="";
			for(var mui_j=0;mui_j<allSelectLen;mui_j++)
			{
				if(alreadySelectAttrString=="")
				{
					alreadySelectAttrString=attrValueIdNameObj[allSelectIds[mui_j]];
				}
				else
				{
					alreadySelectAttrString+=","+attrValueIdNameObj[allSelectIds[mui_j]];
				}
			}
			$("#mui-already-select").html(alreadySelectAttrString);
			
			if(skuFlag)
			{
				//operate the price
				var prices = SKUResult[selectedIds.join(';')].prices;
				var maxPrice = Math.max.apply(Math, prices);
				
				maxPrice=(maxPrice/currencyRate);
				maxPrice=Digit.round(maxPrice, 2);
				maxPrice=Digit.changeTwoDecimal(maxPrice);
				
				var minPrice = Math.min.apply(Math, prices);
				
				minPrice=(minPrice/currencyRate);
				minPrice=Digit.round(minPrice, 2);
				minPrice=Digit.changeTwoDecimal(minPrice);
				
				var tempPrice=maxPrice > minPrice ? minPrice + "-" + maxPrice : maxPrice;//相应sku的价格，有可能因为在后台没有设置，所以价格是零，这个时候需要特殊处理
				if(tempPrice=="0.00")
				{
					tempPrice=calculateFeeByExchangeRate(products.p_nowprice,currencyRate); 
					//calculateFeeByExchangeRate is in math.js
					//products.p_nowprice is in productshow.js
				}
				$('#sku-discount-price').text(tempPrice);

				//operate the image
				var tempImageAddr=SKUResult[selectedIds.join(';')].imageAddr;
				if(tempImageAddr!=null&&tempImageAddr!="")
				{
					mui_replaceSmallImage (tempImageAddr);//the function is in the product.image.js
				}

				//if there is sku info about the product
				//用已选中的节点验证待测试节点 underTestObjs
				$(".sku").not(selectedObjs).not(self).each(function() {//self 代表点击的那个sku选项
					var siblingsSelectedObj = $(this).siblings('.selected');  //该项代表和被测试节点在同一级别，并且已经被选中的节点，注意：该节点最多包含一个，因为同一个属性的元素，每次至多选中一个
					var testAttrIds = [];//该数组的作用主要是验证，存储的值为：已经被选中的值中剔除某个元素，该元素和将要被测试的元素为同一级别，并且被选中。从选中节点中去掉选中的兄弟节点
					
					var test_data_value  = $(this).attr('data-value');
					var testAttrIdValueId = test_data_value.split(":");
					var testAttrId=testAttrIdValueId[0];
					var testAttrValueId=testAttrIdValueId[1];
					if(supportSku(testAttrId))
					{//将要测试的节点属性支持sku
						if(siblingsSelectedObj.length) 
						{//将要被测试的同级元素有某一个被选中
							
							var siblings_data_value  = siblingsSelectedObj.attr('data-value');
							var siblings_attrIdValueId = siblings_data_value.split(":");
							
							var siblingsSelectedObjId = siblings_attrIdValueId[1];
							for(var i = 0; i < len; i++) //len代表已经选择的节点的数量
							{//剔除和被测试的元素为同一级别，并且被选中的元素
								(selectedIds[i] != siblingsSelectedObjId) && testAttrIds.push(selectedIds[i]);
							}
							
							
						} 
						else 
						{//将要被测试的同级元素没有任何一个被选中
							testAttrIds = selectedIds.concat();
						}
						testAttrIds = testAttrIds.concat(testAttrValueId);
						
						testAttrIds.sort(function(value1, value2) {
							return parseInt(value1) - parseInt(value2);
						});
						if(!SKUResult[testAttrIds.join(';')]) 
						{
							//$(this).attr('disabled', 'disabled').removeClass('selected');
							$(this).addClass("tb-out-of-stock").removeClass('selected');
						} 
						else 
						{
							//$(this).removeAttr('disabled');
							$(this).removeClass("tb-out-of-stock");
						}
					}
				});//end of test
			}//end of skuFlag
		} 
		else 
		{//当已经选择的节点，再次点击的时候，就不会被选中了，最后一个被选择的节点变为不被选择的时候，就会完全没有选中的节点了
				//设置属性状态
				$('.sku').each(function() {
					if(skuFlag)
					{
						var last_data_value = $(this).attr('data-value');
						var last_attrIdValueId = last_data_value.split(":");
						var last_attrId=last_attrIdValueId[0];
						var last_attrValueId=last_attrIdValueId[0];
						if(supportSku(last_attrId))
						{//该属性支持sku
							if(SKUResult[last_attrValueId])
							{ 
								$(this).removeClass('tb-out-of-stock');
							}
							else
							{
								$(this).addClass("tb-out-of-stock").removeClass('selected');
							}
						}
						
					}
					else
					{
						$(this).removeClass('selected');
					}
				});
			
		}
	});//END OF CLICK 
}