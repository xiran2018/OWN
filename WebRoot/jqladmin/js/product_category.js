var multiforeigid=new Array();//存放加载的多国语言的id	

var category_setting = {
		view : {
			addHoverDom : addHoverDom,
			removeHoverDom : removeHoverDom,
			selectedMulti : false,
			dblClickExpand : dblClickExpand
		},
		edit : {
			enable : true,
			editNameSelectAll : true,
			showRemoveBtn : showRemoveBtn,
			showRenameBtn : showRenameBtn
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		callback : {
			beforeDrag : beforeDrag,
			beforeEditName : beforeEditName,
			beforeRemove : beforeRemove,
			beforeRename : beforeRename,
			onRemove : onRemove,
			onRename : onRename
		}
	};
	var log, className = "dark";
	function beforeDrag(treeId, treeNodes) {
		return false;
	}
	function dblClickExpand(treeId, treeNode) {
		//return treeNode.level > 0;
		return true;
	}
	var modifyTreeId, modifytempTreeNode;//存放修改节点的节点,在modify_product_category.js中使用
	/**
	 * 修改某个节点之前的动作
	 * @param treeId
	 * @param treeNode
	 * @returns {Boolean}
	 */
	function beforeEditName(treeId, treeNode) 
	{
	
	   modifyTreeId = treeId;
       modifytempTreeNode = treeNode;      
       var tempid=treeNode.id;   
	   var actionUrl="category_fecth.action";
	   var params={"categoryId":tempid }; 
	   $.ajax
	   ( 
	       {
	         url : actionUrl,
	         data:params,
	         type : "POST",
	         dataType : "json",
	         error : function() {
	             alert("由于服务器原因，获取数据失败，请稍后再改动!!!!");
	         },
	         success : function(data) {
	             //在前台图形中添加节点
                $("#self_id").val(data.category.categoryId);
                $("#modify_self_id").val(data.category.categoryId);
                $("#modify_icon_self_id").val(data.category.categoryId);
                $("#modify_father_id").val(data.category.categoryFatherId);
                $("#modify_category_name").val(data.category.categoryName);
                
                $("#modify_imagesize").val(data.category.imagesize);
                
                
                $(":radio[name=modify_cshow][value='"+handleNull(data.category.isShow)+"']").attr("checked","true");
                $(":radio[name=modify_isInBannershow][value='"+handleNull(data.category.isInBannershow)+"']").attr("checked","true");
                $(":radio[name=modify_isInFloorshow][value='"+handleNull(data.category.isInFloorshow)+"']").attr("checked","true");
                //分类图片
                var tempImage=data.category.image;
                if(tempImage==null)
                {
                	tempImage="";
                }

                $("#showImageInDB").attr("src",tempImage);
                $("#modify_image").val(tempImage);
                $("#modify_preimage").val(tempImage);
                
                //分类图标
                var tempIcon=data.category.icon;
                if(tempIcon==null)
                {
                	tempIcon="";
                }
                $("#showIconInDB").attr("src",tempIcon);
                $("#modify_icon").val(tempIcon);
                $("#modify_preicon").val(tempIcon);
                
                insertEditHtml(data.cml);
                $('#modifyw').window('open');
	         }
	       }
	    );//end of ajax
		return false;
	}
	
	function handleNull(data)
	{
		if(data==null)
			return 0;
		else
			return data;
	}
	
	/**
	 * 删除某个节点之前时的动作
	 * @param treeId
	 * @param treeNode
	 */
	function beforeRemove(treeId, treeNode) {
        
		var zTree = $.fn.zTree.getZTreeObj("category_tree");
		zTree.selectNode(treeNode);
		
		if(confirm("确认删除 -- " + treeNode.name + " 吗？"))
		{
			
			var tempid=treeNode.id;   
			var actionUrl="category_delete.action";
			var params={"categoryId":tempid }; 
			$.ajax
			( 
					{
						url : actionUrl,
						data:params,
						type : "POST",
						dataType : "json",
						error : function() {
							alert("由于服务器原因，删除失败，请稍后再删除!!!!");
						},
						success : function() {
							//在前台图形中添加节点
							alert("删除成功");
						}
					}
			);//end of ajax
		}
		else
		{
			return false;
		}
	
	}
	function onRemove(e, treeId, treeNode) {

	}
	function beforeRename(treeId, treeNode, newName, isCancel) {

	}
	function onRename(e, treeId, treeNode, isCancel) {

	}
	function showRemoveBtn(treeId, treeNode) {
		var nodevalue = treeNode.getParentNode();
		return !(nodevalue == null);
	}
	function showRenameBtn(treeId, treeNode) {
		var nodevalue = treeNode.getParentNode();
		return !(nodevalue == null);
	}
	function showLog(str) {

	}
	function getTime() {
		var now = new Date(), h = now.getHours(), m = now.getMinutes(), s = now
				.getSeconds(), ms = now.getMilliseconds();
		return (h + ":" + m + ":" + s + " " + ms);
	}

	var newCount = 1;
	var tempTreeId, tempTreeNode;//存放增加孩子节点的节点

	function addHoverDom(treeId, treeNode) {
		tempTreeId = treeId;
		tempTreeNode = treeNode;
		//for add new category
		var tempname=treeNode.name;
		$("#belong_category").html(tempname);
		var tempid=treeNode.id;
		$("#belong_id").val(tempid);
		/////
		
		var sObj = $("#" + tempTreeNode.tId + "_span");
		if (tempTreeNode.editNameFlag
				|| $("#addBtn_" + tempTreeNode.tId).length > 0)
			return;
		var addStr = "<span class='button add' id='addBtn_" + tempTreeNode.tId
				+ "' title='增加分类' onfocus='this.blur();'></span>";
		
		var nodevalue = treeNode.getParentNode();
		if(!(nodevalue == null))
		{
			addStr+="<a target='_blank' href='addCategoryImage.action?img.categoryid=" +treeNode.id+ "'  id='diyAddBtn_" +treeNode.id+ "' title='添加图片'  style='background: url(jqladmin/images/addimage.png);width:13px;height:16px'></a>";
			addStr+="<a target='_blank' href='categoryimage_showAll.action?img.categoryid=" +treeNode.id+ "' class='button manageicon' id='diyManageBtn_" +treeNode.id+ "' title='图片管理' onfocus='this.blur();' style='background: url(jqladmin/images/mangeimage.png);width:13px;height:16px'></a>";
//			addStr+="<a id='diyBtn1_" +treeNode.id+ "' herf='diyBtn1_" +treeNode.id+ "'   onclick='alert(1);return false;'>图片管理</a>";
		}
		sObj.after(addStr);
		var btn = $("#addBtn_" + tempTreeNode.tId);
		if (btn)
			btn.bind("click", function() {
				
				//把先前添加的内容清空
				$("#category_name").val("");//
				$("#fileupload").val("");//
				$("#preimage").val("");//
                $("#showImage").html("");
                
				$("#iconImageupload").val("");//
				$("#preicon").val("");//
                $("#showIcon").html("");
				
				insertMultiHtml();
			});
	};
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_" + treeNode.tId).unbind().remove();
		$("#diyAddBtn_" + treeNode.id).unbind().remove();
		$("#diyManageBtn_" + treeNode.id).unbind().remove();
		//$("#diyBtn1_" + treeNode.id).unbind().remove();
	};
	function selectAll() {
		var zTree = $.fn.zTree.getZTreeObj("category_tree");
		zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
	}

	$(document).ready(function() {
		var actionUrl = "category_show.action";
		$.ajax( {
			url : actionUrl,
			type : "post",
			dataType : "json",
			error : function() {
				alert("请求失败!!!!");
			},
			success : function(data) {
				//alert("请求成功！");
				//	alert(data.list);
				$.fn.zTree.init($("#category_tree"), category_setting, data.list);
		}
		});//end of ajax
		});
	function insertEditHtml(cml)
	{
		var html=getEditHtml(cml);
		
		$("#modnavigation").empty();
		$("#modnavigation").append(html);
		showEditAjaxContent();//对加入的元素，添加事件侦听
		$('#modifyw').window('open');
		
	}
	/**
	 * "cml":[
				{"category_id":56,"description":"we","id":3,"keywords":"we","languageName":"英语","name":"we","title":"we"},
				{"category_id":56,"description":"we","id":4,"keywords":"we","languageName":"英语","name":"we","title":"we"}
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
					html+="<li class='show'><a href='javascript: void(0)' class='index'>"+temp.languageName+"</a>"+
					"<div class='content'><table class='innertable'>";
				}
				else
				{
					html+="<li class=''><a href='javascript: void(0)' class='index'>"+temp.languageName+"</a>"+
					"<div class='content'><table class='innertable'>";
				}
				//添加该条记录对应的主键值
				//html+="<tr style='display: none;'><td> <input id='mainId' value="+tempid+" /></td></tr>";
				//添加name
				html+="<tr class=''><td class='colume1' valign=middle align=right>名称</td><td class='colume2'>";
				var tempNameid=temp.id+"_modname";
				var tempNameValue=temp.name;
				tempNameValue=convertStringForHtmlShow(tempNameValue);//转移各种特殊字符，然后在html正常显示

				var inputEle="<input id="+tempNameid+" name="+tempNameid+" value='"+tempNameValue+"'  type='text' style='width: 450px;'/>";
				html+=inputEle+"</td></tr>";
				//添加title
				html+="<tr class=''><td class='colume1' valign=middle align=right>Title</td><td class='colume2'>";
				var temptitleid=temp.id+"_modtitle";
				var temptitleValue=temp.title;
			    inputEle="<input id="+temptitleid+" name="+temptitleid+" value='"+temptitleValue+"'  type='text' style='width: 450px;'/>";
				html+=inputEle+"</td></tr>";
				//添加keywords
				html+="<tr class=''><td class='colume1' valign=middle align=right>Keywords</td><td class='colume2'>";
				var tempkeywordsid=temp.id+"_modkeywords";
				var tempkeywordsValue=temp.keywords;
			    inputEle="<input id="+tempkeywordsid+" name="+tempkeywordsid+" value='"+tempkeywordsValue+"'  type='text' style='width: 450px;'/>";
				html+=inputEle+"</td></tr>";
				//添加description
				html+="<tr class=''><td class='colume1' valign=middle align=right>Description</td><td class='colume2'>";
				var tempdescid=temp.id+"_moddescription";
				var tempDescValue=temp.description;
			    inputEle="<input id="+tempdescid+" name="+tempdescid+" value='"+tempDescValue+"'  type='text' style='width: 450px;'/>";
				//html+=inputEle+"</td></tr><td valign=middle colspan=2 align=center><a href='javascript:void(0)' mainId='"+tempid+"' class='easyui-linkbutton' onclick='javascript:modify_product_category_xiangxi()'>保存</a></td></table></div></li>";
			    html+=inputEle+"</td></tr><td valign=middle colspan=2 align=center><button type='button' mainid="+tempid+"  onclick='modify_product_category_xiangxi(this)'>保存</button></td></table></div></li>";
			}
			return html;
	}
	
	/**
	 * 转移各种特殊字符，然后在html正常显示
	 */
	function convertStringForHtmlShow(data)
	{
		data=data.replace("'","&#39;");//替换单引号的显示
		data=data.replace("\"","&#34;");//替换双引号的显示
		return data;
	}
	
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
				$('#w').window('open');
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
	
	function save_product_category() 
	{
		//获取数据，执行入库操作
		 var fatherID =$("#belong_id").val();
		 var category_name=$.trim($("#category_name").val());
		 var icon=$.trim($("#icon").val());
		 var image=$.trim($("#image").val());
		 var imagesize=$.trim($("#imagesize").val());
		 var isShow=$('input[name="cshow"]:checked').val();
		 var isInBannershow=$('input[name="isInBannershow"]:checked').val();
		 var isInFloorshow=$('input[name="isInFloorshow"]:checked').val(); 
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

		 
		 if(!fatherID && typeof(fatherID)!="undefined"){
		 	alert("没有选择父元素");
		 	return;
		 }
		 if(!category_name && typeof(category_name)!="undefined")
		 {
		 	alert("请填写需要加入的类别名称");
		 	return;
		 }
		 else
		 {
	       $('#w').window('close');

		 	var actionUrl="category_insert.action";
			 var params={
			         "categoryFatherId":fatherID,
	                 "categoryName":category_name,
	                 "multiLanString":multiLanString,
	                 "icon":icon,
	                 "image":image,
	                 "imagesize":imagesize,
	                 "isShow":isShow,
	                 "isInBannershow":isInBannershow,
	                 "isInFloorshow":isInFloorshow
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
					//	alert(data.list);
					//在前台图形中添加节点
					var zTree = $.fn.zTree.getZTreeObj("category_tree");
					zTree.addNodes(tempTreeNode, {
						id : data.category.categoryId,
						pId : data.category.categoryFatherId,
						name : data.category.categoryName
					});
					alert("添加成功");
					document.location.reload();//当前页面
				}
			});//end of ajax
			 
		 }
	}
	
	function uploadImage() 
	{
        var options = {
            url : "uploadFile.action",
            type : "POST",
            dataType : "script",
            success : function(msg) {
                if (msg.indexOf("#") > 0) 
                {
                	$("#tipDiv").css("display","none");//出错提示信息部分隐藏
                	
                    var data = msg.split("#");
                    $("#tipDiv").html(data[0]);
                    $("#image").val(data[2]);
                    $("#preimage").val(data[2]);//下次提交的时候，提交至后台，以便删除以前上传的图片
                    $("#showImage").html("<img style='width:100px;height:100px' src='showImage.action?imageUrl="+data[1]+"'/>");
                    $("#showImage").css("display","");
                } else 
                {
                	 $("#showImage").css("display","none");
                	 
                    $("#tipDiv").html(msg);
                    $("#tipDiv").css("display","");
                }
            }
        };
        $("#form2").ajaxSubmit(options);
        return false;
	}
	function uploadModifyImage() 
	{
        var options = {
            url : "uploadModifyFile.action",
            type : "POST",
            dataType : "script",
            success : function(msg) {
                if (msg.indexOf("#") > 0) 
                {
                	$("#modify_tipDiv").css("display","");//出错提示信息部分隐藏
                    var data = msg.split("#");
                    $("#modify_tipDiv").html(data[0]);
                    $("#modify_image").val(data[2]);
                    $("#modify_preimage").val(data[2]);//下次提交的时候，提交至后台，以便删除以前上传的图片
                    $("#modify_showImage").html("<img id='showImageInDB' style='width:50px;height:50px' src='showImage.action?imageUrl="+data[1]+"'/>");
                    $("#modify_showImage").css("display","");
                    alert("修改图片成功");
                } else 
                {
                	$("#modify_showImage").css("display","none");
                    $("#modify_tipDiv").html(msg);
                    $("#modify_tipDiv").css("display","");
                }
                //为了使第二次上传相同的文件可以生效，所以需要替换掉以前的input
                $("#modify_fileupload").replaceWith("<input id='modify_fileupload' name='modify_fileupload'  type='file'  onchange='javascript:uploadModifyImage()'/>");
            
            }
        };
        $("#modify_form2").ajaxSubmit(options);
        return false;
	}
	
	function uploadIcon() 
	{
        var options = {
            url : "uploadCategoryIcon.action",
            type : "POST",
            dataType : "script",
            success : function(msg) {
                if (msg.indexOf("#") > 0) 
                {
                	$("#iconTipDiv").css("display","none");//出错提示信息部分隐藏
                	
                    var data = msg.split("#");
                    $("#iconTipDiv").html(data[0]);
                    $("#icon").val(data[2]);
                    $("#preicon").val(data[2]);//下次提交的时候，提交至后台，以便删除以前上传的图片
                    $("#showIcon").html("<img style='width:100px;height:100px' src='showImage.action?imageUrl="+data[1]+"'/>");
                    $("#showIcon").css("display","");
                } else 
                {
                	 $("#showIcon").css("display","none");
                	 
                    $("#iconTipDiv").html(msg);
                    $("#iconTipDiv").css("display","");
                }
            }
        };
        $("#iconform").ajaxSubmit(options);
        return false;
	}
	function uploadModifyIcon() 
	{
        var options = {
            url : "iconModify.action",
            type : "POST",
            dataType : "script",
            success : function(msg) {
                if (msg.indexOf("#") > 0) 
                {
                	$("#modify_icon_tipDiv").css("display","");//出错提示信息部分隐藏
                    var data = msg.split("#");
                    $("#modify_icon_tipDiv").html(data[0]);
                    $("#modify_icon").val(data[2]);
                    $("#modify_preicon").val(data[2]);//下次提交的时候，提交至后台，以便删除以前上传的图片
                    $("#modify_showIcon").html("<img id='showIconInDB' style='width:50px;height:50px' src='showImage.action?imageUrl="+data[1]+"'/>");
                    $("#modify_showIcon").css("display","");
                    alert("修改类别图标成功");
                } else 
                {
                	$("#modify_showIcon").css("display","none");
                    $("#modify_icon_tipDiv").html(msg);
                    $("#modify_icon_tipDiv").css("display","");
                }
              //为了使第二次上传相同的文件可以生效，所以需要替换掉以前的input
                $("#modify_iconupload").replaceWith("<input id='modify_iconupload' name='modify_iconupload'  type='file'  onchange='javascript:uploadModifyIcon()'/>");
            
           }
        };
        $("#modify_iconform").ajaxSubmit(options);
        return false;
	}