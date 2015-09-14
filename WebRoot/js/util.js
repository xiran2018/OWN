function refresh(obj) 
{
        obj.src = "Security/SecurityCodeImageAction?"+Math.random();
        //obj.src="${pageContext.request.contextPath}/imageServlet?"+Math.random();
}


function clientRegisterRefresh(obj) 
{
        obj.src = "Security/SecurityCodeImageAction?type=1&radom="+Math.random();
        //obj.src="${pageContext.request.contextPath}/imageServlet?"+Math.random();
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

/**
 * 把java中的timestamp类型转换为响应的数据显示，其中，参数time即是timestamp中的time属性的值
 * @param time timestamp中的time属性的值
 * @returns {String}
 */
function timeStamp2String(time){
    var datetime = new Date();
    datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();
    return year + "-" + month + "-" + date+" "+hour+":"+minute+":"+second;
}
