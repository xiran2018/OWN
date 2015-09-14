var Digit = {};



/**
 *  四舍五入
 */
Digit.round = function(digit, length) {
    length = length ? parseInt(length) : 0;
    if (length <= 0) return Math.round(digit);
    digit = Math.round(digit * Math.pow(10, length)) / Math.pow(10, length);
    return digit;
};

Digit.checkIsInt=function(digit){
	
	//小数点法
//	var str = digit+"";
//	if(str.indexOf(".")==-1)
//	{
//		return true;
//	}else
//	{
//		return false;
//	}
	
	if(parseInt(digit)==digit)
	{
		return true;
	}
	else
	{
		return false;
	}
	
//    var arr = /^-?(?:0|[1-9]\d+)(\.\d+)?$/.exec(digit);
//    if(arr){
//        if(arr[1]){
//            alert('小数');
//        	return false;
//        }
//        else{
//            alert('整数');
//        	return true;
//        }
//    }
//    else{
//        alert('非正常数字');
//    	return false;
//    }
};

/**
 * 保留两位小数的函数
 */
Digit.changeTwoDecimal=function (x)  
{  
	if(Digit.checkIsInt(x))
	{
		x+=".00";//保留两位小数
	} 
	return x;
};



//add or reduce number of product
muiSetAmount={};

muiSetAmount.add=function(obj){
	var number=$(obj).val();
	number++;
	$(obj).val(number);
};

muiSetAmount.reduce=function(obj){
	var number=$(obj).val();
	number--;
	if(0>=number)
	{
		number=1;
	}
	$(obj).val(number);
};

muiSetAmount.modify=function(obj){
	var number=$(obj).val();
	var reg = new RegExp("^[0-9]*$");  
	 if(!reg.test(number))
	 {  
		 number="1";
		 $(obj).val(number);
	 }  
};


/**
 * 利用汇率转换数据，保留两位小数点
 * @param number，价格
 * @param currencyRate 费率
 * @returns
 */
function calculateFeeByExchangeRate(number,currencyRate)
{
	
	
	//商品价格
	var number=(number/currencyRate);
	number=Digit.round(number, 2);
	
	number=Digit.changeTwoDecimal(number);
	
	return number;
}