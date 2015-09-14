$().ready(
		function() 
		{
			
			registerEventLister(); //register the event to listen for the element
			showShippingInformaton(); //show my_attention's shipping information
			
		}
		
);//end  of ready


//********************************************************************************************
/**
 * the global Variable
 * 
 */
//JSON格式为：
//[
//{"id":货运方式（ems）的id,"timeStyle":时间的设定方式,"time":货运时间（当选择统一的方式时）,"timeMode":[{"shippingCountryIds":所选择国家的id(中间用"|"隔开);"time":承诺到达时间},{}],"shipStyle":运费的设定方式,"shipMode":[{"shippingCountryIds":所选择国家的id(中间用"|"隔开);"selectShipMode":自定义还是标准;"selectQWMode":标准运费、按照重量还是按照数量;"standardInfo":标准运费;"quanaityInfo":{"cl_min":;"cl_max":;"cl_price":;"cl_add_num";"cl_add_price";};"weightInfo":{"weight-end-0":;"weight-price-0":;"weight-end-1":;"weight-interval-1";"weight-price-1";}}]}，
//]
var shipTemplate=[];//用json格式针对每一种货运方式，存储其相应的运费信息和时间信息
var shippingCountryIds="";//存储所选择国家的id(中间用"|"隔开)，每次点击添加时添加至shipTemplate中
var shipId;//保存正在编辑的货运方式的id（包括货运方式的添加和货运时间的添加、）
var shipDecription;//加入相应的货运方式或者货运时间时的描述信息
var editFlag=0;//当点击确定按钮时，确认是要保存一个新的运输方式，还是针对以前的运输方式进行修改,0表明是添加新的，1表明是编辑
var editId;//当编辑运输方式时，此变量保存，所编辑的运输方式所属的物流方式，比如（ems）
var editPos;//当编辑运输方式时，此变量保存，所编辑的运输方式在shipTemplate变量中的shipMode中所属的位置
var editElement;//当编辑运输方式时，此变量保存编辑的元素，从而可以在编辑元素时，改变元素的一些属性信息



//********************************************************************************************


/**
 * //********************************************************该函数的代码不需要改动
 */
function registerEventLister()
{
	//点击上一页按钮时的动作
//	$("#diggId").on("click","#prePage",
//			function()
//			{
//				
//				if(currentPageNumber==1)
//				{					
//
//				}
//				else
//				{
//					
//				}
//			}
//	);
	
}

/**
 * 该函数在页面加载时，初始化页面需要分页显示的信息
 */
function showShippingInformaton()
{
	
	//ask for the server to return the data to show
	
	var actionUrl = "getAllShipping.action";	 
	
	$.ajax( { // 获取物流信息
		url : actionUrl,
		type : "post",
		dataType : "json",
		error : function(data) 
		{
			alert("获取物流信息失败，请稍后再试!!!!");
		},
		success : function(data) 
		{
			var errCode=data.errCode;
			if(errCode==100) //it means that the data is wrong
			{
				var errMessage=data.errMessage;
				alert(errMessage);
				return;
			}
			//the following code is to show the  data  entireTransInfo
			var entireTransInfo=data.shippingInfo;
			
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

		}
	});// end of ajax

}

function addCountryInformation(flag)
{
//ask for the server to return the data to show
	//清空页面之中含有的国家信息
	$("#showCountryInfo").empty();
	$("#showTimeCountryInfo").empty();
	
	var actionUrl = "getAllShippingCountry.action";	 
	
	$.ajax( { // 获取物流信息
		url : actionUrl,
		type : "post",
		dataType : "json",
		error : function(data) 
		{
			alert("获取物流信息失败，请稍后再试!!!!");
		},
		success : function(data) 
		{
			var errCode=data.errCode;
			if(errCode==100) //it means that the data is wrong
			{
				var errMessage=data.errMessage;
				alert(errMessage);
				return;
			}
			//the following code is to show the  data  entireTransInfo
			var entireTransInfo=data.shippingInfo;
			
			var dataRowsLength = entireTransInfo.length;
			if(dataRowsLength==0)
			{
				//alert("暂时没有相应的信息");
				$("#showCountryInfo").html("暂时没有相应的国家信息，请添加");
				return;
			}
			
		//********************************************************这里的代码需要根据具体显示的数值改动
			var htmldata=buildUpCountryInformation(entireTransInfo);  //构建具体需要显示的信息
			//$("#ServiceProviderListId").
			//console.log("htmldata是：");
			//console.log(htmldata);
			if(flag=="fee")
			{
				
				document.getElementById("showCountryInfo").innerHTML=htmldata;
			}
			else if(flag=="time")
			{
				
				document.getElementById("showTimeCountryInfo").innerHTML=htmldata;
			}
		//********************************************************
			if(flag=="fee")
			{
				
				generateContentInPage(shipId);//当再次打开时，查找到页面之中保存的该物流方式的模板，添加到页面中
			}
			else if(flag=="time")
			{
				
				generateTimeContentInPage(shipId);//当再次打开时，查找到页面之中保存的该物流方式的时间模板，添加到页面中
			}
			

		}
	});// end of ajax
}
//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||显示国家的信息
function buildUpCountryInformation(entireTransInfoArgs)
{
	var entireTransInfo=entireTransInfoArgs;
	var dataRows = entireTransInfo.length;
	var html = "<span class='countrySpan'><input type='checkbox' id='selectCountryAll' name='selectCountryAll' onclick='javascript:selectCountryAll(this);'>全选</span>";
	for ( var i1 = 0; i1 < dataRows; i1++)
	{
		var allInfo=entireTransInfo[i1];
		var transInfo=allInfo;
		//add the td's info
		html+=generateXiangXiCountryInfo(transInfo);
	
	}//end of for
	return html;
}

function selectCountryAll(element)
{
	var selectAllFlag=$("#selectCountryAll").prop("checked");
	if(selectAllFlag =="checked" || selectAllFlag==true)
	{//点击了之后，有了选中的状态，说明之前是没有选中的，也就是点击之前没有任何一个元素选中，需要全部选中
		$(element).prop("checked",true);
		//把所有的都选中
		$(".mui_shippingCountry").each(function(i){
			$(this).prop("checked",true);
		});

		return;
	}
	else
	{//点击了之后，没有了选中的状态，说明之前是有选中的，也就是点击之前有元素选中，需要把选中的取消选中
		

		$(element).prop("checked",false);
		//把所有选中的都改为不选中
		$(".mui_shippingCountry:checked").each(function(i){
			$(this).prop("checked",false);
		});
		return;

	}
//	var flag=$(".mui_shipping:checked");
//	
//	if(flag!=undefined||flag!=null)
//	{//说明有的处于选择状态
//		
//	}
}

function selectOneCountryElement()
{//当选择一个全选按钮时，把全部选择按钮选中
	var selectAllFlag=$("#selectCountryAll").prop("checked");
	if(selectAllFlag =="checked" || selectAllFlag==true)
	{//说明已经有了选中的状态
		return;
	}
	else
	{
		$("#selectCountryAll").prop("checked",true);
	}
	
}

/**
 * 生成需要在表格中显示的具体信息
 * 参数格式为：
 * {"beizhu":"","createTime":"2014-10-14T14:30:08","id":1,"name":"ems","status":1}
 */
function generateXiangXiCountryInfo(transInfo)
{
	html="";
	html+="<span class='countrySpan'><input onclick='selectOneCountryElement()' type='checkbox' class='mui_shippingCountry' value='"+transInfo.id+"'  id='"+transInfo.id+"' name='"+transInfo.name+"'><span class='countryName'>"+transInfo.name+"</span></span>";
	return html;
}

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||END OF 显示国家信息

//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||这里的代码需要改动
/**
 * 该函数的作用是构建具体需要显示的信息
 * @param entireTransInfoArgs
 * @returns {String}
 */
function  buildUpInformation(entireTransInfoArgs)
{
//	console.log("yes!!!!!!!");
	var entireTransInfo=entireTransInfoArgs;
	var dataRows = entireTransInfo.length;
//	alert(dataRows);
	var html = "";
	html+="<table class='altrowstable'>";
	html+="<tr><td colspan='4' style='text-align: center;'>添加运费模版</td></tr>";
	html+="<tr><td colspan='2' style='text-align: right;'>输入运费模板名称:</td><td colspan='2' style=''><input type='text' id='shipTemplateName' name='shipTemplateName'/></td></tr>";
	html+="<tr><td class='fourColume1_1'><input type='checkbox' id='selectAll' name='selectAll' onclick='javascript:selectAll(this);'>全选</td><td class='fourColume2_1'>是否显示</td><td class='fourColume3_1'>运输费用设置</td><td class='fourColume4_1'>运输时间设置</td></tr>";
	for ( var i1 = 0; i1 < dataRows; i1++)
	{
		var allInfo=entireTransInfo[i1];
		var transInfo=allInfo;
		//add the td's info
		html+=generateXiangXiInfo(transInfo);
	
	}//end of for
	
	html+="<tr><td colspan='4' style='text-align: center;'><input type='button' onclick='javascript:saveAllShipTemplate()' value='保存' style='width: 60px;height: 26px;'></td></tr>";
	html+="</table>";
	return html;
}

/**
 * 保存模板
 */
function saveAllShipTemplate()
{
	var shipTemplateName=$("#shipTemplateName").val();
	if(shipTemplateName=="")
	{
		alert("请输入模板名称");
		return;
	}
	var selectShipArray=new Array();
	$(".mui_shipping:checked").each(function(i){
		
		var keyid=$(this).attr("keyid");
		selectShipArray.push(keyid);
	});
	
	checkShipTemplateInSelectShipArray(selectShipArray);
	var correctFlag=checkShipTemplateDateIsCorrect();
	if(!correctFlag)
	{//说明数据不合法，比如选择了自定义运费，但是没有任何自定义运费的信息
		return;
	}
	
	var actionUrl="saveAllShipTemplate.action";
	var tempshipTemplate=JSON.stringify(shipTemplate);
	var params={
			"shipTemplateName":shipTemplateName,
			"shipTemplate":tempshipTemplate
	}; 
	
	$.ajax( {
		url : actionUrl,
		data:params,
		type : "POST",
		dataType : "json",
		error : function() {
			alert("添加失败!!!!");
		},
		success : function(data) {
			alert("添加成功!!!!");
		}
	});//end of ajax
}
/**
 * 检查数据是否合法，比如选择了自定义运费，但是没有任何自定义运费的信息，这样的就是不合法的数据
 */
function checkShipTemplateDateIsCorrect()
{
	var shipTemplateLen=shipTemplate.length;
	for(var i=0;i<shipTemplateLen;i++)
	{
		var tempObj=shipTemplate[i];
		var tempId=tempObj.id;
		var shipStyle=tempObj.shipStyle;
		if(shipStyle==undefined || shipStyle==null)
		{
			var shipName=$(":checkbox[keyid="+tempId+"]").attr("name");
			var des=shipName+"没有定义运费，请设置！";
			alert(des);
			return false;
		}
		
		if(shipStyle=="1")
		{//说明选择的是自定义运费
			var shipMode=tempObj.shipMode;
			if(shipMode==undefined||tempObj==null)
			{
				var shipName=$(":checkbox[keyid="+tempId+"]").attr("name");
				var des=shipName+"没有自定义运费，请设置！";
				alert(des);
				return false;
			}
		}
		var timeStyle=tempObj.timeStyle;
		if(timeStyle==undefined || timeStyle==null)
		{
			var shipName=$(":checkbox[keyid="+tempId+"]").attr("name");
			var des=shipName+"没有定义运输时间，请设置！";
			alert(des);
			return false;
		}
		if(timeStyle=="1")
		{//说明选择的是自定义运输时间
			var timeMode=tempObj.timeMode;
			if(timeMode==undefined||timeMode==null)
			{
				var shipName=$(":checkbox[keyid="+tempId+"]").attr("name");
				var des=shipName+"没有自定义运达时间信息，请设置！";
				alert(des);
				return false;
			}
		}
	}
	return true;
}
/**
 * 查看shipTemplate中的元素是否在最后选择的需要保存的物流方式中，因为shipTemplate保存的数据是，曾经选择过的物流方式
 * @param selectShipArray
 */
function checkShipTemplateInSelectShipArray(selectShipArray)
{
	var noSelectShipArray=[]; //保存没有选择的物流方式，之后删除
	var shipTemplateLen=shipTemplate.length;
	for(var i=0;i<shipTemplateLen;i++)
	{
		var tempObj=shipTemplate[i];
		var tempId=tempObj.id;
		if(!contains(tempId,selectShipArray))
		{
			noSelectShipArray.push(i);
		}
	}
	//删除元素
	var noLen=noSelectShipArray.length;
	for(var j=0;j<noLen;j++)
	{
		var pos=noSelectShipArray[j];
		shipTemplate.splice(pos,1);
	}
	
}

function contains(obj,a) 
{
    for (var i = 0; i < a.length; i++) 
    {
        if (a[i] == obj) 
        {
            return true;
        }
    }
     
    return false;
}

function selectAll(element)
{
	var selectAllFlag=$("#selectAll").prop("checked");
	if(selectAllFlag =="checked" || selectAllFlag==true)
	{//点击了之后，有了选中的状态，说明之前是没有选中的，也就是点击之前没有任何一个元素选中，需要全部选中
		$(element).prop("checked",true);
		//把所有的都选中
		$(".mui_shipping").each(function(i){
			$(this).prop("checked",true);
		});

		return;
	}
	else
	{//点击了之后，没有了选中的状态，说明之前是有选中的，也就是点击之前有元素选中，需要把选中的取消选中
		

		$(element).prop("checked",false);
		//把所有选中的都改为不选中
		$(".mui_shipping:checked").each(function(i){
			$(this).prop("checked",false);
		});
		return;

	}
//	var flag=$(".mui_shipping:checked");
//	
//	if(flag!=undefined||flag!=null)
//	{//说明有的处于选择状态
//		
//	}
}

function selectOneElement(element)
{//当选择一个全选按钮时，把全部选择按钮选中

	
	
	var selectAllFlag=$("#selectAll").prop("checked");
	if(selectAllFlag =="checked" || selectAllFlag==true)
	{//说明已经有了选中的状态
		
	}
	else
	{
		$("#selectAll").prop("checked",true);
	}
	
	//把该货运方式对应的设置时间的按钮和设置货运方式的按钮设为可用
	var keyid=element.getAttribute("keyid");  //说明操作的是哪一个货运方式的模板内容
	//$("'#"+keyid+"cost"+"'").prop("disabled",);
	var feeRadioName=keyid+"cost";
	var timeRadioName=keyid+"time";
	var timeInput=keyid+"_arrivetime";
	
	//$(':radio').prop("disabled","");
	//获取本元素的选中状态
	var checkedFlag=$(element).prop("checked");
	if(checkedFlag)
	{//说明先前没有选中
		
		$("input:radio[name="+feeRadioName+"]").prop("disabled","");
		$("input:radio[name="+timeRadioName+"]").prop("disabled","");
		$("#"+timeInput).prop("disabled","");
	}
	else
	{//说明先前选中了
		
		$("input:radio[name="+feeRadioName+"]").prop("disabled",true);
		$("input:radio[name="+timeRadioName+"]").prop("disabled",true);
		$("#"+timeInput).prop("disabled",true);
	}
	
}

/**
 * 生成需要在表格中显示的具体信息
 * 参数格式为：
 * {"beizhu":"","createTime":"2014-10-14T14:30:08","id":1,"name":"ems","status":1}
 */
function generateXiangXiInfo(transInfo)
{
	html="";
	html+="<tr class='mui_row'><td class='fourColume1_1 mui_name'><input onclick='selectOneElement(this)' type='checkbox' class='mui_shipping' keyid='"+transInfo.id+"' name='"+transInfo.name+"'>"+transInfo.name+"</td><td class='fourColume2_1  mui_status'>"+showConvert(transInfo.status)+"</td><td class='fourColume3_1 mui_beizhu'>"+shipFeeOperate(transInfo.id)+"</td><td class='fourColume4_1 mui_operate'>"+shipTimeOperate(transInfo.id)+"</td></tr>";
	return html;
}
function showConvert(status)
{
	html="";
	if(status==0)
	{
		html+="不显示";
	}
	else
	{
		html+="显示";
	}
	return html;
}
function shipFeeOperate(id)
{
	html="<font style='font-weight:bold;'>运费设置:</font>";
	html+="<input type='radio'  name='"+id+"cost"+"' onchange='openFeeWindowRadio(this);' value=0 keyid='"+id+"' disabled='true'>卖家承担运费";
	html+="<input type='radio'  name='"+id+"cost"+"' onchange='openFeeWindowRadio(this);' value=1 keyid='"+id+"' disabled='true'><a href='javascript:void(0)' onclick='javascript:openFeeWindow(this);return false' value="+id+">自定义运费</a>";

	return html;
}
function shipTimeOperate(id)
{
	html="<font style='font-weight:bold;'>运输时间设置:</font>";
	html+="<input type='radio'  name='"+id+"time"+"' onchange='openTimeWindowRadio(this);' value=0 keyid='"+id+"' disabled>承诺运达时间<input type='text' id='"+id+"_arrivetime"+"'  name='arrivetime' maxlength='2' value='15' style='width: 36;' disabled='true'>天";
	html+="<input type='radio'  name='"+id+"time"+"' onchange='openTimeWindowRadio(this);' value=1 keyid='"+id+"' disabled><a href='javascript:void(0)' onclick='javascript:openTimeWindow(this);return false' value="+id+">自定义运达时间</a>";

	return html;
}
function openFeeWindowRadio(element)
{
	
	var flag=0;//说明在shipTemplate元素中，是否找到了相应的元素对象
	
	var feeRadioFlag=element.value;
	// var keyid=element.attributes["keyid"].nodeValue;
	var keyid=element.getAttribute("keyid");  //说明操作的是哪一个货运方式的模板内容
	//alert("Fee Window Open keyid="+keyid);
	var shipTemplateLength=shipTemplate.length;
	
	if(feeRadioFlag==0)
	{//说明是卖家承担运费，需要删除以前的这个对象中的shipMode变量
		for(var i=0;i<shipTemplateLength;i++)
		{
			var tempid=shipTemplate[i].id;
			if(tempid==keyid)
			{//说明找到了这个货运的信息
				
				shipTemplate[i].shipStyle=feeRadioFlag;//改变货运方式（1：卖家承担运费，2：自定义运费）
			
				var tempShipMode=shipTemplate[i].shipMode;
				
				if(tempShipMode!=undefined&&tempShipMode!=null)
				{//说明还没有时间模板的信息，需要从新生成
					//delete(shipTemplate[i].shipMode);
				}
				
				
				flag=1;
				
				break;
			}
		}
	}
	else if(feeRadioFlag==1)
	{//说明是自定义运费
		
		for(var i=0;i<shipTemplateLength;i++)
		{
			var tempid=shipTemplate[i].id;
			if(tempid==keyid)
			{//说明找到了这个货运的信息
				
				shipTemplate[i].shipStyle=feeRadioFlag;//改变货运方式（1：卖家承担运费，2：自定义运费）
				
				
				flag=1;
				
				break;
			}
		}
	}
	
	//如果flag==0，说明在shipTemplate中，没有相应的信息，需要生成
	if(flag==0)
	{
		var entirInfo={};
		entirInfo.id=keyid;
		entirInfo.shipStyle=feeRadioFlag;//改变货运方式
		
		shipTemplate.push(entirInfo);
	}
}

function openTimeWindowRadio(element)
{
	var flag=0;//说明在shipTemplate元素中，是否找到了相应的元素对象
	
	var timeRadioFlag=element.value;
	// var keyid=element.attributes["keyid"].nodeValue;
	var keyid=element.getAttribute("keyid");  //说明操作的是哪一个货运方式的模板内容
	//alert("Time Window Open keyid="+keyid);
	var shipTemplateLength=shipTemplate.length;
	
	if(timeRadioFlag==0)
	{//说明是所有的国家都是同一个时间，需要删除以前的这个对象中的timeMode变量
		for(var i=0;i<shipTemplateLength;i++)
		{
			var tempid=shipTemplate[i].id;
			if(tempid==keyid)
			{//说明找到了这个货运的信息
				
				shipTemplate[i].timeStyle=timeRadioFlag;//改变货运送到时间（1：所有的国家都是同一个时间，2：自定义时间）
				
				var idString=keyid+"_arrivetime";
				var time=$("#"+idString).val();
				shipTemplate[i].time=time;//
			
				var tempTimeMode=shipTemplate[i].timeMode;
				
				if(tempTimeMode!=undefined&&tempTimeMode!=null)
				{//
					//delete(shipTemplate[i].timeMode);
				}
				
				
				flag=1;
				
				break;
			}
		}
	}
	else if(timeRadioFlag==1)
	{//说明是自定义承诺到达时间
		
		for(var i=0;i<shipTemplateLength;i++)
		{
			var tempid=shipTemplate[i].id;
			if(tempid==keyid)
			{//说明找到了这个货运的信息
				
				shipTemplate[i].timeStyle=timeRadioFlag;//改变货运送到时间（1：所有的国家都是同一个时间，2：自定义时间）
				
				
				flag=1;
				
				break;
			}
		}
	}
	
	//如果flag==0，说明在shipTemplate中，没有相应的信息，需要生成
	if(flag==0)
	{
		var entirInfo={};
		entirInfo.id=keyid;
		entirInfo.timeStyle=timeRadioFlag;//改变货运送到时间
		
		var idString=keyid+"_arrivetime";
		var time=$("#"+idString).val();
		entirInfo.time=time;//
		
		shipTemplate.push(entirInfo);
	}
}

function openFeeWindow(element)
{
	shipId=$(element).attr("value");//保存正在编辑的货运方式的id
	var nameValue=shipId+"cost";
	var radioFlag=$(":radio[name='"+nameValue+"']:checked").val();
	
	var checkedFlag=$(":checkbox[keyid="+shipId+"]").prop("checked"); //查看相应的复选框的选中状态，如果选中了，才能打开运费（时间）设置对话框


		

	
	if(radioFlag==undefined||radioFlag==0||!checkedFlag)
	{
		return;
	}
	
	$("#logistic-groups").css("display","");//显示可以编辑的列表
	
	editFlag=0;//当点击确定按钮时，确认是要保存一个新的运输方式，还是针对以前的运输方式进行修改,0表明是添加新的，1表明是编辑
	
	clearContentInPage();//每次打开时，把页面中相应div的内容清空
	
	
	
	
	
	addCountryInformation("fee"); //添加国家信息
	dialog.dialog( "open" );
}

function openTimeWindow(element)
{
	shipId=$(element).attr("value");//保存正在编辑的货运方式的id
	var nameValue=shipId+"time";
	var radioFlag=$(":radio[name='"+nameValue+"']:checked").val();
	
	var checkedFlag=$(":checkbox[keyid="+shipId+"]").prop("checked"); //查看相应的复选框的选中状态，如果选中了，才能打开运费（时间）设置对话框

	if(radioFlag==undefined||radioFlag==0||!checkedFlag)
	{
		return;
	}
	
	$("#logistic-time-groups").css("display","");//显示可以编辑的列表
	
	editTimeFlag=0;//当点击确定按钮时，确认是要保存一个新的运输方式，还是针对以前的运输方式进行修改,0表明是添加新的，1表明是编辑
	
	clearContentInPage();//每次打开时，把页面中相应div的内容清空
	
	shipId=$(element).attr("value");//保存正在编辑的货运方式的id
	
	addCountryInformation("time"); //添加国家信息
	
	timedialog.dialog( "open" );
}

function clearContentInPage()
{
	$("#logistic-groups").empty();//清空运费模板的内容
	
	$("#logistic-time-groups").empty();//清空时间模板的内容
	
}
/**
 * //当再次打开时，查找到页面之中保存的该物流方式的模板，添加到页面中
 * @param shipId
 */
function generateContentInPage(shipIdArgs)
{
	var len=shipTemplate.length;
	for(var i=0;i<len;i++)
	{
		var tempObj=shipTemplate[i];
		if(tempObj.id==shipIdArgs)
		{//如果相等，说明找到了这个id
			var tempShipMode=tempObj.shipMode;
			if(tempShipMode!=undefined&&tempShipMode!=null)
			{				
				var htmlcontent=generateContent(shipIdArgs,tempShipMode);
				$("#logistic-groups").append(htmlcontent);
			}
			break;
			
		}
	}
}

function generateTimeContentInPage(shipIdArgs)
{
	var len=shipTemplate.length;
	for(var i=0;i<len;i++)
	{
		var tempObj=shipTemplate[i];
		if(tempObj.id==shipIdArgs)
		{//如果相等，说明找到了这个id
			var tempTimeMode=tempObj.timeMode;
			if(tempTimeMode!=undefined&&tempTimeMode!=null)
			{
				
				var htmlcontent=generateTimeContent(shipIdArgs,tempTimeMode);
				$("#logistic-time-groups").append(htmlcontent);
			}
			break;
			
		}
	}
}

function generateContent(shipIdArgs,tempShipMode)
{
	shipDecription="";
	var len=tempShipMode.length;
	for(var i=0;i<len;i++)
	{
		var tempObj=tempShipMode[i];
		shipDecription+="<li style='z-index:9999;' class='logistic-li-tpl new-row standards'><span class='index serial'></span>";
		shipDecription+="<span class='title'><span class='title-content'>";
		var tempselectCountryIds=tempObj.shippingCountryIds;
		var tempCountryArray=tempselectCountryIds.split("|");
		var lenflag;
		if(tempCountryArray.length>3)
		{
			lenflag=3;
		}
		else
		{
			lenflag=tempCountryArray.length;
		}
		for(var j=0;j<lenflag;j++)
		{	
			var tempCountryId=tempCountryArray[j];
			shipDecription+=$("input:checkbox[value="+tempCountryId+"]").next('.countryName').html()+",";
			$("input:checkbox[value="+tempCountryId+"]").prop("checked",true);
			$("input:checkbox[value="+tempCountryId+"]").removeClass("mui_shippingCountry");//
			$("input:checkbox[value="+tempCountryId+"]").prop("disabled",true);
		}
		shipDecription+="...</span></span>";
		var flag=tempObj.selectShipMode;
		if(flag==1)
		{//说明选择的是标准运费
			
			var standardFee=tempObj.standardInfo;//标准运费

			shipDecription+="<span class='logistic_info remark'>标准运费("+standardFee+"$)</span>";
			

		}
		else
		{//说明选择的是自定义运费
			var qwFlag=tempObj.selectQWMode;  //按照重量，还是按照数量选择
			if(qwFlag==1)
			{//说明选择的是按照数量
				shipDecription+="<span class='logistic_info remark'>自定义运费(按照数量)</span>";
			}
			else
			{//说明选择的是按照重量
				shipDecription+="<span class='logistic_info remark'>自定义运费(按照重量)</span>";
			}

		}//end of 自定义运费
		
		//生成在页面中标示某一个元素的主键，改主键的格式如下：id（所编辑的货运方式的id），"shippingCountryIds":所选择国家的id(中间用"|"隔开)
		var key=shipIdArgs+","+tempselectCountryIds;
		//生成编辑的信息
		shipDecription+="<span class='actions'><a href='javascript:void(0);' onclick='javascript:deleteShipTemplateInThePage(this);' class='remove-group'  key='"+key+"'>删除</a></span>";
		shipDecription+="<span class='actions'><a href='javascript:void(0);' onclick='javascript:editShipTemplateInThePage(this);' class='edit-group'  key='"+key+"'> 编辑</a></span>";
		shipDecription+="</li>";
		
		
	}
	
	return shipDecription;

}


function generateTimeContent(shipIdArgs,tempTimeMode)
{
	shipDecription="";
	var len=tempTimeMode.length;
	for(var i=0;i<len;i++)
	{
		var tempObj=tempTimeMode[i];
		shipDecription+="<li style='z-index:9999;' class='logistic-li-tpl new-row standards'><span class='index serial'></span>";
		shipDecription+="<span class='title'><span class='title-content'>";
		var tempselectCountryIds=tempObj.shippingCountryIds;
		var tempCountryArray=tempselectCountryIds.split("|");
		var lenflag;
		if(tempCountryArray.length>3)
		{
			lenflag=3;
		}
		else
		{
			lenflag=tempCountryArray.length;
		}
		for(var j=0;j<lenflag;j++)
		{	
			var tempCountryId=tempCountryArray[j];
			shipDecription+=$("input:checkbox[value="+tempCountryId+"]").next('.countryName').html()+",";
			$("input:checkbox[value="+tempCountryId+"]").prop("checked",true);
			$("input:checkbox[value="+tempCountryId+"]").removeClass("mui_shippingCountry");//
			$("input:checkbox[value="+tempCountryId+"]").prop("disabled",true);
		}
		shipDecription+="...</span></span>";
		var time=tempObj.time;

		shipDecription+="<span class='logistic_info remark'>运输时间("+time+"天)</span>";
		
		//生成在页面中标示某一个元素的主键，改主键的格式如下：id（所编辑的货运方式的id），"shippingCountryIds":所选择国家的id(中间用"|"隔开)
		var key=shipIdArgs+","+tempselectCountryIds;
		//生成编辑的信息
		shipDecription+="<span class='actions'><a href='javascript:void(0);' onclick='javascript:deleteTimeTemplateInThePage(this);' class='remove-group'  key='"+key+"'>删除</a></span>";
		shipDecription+="<span class='actions'><a href='javascript:void(0);' onclick='javascript:editTimeTemplateInThePage(this);' class='edit-group'  key='"+key+"'> 编辑</a></span>";
		shipDecription+="</li>";
		
		
	}
	
	return shipDecription;
}

//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| end of 这里的代码需要改动

//根绝用户选择运费模版的不同，显示不同的设置内容
function selectModeChange()
{
	var flag=$("#selectMode").val();
	//	console.log(flag);
	if(flag==1)
	{//说明选择的是标准运费
		//需要隐藏的选项
		$("#selectQWPattern").css("display","none");// 隐藏数量/重量选择框
		$("#quanaityInfo").css("display","none");//
		$("#weightInfo").css("display","none");// 
		
		//需要显示的选项
		$("#standardInfo").css("display","");
		
	}
	else
	{//说明选择的是自定义运费
		//需要显示的选项
		$("#selectQWPattern").css("display","");// 隐藏数量/重量选择框
		$("#selectQWPattern").val("1");//把该多选框的值改为按照数量选择
		$("#quanaityInfo").css("display","");//
		$("#weightInfo").css("display","none");// 
		
		//需要隐藏显示的选项
		$("#standardInfo").css("display","none");
	}
}
//
function selectQWPatternChange()
{
	var flag=$("#selectQWPattern").val();  //按照重量，还是按照数量选择
	//	console.log(flag);
	if(flag==1)
	{//说明选择的是按照数量
		//需要隐藏的选项
		$("#quanaityInfo").css("display","");//
		$("#weightInfo").css("display","none");// 
	}
	else
	{//说明选择的是按照重量
		//需要显示的选项
		$("#quanaityInfo").css("display","none");//
		$("#weightInfo").css("display","");// 
	}
}

function changeValue(element)
{
	var tempValue=$(element).val();
	$("#weight-start-1").val(tempValue);
}

//********************************************************************************************
/**
 * the global Variable
 * 页面显示相关
 */
var dialog;//此变量的作用是，根据用户的点击事件（如当点击编辑按钮的时候）出现相应的对话框，该变量保存编辑信息的对话框
var editElement;//此变量的作用是记录当前需要修改的是哪一行，当用户修改完成之后，把相应的内容更行至相应的表格中

//********************************************************************************************

$(document).ready(function () {
	registerEventListerAddInPage();//给网页的元素添加注册事件，和分页没有关系，可以根据不同的情况删除该函数
});

function registerEventListerAddInPage()
{
	//编辑运费的对话框
	dialog = $("#shipTemplate").dialog({
	      autoOpen: false,
	      closeText: "hide",
	      height: "auto",
	      width: "800px",
	      modal: true,
	      buttons: {
	       "保存": add_shipping,
	       "取消": function() {
	          dialog.dialog( "close" );
	        }
	      },
	      close: function() {
//	        form[ 0 ].reset();
//	        allFields.removeClass( "ui-state-error" );
	    	 // alert("关闭");
	    	  editFlag=0;//当点击确定按钮时，确认是要保存一个新的运输方式，还是针对以前的运输方式进行修改,0表明是添加新的，1表明是编辑
	      }
	    });
	
	//编辑时间的对话框
	timedialog = $("#shipTimeTemplate").dialog({
	      autoOpen: false,
	      closeText: "hide",
	      height: "auto",
	      width: "800px",
	      modal: true,
	      buttons: {
	       "保存": add_time_shipping,
	       "取消": function() {
	    	   timedialog.dialog( "close" );
	        }
	      },
	      close: function() {
//	        form[ 0 ].reset();
//	        allFields.removeClass( "ui-state-error" );
	    	 // alert("关闭");
	    	  editFlag=0;//当点击确定按钮时，确认是要保存一个新的时间，还是针对以前的时间进行修改,0表明是添加新的，1表明是编辑
	      }
	    });
}

function add_time_shipping()
{
	if(editFlag==0)
	{//表明是添加
		//每次加入的时候都把这个变量重新赋值
		shipDecription="<li style='z-index:9999;' class='logistic-li-tpl new-row standards'><span class='index serial'></span>";
		shipDecription+="<span class='title'><span class='title-content'>";
		shippingCountryIds="";//每次添加之前先清空
		//获取所有的选择的国家，加入全局变量selectCountryIds中
		$(".mui_shippingCountry:checked").each(function(i){
			var tempCountryId=$(this).val();
			$(this).removeClass("mui_shippingCountry");//把每一个都设置为disabled
			$(this).prop("disabled",true);//把每一个都设置为disabled
			
			if(i==0)
			{//第一个
				shippingCountryIds=tempCountryId;
				
				shipDecription+=$(this).next('.countryName').html();
			}
			else
			{
				shippingCountryIds=shippingCountryIds+"|"+tempCountryId;
				if(i<3)
				{
					shipDecription+=","+$(this).next('.countryName').html();
				}
				
			}
		});
		shipDecription+="...</span></span>";
		
		if(shippingCountryIds==""||shippingCountryIds==null||shippingCountryIds==undefined)
		{
			alert("还没有选择相应的国家，请选择国家");
			return;
		}
		
		handleTimeXiangXiInfo();
	}
	else
	{//表明是编辑
		shippingCountryIds="";//每次添加之前先清空
		//获取所有的选择的国家，加入全局变量selectCountryIds中
		$(".mui_shippingCountry:checked").each(function(i){
			var tempCountryId=$(this).val();
			$(this).removeClass("mui_shippingCountry");//把每一个都设置为disabled
			$(this).prop("disabled",true);//把每一个都设置为disabled
			
			if(i==0)
			{//第一个
				shippingCountryIds=tempCountryId;
				
				shipDecription+=$(this).next('.countryName').html();
			}
			else
			{
				shippingCountryIds=shippingCountryIds+"|"+tempCountryId;
				if(i<3)
				{
					shipDecription+=","+$(this).next('.countryName').html();
				}
				
			}
		});
		
		if(shippingCountryIds==""||shippingCountryIds==null||shippingCountryIds==undefined)
		{
			alert("还没有选择相应的国家，请选择国家");
			return;
		}
		
		handleTimeXiangXiInfo();
		
		editFlag=0;//编辑完了之后重新设置为添加状态
	}
	
	$("#logistic-time-groups").css("display","");//显示可以编辑的列表
}

function add_shipping()
{
	if(editFlag==0)
	{//表明是添加
		//每次加入的时候都把这个变量重新赋值
		shipDecription="<li style='z-index:9999;' class='logistic-li-tpl new-row standards'><span class='index serial'></span>";
		shipDecription+="<span class='title'><span class='title-content'>";
		shippingCountryIds="";//每次添加之前先清空
		//获取所有的选择的国家，加入全局变量selectCountryIds中
		$(".mui_shippingCountry:checked").each(function(i){
			var tempCountryId=$(this).val();
			$(this).removeClass("mui_shippingCountry");//把每一个都设置为disabled
			$(this).prop("disabled",true);//把每一个都设置为disabled
			
			if(i==0)
			{//第一个
				shippingCountryIds=tempCountryId;
				
				shipDecription+=$(this).next('.countryName').html();
			}
			else
			{
				shippingCountryIds=shippingCountryIds+"|"+tempCountryId;
				if(i<3)
				{
					shipDecription+=","+$(this).next('.countryName').html();
				}
				
			}
		});
		shipDecription+="...</span></span>";
		
		if(shippingCountryIds==""||shippingCountryIds==null||shippingCountryIds==undefined)
		{
			alert("还没有选择相应的国家，请选择国家");
			return;
		}
		
		handleXiangXiInfo();
	}
	else
	{//表明是编辑
		shippingCountryIds="";//每次添加之前先清空
		//获取所有的选择的国家，加入全局变量selectCountryIds中
		$(".mui_shippingCountry:checked").each(function(i){
			var tempCountryId=$(this).val();
			$(this).removeClass("mui_shippingCountry");//把每一个都设置为disabled
			$(this).prop("disabled",true);//把每一个都设置为disabled
			
			if(i==0)
			{//第一个
				shippingCountryIds=tempCountryId;
				
				shipDecription+=$(this).next('.countryName').html();
			}
			else
			{
				shippingCountryIds=shippingCountryIds+"|"+tempCountryId;
				if(i<3)
				{
					shipDecription+=","+$(this).next('.countryName').html();
				}
				
			}
		});
		
		if(shippingCountryIds==""||shippingCountryIds==null||shippingCountryIds==undefined)
		{
			alert("还没有选择相应的国家，请选择国家");
			return;
		}
		
		handleXiangXiInfo();
		
		editFlag=0;//编辑完了之后重新设置为添加状态
	}
	
	$("#logistic-groups").css("display","");//显示可以编辑的列表
}
/**
 * 根据用户选择的具体内容，获取相应的信息
 */
function handleXiangXiInfo()
{
	var obj={};//保存相应的信息
	shipTemplateName=$("#shipTemplateName").val();//运费模版名称
	
	var flag=$("#selectMode").val();
	//	console.log(flag);
	if(flag==1)
	{//说明选择的是标准运费
		
		
		obj.shippingCountryIds=shippingCountryIds;
		obj.selectShipMode=flag;
		
		var standardFee=$("#standardFee").val();//标准运费
		if(standardFee==""||standardFee==null)
		{
			alert("请填写标准运费");
			return;
		}
		obj.standardInfo=standardFee;

		shipDecription+="<span class='logistic_info remark'>标准运费("+standardFee+"$)</span>";
		

	}
	else
	{//说明选择的是自定义运费
		var qwFlag=$("#selectQWPattern").val();  //按照重量，还是按照数量选择
		//	console.log(flag);
		if(qwFlag==1)
		{//说明选择的是按照数量
			
			shipDecription+="<span class='logistic_info remark'>自定义运费(按照数量)</span>";
			
			var cl_min=$("#cl_min").val();
			var cl_max=$("#cl_max").val();
			var cl_price=$("#cl_price").val();
			var cl_add_num=$("#cl_add_num").val();
			var cl_add_price=$("#cl_add_price").val();
			
			obj.shippingCountryIds=shippingCountryIds;
			obj.selectShipMode=flag;
			obj.selectQWMode=qwFlag;
			
			var tempquanaityInfo={};
			tempquanaityInfo.cl_min=cl_min;
			tempquanaityInfo.cl_max=cl_max;
			tempquanaityInfo.cl_price=cl_price;
			tempquanaityInfo.cl_add_num=cl_add_num;
			tempquanaityInfo.cl_add_price=cl_add_price;
			obj.quanaityInfo=tempquanaityInfo;
			
			
			
		}
		else
		{//说明选择的是按照重量
			
			shipDecription+="<span class='logistic_info remark'>自定义运费(按照重量)</span>";
			
			var weight_end0=$("#weight-end-0").val();
			var weight_price0=$("#weight-price-0").val();
			var weight_end1=$("#weight-end-1").val();
			var weight_interval1=$("#weight-interval-1").val();
			var weight_price1=$("#weight-price-1").val();
			

			obj.shippingCountryIds=shippingCountryIds;
			obj.selectShipMode=flag;
			obj.selectQWMode=qwFlag;
			
			var tempweightInfo={};
			tempweightInfo.weight_end_0=weight_end0;
			tempweightInfo.weight_price_0=weight_price0;
			tempweightInfo.weight_end_1=weight_end1;
			tempweightInfo.weight_interval_1=weight_interval1;
			tempweightInfo.weight_price_1=weight_price1;
			obj.weightInfo=tempweightInfo;
			
			

		}

	}
	
	//shipTemplate中插入相应的信息
	insertShipTemplateElement(obj);
}

function handleTimeXiangXiInfo()
{
	var obj={};//保存相应的信息
	shipTemplateName=$("#shipTemplateName").val();//运费模版名称
	
	
	
	obj.shippingCountryIds=shippingCountryIds;
	
	var time=$("#shipping-time").val();//时间
	if(time==""||time==null)
	{
		alert("请填写时间");
		return;
	}
	obj.time=time;

	shipDecription+="<span class='logistic_info remark'>运输时间("+time+"天)</span>";

	
	//shipTemplate中插入相应的信息
	insertTimeTemplateElement(obj);
}

function insertTimeTemplateElement(obj)
{
	if(editFlag==0)
	{//说明是重新添加数据
		var flag=0;//代表在以前的数据中是否有这个时间模板的信息
		//shipTemplate中插入相应的信息
		var shipTemplateLength=shipTemplate.length;
		for(var i=0;i<shipTemplateLength;i++)
		{
			var tempid=shipTemplate[i].id;
			if(tempid==shipId)
			{//说明已经有了这个货运的信息
				var tempTimeMode=shipTemplate[i].timeMode;
				if(tempTimeMode==undefined||tempTimeMode==null)
				{//说明还没有时间模板的信息，需要从新生成
					var tempTimeModeToAdd=[];
					tempTimeModeToAdd.push(obj);
					shipTemplate[i].timeMode=tempTimeModeToAdd;
				}
				else
				{
					tempTimeMode.push(obj);
					
				}
				flag=1;
				break;
			}
		}
		//如果flag==0，说明在shipTemplate中，没有相应的信息，需要生成
		if(flag==0)
		{
			
			var entirInfo={};
			entirInfo.id=shipId;
			var tempTimeMode=[];
			tempTimeMode.push(obj);
			entirInfo.timeMode=tempTimeMode;
			
			shipTemplate.push(entirInfo);
		}
		

	
		//生成在页面中标示某一个元素的主键，改主键的格式如下：id（所编辑的货运方式的id），"shippingCountryIds":所选择国家的id(中间用"|"隔开)
		var key=shipId+","+shippingCountryIds;
		//生成编辑的信息
		shipDecription+="<span class='actions'><a href='javascript:void(0);' onclick='javascript:deleteTimeTemplateInThePage(this);' class='remove-group'  key='"+key+"'>删除</a></span>";
		shipDecription+="<span class='actions'><a href='javascript:void(0);' onclick='javascript:editTimeTemplateInThePage(this);' class='edit-group'  key='"+key+"'> 编辑</a></span>";
		shipDecription+="</li>";
		$("#logistic-time-groups").append(shipDecription);
	}
	else if(editFlag==1)
	{//说明是编辑的数据重新添加数据
		//shipTemplate中插入相应的信息
		var shipTemplateLength=shipTemplate.length;
		for(var i=0;i<shipTemplateLength;i++)
		{
			var tempid=shipTemplate[i].id;
			if(tempid==editId)
			{//说明已经有了这个货运的信息
				var tempTimeMode=shipTemplate[i].timeMode;
				tempTimeMode.splice(editPos,1); //删除需要编辑的元素，然后重新添加新的
				tempTimeMode.push(obj);
				break;
			}
		}
		//生成在页面中标示某一个元素的主键，改主键的格式如下：id（所编辑的货运方式的id），"shippingCountryIds":所选择国家的id(中间用"|"隔开)
		var key=editId+","+shippingCountryIds;
		$(editElement).attr("key",key);
		
	}//end of else if(editFlag==1)
}

function insertShipTemplateElement(obj)
{
	if(editFlag==0)
	{//说明是重新添加数据
		var flag=0;//代表在以前的数据中是否有这个货运的信息
		//shipTemplate中插入相应的信息
		var shipTemplateLength=shipTemplate.length;
		for(var i=0;i<shipTemplateLength;i++)
		{
			var tempid=shipTemplate[i].id;
			if(tempid==shipId)
			{//说明已经有了这个货运的信息
				var tempShipMode=shipTemplate[i].shipMode;
				if(tempShipMode==undefined||tempShipMode==null)
				{//说明还没有时间模板的信息，需要从新生成
					var tempShipModeToAdd=[];
					tempShipModeToAdd.push(obj);
					shipTemplate[i].shipMode=tempShipModeToAdd;
				}
				else
				{
					tempShipMode.push(obj);
					
				}
				flag=1;
				break;
			}
		}
		//如果flag==0，说明在shipTemplate中，没有相应的信息，需要生成
		if(flag==0)
		{
			
			var entirInfo={};
			entirInfo.id=shipId;
			var tempShipMode=[];
			tempShipMode.push(obj);
			entirInfo.shipMode=tempShipMode;
			
			shipTemplate.push(entirInfo);
		}
		

	
		//生成在页面中标示某一个元素的主键，改主键的格式如下：id（所编辑的货运方式的id），"shippingCountryIds":所选择国家的id(中间用"|"隔开)
		var key=shipId+","+shippingCountryIds;
		//生成编辑的信息
		shipDecription+="<span class='actions'><a href='javascript:void(0);' onclick='javascript:deleteShipTemplateInThePage(this);' class='remove-group'  key='"+key+"'>删除</a></span>";
		shipDecription+="<span class='actions'><a href='javascript:void(0);' onclick='javascript:editShipTemplateInThePage(this);' class='edit-group'  key='"+key+"'> 编辑</a></span>";
		shipDecription+="</li>";
		$("#logistic-groups").append(shipDecription);
	}
	else if(editFlag==1)
	{//说明是编辑的数据重新添加数据
		//shipTemplate中插入相应的信息
		var shipTemplateLength=shipTemplate.length;
		for(var i=0;i<shipTemplateLength;i++)
		{
			var tempid=shipTemplate[i].id;
			if(tempid==editId)
			{//说明已经有了这个货运的信息
				var tempShipMode=shipTemplate[i].shipMode;
				tempShipMode.splice(editPos,1); //删除需要编辑的元素，然后重新添加新的
				tempShipMode.push(obj);
				break;
			}
		}
		//生成在页面中标示某一个元素的主键，改主键的格式如下：id（所编辑的货运方式的id），"shippingCountryIds":所选择国家的id(中间用"|"隔开)
		var key=editId+","+shippingCountryIds;
		$(editElement).attr("key",key);
		
	}//end of else if(editFlag==1)
	
	
}

function editShipTemplateInThePage(element)
{
	$("#logistic-groups").css("display","none");//隐藏可以编辑的列表,防止多次点击编辑
	
	editFlag=1;//标明是在编辑状态，此变量在shiptemplate中
	editElement=element;//此变量在shiptemplate中
	
	var key=$(element).attr("key");//获取所要编辑的货运模版的key
	var splitKey=key.split(","); //用逗号分割这个key，第一项是shipId，第二项是：shippingCountryIds
	
	var shipTemplateLength=shipTemplate.length;
	for(var i=0;i<shipTemplateLength;i++)
	{
		var tempid=shipTemplate[i].id;
		if(tempid==splitKey[0])
		{//说明是这个货运方式之中的某一个货运模版
			editId=tempid;//编辑的这个id中的货运模版，此变量在shiptemplate中
			
			var tempShipMode=shipTemplate[i].shipMode;
			var tempShipModeLength=tempShipMode.length;
			for(var j=0;j<tempShipModeLength;j++)
			{
				var tempselectCountryIds=tempShipMode[j].shippingCountryIds;
				if(tempselectCountryIds==splitKey[1])
				{//说明找到了需要编辑的模版
					
					editPos=j;//编辑的这个id中的货运模版，此变量在shiptemplate中
					
					setParmsInThePage(tempShipMode[j]);
					break;
				}
			}
		}
	}
	
	
}

function deleteShipTemplateInThePage(element)
{
	 if(confirm("是否删除?"))
	{
		 	var key=$(element).attr("key");//获取所要编辑的货运模版的key
			var splitKey=key.split(","); //用逗号分割这个key，第一项是shipId，第二项是：shippingCountryIds
			
			var shipTemplateLength=shipTemplate.length;
			for(var i=0;i<shipTemplateLength;i++)
			{
				var tempid=shipTemplate[i].id;
				if(tempid==splitKey[0])
				{//说明是这个货运方式之中的某一个货运模版
					
					
					var tempShipMode=shipTemplate[i].shipMode;
					var tempShipModeLength=tempShipMode.length;
					for(var j=0;j<tempShipModeLength;j++)
					{
						var tempselectCountryIds=tempShipMode[j].shippingCountryIds;
						if(tempselectCountryIds==splitKey[1])
						{//说明找到了需要编辑的模版
							setShipParmsUnDisableInThePage(tempShipMode[j]);
							tempShipMode.splice(j,1); //删除这个元素
							$(element).parents(".new-row").remove();
							break;
						}
					}
				}
			}
	}

}
/**
 * 把以前设为不可用的国家设为可用
 */
function setShipParmsUnDisableInThePage(shipModeElement)
{
	var tempselectCountryIds=shipModeElement.shippingCountryIds;
	var tempCountry=tempselectCountryIds.split("|");
	var len=tempCountry.length;
	for(var i=0;i<len;i++)
	{
		tempid=tempCountry[i];
		//把该种方式所对应国家的复选框设定为可选，去除disable属性，同时加上名字为mui_shippingCountry的class
		$("input:checkbox[value='"+tempid+"']").addClass("mui_shippingCountry");//把每一个都设置为disabled
		$("input:checkbox[value='"+tempid+"']").prop("disabled",false);//去除disable
	}
}
function editTimeTemplateInThePage(element)
{
	$("#logistic-time-groups").css("display","none");//隐藏可以编辑的列表,防止多次点击编辑
	
	editFlag=1;//标明是在编辑状态，此变量在shiptemplate中
	editElement=element;//此变量在shiptemplate中
	
	var key=$(element).attr("key");//获取所要编辑的货运模版的key
	var splitKey=key.split(","); //用逗号分割这个key，第一项是shipId，第二项是：shippingCountryIds
	
	var shipTemplateLength=shipTemplate.length;
	for(var i=0;i<shipTemplateLength;i++)
	{
		var tempid=shipTemplate[i].id;
		if(tempid==splitKey[0])
		{//说明是这个货运方式之中的某一个时间模版
			editId=tempid;//编辑的这个id中的货运模版，此变量在shiptemplate中
			
			var tempTimeMode=shipTemplate[i].timeMode;
			var tempTimeModeLength=tempTimeMode.length;
			for(var j=0;j<tempTimeModeLength;j++)
			{
				var tempselectCountryIds=tempTimeMode[j].shippingCountryIds;
				if(tempselectCountryIds==splitKey[1])
				{//说明找到了需要编辑的模版
					
					editPos=j;//编辑的这个id中的货运模版，此变量在shiptemplate中
					setTimeParmsInThePage(tempTimeMode[j]);
					break;
				}
			}
		}
	}
	
	
}


function deleteTimeTemplateInThePage(element)
{
	
	 if(confirm("是否删除?"))
	{
		 	var key=$(element).attr("key");//获取所要编辑的货运模版的key
			var splitKey=key.split(","); //用逗号分割这个key，第一项是shipId，第二项是：shippingCountryIds
			
			var shipTemplateLength=shipTemplate.length;
			for(var i=0;i<shipTemplateLength;i++)
			{
				var tempid=shipTemplate[i].id;
				if(tempid==splitKey[0])
				{//说明是这个货运方式之中的某一个时间模版
					
					var tempTimeMode=shipTemplate[i].timeMode;
					var tempTimeModeLength=tempTimeMode.length;
					for(var j=0;j<tempTimeModeLength;j++)
					{
						var tempselectCountryIds=tempTimeMode[j].shippingCountryIds;
						if(tempselectCountryIds==splitKey[1])
						{//说明找到了需要编辑的模版
							setTimeParmsUnDisableInThePage(tempTimeMode[j]);
							tempTimeMode.splice(j,1);
							$(element).parents(".new-row").remove();
							break;
						}
					}
				}
			}
	}
	
}
/**
 * 把以前设为不可用的国家设为可用
 */
function setTimeParmsUnDisableInThePage(timeModeElement)
{
	var tempselectCountryIds=timeModeElement.shippingCountryIds;
	var tempCountry=tempselectCountryIds.split("|");
	var len=tempCountry.length;
	for(var i=0;i<len;i++)
	{
		var tempid=tempCountry[i];
		//把该种方式所对应国家的复选框设定为可选，去除disable属性，同时加上名字为mui_shippingCountry的class
		$("input:checkbox[value='"+tempid+"']").addClass("mui_shippingCountry");//把每一个都设置为disabled
		$("input:checkbox[value='"+tempid+"']").prop("disabled",false);//去除disable
	}
}

function setTimeParmsInThePage(TimeModeElement)
{
	var tempselectCountryIds=TimeModeElement.shippingCountryIds;
	var tempCountry=tempselectCountryIds.split("|");
	var len=tempCountry.length;
	for(var i=0;i<len;i++)
	{
		var tempid=tempCountry[i];
		//把该种方式所对应国家的复选框设定为可选，去除disable属性，同时加上名字为mui_shippingCountry的class
		$("input:checkbox[value='"+tempid+"']").addClass("mui_shippingCountry");//把每一个都设置为disabled
		$("input:checkbox[value='"+tempid+"']").prop("disabled",false);//去除disable
	}
	
	//根据信息，显示物流信息所应该编辑的内容
	insertTimeXiangXiInfo(TimeModeElement);
}

/**
 * 编辑货运模版中的货运方式时，在页面中显示该种方式的信息
 * @param ShipModeElement
 */
function setParmsInThePage(ShipModeElement)
{
	var tempselectCountryIds=ShipModeElement.shippingCountryIds;
	var tempCountry=tempselectCountryIds.split("|");
	var len=tempCountry.length;
	for(var i=0;i<len;i++)
	{
		tempid=tempCountry[i];
		//把该种方式所对应国家的复选框设定为可选，去除disable属性，同时加上名字为mui_shippingCountry的class
		$("input:checkbox[value='"+tempid+"']").addClass("mui_shippingCountry");//把每一个都设置为disabled
		$("input:checkbox[value='"+tempid+"']").prop("disabled",false);//去除disable
	}
	
	//根据信息，显示物流信息所应该编辑的内容
	insertXiangXiInfo(ShipModeElement);
	
}

function insertTimeXiangXiInfo(TimeModeElement)
{
	var time=TimeModeElement.time;
	$("#shipping-time").val(time);//标准运费
}

function insertXiangXiInfo(ShipModeElement)
{
	
	var flag=ShipModeElement.selectShipMode;
	
	$("#selectMode").val(flag);
	//	console.log(flag);
	if(flag==1)
	{//说明选择的是标准运费
		
		var standardFee=ShipModeElement.standardInfo;
		$("#standardFee").val(standardFee);//标准运费

		//需要隐藏的选项
		$("#selectQWPattern").css("display","none");// 隐藏数量/重量选择框
		$("#quanaityInfo").css("display","none");//
		$("#weightInfo").css("display","none");// 
		
		//需要显示的选项
		$("#standardInfo").css("display","");

	}
	else
	{//说明选择的是自定义运费
		
		var qwFlag=ShipModeElement.selectQWMode;
		
		//需要显示的选项
		$("#selectQWPattern").val(qwFlag);  //按照重量，还是按照数量选择
		$("#selectQWPattern").css("display","");// 隐藏数量/重量选择框

		
		//需要隐藏的选项
		$("#standardInfo").css("display","none");
		

		if(qwFlag==1)
		{//说明选择的是按照数量
			
			//需要显示的选项
			$("#quanaityInfo").css("display","");//
			
			//需要隐藏的选项
			$("#weightInfo").css("display","none");// 
			
			var cl_min=ShipModeElement.quanaityInfo.cl_min;
			$("#cl_min").val(cl_min);
			var cl_max=ShipModeElement.quanaityInfo.cl_max;
			$("#cl_max").val(cl_max);
			var cl_price=ShipModeElement.quanaityInfo.cl_price;
			$("#cl_price").val(cl_price);
			var cl_add_num=ShipModeElement.quanaityInfo.cl_add_num;
			$("#cl_add_num").val(cl_add_num);
			var cl_add_price=ShipModeElement.quanaityInfo.cl_add_price;
			$("#cl_add_price").val(cl_add_price);
			
			
			
		}
		else
		{//说明选择的是按照重量
			
			//需要显示的选项
			$("#weightInfo").css("display","");// 
			
			//需要隐藏的选项
			$("#quanaityInfo").css("display","none");//
			
			
			var weight_end0=ShipModeElement.weightInfo.weight_end_0;
			$("#weight-end-0").val(weight_end0);
			var weight_price0=ShipModeElement.weightInfo.weight_price_0;
			$("#weight-price-0").val(weight_price0);
			var weight_end1=ShipModeElement.weightInfo.weight_end_1;
			$("#weight-end-1").val(weight_end1);
			var weight_interval1=ShipModeElement.weightInfo.weight_interval_1;
			$("#weight-interval-1").val(weight_interval1);
			var weight_price1=ShipModeElement.weightInfo.weight_price_1;
			$("#weight-price-1").val(weight_price1);

		}

	}
}