$().ready(
		function() 
		{
			
			registerEventLister(); //register the event to listen for the element
			showInformaton(); //show  information
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
function showInformaton()
{
	
	//ask for the server to return the data to show
	
	var actionUrl = "getUsers.action";	 
	var params=
	{
		"pagenum":"1"
	};
	
	$.ajax( { // 获取需要编辑的信息
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
//				dialog.dialog( "open" );
			}
			else if(data.status=="500")
			{	
				alert("服务器原因，获取信息失败，请稍后再试!!!!");
			}
			
		},
		success : function(data) 
		{
//			console.log("*******************data***********************");
//			console.log(data);
			var errCode=data.errCode;
			if(errCode==100) //it means that the data is wrong
			{
				var errMessage=data.errMessage;
				alert(errMessage);
				return;
			}
			//the following code is to show the  data  entireTransInfo
			var entireTransInfo=data.userInfo;
			
			var dataRowsLength = entireTransInfo.length;
			if(dataRowsLength==0)
			{
				alert("暂时没有相应的信息");
				return;
			}
			
		//********************************************************这里的代码需要根据具体显示的数值改动
			var htmldata=buildUpInformation(entireTransInfo);  //构建具体需要显示的信息
			//$("#ServiceProviderListId").
			//console.log("htmldata是：");
			//console.log(htmldata);
			document.getElementById("listshowID").innerHTML=htmldata;
		//********************************************************
			
		//next code is to show the list-data，也就是分页的按钮:  pre page::1::2::3::next page
		//********************************************************这里的代码不需要改动，需要根据实际却动totalNmuberPage的值
			var totalNumber=data.totalNumberPage;
			var listDataHtml=buildUpListData(totalNumber);
			$(listDataHtml).appendTo($("#diggId"));
		//********************************************************

		}
	});// end of ajax

}


//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||这里的代码需要改动
/**
 * 该函数的作用是构建具体需要显示的信息
 * @param entireTransInfoArgs
 * @returns {String}
 * "userInfo":[
 * {"createtime":"2013-12-24T00:00:00","lasttime":"2013-12-26T00:00:00","status":1,"userid":1,"userlevel":1,"usermail":"","username":"admin","userpassword":"root"},
 * {"createtime":"2013-12-25T21:49:01","lasttime":"2013-12-25T21:49:13","status":1,"userid":2,"userlevel":1,"usermail":"","username":"cisco","userpassword":"cisco"}
 *]
 */
function  buildUpInformation(entireTransInfoArgs)
{
//	console.log("yes!!!!!!!");
	var entireTransInfo=entireTransInfoArgs;
	var dataRows = entireTransInfo.length;
//	alert(dataRows);
	var html = "";
	html+="<table class='altrowstable'>";
	html+="<tr><td colspan='7' style='text-align: center;'>用户管理</td></tr>";
	html+="<tr><td class='sevenColume1'>用户名</td><td class='sevenColume2'>密码</td><td class='sevenColume3'>真实姓名</td><td class='sevenColume4'>邮箱</td><td class='sevenColume5'>电话</td><td class='sevenColume6'>是否可用</td><td class='sevenColume7'>操作</td></tr>";
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
 * {"createtime":"2013-12-24T00:00:00","lasttime":"2013-12-26T00:00:00","status":1,"userid":1,"userlevel":1,"usermail":"","username":"admin","userpassword":"root"},
 */
function generateXiangXiInfo(transInfo)
{
	html="";
	html+="<tr class='mui_row'><td class='sevenColume1 mui_name'>"+transInfo.username+"</td><td class='sevenColume2 mui_password'>"+transInfo.userpassword+"</td><td class='sevenColume3 mui_realname'>"+paramConvert(transInfo.userrealname)+"</td><td class='sevenColume4 mui_mail'>"+transInfo.usermail+"</td><td class='sevenColume5 mui_tel'>"+paramConvert(transInfo.usertel)+"</td><td class='sevenColume6  mui_status'>"+showConvert(transInfo.status)+"</td><td class='sevenColume7 mui_operate'>"+operate(transInfo.userid)+"</td></tr>";
	return html;
}

function paramConvert(param)
{
	if(param==null)
	{
		return "";
	}
	else
	{
		return param;
	}
}

function showConvert(status)
{
	html="";
	if(status==0)
	{
		html+="不可用";
	}
	else
	{
		html+="可用";
	}
	return html;
}
function operate(id)
{
	html="";
	html+="<a href='javascript:void(0)' onclick='javascript:Edit(this);return false' value="+id+">编辑</a>|";
	html+="<a href='javascript:void(0)' onclick='javascript:ShowXiangQing(this);return false' value="+id+">详情</a>|";
	html+="<a href='javascript:void(0)' onclick='javascript:DeleteElement(this);return false' value="+id+">删除</a>";

	return html;
}
/**
 * 显示用户详情
 * @param element
 */
function ShowXiangQing(element)
{
	editElement=element;//editElement这个变量在shipmanage。js中
	var idvalue=$(element).attr("value");
	var actionUrl="getUserById.action";
    var params={
            "id":idvalue
    }; 
    
    $.ajax( {
       url : actionUrl,
       data:params,
       type : "POST",
       dataType : "json",
       error : function() {
           alert("修改失败!!!!");
       },
       success : function(data) {
//{"userlevel":1,"usermail":"","username":"admin","userpassword":"root"},
    	   
    	   username=data.username;
    	   userpassword=data.userpassword;
    	   userrealname=paramConvert(data.userrealname);
    	   totalbuycount=paramConvert(data.totalbuycount);
    	   usermail=paramConvert(data.usermail);
    	   usertel=paramConvert(data.usertel);
    	   userlevel=paramConvert(data.userlevel);
    	   createtime=data.createtime;
    	   lasttime=data.lasttime;
    	   statusString=showConvert(data.status);
    	   
    	   
    	   var html="";
    	    html+="<div class='xiangqing'>用户名:"+username+"</div>";
    	    html+="<div class='xiangqing'>密码:"+userpassword+"</div>";
    	    html+="<div class='xiangqing'>真实姓名:"+userrealname+"</div>";
    	    html+="<div class='xiangqing'>用户级别:"+userlevel+"</div>";
    	    html+="<div class='xiangqing'>邮箱:"+usermail+"</div>";
    	    html+="<div class='xiangqing'>电话:"+usertel+"</div>";
    	    html+="<div class='xiangqing'>用户状态:"+statusString+"</div>";
    	    html+="<div class='xiangqing'>用户级别:"+userlevel+"</div>";
    	    html+="<div class='xiangqing'>购买金额:"+totalbuycount+"</div>";
    	    html+="<div class='xiangqing'>最后修改时间:"+createtime+"</div>";
    	    html+="<div class='xiangqing'>创建时间:"+createtime+"</div>";
    	   
    	   $("#xiangxiw").empty();
    	   $("#xiangxiw").append(html);
           
    	   xiangxidialog.dialog('open');
       }
   });//end of ajax
}
/**
 * 编辑
 * @param element
 * {"createtime":"2013-12-24T00:00:00","lasttime":"2013-12-26T00:00:00","status":1,"userid":1,"userlevel":1,"usermail":"","username":"admin","userpassword":"root"},
 */
function Edit(element)
{
		editElement=element;//editElement这个变量在shipmanage。js中
		var idvalue=$(element).attr("value");
		var actionUrl="getUserById.action";
	    var params={
	            "id":idvalue
	    }; 
	    
	    $.ajax( {
	       url : actionUrl,
	       data:params,
	       type : "POST",
	       dataType : "json",
	       error : function() {
	           alert("修改失败!!!!");
	       },
	       success : function(data) {

	    	   
	    	   //$('input[name="search"]:checked').prop("checked","false");
	    	   //{"beizhu":"","createTime":"2014-10-14T14:30:08","id":1,"name":"ems","status":1}
	    	   $("#userid").val(data.userid);
	    	   $("#mail").val(data.usermail);
	    	   $("#tel").val(data.usertel);
	    	   
//	    	   $('input[name="status"]:checked').attr("checked","false");
	    	   $(":radio[name=status][value='"+data.status+"']").prop("checked","true");
	           
	    	   dialog.dialog('open');
	       }
	   });//end of ajax
}

//删除
function DeleteElement(obj)
{
	if(confirm("确认删除该用户信息吗？"))
	{
        
		var idvalue=$(obj).attr("value");
		
		var actionUrl="deleteUserById.action";
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


//********************************************************该函数的代码不需要改动
/**
 * 第一次加载的时候，按照淘宝等的形式，构建分页需要的  上一页:1:2:3:4:下一页    这样的分页形式的信息
 * @param totalNumberArgs
 */
function  buildUpListData(totalNumberPageArgs)
{
	var totalNumber=totalNumberPageArgs;
//	console.log("totalNumber="+totalNumber);
	if(totalNumber==1)
	{//只有大于一页参会显示分页
		return;
	}
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
//********************************************************end of 该函数的代码不需要改动


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
		
		//getPageData(clickPageNumber);//加载相应的数据  
		
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
			//getPageData(clickPageNumber);//加载相应页面的数据  
		}
		else//说明已经重新组装分页
		{	
					listDataHtml=genernateListData(allPageNumber,clickPageNumber);
					
					$("#diggId").empty();
					$(listDataHtml).appendTo($("#diggId"));
				
				   //getPageData(clickPageNumber);//加载相应页面的数据  
				
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
function getPageData(pageNum)
{
	
		var actionUrl="getUsers.action";
		
		//ask for the server to return the data to show
		
		var params=
		{
			"pagenum":pageNum
		};
		
		$.ajax( { // 获取物流信息
			url : actionUrl,
			type : "post",
			data:params,
			dataType : "json",
			error : function(data) 
			{
				if(data.status=="200")
				{
//					alert("服务器原因，获取信息失败，请稍后再试!!!!");
				}
				else if(data.status=="500")
				{	
					alert("服务器原因，获取信息失败，请稍后再试!!!!");
				}
			},
			success : function(data) 
			{
//				console.log("*******************data***********************");
//				console.log(data);
				var errCode=data.errCode;
				if(errCode==100) //it means that the data is wrong
				{
					var errMessage=data.errMessage;
					alert(errMessage);
					return;
				}
				//the following code is to show the  data  entireTransInfo
				var entireTransInfo=data.userInfo;
				
				var dataRowsLength = entireTransInfo.length;
				if(dataRowsLength==0)
				{
					alert("暂时没有相应的信息");
					return;
				}
				
			//********************************************************这里的代码需要根据具体显示的数值改动
				var htmldata=buildUpInformation(entireTransInfo);  //构建具体需要显示的信息
				//$("#ServiceProviderListId").
				//console.log("htmldata是：");
				//console.log(htmldata);
				document.getElementById("listshowID").innerHTML=htmldata;
			//********************************************************
				
			//next code is to show the list-data，也就是分页的按钮:  pre page::1::2::3::next page
			//********************************************************这里的代码不需要改动，需要根据实际却动totalNmuberPage的值
//				var totalNumber=data.totalNumberPage;
//				var listDataHtml=buildUpListData(totalNumber);
//				$("#diggId").empty();
//				$(listDataHtml).appendTo($("#diggId"));
			//********************************************************

			}
		});// end of ajax
		
		
}



//********************************************************该函数的代码不需要改动
/**
 * 当点击了某一个页的时候，按照淘宝等的形式，构建分页需要的  上一页:1:2:3:4:下一页    这样的分页形式的信息
 * @param totalNumberArgs
 * 
 */
function genernateListData(allPageNumberArgs,clickPageNumberArgs)
{
	var allPageNumber=allPageNumberArgs;
	var clickPageNumber=clickPageNumberArgs;
	var currentSelectedPageNumber=parseInt($(".current").html());//当前被选择的页数
	var listDataHtml="";
	//以下的代码为开始重新组装的代码，点击的页尽量作为中间页显示
	//首先，改变上一页按钮的css样式，因为肯定不是点击的前面的几页，点击前面几页的时候调用这个函数之前已经拦截
	
	if(1==clickPageNumber)//如果点击的是第一页
	{
			listDataHtml+="<span id='prePage' class='disabled'>&lt;上一页</span>";//不显示上一页按钮
			listDataHtml+="<span class='listdata  current'>"+1+"</span>";
	}
	else
	{
			listDataHtml+="<span id='prePage' class=''>&lt;上一页</span>";
			listDataHtml+="<span class='listdata'>"+1+"</span>";
	}

	
	//首先，组装左边要显示的信息,从第一页开始组装
	for(var i=2;i<leftPageToShow+1;i++)
	{
		if(i==clickPageNumber)
		{
			 
				 listDataHtml+="<span class='current'>"+i+"</span>";
		}
		else
		{
			listDataHtml+="<span class='listdata'>"+i+"</span>";
		}
	}
	
	//然后，组装中间要显示的信息,点击的那一页尽量作为中间页显示

	listDataHtml+=genernateMiddLeftListData(clickPageNumber,allPageNumber);
	listDataHtml+=genernateMiddRightListData(realLeftNumCount,clickPageNumber,allPageNumber);
	
	
	//然后，组装最后要显示的信息
	//首先计算从那一页开始显示
	var firstLastPage=allPageNumber-rightPageToShow+1;
	for(var j=firstLastPage;j<allPageNumber;j++)
	{
		if(j==clickPageNumber)
		{
			 
				 listDataHtml+="<span class='current'>"+j+"</span>";
		}
		else
		{
			listDataHtml+="<span class='listdata'>"+j+"</span>";
		}
	}
	if(allPageNumber==clickPageNumber)//如果点击的是最后一页
	{
			listDataHtml+="<span class='listdata lastPage current'>"+allPageNumber+"</span>";
			listDataHtml+="<span id='nextPage' class='disabled'>下一页&gt;</span>"; //不显示下一页按钮
	}
	else
	{
			listDataHtml+="<span class='listdata lastPage'>"+allPageNumber+"</span>";
			listDataHtml+="<span id='nextPage' class=''>下一页&gt;</span>";
	}

	return listDataHtml;
}

//********************************************************该函数的代码不需要改动
/**
 * 生成分页列表左边需要显示的页数信息
 * @param clickPageNumber
 * @returns {String}
 */
function genernateMiddLeftListData(clickPageNumber,allPageNumber)
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
		if(realLeftNumCount<0)
			realLeftNumCount=0;
		//左面的数据说明不够用
//		var temp=clickPageNumber-1;
		//开始组装左面的数据
		for(var s=leftPageToShow+1;s<clickPageNumber;s++)
		{
			listDataHtml+="<span class='listdata'>"+s+"</span>";
		}
		if(clickPageNumber>leftPageToShow)
		{			
			listDataHtml+="<span class='current'>"+clickPageNumber+"</span>";
		}
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
		
		var endNum=clickPageNumber;
		var tempNum=allPageNumber-rightPageToShow+1;//次数表示了最左边的显示的页数中的第一个页数号码
		
		if(endNum>=tempNum)
		{
			endNum=tempNum;
		}
		
		//计算左面已经组装了多少数据
		for(var s=tempMiddLeftNum;s<endNum;s++)
		{
			listDataHtml+="<span class='listdata'>"+s+"</span>";
		}
		
		if(clickPageNumber<tempNum)
		{
			listDataHtml+="<span class='current'>"+clickPageNumber+"</span>";
		}
	}
	return listDataHtml;
}
//********************************************************end of该函数的代码不需要改动


//********************************************************该函数的代码不需要改动
/**
 * 生成分页列表右边需要显示的页数信息
 * @param clickPageNumber
 * @returns {String}
 */
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
		var tempRightStart=clickPageNumber+1;//从哪一个页开始生成
		if(leftPageToShow>=tempRightStart)//leftPageToShow的页数已经在genernateListData函数中生成了，所以这里必须要从大于这个数值的地方开始)
		{
			tempRightStart=leftPageToShow+1;
		}
		
		for(var t=tempRightStart;t<tempNum;t++)
		{
			listDataHtml+="<span class='listdata'>"+t+"</span>";
		}
	}
	else//右面的数据说明够用
	{
		var tempRightToNum=clickPageNumber+rightNum+1;
		var tempRightStart=clickPageNumber+1;//从哪一个页开始生成

		if(leftPageToShow>=tempRightStart)//leftPageToShow的页数已经在genernateListData函数中生成了，所以这里必须要从大于这个数值的地方开始)
		{
			tempRightStart=leftPageToShow+1;
		}
		for(var t=tempRightStart;t<tempRightToNum;t++)
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
//********************************************************end of该函数的代码不需要改动

