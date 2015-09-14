var multiforeigid=new Array();//存放加载的多国语言的id	


$(document).ready(function() {
		insertMultiHtml();
	});

function insertMultiHtml()
{
	var html;
	var actionUrl = "getAllLanguage.action";
	$.ajax( { // 取语言
		url : actionUrl,
		type : "post",
		dataType : "json",
		error : function(data) 
		{
			alert("由于服务器原因，请稍后再试。。。");
			
		},
		success : function(data) 
		{
			var path=window.location.pathname;
			//console.log(path);
			var pathsplit=path.split("/");
			var len=pathsplit.length;
			var lastEle=pathsplit[len-1];
			if(lastEle=="product_attr.jsp")//如果是在添加属性页面，则需要页面加载时，在页面中生成添加属性值需要的元素
			{
				insertAddAttrHtml(data);  //生成添加属性值需要的元素
				
				//加载页面的基本信息
				html=gethtml(data);
				
				$("#navigation").empty();
				$("#navigation").append(html);
				showAjaxContent();//对加入的元素，添加事件侦听
				
				//在页面中插入编辑页面属性值的时候需要的多语言元素
				insertEditAttrValue(data);
			}
			else if(lastEle=="brand_series.jsp"||lastEle=="product_category.jsp")
			{
				//加载页面的基本信息
				html=gethtml(data);
				$("#navigation").empty();
				$("#navigation").append(html);
				showAjaxContent();//对加入的元素，添加事件侦听
				
				//在页面中插入编辑页面属性值的时候需要的多语言元素
			}
			else//如果是在添加属性页面，则需要页面加载时，在页面中生成添加属性值需要的元素
			{//该种情形主要是针对editAttrValues.jsp页面
				insertAddAttrHtml(data);  //生成添加属性值需要的元素
				//在页面中插入编辑页面属性值的时候需要的多语言元素
				insertEditAttrValue(data);
			}


		}
	});// end of ajax
	
}

/**
 * 针对每一个国家形成相应的name，keyword和description，具体时间id_name ,id_keywords,id_description,其中，id为语言的id值（主键）
 * @param data
 * @returns {String}
 */
function gethtml(data)
{
	//清空数组
	multiforeigid=[];
	var html="";
	var allLanguage=data;
	var len=allLanguage.length;
	for(var i=0;i<len;i++)
	{
		temp=allLanguage[i];
		var tempid=temp.id;
		multiforeigid.push(tempid);
		if(i==0)
		{//只有第一个元素才有show的class
			html+="<li class='show'><a href='javascript: void(0)' class='index'>"+temp.languageName+"</a>"+
			"<div class='content'><table class='innertable'>";
		}
		else
		{
			html+="<li class=''><a href='javascript: void(0)' class='index'>"+temp.languageName+"</a>"+
			"<div class='content'><table class='innertable'>";
		}

		//添加name
		html+="<tr class=''><td class='colume1' valign=middle align=right>名称</td><td class='colume2'>";
		var tempNameid=temp.id+"_name";
		var inputEle="<input id="+tempNameid+" name="+tempNameid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加title
		html+="<tr class=''><td class='colume1' valign=middle align=right>Title</td><td class='colume2'>";
		var temptitleid=temp.id+"_title";
	    inputEle="<input id="+temptitleid+" name="+temptitleid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加keywords
		html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
		var tempkeywordsid=temp.id+"_keywords";
	    inputEle="<input id="+tempkeywordsid+" name="+tempkeywordsid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加description
		html+="<tr class=''><td class='colume1' valign=middle align=right>Description</td><td class='colume2'>";
		var tempdescid=temp.id+"_description";
	    inputEle="<input id="+tempdescid+" name="+tempdescid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr></table></div></li>";
	}
	return html;
}

//////////////////////////////////////////////////////////////////////////
//以下的代码为添加商品属性值时需要用到的
//////////////////////////////////////////////////////////////////////////
function insertAddAttrHtml(cml)
{
	var html=getAddAttrHtml(cml);
	
	$("#modnavigation").empty();
	$("#modnavigation").append(html);
	showEditAjaxContent();//对加入的元素，添加事件侦听
	
	
}
/**
 *
 * @param data 格式如上所示
 * @returns {String}
 * 修改的表格中，每一种语言的name，description，title生成规律为 id+"mod"_name(title,keywords,description)
 */
function getAddAttrHtml(data)
{
	var html="";
	var allLanguage=data;
	var len=allLanguage.length;
	for(var i=0;i<len;i++)
	{
		temp=allLanguage[i];
		var tempid=temp.id;
		multiforeigid.push(tempid);
		if(i==0)
		{//只有第一个元素才有show的class
			html+="<li class='show'><a href='javascript: void(0)' class='index'>"+temp.languageName+"</a>"+
			"<div class='content'><table class='innertable'>";
		}
		else
		{
			html+="<li class=''><a href='javascript: void(0)' class='index'>"+temp.languageName+"</a>"+
			"<div class='content'><table class='innertable'>";
		}

		//添加name
		html+="<tr class=''><td class='colume1' valign=middle align=right>名称</td><td class='colume2'>";
		var tempNameid=temp.id+"_attrforeignname";
		var inputEle="<input id="+tempNameid+" name="+tempNameid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加title
		html+="<tr class=''><td class='colume1' valign=middle align=right>Title</td><td class='colume2'>";
		var temptitleid=temp.id+"_attrforeigntitle";
	    inputEle="<input id="+temptitleid+" name="+temptitleid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加keywords
		html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
		var tempkeywordsid=temp.id+"_attrforeignkeywords";
	    inputEle="<input id="+tempkeywordsid+" name="+tempkeywordsid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加description
		html+="<tr class=''><td class='colume1' valign=middle align=right>Description</td><td class='colume2'>";
		var tempdescid=temp.id+"_attrforeigndescription";
	    inputEle="<input id="+tempdescid+" name="+tempdescid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr></table></div></li>";
	}
	return html;
}
//////////////////////////////////////////////////////////////////////////
//以下的代码为在页面中生成需要编辑属性值的元素时需要的代码
/////////////////////////////////////////////////////////////////////////
function insertEditAttrValue(cml)
{
	var html=getEditAttrValueHtml(cml);
	
	$("#editnavigation").empty();
	$("#editnavigation").append(html);
	showEditAttrValueAjaxContent();//对加入的元素，添加事件侦听
}

function getEditAttrValueHtml(data)
{
	var html="";
	var allLanguage=data;
	var len=allLanguage.length;
	for(var i=0;i<len;i++)
	{
		temp=allLanguage[i];
		var tempid=temp.id;
		//multiforeigid.push(tempid);    //因为前面已经添加了，所以在这里就不必要添加了!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
		if(i==0)
		{//只有第一个元素才有show的class
			html+="<li class='show'><a href='javascript: void(0)' class='index'>"+temp.languageName+"</a>"+
			"<div class='content'><table class='innertable'>";
		}
		else
		{
			html+="<li class=''><a href='javascript: void(0)' class='index'>"+temp.languageName+"</a>"+
			"<div class='content'><table class='innertable'>";
		}

		//添加name
		html+="<tr class=''><td class='colume1' valign=middle align=right>名称</td><td class='colume2'>";
		var tempNameid=temp.id+"_editattrforeignname";
		var inputEle="<input id="+tempNameid+" name="+tempNameid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加title
		html+="<tr class=''><td class='colume1' valign=middle align=right>Title</td><td class='colume2'>";
		var temptitleid=temp.id+"_editattrforeigntitle";
	    inputEle="<input id="+temptitleid+" name="+temptitleid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加keywords
		html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
		var tempkeywordsid=temp.id+"_editattrforeignkeywords";
	    inputEle="<input id="+tempkeywordsid+" name="+tempkeywordsid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr>";
		//添加description
		html+="<tr class=''><td class='colume1' valign=middle align=right>Description</td><td class='colume2'>";
		var tempdescid=temp.id+"_editattrforeigndescription";
	    inputEle="<input id="+tempdescid+" name="+tempdescid+" class='' type=text style='width: 450px;'/>";
		html+=inputEle+"</td></tr></table></div></li>";
	}
	return html;
}