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
	dialog = $("#modifyw").dialog({
	      autoOpen: false,
	      closeText: "hide",
	      height: "auto",
	      width: "500px",
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
	
	$("#page960").on("click",".to-edit-btn",function(){
		dialog.dialog( "open" );
	});
	
	$("#modifyw").on("click",".dpl-btn-cancel",function(){
		 dialog.dialog( "close" );
	});
	
	$("#modifyw").on("click",".dpl-btn-save",modifyUser);
}
/**
 * 修改用户信息
 */
function modifyUser()
{
	var actionUrl = "client-center/modifyUser.action";
	
	 var id=$.trim($("#userid").val());
	 var username=$.trim($("#username").val());
	 var sex=$("input[type=radio][name=sex]:checked").val();
	 var mail=$.trim($("#mail").val());
	 var tel=$.trim($("#usertel").val());
	 
	if(!isEmail(mail))
	{
		alert("Please enter a valid Email Address");
		return;
	}
	else if(username==""||username==null||username==undefined)
	{
		alert("Please enter a name");
		return;
	}

	 
	 var params=
	 {
		   "id":id,
		   "username":username,
		   "sex":sex,
		   "mail":mail,
           "tel":tel
	 };
	 
	$.ajax( {
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			alert("sorry,try again!!");
		},
		success : function(data) 
		{
			if(data=="0")
			{
				dialog.dialog( "close" );
				window.location.href="client-center/userinfo.action";
//				alert("Ok,success!");
			}
			else if(data=="2")
			{//用户名重复
				$("#name-tipbox").removeClass("hide");

//				alert("sorry,the name has already registered before");
			}
			else if(data=="3")
			{//email重复
				$("#email-tipbox").removeClass("hide");
//				alert("sorry, the email has already registered before!!");
			}

		}
	});// end of ajax
}

function checkUserName(element)
{
	var username=$.trim($(element).val());
	if(username==""||username==null||username==undefined)
	{
		$("#name-tipbox").removeClass("hide");
		return;
	}
}

function checkIsMail(element)
{
	var checkpassword=$.trim($(element).val());
	var flag=isEmail(checkpassword);
	if(!flag)
	{
		$("#email-tipbox").removeClass("hide");
		return;
	}
	
}

function isEmail(obj)
{   
    reg=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;   
   if(!reg.test(obj))
   {        
	   return false;
    }
   else
    {   
       return true;
    }   
}  