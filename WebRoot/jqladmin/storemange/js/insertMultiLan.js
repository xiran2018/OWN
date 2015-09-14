
//********************************************************************************************
/**
 * the global Variable
 * 
 */
var multiforeigid=new Array();//存放加载的多国语言的id	


//********************************************************************************************



//增加多语言信息时需要的代码********************************************************************************************
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
				html=gethtml(data);
				
				$("#navigation").empty();
				$("#navigation").append(html);
				showAjaxContent();//对加入的元素，添加事件侦听
				$('#addDialog').dialog('open');
			}
		});// end of ajax
		
	}
	
	function gethtml(data)
	{
		//清空数组
		multiforeigid=[];
		var html="";
		var allLanguage=data;  //在language.js中
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
			html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
			var tempdescid=temp.id+"_description";
		    inputEle="<input id="+tempdescid+" name="+tempdescid+" class='' type=text style='width: 450px;'/>";
			html+=inputEle+"</td></tr></table></div></li>";
		}
		return html;
	}
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!添加的代码
	/**
	 * 添加首页的页脚之上需要展示的大栏目信息
	 */
	function addElement() 
	{
		//获取数据，执行入库操作  
		 var fatherId=$("#belong_id").val();
		 var pageName=$("#pageName").val();
		 var  mui_input_name=$.trim($("#mui_input_name").val());
		 var image=$.trim($("#image").val());
		 var isShow=$('input[name="mui_input_show"]:checked').val();
		 var multiLanguage=[];//按照json的格式，存储多语言的类别信息：json的格式如下所示：
		 //[{id(语言id）:1,other_name：“23”,other_title:,other_keywords:,other_desc:},{},{}]
		 len=multiforeigid.length;
		 for(var j=0;j<len;j++)
	     {
			 obj={};
			 tempid=multiforeigid[j];
			 obj.id=tempid;
			 
			 tempname=tempid+"_name";
			 other_name=$.trim($("#"+tempname).val());
			 obj.other_name=other_name;
			 
			 temptitle=tempid+"_title";
			 other_title=$.trim($("#"+temptitle).val());
			 obj.other_title=other_title;
			 
			 tempkeywords=tempid+"_keywords";
			 other_keywords=$.trim($("#"+tempkeywords).val());
			 obj.other_keywords=other_keywords;
			 
			 tempdesc=tempid+"_description";
			 other_desc=$.trim($("#"+tempdesc).val());
			 obj.other_desc=other_desc;
			 multiLanguage.push(obj);
	     }
		 
		 var multiLanString=JSON.stringify(multiLanguage);
		 //alert(multiLanString);

		 if(addFlag=="1")
		 {
			 if(!pageName && typeof(pageName)!="undefined")
			 {
			 	alert("请填写展示信息的页面名称");
			 	return;
			 }
			 else
			 {
//				 var fileType=pageName.substring(pageName.lastIndexOf('.')).toLowerCase();
				 var fileType=pageName.substring(pageName.lastIndexOf('.'));
				 if(fileType!=".jsp")
				 {
					 alert("请输入以.jsp结尾的名称");
					 return;
				 }
			 }
		 }

		 if(!mui_input_name && typeof(mui_input_name)!="undefined")
		 {
		 	alert("请填写需要加入的栏目名称");
		 	return;
		 }
		 else
		 {
		 	var actionUrl="storeHomeInfo_insert.action";
			 var params={
					 "fatherId":fatherId,
					 "pageName":pageName,
	                 "mui_input_name":mui_input_name,
	                 "multiLanString":multiLanString,
	                 "image":image,
	                 "isShow":isShow
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
					if(addFlag==0)
					{
						//在前台图形中添加节点
						var tempHtml=generateParentXiangXiInfoInPage(data);//在前台图形界面中加上添加的信息
						$("#storehomeinfo").append(tempHtml);
						addDialog.dialog('close');
						alert("添加成功");
					}
					else
					{
						alert("添加成功");
						location.reload();
					}
				}
			});//end of ajax
			 
		 }
	}
	
	function generateParentXiangXiInfoInPage(dataInfo)
	{
		html="";
		html+="<tr class='mui_row' data-tt-id='"+dataInfo.id+"'><td class='fourColume1 mui_name'><span class='indenter' style='padding-left: 0px;'></span><span class='mui_span_name'>"+dataInfo.name+"</span></td><td class='fourColume2 mui_image'>"+imageParamConvert(dataInfo.image)+"</td><td class='fourColume3 mui_status'>"+showConvert(dataInfo.status)+"</td><td class='fourColume4 mui_operate'>"+parentOperate(dataInfo.id)+"</td></tr>";
		return html;
	}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!end of 添加的代码

//end of 增加多语言信息***************************************************************************************************************************
	
	
//编辑多语言信息时需要的代码***************************************************************************************************************************
	function insertEditHtml(cml)
	{
		var html=getEditHtml(cml);
		
		$("#modnavigation").empty();
		$("#modnavigation").append(html);
		showEditAjaxContent();//对加入的元素，添加事件侦听
		modifyDialog.dialog( "open" );
		
	}
	/**
	 * "cml":[
				{"category_id":56,"description":"we","id":3,"keywords":"we","languageName":"英语","name":"we","title":"we"},
				{"category_id":56,"description":"we","id":4,"keywords":"we","languageName":"英语","name":"we","title":"we"}
			]
	 * @param data 格式如上所示
	 * @returns {String}
	 * 修改的表格中，每一种语言的name，description，title生成规律为 id+"mod"_name(title,keywords,description)
	 * 	private Integer id;
	private Integer storefooterinfoid;
	private Integer lanname;
	private String name;
	private String content;
	private String title;
	private String keyword;
	private String description;
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
					html+="<li class='show'><a href='javascript: void(0)' class='index'>"+temp.lanname+"</a>"+
					"<div class='content'><table class='innertable'>";
				}
				else
				{
					html+="<li class=''><a href='javascript: void(0)' class='index'>"+temp.lanname+"</a>"+
					"<div class='content'><table class='innertable'>";
				}
				//添加该条记录对应的主键值
				//html+="<tr style='display: none;'><td> <input id='mainId' value="+tempid+" /></td></tr>";
				//添加name
				html+="<tr class=''><td class='colume1' valign=middle align=right>名称</td><td class='colume2'>";
				var tempNameid=temp.id+"_modname";
				var tempNameValue=temp.name;
				var inputEle="<input id="+tempNameid+" name="+tempNameid+" value='"+tempNameValue+"'  class='' type=text style='width: 450px;'/>";
				html+=inputEle+"</td></tr>";
				//添加title
				html+="<tr class=''><td class='colume1' valign=middle align=right>Title</td><td class='colume2'>";
				var temptitleid=temp.id+"_modtitle";
				var temptitleValue=temp.title;
			    inputEle="<input id="+temptitleid+" name="+temptitleid+" value='"+temptitleValue+"' class='' type=text style='width: 450px;'/>";
				html+=inputEle+"</td></tr>";
				//添加keywords
				html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
				var tempkeywordsid=temp.id+"_modkeywords";
				var tempkeywordsValue=temp.keyword;
			    inputEle="<input id="+tempkeywordsid+" name="+tempkeywordsid+" value='"+tempkeywordsValue+"' class='' type=text style='width: 450px;'/>";
				html+=inputEle+"</td></tr>";
				//添加description
				html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
				var tempdescid=temp.id+"_moddescription";
				var tempDescValue=temp.description;
			    inputEle="<input id="+tempdescid+" name="+tempdescid+" value='"+tempDescValue+"'  class='' type=text style='width: 450px;'/>";
				//html+=inputEle+"</td></tr><td valign=middle colspan=2 align=center><a href='javascript:void(0)' mainId='"+tempid+"' class='easyui-linkbutton' onclick='javascript:modify_product_category_xiangxi()'>保存</a></td></table></div></li>";
			    html+=inputEle+"</td></tr><td valign=middle colspan=2 align=center><button type='button' mainid="+tempid+"  onclick='modify_storehomeinfo_xiangxi(this)'>保存</button></td></table></div></li>";
			}
			return html;
	}
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!编辑多语言信息
	/**
	 * 编辑栏目信息
	 */
	function editPageElement(element)
	{
	 	
		
		editElement=element; //当编辑栏目信息时，此变量保存编辑的元素，从而可以在编辑元素时，改变元素的一些属性信息，此变量在storehomeinfo.js中
		var id=$(element).attr("value");
		var actionUrl="storeHomeInfo_fecth.action";
		 var params={
	            "id":id
		 };	
		 $.ajax( {
			url : actionUrl,
			data:params,
			type : "POST",
			dataType : "json",
			error : function(data) {
				alert("获取信息失败，请稍后再试!!!!");
			},
			success : function(data) 
			{	
				 //在前台图形中添加节点
	            $("#self_id").val(data.sftInfo.id);
	            $("#modify_self_id").val(data.sftInfo.id);
	            $("#modify_father_id").val(data.sftInfo.fatherid);
	            $("#modify_name").val(data.sftInfo.name);
	            
	            $(":radio[name=modify_cshow][value='"+data.sftInfo.status+"']").attr("checked","true");
	            var tempImage=data.sftInfo.image;
	            if(tempImage==null)
	            {
	            	tempImage="";
	            }
	            $("#showImageInDB").attr("src",tempImage);
	            $("#modify_image").val(tempImage);
	            $("#modify_preimage").val(tempImage);
	            
	            insertEditHtml(data.cml);

			}
		});//end of ajax
	}

	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!end of 编辑多语言信息
	
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!保存编辑的信息
	/**
	 * 首先保存基本信息
	 */
	function modify_storehomeinfo_basic()
	{
	    var id =$("#self_id").val();
	    var mui_input_name=$.trim($("#modify_name").val());
	    var image=$.trim($("#modify_image").val());
		var isShow=$('input[name="modify_cshow"]:checked').val();
	    if(!mui_input_name && typeof(mui_input_name)!="undefined")
	    {
	       alert("请填写需要加入的类别名称");
	       return;
	    }
	    else
	    {

	       var actionUrl="modify_basic_info.action";
	        var params=
	        {
	                "id":id,
	                "mui_input_name":mui_input_name,
	                "image":image,
	                "isShow":isShow
	        }; 
	        
	        $.ajax( {
	           url : actionUrl,
	           data:params,
	           type : "POST",
	           dataType : "json",
	           error : function() {
	               alert("修改失败!!!!");
	           },
	           success : function(data) 
	           {	               
	               alert("修改成功");
	               updateDateInThePage(mui_input_name,image,isShow);
	           }
	       });//end of ajax
	        
	    }
	}
	
	/**
	 * 更新页面中表格中的内容
	 * @param name
	 * @param beizhu
	 * @param status
	 */
	function updateDateInThePage(mui_input_name,image,isShow)
	{
		//console.log($(editElement).parent(".mui_operate").html());
		//console.log($(editElement).parent(".mui_operate").prevAll(".mui_name").html());
		
		$(editElement).parent(".mui_operate").prevAll(".mui_name").children(".mui_span_name").html(mui_input_name);
		var tempimage=imageParamConvert(image);
		$(editElement).parent(".mui_operate").prevAll(".mui_image").html(tempimage);

		var tempStatus=showConvert(isShow); //showConvert函数在pagination.js中
		$(editElement).parent(".mui_operate").prevAll(".mui_status").html(tempStatus);
	}
	
	/**
	 * 保存多语言的信息
	 */
	function modify_storehomeinfo_xiangxi(element)
	{
	    var selfID =$(element).attr("mainid");
		 tempname=selfID+"_modname";
		 other_name=$.trim($("#"+tempname).val());
		 
		 temptitle=selfID+"_modtitle";
		 other_title=$.trim($("#"+temptitle).val());
		 
		 tempkeywords=selfID+"_modkeywords";
		 other_keywords=$.trim($("#"+tempkeywords).val());
		 
		 tempdesc=selfID+"_moddescription";
		 other_desc=$.trim($("#"+tempdesc).val());
		 
	    if(!other_name && typeof(other_name)!="undefined")
	    {
	       alert("请填写需要加入的栏目名称");
	       return;
	    }
	    else
	    {

	       var actionUrl="modify_xiangxi_info.action";
	        var params={
	                "id":selfID,
	                "mui_input_name":other_name,
	                "title":other_title,
	                "keyword":other_keywords,
	                "description":other_desc
	        }; 
	        
	        $.ajax( {
	           url : actionUrl,
	           data:params,
	           type : "POST",
	           dataType : "json",
	           error : function() {
	               alert("修改失败，稍后再试!!!!");
	           },
	           success : function(data) {
	               alert("修改成功");
	           }
	       });//end of ajax
	        
	    }
	}

	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!end of 保存编辑的信息
	
//end of编辑多语言信息时需要的代码***************************************************************************************************************************
	