function email_mangage()
{
	var port=$("[id='ee.smtpPort']").val(); 
	var flag=Digit.checkIsInt(port);
	if(!flag)
	{
		alert("端口号请输入整数!");
		$('form').on('submit', function (event) {
		    event.preventDefault();
		});
		return;
	}
	else
	{
		$('form').on('submit', function (event) {
//		    event.preventDefault();
		});
		$("form:first").submit();//提交表单
	}
}