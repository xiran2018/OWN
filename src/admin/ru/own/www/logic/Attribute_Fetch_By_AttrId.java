package admin.ru.own.www.logic;



import java.util.List;




import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;

import admin.ru.own.www.entity.ProductAttrMultiLanguageShow;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;


import com.opensymphony.xwork2.ActionSupport;

public class Attribute_Fetch_By_AttrId extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int Id;	
	private Attribute attribute=null;
	private List<ProductAttrMultiLanguageShow> pamu=null;
	private List<AttributeValue> attrValueList=null;


	public String execute()
	{
			List<Attribute> list=null;
			DataAcessObject dao=new DataAcessObject();
			attribute=dao.getAttributeByAttrId(Id);
			attrValueList=dao.getAttrValueByAttrId(Id);
			if(attribute==null)
			{
				return ERROR;	
			}
			else
			{
//				System.out.println("*************************************"+result);
				//获取多语言的attribute
				pamu=MyBatisDAO.getProductAttrMultiLangByAttrId(Id);
				
				return SUCCESS;	
			}

    }


	public int getId() {
		return Id;
	}


	public void setId(int id) {
		Id = id;
	}


	public Attribute getAttribute() {
		return attribute;
	}


	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}


	public List<AttributeValue> getAttrValueList() {
		return attrValueList;
	}


	public void setAttrValueList(List<AttributeValue> attrValueList) {
		this.attrValueList = attrValueList;
	}


	public List<ProductAttrMultiLanguageShow> getPamu() {
		return pamu;
	}


	public void setPamu(List<ProductAttrMultiLanguageShow> pamu) {
		this.pamu = pamu;
	}








    

}