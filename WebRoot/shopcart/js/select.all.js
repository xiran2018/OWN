/**
 * 点击全选按钮时的动作
 * @param element
 */
function selectAll(element)
{
	var selectAllFlag=$("#selectAll").prop("checked");
	if(selectAllFlag =="checked" || selectAllFlag==true)
	{//点击了之后，有了选中的状态，说明之前是没有选中的，也就是点击之前没有任何一个元素选中，需要全部选中
		$(element).prop("checked",true);
		//把所有的都选中
		$(".mui_select").each(function(i){
			$(this).prop("checked",true);
		});

		//return;
	}
	else
	{//点击了之后，没有了选中的状态，说明之前是有选中的，也就是点击之前有元素选中，需要把选中的取消选中
		$(element).prop("checked",false);
		//把所有选中的都改为不选中
		$(".mui_select:checked").each(function(i){
			$(this).prop("checked",false);
		});
		//return;
	}
	
	checkboxChangeLister();//点击某一个复选框时的后续动作
}

/**
 * 点击某一个选项时的动作
 * @param element
 */
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
	
	checkboxChangeLister();//点击某一个复选框时的后续动作
}