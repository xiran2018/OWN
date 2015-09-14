$().ready(
		function() 
		{
			registerEventLister(); //register the event to listen for the element
			showCompanyInformaton(); //show my_attention's company information
		}
		
);//end  of ready
/**
 * the global Variable
 * 页面显示相关
 */
//默认：1  2	3	4	5	6	7	8	9...50
//重新组装分页：1 	2 ... 9 10 11 12 13 14...50
var flag=0;//表示，显示的页数是否发生了相应的变化，如果发生了变化再执行重新组装分页，然后进行显示,0表示无重新组装，1表示已经重新组装
//var totalPageToShow=12;//第一次页面显示时，在页面中需要显示的页的数量
var leftPageToShow=3;//左面需要显示的页数
var middPageToShow=7; //此数值必须为一个奇数
var rightPageToShow=2;//右面需要显示的页数
var totalPageToShow=leftPageToShow+middPageToShow+rightPageToShow;//第一次页面显示时 和 页面分页改变以后，页面显示时，在页面中需要显示的页的数量
var realLeftNumCount;  //实际组装过程中，中间左面已经显示的数据

var companyId=-1;//defaul value is -1 , 表示有错误

function registerEventLister()
{
	//取消关注按钮
	$(".qxgz").die().live("click",
			
			function()
			{
				var memId=$(this).next().val();
				deleteGuanZhu(memId);
			}
	);
	//点击上一页按钮时的动作
	$("#prePage").die().live("click",
			function()
			{
				var currentPageElement=$(".current")[0];//当前选中的是第几页
				
				var currentPageNumber=parseInt($(".current").html());//当前选中的是第几页
				
				if(currentPageNumber==1)
				{					
					alert("已是第一页！");
					return;
				}
				else
				{
					var willingShowElement=$(".current").prev()[0];//即将显示的页，dom元素
					
/*					test=$(willingShowElement).html();
					alert(test);*/
					
					
					
					var clickPageNumber=currentPageNumber-1;
					handlePageClick(clickPageNumber,willingShowElement,currentPageElement);//改变下面分页栏
					
					var pageNum=currentPageNumber-1;
					var posInPage=1;
					var pricePageNum=1;
					var userAction="turnToPage";
					var companyId=1;
					
					getPageData(pageNum,posInPage,pricePageNum,userAction,companyId);//加载相应的数据  function getPageData(pageNum,posInPage,pricePageNum,userAction,companyId)
					
				}
			}
	);
	//点击上一页按钮时的动作
	$("#nextPage").die().live("click",
			function()
			{
				var currentPageElement=$(".current")[0];//当前选中的是第几页
				var allPageNumber=parseInt($(".lastPage").html());//the total number to show
				var currentPageNumber=parseInt($(".current").html());//当前选中的是第几页
				
				if(currentPageNumber==allPageNumber)
				{					
					alert("已是最后一页！");
				}
				else
				{
					var willingShowElement=$(".current").next()[0];//即将显示的页，dom元素
					
					var pageNum=currentPageNumber+1;
					
					handlePageClick(pageNum,willingShowElement,currentPageElement);//改变下面分页栏
					
					var posInPage=1;
					var pricePageNum=1;
					var userAction="turnToPage";
					var companyId=1;
					
					getPageData(pageNum,posInPage,pricePageNum,userAction,companyId);//加载相应的数据  function getPageData(pageNum,posInPage,pricePageNum,userAction,companyId)
					
				}
			}
	);
	//点击更多运价按钮时的动作
	$(".bod_null").die().live("click",
			
		function()
		{
			var pageNum=$(".current").html();
			var companyId=$(this).parents(".Price").attr("id");
			var userAction="morePrice";
			var length=$("#"+companyId+" table tr").length;
			console.log("*******************length***********************"+length);
			var addPos=length-3;//剔除头部和其他部分的实际有效的价格行数
			var pricePageNum=parseInt(addPos/5)+1;
			console.log("*******************pricePageNum***********************"+pricePageNum);
			var posInPage=1;
			getPageData(pageNum,posInPage,pricePageNum,userAction,companyId);//加载相应的数据  function getPageData(pageNum,posInPage,pricePageNum,userAction,companyId)
			
		}
	
	);
	
	//点击分页按钮时的动作
	$(".listdata").die().live("click",
		function()
		{
			var currentPageElement=$(".current")[0];//当前选中的是第几页
			var clickPageNumber=parseInt($(this).html());//点击的是第几页
			handlePageClick(clickPageNumber,this,currentPageElement);
			
			var pageNum=currentPageNumber+1;
			var posInPage=1;
			var pricePageNum=1;
			var userAction="turnToPage";
			var companyId=1;
			
			getPageData(pageNum,posInPage,pricePageNum,userAction,companyId);//加载相应的数据
		}//end of function
	
	);//end of click
}
function deleteGuanZhu(memId)
{
//	alert("start to remove");
	var queryURl="communityAction.do?cmd=removeMyAttention";
//	var queryURl="communityAction.do?cmd=addMyAttention";
	
	//ask for the server to return the data to show
	
	var queryParam=
	{
		"memberID":memId
	};
	
	$.getJSON(queryURl,queryParam, function(data) 
	{
    	
		console.log("*******************data***********************");
		console.log(data);	
		var errCode=data.errCode;
		var errMessage=data.errMessage;
		alert(errMessage);
		return;
	});//end of getJson
}
function handlePageClick(wantToShowPageArgs,theElement,currentPageElement)
{
	if(isNaN(wantToShowPageArgs))
	{  
	    return;
	}
	//点击页去除listdata属性
	$(theElement).removeClass("listdata");
	//当前选中的页重新增加listdata属性
	$(currentPageElement).addClass("listdata");
	
	var allPageNumber=parseInt($(".lastPage").html());//the total number to show
	var clickPageNumber=wantToShowPageArgs;//即将要显示的页数
	console.log("totalPageToShow:"+totalPageToShow);
	
	if(totalPageToShow>=allPageNumber)//说明不需要分页，只需要相应的改变css即可
	{
		if(clickPageNumber==1)//如果是第一页，改变上一页和下一页按钮的css样式
		{
			$("#prePage").removeClass("listdata");
			$("#prePage").addClass("disabled");
			
			$("#nextPage").addClass("listdata");
			$("#nextPage").removeClass("disabled");
		}
		else if(clickPageNumber==allPageNumber)//说明是最后一页被点击，，改变上一页和下一页按钮的css样式
		{
			$("#prePage").addClass("listdata");
			$("#prePage").removeClass("disabled");
			
			$("#nextPage").removeClass("listdata");
			$("#nextPage").addClass("disabled");
		}
		else//其他情况，把第一页或者最后一页的disable样式，去掉就可以了
		{
			$("#prePage").removeClass("disabled");
			$("#nextPage").removeClass("disabled");
		}
		
		$(".current").removeClass("current");
		$(theElement).addClass("current");
		
		//getPageData(clickPageNumber,"1","1","turnToPage","1");//加载相应的数据  function getPageData(pageNum,posInPage,pricePageNum,userAction,companyId)
		
		return;
		
	}
	
	var listDataHtml="";
	if(allPageNumber>totalPageToShow)//以下是大于需要显示页数时的处理方式
	{
		if(flag==0)//说明还没有重新组装分页
		{
			var preTotalPageToShow=totalPageToShow-3;//没有重新组装之前，符号“...”之前的页，点击该页需要重新组装分页
			if(clickPageNumber<preTotalPageToShow)//如果点击的是左边的页数，则不需要重新组装，直接改变相应的css模式即可
			{
				if(clickPageNumber==1)//如果是第一页，改变上一页按钮的css样式
				{
					$("#prePage").removeClass("listdata");
					$("#prePage").addClass("disabled");
				}
				else//不是第一页，改变上一页按钮的css样式
				{
					$("#prePage").removeClass("disabled");
					$("#prePage").addClass("listdata");
				}
				$(".current").removeClass("current");
				$(theElement).addClass("current");
			}
			else//第一次重新组装
			{
				flag=1;//重新组装赋值为1
				listDataHtml=genernateListData(allPageNumber,clickPageNumber);
				$("#diggId").empty();
				$(listDataHtml).appendTo($("#diggId"));
				
			}//END OF ELSE
			//getPageData(clickPageNumber,"1","1","turnToPage","1");//加载相应页面的数据  function getPageData(pageNum,posInPage,pricePageNum,userAction,companyId)
		}
		else//说明已经重新组装分页
		{
				if(clickPageNumber<leftPageToShow+1)//如果点击的是左边显示的页数，则不需要重新组装，直接改变相应的css模式即可
				{
					if(clickPageNumber==1)//如果是第一页，改变上一页按钮的css样式
					{
						$("#prePage").removeClass("listdata");
						$("#prePage").addClass("disabled");
					}
					else//不是第一页，改变上一页按钮的css样式
					{
						$("#prePage").removeClass("disabled");
						$("#prePage").addClass("listdata");
					}
					//改变下一页按钮的css样式
					$("#nextPage").removeClass("disabled");
					$("#nextPage").addClass("listdata");
					
					
					$(".current").removeClass("current");
					$(theElement).addClass("current");
					
				}
				else if(clickPageNumber>allPageNumber-rightPageToShow)//如果点击的是右边显示的页数，则不需要重新组装，直接改变相应的css模式即可
				{
					if(clickPageNumber==allPageNumber)//如果是最后一页，改变下一页按钮的css样式
					{
						$("#nextPage").removeClass("listdata");
						$("#nextPage").addClass("disabled");
					}
					else//不是最后一页，改变下一页按钮的css样式
					{
						$("#nextPage").removeClass("disabled");
						$("#nextPage").addClass("listdata");
					}
					//改变下一页按钮的css样式

					$("#prePage").removeClass("disabled");
					$("#prePage").addClass("listdata");
					
					$(".current").removeClass("current");
					$(theElement).addClass("current");
					
				}
				else
				{
					listDataHtml=genernateListData(allPageNumber,clickPageNumber);
					
					$("#diggId").empty();
					$(listDataHtml).appendTo($("#diggId"));
				}
				
				//getPageData(clickPageNumber,"1","1","turnToPage","1");//加载相应页面的数据  function getPageData(pageNum,posInPage,pricePageNum,userAction,companyId)
				
		}//end of else
	}
}

/**
 * 
 * @param pageNum 需要搜索的某页数的位置信息
 * @param posInPage 一页中某公司的位置信息
 * @param pricePageNum 公司的价格位置信息(即将从数据库中取出的页数)
 * @param userAction 用户的行为，目前只有一种："turnToPage"
 * @param companyId  公司的id信息
 * 
 */
function getPageData(pageNum,posInPage,pricePageNum,userAction,companyId)
{
	
		var queryURl="communityAction.do?cmd=displayMyAttention";
		
		//ask for the server to return the data to show
		
		var queryParam=
		{
			"pagenum":pageNum,	
			"posInPage":posInPage,
			"pricePageNum":pricePageNum,
			"userAction":userAction,
			"companyId":companyId
		};
		
		$.getJSON(queryURl,queryParam, function(data) 
		{
			console.log("*******************data***********************");
			console.log(data);
			
			var errCode=data.errCode;
			if(errCode==100) //it means that the data is wrong
			{
				var errMessage=data.errMessage;
				alert(errMessage);
				return;
			}
			
			var entireTransInfo=data.entireTransInfo;
			if(userAction=="turnToPage")
			{
				//next code is to show the company data
				var htmldata=buildUpCompanyInformation(entireTransInfo);
				//$("#ServiceProviderListId").
				console.log("*******************htmldata***********************");
				console.log(htmldata);
//				$(html).appendTo($("#ServiceProviderListId"));
//				$("#ServiceProviderListId").append(htmldata);
				$("#ServiceProviderListId").empty();
				document.getElementById("ServiceProviderListId").innerHTML=htmldata;
			}
			else//增加某公司的更多信息
			{
				var htmldata=buildUpCompanyPriceInformation(entireTransInfo);//获取返回的公司信息
				//根据公司的id
				//add the td's info
				var length=$("#"+companyId+" table tr").length;
				console.log("*******************length***********************"+length);
				var delPos=length-1;
				$("#"+companyId+" table tr").eq(delPos).remove();
				
				var nowLength=$("#"+companyId+" table tr").length;
				var addPos=nowLength-1;
				console.log("*******************addPos***********************"+addPos);
				$("#"+companyId+" table tr").eq(addPos).after(htmldata);
			}

		});//end of getJson
}

function  buildUpCompanyPriceInformation(entireTransInfoArgs)
{
	//just for test
	//****************************
/*	html="<tr><td>sdfsdfsfsdf</td> </tr>";
	return html;*/
	//***************************
//	console.log("yes!!!!!!!");
	var entireTransInfo=entireTransInfoArgs;
	var dataRows = entireTransInfo.length;
	//price total count
	var totalpricecount=$("#totalPriceInfo").val();
//	alert(dataRows);
	var html = "";
	for ( var i = 0; i < dataRows; i++)
	{
		var allInfo=entireTransInfo[i];
		var transInfo=allInfo;

		//add price
		var priceTransInfo=transInfo.pricetransInfo;
		var priceNameArray=new Array();
		if(priceTransInfo.length>0)
		{
			var priceInfo=priceTransInfo[0].price;

			
			for(var key in priceInfo)
			{
				priceNameArray.push(key);
			}
		}
		
		//add the real-info
		for(var j=0;j<priceTransInfo.length;j++)
		{
			var tempPriceInfo=priceTransInfo[j];
			var tempPrice=priceTransInfo[j].price;
			html+="<tr><td>"+tempPriceInfo.tranStart+"</td><td>"+tempPriceInfo.transEnd+"</td><td>"+tempPriceInfo.transType+"</td>";
			for(var jj=0;jj<priceNameArray.length;jj++)
			{
				//add the real price to the html
				html+=" <td class='Price_red'>"+tempPrice[priceNameArray[jj]]+"</td>";
			}
			//add the date to the html
			html+="<td>"+tempPriceInfo.date+"</td>";
			//add the other two elements
			html+="<td><a href='#'>查看详情</a></td><td><a class='zyd' href='#'>直接预定</a></td> </tr>";
		}
		//计算是否是最后一个，加上新过来的数量为
		var prelength=$("#"+companyId+" table tr").length;
		var nowCount=dataRows+prelength-3;
		if(nowCount==totalpricecount)
		{
			html+="<tr><td class='' colspan='9'><span>暂时无更多运价</span></td></tr>";
		}
		else
		{
			html+="<tr><td class='bod_null' colspan='9'><span>更多运价</span></td></tr>";
		}
	
	}//end of for
	return html;
}

function genernateMiddRightListData(realLeftNumCount,clickPageNumber,allPageNumber)
{
	var listDataHtml="";
	//开始组装右面的数据，右面的数据可能也有不够的情况
	//右面需要的数据个数为：
	var rightNum=middPageToShow-1-realLeftNumCount;
	
	var tempRightTempMidd=clickPageNumber+rightNum;//此数是为了判断中间部分右边要显示的页数是否够用
	
	var tempNum=allPageNumber-rightPageToShow+1;//次数表示了最左边的显示的页数中的第一个页数号码
	
	if(tempRightTempMidd>=tempNum)//右面的数据说明不够用
	{
		
		for(var t=clickPageNumber+1;t<tempNum;t++)
		{
			listDataHtml+="<span class='listdata'>"+t+"</span>";
		}
	}
	else//右面的数据说明够用
	{
		var tempRightToNum=clickPageNumber+rightNum+1;
		for(var t=clickPageNumber+1;t<tempRightToNum;t++)
		{
			listDataHtml+="<span class='listdata'>"+t+"</span>";
		}
		if(tempNum!=tempRightToNum)//如果中间部分最右边的数和   最右面的第一个数是连续的，则不加"..."，如果是不连贯的则加"..."
		{
			
			listDataHtml+="...";
		}
	}
	
	return listDataHtml;
	

}



function genernateMiddLeftListData(clickPageNumber)
{
	var listDataHtml="";
	//首先，计算中间部分显示时，点击的那一页左右两边所要显示的页数
	var totalMiddNumCount=middPageToShow-1;  //中间还需要显示的数据

//	var realLeftNumCount;  //实际组装过程中，中间左面已经显示的数据
	
	var tempMiddPageToShow=totalMiddNumCount/2; //理论上，点击页的左右两边，需要显示的页数
	var templeftTempMidd=leftPageToShow+tempMiddPageToShow;//此数是为了判断中间部分左边要显示的页数是否够用
	
	if(templeftTempMidd>=clickPageNumber)//左面的数据说明不够用
	{	
		realLeftNumCount=clickPageNumber-leftPageToShow;
		//左面的数据说明不够用
//		var temp=clickPageNumber-1;
		//开始组装左面的数据
		for(var s=leftPageToShow+1;s<clickPageNumber;s++)
		{
			listDataHtml+="<span class='listdata'>"+s+"</span>";
		}
		
		listDataHtml+="<span class='current'>"+clickPageNumber+"</span>";
	}
	else
	{

		realLeftNumCount=tempMiddPageToShow;
		//开始组装左面的数据
		//计算左面第一个要显示的数据页号码
		var tempMiddLeftNum=clickPageNumber-tempMiddPageToShow;
		
		var tmeps=leftPageToShow+1;
		if(tempMiddLeftNum!=tmeps)//如果中间部分最左边的数和   最左面的一个数是连续的，则不加"..."，如果是不连贯的则加"..."
		{
			listDataHtml+="...";
		}
		
		//计算左面已经组装了多少数据
		for(var s=tempMiddLeftNum;s<clickPageNumber;s++)
		{
			listDataHtml+="<span class='listdata'>"+s+"</span>";
		}
		
		listDataHtml+="<span class='current'>"+clickPageNumber+"</span>";
	}
	
	return listDataHtml;
	

}

function genernateListData(allPageNumberArgs,clickPageNumberArgs)
{
	var allPageNumber=allPageNumberArgs;
	var clickPageNumber=clickPageNumberArgs;
	var currentSelectedPageNumber=parseInt($(".current").html());//当前被选择的页数
	var listDataHtml="";
	//以下的代码为开始重新组装的代码，点击的页尽量作为中间页显示
	//首先，改变上一页按钮的css样式，因为肯定不是点击的前面的几页，点击前面几页的时候调用这个函数之前已经拦截
	listDataHtml+="<span id='prePage' class=''>&lt;上一页</span>";

	
	//首先，组装左边要显示的信息,从第一页开始组装
	for(var i=1;i<leftPageToShow+1;i++)
	{
		listDataHtml+="<span class='listdata'>"+i+"</span>";
	}
	
	//然后，组装中间要显示的信息,点击的那一页尽量作为中间页显示

	listDataHtml+=genernateMiddLeftListData(clickPageNumber);
	listDataHtml+=genernateMiddRightListData(realLeftNumCount,clickPageNumber,allPageNumber);
	
	
	//然后，组装最后要显示的信息
	//首先计算从那一页开始显示
	var firstLastPage=allPageNumber-rightPageToShow+1;
	for(var j=firstLastPage;j<allPageNumber;j++)
	{
		listDataHtml+="<span class='listdata'>"+j+"</span>";
	}
	listDataHtml+="<span class='listdata lastPage'>"+allPageNumber+"</span>";
	listDataHtml+="<span id='nextPage' class=''>下一页&gt;</span>";

	return listDataHtml;
}

function showCompanyInformaton()
{
/*	//decide the type of explore
	if (navigator.userAgent.indexOf("MSIE")>0) 
	{
		 queryURl="../../communityAction.do?cmd=displayMyAttention";
	} //判断是否IE浏览器if(isFirefox=navigator.userAgent.indexOf(”Firefox”)>0){ }判断是否火狐浏览器if(isSafari=navigator.userAgent.indexOf(”Safari”)>0) {}判断是否Safari浏览器
	else
	{
		 queryURl="communityAction.do?cmd=displayMyAttention";
	}*/
	var queryURl="communityAction.do?cmd=displayMyAttention";
	
	//ask for the server to return the data to show
	
	var queryParam=
	{
		"pagenum":"1",	
		"posInPage":"1",
		"pricePageNum":"1",
		"userAction":"turnToPage",
		"companyId":"1"
	};
	
	$.getJSON(queryURl,queryParam, function(data) 
	{
		console.log("*******************data***********************");
		console.log(data);
		var errCode=data.errCode;
		if(errCode==100) //it means that the data is wrong
		{
			var errMessage=data.errMessage;
			alert(errMessage);
			return;
		}
		//next code is to show the company data
		var entireTransInfo=data.entireTransInfo;
		
		var dataRowsLength = entireTransInfo.length;
		if(dataRowsLength==0)
		{
			alert("暂时没有相应的信息");
			return;
		}
		
		var htmldata=buildUpCompanyInformation(entireTransInfo);
		

		
		//$("#ServiceProviderListId").
		console.log("*******************htmldata***********************");
		console.log(htmldata);
//		$(html).appendTo($("#ServiceProviderListId"));
//		$("#ServiceProviderListId").append(htmldata);
		
		document.getElementById("ServiceProviderListId").innerHTML=htmldata;
	
		
		//next code is to show the list-data:  pre page::1::2::3::next page
		var totalNumber=data.totalNumberPage;
		var listDataHtml=buildUpListData(totalNumber);
		$(listDataHtml).appendTo($("#diggId"));

	});//end of getJson
}
/**
 * @param totalNumberArgs
 */
function  buildUpListData(totalNumberPageArgs)
{
	var totalNumber=totalNumberPageArgs;
//	console.log("totalNumber="+totalNumber);
	var listDataHtml="";
	if(totalNumber!=1)//如果只有一页，则不显示上一页按钮
	{		
		listDataHtml+="<span id='prePage' class='disabled'>&lt;上一页</span>";
		listDataHtml+="<span class='current'>"+1+"</span>"; //the first element's class is current
	}
	else
	{
		listDataHtml+="<span class='current'>"+1+"</span>";
	}
	if(totalNumber>totalPageToShow)
	{
		for(var i=2;i<totalPageToShow;i++)
		{
			listDataHtml+="<span class='listdata'>"+i+"</span>";
		}
		listDataHtml+="...<span class='listdata lastPage'>"+totalNumber+"</span>";
	}
	else
	{
		for(var i=2;i<totalNumber;i++)
		{
			listDataHtml+="<span class='listdata'>"+i+"</span>";
		}
		if(totalNumber>1)
		{
			listDataHtml+="<span class='listdata lastPage'>"+totalNumber+"</span>";
		}
		
	}
	
	if(totalNumber!=1)//如果只有一页，则不显示下一页按钮
	{		
		listDataHtml+="<span class='' id='nextPage'>下一页&gt;</span>";
	}
	
//	console.log("sldjflsdj!!!!!!!");
//	console.log(listDataHtml);
	return listDataHtml;
}

function  buildUpCompanyInformation(entireTransInfoArgs)
{
//	console.log("yes!!!!!!!");
	var entireTransInfo=entireTransInfoArgs;
	var dataRows = entireTransInfo.length;
//	alert(dataRows);
	var html = "";
	for ( var i1 = 0; i1 < dataRows; i1++)
	{
		var allInfo=entireTransInfo[i1];
		var transInfo=allInfo;
		//add gro_logo
		html+="<div class='Introduction'><div class='gro_logo'><a href='#'><img src='"+transInfo.companyLogo+"' alt='' /></a></div>";
		//add text
		html+="<div class='text'><dl><h2>"+transInfo.companyName+"</h2><dt><strong>所在地：</strong> <span>"+transInfo.companyLocation+"</span> <strong class='padd'>运输类型：</strong> <span>"+transInfo.transType+"</span></dt>";
		var companyInfo=transInfo.companyInfo;
		if (typeof(companyInfo) == "undefined") 
		{ 
			html+="<dd></dd></dl>";
		}  
		else
		{
			html+="<dd>"+companyInfo+"</dd></dl>";
		}
		
		//add the td's info
		companyId=transInfo.companyId;  //it is a global variable,use for add more company price information
		var tempid=transInfo.companyId;
		//add msg
		html+="<div class='msg'><p><a href='#'><img src='resources/images/meg.png' alt='' /></a><a class='qxgz' href='javascript:void(0);'><img src='resources/images/qxgz.png' alt='' /></a><input style='display: none;' calss='getMemId' value="+tempid+"></input></p></div></div> <div class='clear'></div></div>";
		//TOTAL PRICE info
		var totalPriceInfo=transInfo.totalPriceInfo;
		//add price
		var priceTransInfo=transInfo.pricetransInfo;
		var priceNameArray=new Array();
		var tempLength=eval(priceTransInfo).length;
		if(tempLength>0)
		{
			var priceInfo=priceTransInfo[0].price;

			
			for(var key in priceInfo)
			{
				priceNameArray.push(key);
			}
		}
		html+="<div class='Price' id="+tempid+">";
		html+="<input type='text' style='display: none;' id='totalPriceInfo' value='"+totalPriceInfo+"' />";
		html+="<table width='744' border='1' cellspacing='0' cellpadding='0'>";
		html+="<tr><td class='pad_left' colspan='8'>最新运价</td><td class='ygz'>已关注线路(3)</td></tr>";
		html+="<tr class='color_grey'><td>起始地</td><td>目的地</td><td>类型</td>";
		//add the priceName
		for(var i2=0;i2<priceNameArray.length;i2++)
		{
			html+="<td>"+priceNameArray[i2]+"</td>";
		}
		html+="<td>有效期</td><td>详情</td><td>预定</td></tr>";
		
		//add the real-info
		var priceTransInfoLen=priceTransInfo.length;
		for(var j=0;j<priceTransInfoLen;j++)
		{
			var tempPriceInfo=priceTransInfo[j];
			var tempPrice=priceTransInfo[j].price;
			html+="<tr><td>"+tempPriceInfo.tranStart+"</td><td>"+tempPriceInfo.transEnd+"</td><td>"+tempPriceInfo.transType+"</td>";
			for(var jj=0;jj<priceNameArray.length;jj++)
			{
				//add the real price to the html
				
				var tempRealPrice =tempPrice[priceNameArray[jj]];
				if (typeof(tempRealPrice) == "undefined") 
				{ 
						html+=" <td class='Price_red'></td>";
				}  
				else
				{
//						html+=" <td class='Price_red'>"+tempPrice[priceNameArray[jj]]+"</td>";
						html+=" <td class='Price_red'>"+tempRealPrice+"</td>";
				}	
			}
			//add the date to the html
			html+="<td>"+tempPriceInfo.date+"</td>";
			//add the other two elements
			html+="<td><a href='#'>查看详情</a></td><td><a class='zyd' href='#'>直接预定</a></td> </tr>";
		}
		
		//add the "更多运价" element
		if(priceTransInfoLen==0)
		{
			
			html+="<tr><td class='' colspan='9'><span>暂时无运价</span></td></tr>";
		}
		else if(totalPriceInfo==priceTransInfoLen)
		{
			html+="<tr><td class='' colspan='9'><span>暂时无更多运价</span></td></tr>";
		}
		else
		{
			html+="<tr><td class='bod_null' colspan='9'><span>更多运价</span></td></tr>";
		}
//		html+="<tr style='display: none;' class='companyId'><td>"+transInfo.companyId;+"</td></tr>";
		
		//add the "table"&"div" element
		html+="</table>";
		html+="</div>";
		
		//add the "hr"element
		
		html+="<hr/>";
	
	}//end of for
	return html;
}