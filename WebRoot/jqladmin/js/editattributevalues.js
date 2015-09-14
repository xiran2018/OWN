
function deleteOldAttribute(element)
{
	//alert($(element).html());
	var spanElement=$(element).parent(".attr_value_span");
	if(! confirm(' 你确定要删除该属性吗? ' ) ) { return false; }
	var attrValueId=$(element).prev(".attr_value_id").val();
	
	var name=$(element).prevAll(".attr_value").val();

	
	delOldAttrValue(attrValueId,spanElement,name);
	return false;
}
function delOldAttrValue(id,spanElement,name)
{
	var actionUrl = "delAttrValueById.action";
	var params = 
	{
		"id" : id
	};
	$.ajax( {
		url : actionUrl,
		data : params,
		type : "POST",
		dataType : "json",
		error : function() {
			alert("由于服务器原因，请稍后再试!!!!");
		},
		success : function(data) {
			alert("删除成功");
			delOldAttrValueInPage(name);  //删除在页面中存储的该属性值
			spanElement.css("display","none"); 
	}
	});// end of ajax
}

function delOldAttrValueInPage(attr_value)
{
	len=attrValueInDB.length;
	for(var i=0;i<len;i++)
	{
		tempname=attrValueInDB[i];
		if(attr_value==tempname)
		{
			attrValueInDB.splice(i, 1);
			break;
		}
	}
}
//**********************************************************************
var editOldElement;  //该属性存储编辑的值所在的span元素
//**********************************************************************
//编辑属性值
function editOldAttribute(element)
{
	editOldElement=element;
	var attrValueId=$(element).prevAll(".attr_value_id").val();
	var actionUrl="attributeValues_fecth_byAttrId.action";
    var params={
            "id":attrValueId
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
    	   //获取属性值列表
           $("#attrValueId").val(data.av.attrValueId);
           $("#name").val(data.av.attrValueName);
           
           getPositionInAttrValueInDB(data.av.attrValueName);//得到已经存入数据库中的属性值（编辑的属性值）在页面元素中的位置

           //获取多国语言的属性值信息，加入页面
           insertEditHtml(data.avmls); //这个函数在insertMultiLanEditHtml.js文件中
           $('#modifyw').dialog('open');
       }
   });//end of ajax
}

function getPositionInAttrValueInDB(attrValue)
{
	len=attrValueInDB.length; //attrValueInDB在iframe_add_product_attrValues.js定义
	for(var i=0;i<len;i++)
	{
		tempname=attrValueInDB[i];
		if(attrValue==tempname)
		{
			
			attrValueInDBPosition=i;  //attrValueInDBPosition在iframe_add_product_attrValues.js定义
			////记录当前编辑的页面中(已经写入数据库)的属性值在attrValueInDB数组中的位置（在editattributevalues。js中使用）
			break;
		}
	}
}

function insertEditHtml(cml)
{
	var html=getEditHtml(cml);
	
	$("#navigation").empty();
	$("#navigation").append(html);
	showAjaxContent();//对加入的元素，添加事件侦听	
}
/**
 "pamu":
[
{"description":"","id":57,"keywords":"","language_name":"英语","name":"bb1","attrvalue_id":30,"title":""},
{"description":"","id":58,"keywords":"","language_name":"俄语","name":"bb2","attrvalue_id":30,"title":""}
]
 * @param data 格式如上所示
 * @returns {String}
 * 修改的表格中，每一种语言的name，description，title生成规律为 id+"mod"_name(title,keywords,description)
 */
function getEditHtml(data)
{
		var html="";
		var allLanguage=data;
		var len=allLanguage.length;
		for(var i=0;i<len;i++)
		{
			temp=allLanguage[i];
			var tempid=temp.id; //该条记录对应的主键
			if(i==0)
			{//只有第一个元素才有show的class
				html+="<li class='show'><a href='javascript: void(0)' class='index'>"+temp.language_name+"</a>"+
				"<div class='content'><table class='innertable'>";
			}
			else
			{
				html+="<li class=''><a href='javascript: void(0)' class='index'>"+temp.language_name+"</a>"+
				"<div class='content'><table class='innertable'>";
			}
			//添加该条记录对应的主键值
			//html+="<tr style='display: none;'><td> <input id='mainId' value="+tempid+" /></td></tr>";
			//添加name
			html+="<tr class=''><td class='colume1' valign=middle align=right>名称</td><td class='colume2'>";
			var tempNameid=temp.id+"_modname";
			var tempNameValue=temp.name;
			var inputEle="<input id="+tempNameid+" name="+tempNameid+" value='"+tempNameValue+"'   type=text style='width: 450px;'/>";
			html+=inputEle+"</td></tr>";
			//添加title
			html+="<tr class=''><td class='colume1' valign=middle align=right>Title</td><td class='colume2'>";
			var temptitleid=temp.id+"_modtitle";
			var temptitleValue=temp.title;
		    inputEle="<input id="+temptitleid+" name="+temptitleid+" value='"+temptitleValue+"'  type=text style='width: 450px;'/>";
			html+=inputEle+"</td></tr>";
			//添加keywords
			html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
			var tempkeywordsid=temp.id+"_modkeywords";
			var tempkeywordsValue=temp.keywords;
		    inputEle="<input id="+tempkeywordsid+" name="+tempkeywordsid+" value='"+tempkeywordsValue+"'  type=text style='width: 450px;'/>";
			html+=inputEle+"</td></tr>";
			//添加description
			html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
			var tempdescid=temp.id+"_moddescription";
			var tempDescValue=temp.description;
		    inputEle="<input id="+tempdescid+" name="+tempdescid+" value='"+tempDescValue+"'  type=text style='width: 450px;'/>";
			//html+=inputEle+"</td></tr><td valign=middle colspan=2 align=center><a href='javascript:void(0)' mainId='"+tempid+"' class='easyui-linkbutton' onclick='javascript:modify_product_category_xiangxi()'>保存</a></td></table></div></li>";
		    html+=inputEle+"</td></tr><td valign=middle colspan=2 align=center><button type='button' mainid="+tempid+"  onclick='modify_xiangxi(this)'>保存</button></td></table></div></li>";
		}
		return html;
}




$(document).ready(function() {	
	
	//给单选按钮注册事件
	$(".radioItem").change(function() {
		
		var currentValue=$("input[name='input_style']:checked").val();//选择了之后的值

		if(storInputStyle!=currentValue)
		{
			if(!confirm("如果改变输入方式，以前保存的属性值将不可用，如果选择的不是从列表中选择，请务必把属性值列表全部删除，确实要改变属性值吗？"))
			{	
		       $(":radio[name=input_style][value='"+storInputStyle+"']").attr("checked","true");
			}
			else
			{
				storInputStyle=currentValue;
			}
		}
		

	});  //给单选按钮注册改变，当选择的单选按钮改变时，就会触发该程序
});// end of $(document).ready(function() {


function save_product_attrValues() {
	 
	 //得到多国语言的属性值信息
	 //attrForeignValue在iframe_add_product_attrValues.js中
	 var multiAttrValueString=JSON.stringify(attrForeignValue);	
	 
	 var categoryid=$.trim($("#sel_category_id").val());
	 var attrid=$.trim($("#attrId").val());
	 
	 var input_style=$('input[name="input_style"]:checked').val();
	 
 	 var actionUrl="product_attrValues_insert.action";
	 var params={
			 "inputStyle":input_style,
			 "id":attrid,
			 "categoryId":categoryid,
             "multiAttrValueString":multiAttrValueString
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
			alert("保存成功");
			location.reload(true);//刷新页面
		}
	});//end of ajax
		 
	 
}