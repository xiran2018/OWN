/**
 * 计算货运时间
 * @param tempShipTime
 * @returns {String}
 */
function calculateShippingTime(tempShipTime)
{
	var realTime=tempShipTime.shippingTime;
	if(realTime==null||realTime==undefined||realTime=="")
		realTime="6-30";
	return realTime;
}

/**
 * 增加或者减少数量时重新计算运费信息，在商品展示的右边显示
 */
function calculateShipFeeInpage(selectShipFee,products,selectNumber)
{
	var realFee=calculateShippingFee(selectShipFee,products,selectNumber); //calculateShippingFee in product.ship.js
	if(realFee!="Free Shipping")
	{
		realFee=calculateShippingFeeByExchangeRate(realFee);		
	}
	return realFee;
}

/**
 * 计算邮费
 * @param shipFee,相应物流方式的具体信息
 * @param products ，产品基本信息
 * @param selectNumber  商品数量
 * @returns
 */
function calculateShippingFee(shipFee,products,selectNumber)
{
	var realFee;
	var shipStyle=shipFee.shippingStyle;
	if(shipStyle==0)
	{//免邮费
		realFee="Free Shipping";
		
	}
	else
	{//自定义
		var selectMode=shipFee.selectMode;
		if(selectMode==1)
		{//标准
			realFee=shipFee.standardFee;
		}
		else
		{//自定义
			var selectQwpattern=shipFee.selectQwpattern;
			if(selectQwpattern==1)
			{//数量

				clMin=shipFee.clMin;
				clMax=shipFee.clMax;
				clPrice=shipFee.clPrice;
				clAddNum=shipFee.clAddNum;
				clAddPrice=shipFee.clAddPrice;
				//var selectNumber=$("#buy-num").val(); //商品数量
				if(selectNumber<clMax)
				{//在首重的数量范围之内
					realFee=shipFee.clPrice;
				}
				else
				{
					var addNumber=selectNumber-clMax;
					var addPrice=addNumber*clAddPrice;
					realFee=addPrice+shipFee.clPrice;
				}
			}
			else
			{//重量
				
				weightEnd0=shipFee.weightEnd0; //首重
				weightPrice0=shipFee.weightPrice0; //首重运费
				weightEnd1=shipFee.weightEnd1;  //续重最高重量
				weightInterval1=shipFee.weightInterval1;  //每增加的重量
				weightPrice1=shipFee.weightPrice1;  //增加多少钱
				//var selectNumber=$("#buy-num").val(); //商品数量
				if(selectNumber==null||selectNumber==undefined)
					selectNumber=1;
				var pweight=products.p_weight; //商品重量
				var totalWeight=pweight*selectNumber; //总重量
				if(totalWeight<weightEnd0)
				{//在首重范围之内
					realFee=shipFee.weightPrice0;
				}
				else
				{
					var addWeight=totalWeight-weightEnd0;
					var addedPrice=(addWeight/weightInterval1)*weightPrice1;
					realFee=addedPrice+shipFee.weightPrice0;
				}
			}
		}
		
	}
	
	return realFee;
}

/**
 * 利用汇率转换数据
 * @param number
 * @returns
 */
function calculateShippingFeeByExchangeRate(number)
{
	
	
	//商品价格
	number=(number/currencyRate);
	number=Digit.round(number, 2);
	
	number=Digit.changeTwoDecimal(number);
	
	return number;
}