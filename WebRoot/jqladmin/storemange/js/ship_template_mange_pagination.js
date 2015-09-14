$().ready(
		function() 
		{
			
			registerEventLister(); //register the event to listen for the element
			showShippingTemplateInformaton(); //show my_attention's shipping information
		}
		
);//end  of ready


//********************************************************************************************
/**
 * the global Variable
 * 页面分页显示相关
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

//********************************************************************************************


/**
 * //********************************************************该函数的代码不需要改动
 */
function registerEventLister()
{
	//点击上一页按钮时的动作
	$("#diggId").on("click","#prePage",
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
					
					getPageData(pageNum);//加载相应的数据  
					
				}
			}
	);
	//点击下一页按钮时的动作
	$("#diggId").on("click","#nextPage",
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
					

					
					getPageData(pageNum);//加载相应的数据 
					
				}
			}
	);
	
	//点击相应的某一页按钮时的动作
	$("#diggId").on("click",".listdata",
		function()
		{
			var currentPageElement=$(".current")[0];//当前选中的是第几页
			var clickPageNumber=parseInt($(this).html());//点击的是第几页
			
			handlePageClick(clickPageNumber,this,currentPageElement);
			
			
			getPageData(clickPageNumber);//加载相应的数据
		}//end of function
	
	);//end of click
	
}

/**
 * 该函数在页面加载时，初始化页面需要分页显示的信息
 */
function showShippingTemplateInformaton()
{
	
	//ask for the server to return the data to show
	
	var actionUrl = "get_allshippingtemplate.action";	 	
	$.ajax( { // 获取物流信息
		url : actionUrl,
		type : "post",
		dataType : "json",
		error : function(data) 
		{
			alert("获取物流模版信息失败，请稍后再试!!!!");
		},
		success : function(data) 
		{
//			console.log("*******************data***********************");
//			console.log(data);
//			var errCode=data.errCode;
//			if(errCode==100) //it means that the data is wrong
//			{
//				var errMessage=data.errMessage;
//				alert(errMessage);
//				return;
//			}
//			//the following code is to show the  data  entireTransInfo
//			var entireTransInfo=data.shippingInfo;
//			
//			var dataRowsLength = entireTransInfo.length;
//			if(dataRowsLength==0)
//			{
//				alert("暂时没有相应的信息");
//				return;
//			}
			
			if(data==null)
			{
				alert("暂时没有相应的运费模版信息,请添加");
				return;
			}
			
		//********************************************************这里的代码需要根据具体显示的数值改动
			var htmldata=buildUpInformation(data);  //构建具体需要显示的信息
			//console.log("htmldata是：");
			console.log(htmldata);
			document.getElementById("listshowID").innerHTML=htmldata;
		//********************************************************
			
		//next code is to show the list-data，也就是分页的按钮:  pre page::1::2::3::next page
		//********************************************************这里的代码不需要改动，需要根据实际却动totalNmuberPage的值
//			var totalNumber=data.totalNumberPage;
//			var listDataHtml=buildUpListData(totalNumber);
//			$(listDataHtml).appendTo($("#diggId"));
		//********************************************************

		}
	});// end of ajax

}


//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||这里的代码需要改动
/**
 * 该函数的作用是构建具体需要显示的信息
 * @param entireTransInfoArgs
 * @returns {String}
 * [{"beizhu":null,"createtime":"2014-10-26T18:54:01","id":30,"name":"sdf","status":null},
 * {"beizhu":null,"createtime":"2014-10-26T19:49:29","id":31,"name":"jj","status":null},
 * {"beizhu":null,"createtime":"2014-10-26T19:53:33","id":32,"name":"cc","status":null}]
 */
function  buildUpInformation(entireTransInfoArgs)
{
//	console.log("yes!!!!!!!");
	var entireTransInfo=entireTransInfoArgs;
	var dataRows = entireTransInfo.length;
//	alert(dataRows);
	var html = "";
	html+="<table class='novlinetable'>";
	html+="<tr><td colspan='2' style='text-align: center;'>货运模版管理</td></tr>";
	//html+="<tr><td class='twoColume1_1 textAlignLeft'>名称</td><td class='twoColume1_2 textAlignRight'>操作</td></tr>";
	for ( var i1 = 0; i1 < dataRows; i1++)
	{
		var allInfo=entireTransInfo[i1];
		var transInfo=allInfo;
		//add the td's info
		html+=generateXiangXiInfo(transInfo);
	
	}//end of for
	html+="</table>";
	return html;
}
/**
 * 生成需要在表格中显示的具体信息
 * 参数格式为：
 * {"beizhu":null,"createtime":"2014-10-26T18:54:01","id":30,"name":"sdf","status":null},
 */
function generateXiangXiInfo(transInfo)
{
	html="";
	html+="<tr class='mui_row'><td class='twoColume1_1 mui_name textAlignLeft'>"+transInfo.name+"</td><td class='twoColume1_2 mui_operate textAlignRight'>"+operate(transInfo.id)+"</td></tr>";
	return html;
}

function operate(id)
{
	html="";
	html+="<a href='shipTemplateEdit.action?id="+id+"'  value="+id+">编辑</a>|";
	html+="<a href='javascript:void(0)' onclick='javascript:DeleteElement(this);return false' value="+id+">删除</a>";

	return html;
}


//删除
function DeleteElement(obj)
{
	if(confirm("确认删除该模版吗？"))
	{
        
		var idvalue=$(obj).attr("value");
		
		var actionUrl="deleteShippingTemplateById.action";
		var params={
				"id":idvalue
		}; 
		
		$.ajax( {
			url : actionUrl,
			data:params,
			type : "POST",
			dataType : "json",
			error : function() {
				alert("删除失败!!!!");
			},
			success : function(data) {
				alert("删除成功!!!!");
				$(obj).parent(".mui_operate").parent(".mui_row").remove();
			}
		});//end of ajax
	}
	
}
//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| end of 这里的代码需要改动