package admin.ru.own.www.logic;

import java.util.List;


import admin.ru.own.www.entity.BrandShow;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionSupport;

public class brand_fetch_by_categoryId extends ActionSupport
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	List<BrandShow> list;
	String message;
	String messageCode;
	int id;

	public String execute()
	{

		list=MyBatisDAO.selectBrandByCategoryId(id);
		
		
		int count=list.size();
		//System.out.println("<<<<<<<<<<<<<<<<<<<<<<"+count);
		if(list==null)
		{
			messageCode="200";
			message="此类别下没有相应的品牌系统，请添加！";
			return SUCCESS;
		}
		if(list.size()>=1)
		{
			messageCode="100";
			message="成功";
			return SUCCESS;
		}
		else if(count==0)
		{
			messageCode="200";
			message="此类别下没有相应的品牌系统，请添加！";
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}

	}

	public List<BrandShow> getList() {
		return list;
	}

	public void setList(List<BrandShow> list) {
		this.list = list;
	}

	public String getResult() {
		return message;
	}

	public void setResult(String result) {
		this.message = result;
	}

	public String getMessageCode() {
		return messageCode;
	}

	public void setMessageCode(String messageCode) {
		this.messageCode = messageCode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
