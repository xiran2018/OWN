

/**
 * 密码是否符合要求
 * @param obj
 * @returns {Boolean}
 */
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




/**
 * email 是否符合要求
 * @param obj
 * @returns {Boolean}
 */
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


