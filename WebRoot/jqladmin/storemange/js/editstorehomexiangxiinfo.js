//编辑多语言信息时需要的代码***************************************************************************************************************************
	function insertEditHtml(cml)
	{
		var html=getEditHtml(cml);
		
		$("#modnavigation").empty();
		$("#modnavigation").append(html);
		//把加入的textarea，成为ueditor
		//////////////////////////////////////////////////
		changeToUeditor(cml);
		/////////////////////////////////////////////////
		showEditAjaxContent();//对加入的元素，添加事件侦听
		
	}
	
	//把加入的textarea，成为ueditor
	function changeToUeditor(data)
	{
		var allLanguage=data;
		var len=allLanguage.length;
		for(var i=0;i<len;i++)
		{
			temp=allLanguage[i];
			var tempNameid=temp.id+"_modname";
			UE.getEditor(tempNameid,{
		            initialFrameWidth: 900,
		            initialFrameHeight: 400,
		        	});

		}

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
					"<div class='content' style='width:920px'><table class='innertable'>";
				}
				else
				{
					html+="<li class=''><a href='javascript: void(0)' class='index'>"+temp.lanname+"</a>"+
					"<div class='content' style='width:920px'><table class='innertable'>";
				}
				//添加该条记录对应的主键值
				//html+="<tr style='display: none;'><td> <input id='mainId' value="+tempid+" /></td></tr>";
				//添加name
				html+="<tr class=''><td class=''>";
				var tempNameid=temp.id+"_modname";
				var tempNameValue=temp.content;
				if(tempNameValue==undefined||tempNameValue==null)
					tempNameValue="";
				//<textarea name="content" id="myEditor" style="width:100%;height:60%"></textarea>
				var inputEle="<textarea style='width:100%;height:100%' id="+tempNameid+" name="+tempNameid+" >"+tempNameValue+"</textarea>";
				html+=inputEle+"</td></tr>";
				
				//html+=inputEle+"</td></tr><td valign=middle colspan=2 align=center><a href='javascript:void(0)' mainId='"+tempid+"' class='easyui-linkbutton' onclick='javascript:modify_product_category_xiangxi()'>保存</a></td></table></div></li>";
			    html+="<tr><td valign=middle  align=center><button type='button' mainid="+tempid+"  onclick='modify_storehomeinfo_xiangxi(this)'>保存</button></td></tr></table></div></li>";
			}
			return html;
	}
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!编辑多语言信息
	/**
	 * 保存多语言的信息
	 */
	function modify_storehomeinfo_xiangxi(element)
	{
	     var selfID =$(element).attr("mainid");
		 tempname=selfID+"_modname";
		 var ue1=UE.getEditor(tempname); 
         var content = ue1.getContent();

         var actionUrl="modify_xiangxi_content.action";
        var params={
                "id":selfID,
                "info":content
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