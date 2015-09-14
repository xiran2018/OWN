$(document).ready(function () {
	
	registerEventListerAddInPage();//给网页的元素添加注册事件，和分页没有关系，可以根据不同的情况删除该函数
	
      $("A.listdiv").click(function(){

      	//  $(this).find('ul').css("display","none");
          	
      	//  $(this).next("ul.goods").slideToggle(500).siblings("ul.goods").slideUp("slow");
          	

        });
});

function registerEventListerAddInPage()
{
	dialog = $("#modifyw").dialog({
	      autoOpen: false,
	      closeText: "hide",
	      height: "auto",
	      width: "500px",
	      modal: true,
	      buttons: {
	       "确定": Login,
	       "取消": function() {
	          dialog.dialog( "close" );
	        }
	      },
	      close: function() {
//	        form[ 0 ].reset();
//	        allFields.removeClass( "ui-state-error" );
	      }
	    });
}

function Login()
{
//	document.forms[0].submit();

	var actionUrl = "admin_login.action";
	
	 var userName=$.trim($("#userName").val());
	 var password=$.trim($("#password").val());
	 
	 var params=
	 {
		   "userName":userName,
           "password":password,
           "type":"1",
	 };
	 
	$.ajax( { //登录
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			alert("稍后再试");
		},
		success : function(data) 
		{
			addUser();
			
		}
	});// end of ajax
}
//********************************************************************************************
/**
 * the global Variable
 * 
 */
var password;

//********************************************************************************************
function getPassword(element)
{
	password=$.trim($(element).val());
	var flag=isPassword(password);
	if(!flag)
	{
		alert("请输入符合要求的密码");
//		$(element).focus();
	}
}



function isPassword(obj)
{   
    reg=/^[\w]{6,12}$/;   
   if(!reg.test(obj))
   {        
//        $("#test").html("<b>请输入正确的邮箱地址</b>");   
	   return false;
    }
   else
    {   
       return true;
    }   
}  

function checkPassword(element)
{
	var checkpassword=$.trim($(element).val());
	if(password!=checkpassword)
	{
		alert("两次输入的密码不一致");
//		$("#passw").focus();
		return;
	}
}


function checkIsMail(element)
{
	var checkpassword=$.trim($(element).val());
	var flag=isEmail(checkpassword);
	if(!flag)
	{
		alert("请输入正确的邮箱地址");
//		$(element).focus();
		return;
	}
	
}

function isEmail(obj)
{   
    reg=/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;   
   if(!reg.test(obj))
   {        
//        $("#test").html("<b>请输入正确的邮箱地址</b>");   
	   return false;
    }
   else
    {   
       return true;
    }   
}  

function addUser()
{
	var actionUrl = "addUser.action";
	
	 var name=$.trim($("#name").val());
	 var passw=$.trim($("#passw").val());
	 var checkpassw=$.trim($("#checkpassw").val());
	 var mail=$.trim($("#mail").val());
	 
	 if(name=="")
	{
				 alert("请输入用户名");
				 return;
	}
	 
	 if(passw=="")
	{
			 alert("请输入密码");
			 return;
	}
	 
	 if(checkpassw=="")
	 {
		 alert("请确认密码");
		 return;
	 }
	 
	if(mail=="")
	{
		 alert("请输入邮箱，方便找回密码");
		 return;
	}
	 
	 var status=$('input[name="status"]:checked').val();

	 
	 var params=
	 {
            "name":name,
            "passw":passw,
            "mail":mail,
            "status":status
	 };
	 
	$.ajax( { //添加用户
		url : actionUrl,
		type : "post",
		data:params,
		dataType : "json",
		error : function(data) 
		{
			if(data.status=="200")
			{
				dialog.dialog( "open" );
			}
			else if(data.status=="500")
			{	
				alert("由于服务器原因，添加失败!!!!");
			}
		},
		success : function(data) 
		{
			dialog.dialog( "close" );
			alert("添加成功！");
		}
	});// end of ajax

}