///////////////////////////////////////////////////////////////////
var attrForeignValue=[]; //按照json的格式，存放属性值，具体格式为:
//[{name:红色,multiInfo:[{id(语言id）:1,other_name：“23”,other_title:,other_keywords:,other_desc:},{},{}]},{},{}]
var attrValuePosition;//记录当前编辑的页面中(未写入数据库)的属性值在attrForeignValue数组中的位置
var attrValueInDB=[];//存储放在数据库中的属性值，以便在添加属性值时进行比较，避免存入重复的属性值 （在editattributevalues。js中使用）
var attrValueInDBPosition;//记录当前编辑的页面中(已经写入数据库)的属性值在attrValueInDB数组中的位置（在editattributevalues。js中使用）
///////////////////////////////////////////////////////////////////

/**
 * 对新加入但是还没有存入数据库的属性值，当点击编辑按钮时的动作
 */


function checkAttrIsSame(nameEle)
{
	len=attrForeignValue.length;
	for(var i=0;i<len;i++)
	{
		tempEle=attrForeignValue[i];
		tempname=tempEle.name;
		if(nameEle==tempname)
		{
			return true;
			//break;
		}
	}
	
	
	len=attrValueInDB.length;
	for(var i=0;i<len;i++)
	{

			tempname=attrValueInDB[i];
			if(nameEle==tempname)
			{
				return true;
				//break;
			}

	}
	
	return false;
}

/**
 * 添加属性值按钮的动作
 * @param element
 */
function buttonAddAttrValues(element)
{
	$('#addattrw').window('open');
}

function saveAttrValueInThePage()
{
	 obj={};
	 tempznname=$.trim($("#attr_value_name").val());
	 obj.name=tempznname;
	 obj.multiInfo=[];
	 
	 len=multiforeigid.length;
	 for(var j=0;j<len;j++)
     {
		 
		 tempobj={ };
		 tempid=multiforeigid[j];
		 tempobj.id=tempid;
		 
		 tempname=tempid+"_attrforeignname";
		 other_name=$.trim($("#"+tempname).val());
		 tempobj.other_name=other_name;
		 
		 temptitle=tempid+"_attrforeigntitle";
		 other_title=$.trim($("#"+temptitle).val());
		 tempobj.other_title=other_title;
		 
		 tempkeywords=tempid+"_attrforeignkeywords";
		 other_keywords=$.trim($("#"+tempkeywords).val());
		 tempobj.other_keywords=other_keywords;
		 
		 tempdesc=tempid+"_attrforeigndescription";
		 other_desc=$.trim($("#"+tempdesc).val());
		 tempobj.other_desc=other_desc;
		 
		 obj.multiInfo.push(tempobj);
     }
	 
	 attrForeignValue.push(obj);
}

/**
 * 把属性值加入页面之中
 */
function save_product_attr_value()
{
	//alert($(element).html());
	var textElement=$("#attr_value_name");
	var text=$.trim(textElement.val());
	
	if(text=="")
	{
		alert("请输入属性值");
		return;
	}
	 flag=checkAttrIsSame(text);
	 if(flag)
	 {
		 alert("请加入不相同的属性名！");
		 return;
	 }
	saveAttrValueInThePage();
	
	var addElement=$("#input_attr_values");
	var tempString='<span class="attr_value_span new_attr_value_span"><input type="text" class="attr_value" readonly="readonly" style="width: 154px;background-color: #B4C7C7;" value='+text+' /><a class="close" href="javascript:void(0)" onclick="deleteNewAttribute(this)"></a><a class="attrvalueedit" href="javascript:void(0)" onclick="editNewAttribute(this)" title="编辑该属性值"></a></span>';
	addElement.append(tempString);
	return;
}


function deleteNewAttribute(element)
{
	//alert($(element).html());

	var spanElement=$(element).parent(".attr_value_span");
	if(! confirm(' 你确定要删除该属性吗? ' ) ) { return false; }
	var attr_value=$(element).prevAll(".attr_value").val();
	delNewAttrInThePage(attr_value);
	spanElement.remove(); 
	return false;
}


function delNewAttrInThePage(attr_value)
{
	len=attrForeignValue.length;
	for(var i=0;i<len;i++)
	{
		tempEle=attrForeignValue[i];
		tempname=tempEle.name;
		if(attr_value==tempname)
		{
			attrForeignValue.splice(i, 1);
			break;
		}
	}
}
//**********************************************************************
var editElement;  //该属性存储编辑的值所在的span元素
//**********************************************************************
/**
 * 编辑在页面中的属性值
 */
function editNewAttribute(element)
{
	var attrValue=$(element).prevAll(".attr_value").val();
	editElement=element;
	len=attrForeignValue.length;
	for(var i=0;i<len;i++)
	{
		tempEle=attrForeignValue[i];
		tempname=tempEle.name;
		if(attrValue==tempname)
		{
			//把该元素对应的值加入修改属性值的页面中
			inserteditNewAttribute(tempEle);
			
			attrValuePosition=i;  //记录当前编辑的属性值元素的位置
			
			$('#editattrw').window('open');
			break;
		}
	}
}
/**
 * 把在数组中的相应信息加入到页面中的相应元素中
 * //[{name:红色,multiInfo:[{id(语言id）:1,other_name：“23”,other_title:,other_keywords:,other_desc:},{},{}]},{},{}]
 * @param tempEle
 */
function inserteditNewAttribute(temp)
{
	tempname=tempEle.name;
	$("#edit_attr_value_name").val(tempname);
	
	var multiInfo=temp.multiInfo;
	var len=multiInfo.length;
	for(var i=0;i<len;i++)
	{
		tempEle=multiInfo[i];
		tempid=tempEle.id;
		var tempNameid=tempid+"_editattrforeignname";
		name=tempEle.other_name;
		$("#"+tempNameid).val("");
		$("#"+tempNameid).val(name);
		
		var temptitleid=tempid+"_editattrforeigntitle";
		title=tempEle.other_title;
		$("#"+temptitleid).val("");
		$("#"+temptitleid).val(title);
		
		var tempkeywordsid=tempid+"_editattrforeignkeywords";
		keywords=tempEle.other_keywords;
		$("#"+tempkeywordsid).val("");
		$("#"+tempkeywordsid).val(keywords);
		
		var tempdescid=tempid+"_editattrforeigndescription";
		desc=tempEle.other_desc;
		$("#"+tempdescid).val("");
		$("#"+tempdescid).val(desc);
	}
	

}

function checkAttrIsSameWithOther(nameEle)
{
	//和没有加入至数据库中的属性值进行比较
	len=attrForeignValue.length;
	for(var i=0;i<len;i++)
	{
		if(i!=attrValuePosition)
		{
			tempEle=attrForeignValue[i];
			tempname=tempEle.name;
			if(nameEle==tempname)
			{
				return true;
				//break;
			}
		}

	}
	
	//和已经加入至数据库中的属性值进行比较
	len=attrValueInDB.length;
	for(var i=0;i<len;i++)
	{

		    tempname=attrValueInDB[i];
			if(nameEle==tempname)
			{
				return true;
				//break;
			}

	}
	
	return false;
}
/**
 * 函数的作用是对
 * 没有提交到数据库的属性值进行更改
 * //[{name:红色,multiInfo:[{id(语言id）:1,other_name：“23”,other_title:,other_keywords:,other_desc:},{},{}]},{},{}]
 */
function save_edit_product_attr_value()
{
	var  tempEle=attrForeignValue[attrValuePosition]; //需要修改的元素
	
	var textElement=$("#edit_attr_value_name");
	var text=$.trim(textElement.val());

	
	
	if(text=="")
	{
		alert("请输入属性值");
		return;
	}
	 flag=checkAttrIsSameWithOther(text);
	 if(flag)
	 {
		 alert("请加入不相同的属性名！");
		 return;
	 }
	 
		//改变页面元素中现实的值
		$(editElement).prevAll(".attr_value").val(text);
		
	tempEle.name=text;//修改属性值名称
	
	//修改针对多语言的名称
	var multiInfo=tempEle.multiInfo;
	var len=multiInfo.length;
	for(var i=0;i<len;i++)
	{
		tempMultiInfoEle=multiInfo[i];
		tempid=tempMultiInfoEle.id;
		var tempNameid=tempid+"_editattrforeignname";
		name=$("#"+tempNameid).val();
		tempMultiInfoEle.other_name=name;
		
		var temptitleid=tempid+"_editattrforeigntitle";
		title=$("#"+temptitleid).val();
		tempMultiInfoEle.other_title=title;
		
		var tempkeywordsid=tempid+"_editattrforeignkeywords";
		keywords=$("#"+tempkeywordsid).val();
		tempMultiInfoEle.other_keywords=keywords;
		
		var tempdescid=tempid+"_editattrforeigndescription";
		desc=$("#"+tempdescid).val();
		tempMultiInfoEle.other_desc=desc;
	}
}