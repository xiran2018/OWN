$().ready(
		function() 
		{
			
			registerEventLister(); //register the event to listen for the element
			showhomeInformaton(); 
			
		}
		
);//end  of ready


//********************************************************************************************
/**
 * the global Variable
 * 
 */
var addDialog; //增加栏目的dialog
var modifyDialog; //修改栏目的dialog
var editElement;//当编辑栏目信息时，此变量保存编辑的元素，从而可以在编辑元素时，改变元素的一些属性信息
var addFlag;//标示加入类型的元素，是栏目信息，还是具体的页面，0：栏目信息  1：具体的页面




//********************************************************************************************


/**
 * //********************************************************该函数的代码不需要改动
 */
function registerEventLister()
{
	addDialog = $("#addw").dialog({
	      autoOpen: false,
	      closeText: "hide",
	      height: "auto",
	      width: "950px",
	      modal: true,
//	      buttons: {
//	       "确定": modifyUser,
//	       "取消": function() {
//	          dialog.dialog( "close" );
//	        }
//	      },
	      close: function() {
//	        form[ 0 ].reset();
//	        allFields.removeClass( "ui-state-error" );
	      }
	    });
	
	modifyDialog = $("#modifyw").dialog({
	      autoOpen: false,
	      closeText: "hide",
	      height: "auto",
	      width: "950px",
	      modal: true,
//	      buttons: {
//	       "确定": modifyUser,
//	       "取消": function() {
//	          dialog.dialog( "close" );
//	        }
//	      },
	      close: function() {
//	        form[ 0 ].reset();
//	        allFields.removeClass( "ui-state-error" );
	      }
	    });
	
	
	 $("#addElement").click(function(){
		 		$("#preimage").val("");//重新加载的时候，把以前保存的图片信息清空
		 		addFlag=0;//加入的是栏目信息
		 		$("#belong_id").val("1");
		 		$("#preimage").val("");
		 		$("#pageNameId").css("display","none");//隐藏具体的页面信息，因为暂时栏目信息不需要
		 		insertMultiHtml();
		 		addDialog.dialog( "open" );
 		    });//end of submitB
}

/**
 * 该函数在页面加载时，初始化页面需要分页显示的信息
 */
function showhomeInformaton()
{
	
	//ask for the server to return the data to show
	
	var actionUrl = "getAllHomeInfo.action";	 
	
	$.ajax( { // 获取物流信息
		url : actionUrl,
		type : "post",
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
				alert("获取信息失败，请再试一次!!");
			}
			else if(data.status=="500")
			{	
				alert("由于服务器原因，添加失败!!!!");
			}
		},
		success : function(data) 
		{
			var len=data.length;
			if(len==0)
			{
				alert("暂时没有相应的信息,请添加！");
				return;
			}
			else
			{
				var html=gernateContent(data);
				$("#storehomeinfo").append(html);
				$("#storehomeinfo").treetable({ expandable: true });
			}

		}
	});// end of ajax

}
/**
 * 数组中的数据格式如下；
 * 			createtime: "2014-11-09T20:54:29"
				fatherid: 1
				id: 4
				image: null
				name: "公司概况"
				pagename: "som.jsp"
				status: 1
 * @param data
 * 						        
 */
function gernateContent(data)
{
	//首先需要加载一个根元素信息
	var html="";
	var len=data.length;
	for(var i=0;i<len;i++)
	{
		var tempParentEle=data[i].parentInfo;
		html+=generateParentXiangXiInfo(tempParentEle);
		
		var tempChildList=data[i].childInfoList;
		var childLen=tempChildList.length;
		for(var j=0;j<childLen;j++)
		{
			var tempChildEle=tempChildList[j];
			html+=generateChildXiangXiInfo(tempChildEle);
		}
		
	}
	
	return html;
}

function generateChildXiangXiInfo(dataInfo)
{
	html="";
	html+="<tr class='mui_row' data-tt-id='"+dataInfo.id+"' data-tt-parent-id='"+dataInfo.fatherid+"'><td class='fourColume1 mui_name'><span class='mui_span_name'>"+dataInfo.name+"</span></td><td class='fourColume2 mui_image'>"+imageParamConvert(dataInfo.image)+"</td><td class='fourColume3 mui_status'>"+showConvert(dataInfo.status)+"</td><td class='fourColume4 mui_operate'>"+childOperate(dataInfo.id)+"</td></tr>";
	return html;
}

function generateParentXiangXiInfo(dataInfo)
{
	html="";
	html+="<tr class='mui_row' data-tt-id='"+dataInfo.id+"'><td class='fourColume1 mui_name'><span class='mui_span_name'>"+dataInfo.name+"</span></td><td class='fourColume2 mui_image'>"+imageParamConvert(dataInfo.image)+"</td><td class='fourColume3 mui_status'>"+showConvert(dataInfo.status)+"</td><td class='fourColume4 mui_operate'>"+parentOperate(dataInfo.id)+"</td></tr>";
	return html;
}

function imageParamConvert(imageAddr)
{
	html="";
	html+="<img src='"+imageAddr+"'  alt='在前台显示的图标' style='width: 50px;height: 50px;'/>";
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

function childOperate(id)
{
	html="";
	html+="<a href='javascript:void(0)' onclick='javascript:editPageElement(this);return false' value="+id+">编辑</a>|";
	html+="<a target='_blank' href='editStoreHomeXiangXiInfo.action?id="+id+"' >详情</a>|";
	html+="<a href='javascript:void(0)' onclick='javascript:deleteElement(this);return false' value="+id+">删除</a>";
	return html;
}

function parentOperate(id)
{
	html="";
	html+="<a href='javascript:void(0)' onclick='javascript:addpage(this);return false' value="+id+">添加</a>|";
	html+="<a href='javascript:void(0)' onclick='javascript:editPageElement(this);return false' value="+id+">编辑</a>|";
	html+="<a href='javascript:void(0)' onclick='javascript:deleteElement(this);return false' value="+id+">删除</a>";
	return html;
}


function addpage(element)
{
	editElement=element;
 	addFlag=1;//加入的是具体页面信息
 	var id=$(element).attr("value");
 	$("#belong_id").val(id);
 	$("#preimage").val("");
 	$("#pageNameId").css("display","");//隐藏具体的页面信息，因为暂时栏目信息不需要
 	insertMultiHtml();
 	addDialog.dialog( "open" );

 	
 		
 	
}

/**
 * 删除栏目
 * @param element
 */
function deleteElement(element)
{
	if(confirm("确实要删除该栏目吗？"))
	{
		
		var id=$(element).attr("value");
		var actionUrl="storeHomeInfo_delete.action";
		var params={
				"id":id
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
				//在前台图形中删除节点所在的行
				alert("删除成功");
				location.reload();
//				$(element).parent(".mui_operate").parent(".mui_row").remove();
			}
		});//end of ajax
	}
}
