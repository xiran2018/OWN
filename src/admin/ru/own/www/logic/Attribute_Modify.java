package admin.ru.own.www.logic;

import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.ProductAttrMultiLanguage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionSupport;

public class Attribute_Modify extends ActionSupport 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String Name;
	private Short isSearchAttr;
	private Short isPopup;// 是否弹框显示
	private Byte isglobalattr;
	private Short status;


	private Short InputStyle;

	private String attrValues;

	private String newattrValues;//新添加的商品属性值
	private String delattrValues;//删除的商品属性值
	
	
	//修改属性对应的多国语言信息时需要用到该属性
	private String title;
	private String keyword;
	private String description;
	
	
	public String attribute_delete_byAttrId()
	{
		
		boolean flag=MyBatisDAO.attributeDeleteByAttrId(id);
		
		if(flag)
		{
			return SUCCESS;	
		}
		else
		{
			return ERROR;	
		}
	}
	
	@SuppressWarnings("finally")
	public String updateBasicInfo()
	{
		

		Attribute attr=new Attribute();
		
		attr.setAttrId(id);
		attr.setAttrName(Name);
		attr.setAttrStatus(status);
		attr.setIsSearchAttr(isSearchAttr);
		attr.setIsPopup(isPopup);
		attr.setGlobalattr(isglobalattr);
		
		boolean flag=MyBatisDAO.updateBasicInfo(attr);
		
		if(flag)
		{
			return SUCCESS;	
		}
		else
		{
			return ERROR;	
		}
    }
	
	
	public String updateXiangXiInfo()
	{
		ProductAttrMultiLanguage pam=new ProductAttrMultiLanguage();
		pam.setId(id);
		pam.setName(Name);
		pam.setTitle(title);
		pam.setKeywords(keyword);
		pam.setDescription(description);
		boolean flag=MyBatisDAO.updateAttrXiangXiInfo(pam);
		
		if(flag)
		{
			return SUCCESS;	
		}
		else
		{
			return ERROR;	
		}
	}
	
	public String updateAttrValues()
	{
		 if(InputStyle.equals(2)||InputStyle==2)//操作属性值
		{	
			 DataAcessObject dao=new DataAcessObject();
			 
			 //增加新添加的属性值
			 if(!newattrValues.equals("")&&newattrValues!=null)
			 {
				Integer attrid=-1;
				String [] value=newattrValues.split("\\n");  //换行符分隔
				for(int i=0;i<value.length;i++)
				{
					attrid=-1;
//					System.out.println("*************************value="+value[i]);
					String valueName=value[i];
					AttributeValue attrvalue=new AttributeValue();
					attrvalue.setAttrId(id);
					attrvalue.setAttrValueName(valueName);
					attrid=dao.Insert_Attribute_name(attrvalue);
					if(attrid==-1||attrid.equals(-1))
					{
						return ERROR;
					}
				}
			 }
			//删除前台删除的属性值
			 if(!delattrValues.equals("")&&delattrValues!=null)
			 {
				boolean flag;
				String [] delvalue=delattrValues.split("\\n");  //换行符分隔
				for(int i=0;i<delvalue.length;i++)
				{
					
//					System.out.println("*************************value="+value[i]);
					int delid=Integer.parseInt(delvalue[i]);
					flag=dao.deleteAttributeValueById(delid);
					if(!flag)
					{
						return ERROR;
					}
				}
			 }

		}
		return Name;
	}

//	@SuppressWarnings("finally")
//	public String saveBasicInfo()
//	{
//		
//
//		Attribute attr;
//		
//		Session session=HibernateSessionFactory.getSession();
//		Transaction tx = null;
//		 try 
//		 {
//				tx=session.beginTransaction();
//				attr=(Attribute) session.get(Attribute.class, id);
//				attr.setAttrName(Name);
//				attr.setAttrStatus(status);
//				attr.setIsSearchAttr(isSearchAttr);
//				//attr.setInputStyle(InputStyle);//1手工录入  2多个选择   3多行文本框
//				tx.commit();
//		 }
//		 catch (Exception e)
//		 {
//			 System.out.println(">>>>>>>>>>>>>>>>thers is a bug for modify attribute  baisic info!!!!");
//			 e.printStackTrace();
//		     if (tx!=null) tx.rollback();
//			 return ERROR;
//		 }
//		 finally 
//		 {
//				session.close();
//		 }
//
//		return SUCCESS;	
//
//
//
//    }

	public Integer getId() {
		return id;
	}



	public void setId(Integer id) {
		this.id = id;
	}



	public String getName() {
		return Name;
	}



	public void setName(String name) {
		Name = name;
	}
	public Byte getIsglobalattr() {
		return isglobalattr;
	}

	public void setIsglobalattr(Byte isglobalattr) {
		this.isglobalattr = isglobalattr;
	}

	public Short getStatus() {
		return status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public Short getInputStyle() {
		return InputStyle;
	}

	public void setInputStyle(Short inputStyle) {
		InputStyle = inputStyle;
	}

	
	public Short getIsSearchAttr() {
		return isSearchAttr;
	}

	public void setIsSearchAttr(Short isSearchAttr) {
		this.isSearchAttr = isSearchAttr;
	}

	
	



	public String getAttrValues() {
		return attrValues;
	}



	public void setAttrValues(String attrValues) {
		this.attrValues = attrValues;
	}



	public String getNewattrValues() {
		return newattrValues;
	}



	public void setNewattrValues(String newattrValues) {
		this.newattrValues = newattrValues;
	}



	public String getDelattrValues() {
		return delattrValues;
	}



	public void setDelattrValues(String delattrValues) {
		this.delattrValues = delattrValues;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Short getIsPopup() {
		return isPopup;
	}

	public void setIsPopup(Short isPopup) {
		this.isPopup = isPopup;
	}
	
	
	
}