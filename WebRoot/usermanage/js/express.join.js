
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
		$("#password-tipbox").removeClass("hide");
		return false;
	}
	else
	{
		$("#password-tipbox").addClass("hide");
		return true;
	}
}



function isPassword(obj)
{   
    reg=/^[\w]{6,12}$/;   
   if(!reg.test(obj))
   {        
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
		$("#confirm-password-tipbox").removeClass("hide");
		return false;
	}
	else
	{
		$("#confirm-password-tipbox").addClass("hide");
		return true;
	}
}

function checkUserName(element)
{
	var username=$.trim($(element).val());
	if(username==""||username==null||username==undefined)
	{
		$("#name-tipbox").removeClass("hide");
		return false;
	}
	else
	{
		$("#name-tipbox").addClass("hide");
		return true;
	}
}

function checkIsMail(element)
{
	var checkpassword=$.trim($(element).val());
	var flag=isEmail(checkpassword);
	if(!flag)
	{
		$("#email-tipbox").removeClass("hide");
		return false;
	}
	else
	{
		$("#email-tipbox").addClass("hide");
		return true;
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

function validate()
{
	if(!checkIsMail("#mail"))
		return;
	if(!checkUserName("#username"))
		return;
	if(!getPassword("#password"))
		return;
	if(!checkPassword("#checkpassw"))
		return;
	var checkcode=$("#checkcode").val()
	if(checkcode==null||checkcode==""||checkcode==undefined)
	{
		$("#checkcode-tipbox").removeClass("hide");
		return;
	}

	
	$("form:first").submit();//提交表单
}


