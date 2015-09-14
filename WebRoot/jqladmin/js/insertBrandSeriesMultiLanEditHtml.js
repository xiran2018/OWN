function insertEditHtml(cml)
{
	var html=getEditHtml(cml);
	
	$("#modnavigation").empty();
	$("#modnavigation").append(html);
	showEditAjaxContent();//对加入的元素，添加事件侦听
	$('#modifyw').window('open');
	
}
/**
 * "cml":
 * [
	{"brand_id":30,"description":"22","id":5,"keywords":"22","language_name":"英语","name":"22","title":"22"},
	{"brand_id":30,"description":"22","id":6,"keywords":"22","language_name":"英语","name":"22","title":"22"}
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
		    html+=inputEle+"</td></tr><td valign=middle colspan=2 align=center><button type='button' mainid="+tempid+"  onclick='modify_brand_xiangxi(this)'>保存</button></td></table></div></li>";
		}
		return html;
}