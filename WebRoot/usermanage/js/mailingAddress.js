/**
 * 删除货运地址
 * @param mailAddressId
 */
function deleteMyAddress(mailAddressId)
{
	if(confirm("Are you sure want to delete this address?"))
	{
		var actionUrl = "client-center/delMailAddress.action";
		
		var params=
		 {
			   "id":mailAddressId
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
				if(data.status=="0")
				{
					alert("sorry,please try again");
				}
				else if(data.status=="1")
				{
					alert("delete success!");
					window.location.href="client-center/shippingAddressShow.action";
				}
				else if(data.status=="2")
				{
					alert("sorry,some orders has used the address,so you can not delete the address!");
				}

			}
		});// end of ajax
	}

	
	
}