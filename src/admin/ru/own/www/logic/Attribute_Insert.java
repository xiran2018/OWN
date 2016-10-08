package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.Transaction;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;
import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryShow;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class Attribute_Insert extends ActionSupport 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private byte globalattr;
	private String Name;
	private Integer categoryId;
	private Short isColorAttr;
	private Short InputStyle;
	private Short isKeyAttr;
	private Short isSaleAttr;
	private Short isSearchAttr;
	private Short isPopup;//是否弹窗显示
	private Short isMultiselect;
	private Short isNecessary;
	private Integer sortNumber;
	private Short attrStatus;
	private String multiLanString;
	private String multiAttrValueString;

	@SuppressWarnings("finally")
	public String execute()
	{
		Attribute attr=new Attribute();
		attr.setAttrName(Name);
		attr.setGlobalattr(globalattr);
		if(globalattr==0)//不是全局属性
		{			
			attr.setCategoryId(categoryId);
		}
		else
		{//如果是全局属性，则把该属性的商品分类设为1
			attr.setCategoryId(1);
		}
		attr.setAttrStatus(attrStatus);
		attr.setIsSearchAttr(isSearchAttr);
		attr.setIsPopup(isPopup);
		attr.setInputStyle(InputStyle);//1手工录入  2多个选择   3多行文本框   4下拉菜单
		
		Timestamp timestamp=new Timestamp(System.currentTimeMillis());
		attr.setCreateTime(timestamp);

		
		DataAcessObject dao=new DataAcessObject();
		id=dao.Insert_Product_attr(attr);
		if(id==-1||id.equals(-1))
		{
			return ERROR;
		}
		//存储多国语言相应的属性
		MyBatisDAO.insertProductAttrMultiLang(multiLanString,id);
		
		if(InputStyle.equals(2)||InputStyle==2||InputStyle.equals(4)||InputStyle==4)//存储属性值
		{
			//存储多国语言相应的属性值
			boolean attflag=MyBatisDAO.insertProductAttrValues(multiAttrValueString,id,categoryId);
			
			if(attflag==false)
			{
				return ERROR;
			}


		}

		return SUCCESS;	



    }



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



	



	public byte getGlobalattr() {
		return globalattr;
	}



	public void setGlobalattr(byte globalattr) {
		this.globalattr = globalattr;
	}



	public String getMultiLanString() {
		return multiLanString;
	}



	public void setMultiLanString(String multiLanString) {
		this.multiLanString = multiLanString;
	}



	public String getMultiAttrValueString() {
		return multiAttrValueString;
	}



	public void setMultiAttrValueString(String multiAttrValueString) {
		this.multiAttrValueString = multiAttrValueString;
	}



	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Short getIsColorAttr() {
		return isColorAttr;
	}

	public void setIsColorAttr(Short isColorAttr) {
		this.isColorAttr = isColorAttr;
	}



	public Short getInputStyle() {
		return InputStyle;
	}

	public void setInputStyle(Short inputStyle) {
		InputStyle = inputStyle;
	}

	public Short getIsKeyAttr() {
		return isKeyAttr;
	}

	public void setIsKeyAttr(Short isKeyAttr) {
		this.isKeyAttr = isKeyAttr;
	}

	public Short getIsSaleAttr() {
		return isSaleAttr;
	}

	public void setIsSaleAttr(Short isSaleAttr) {
		this.isSaleAttr = isSaleAttr;
	}

	public Short getIsSearchAttr() {
		return isSearchAttr;
	}

	public void setIsSearchAttr(Short isSearchAttr) {
		this.isSearchAttr = isSearchAttr;
	}

	public Short getIsMultiselect() {
		return isMultiselect;
	}

	public void setIsMultiselect(Short isMultiselect) {
		this.isMultiselect = isMultiselect;
	}

	public Short getIsNecessary() {
		return isNecessary;
	}

	public void setIsNecessary(Short isNecessary) {
		this.isNecessary = isNecessary;
	}

	public Integer getSortNumber() {
		return sortNumber;
	}

	public void setSortNumber(Integer sortNumber) {
		this.sortNumber = sortNumber;
	}

	public Short getAttrStatus() {
		return attrStatus;
	}

	public void setAttrStatus(Short attrStatus) {
		this.attrStatus = attrStatus;
	}



	public Short getIsPopup() {
		return isPopup;
	}



	public void setIsPopup(Short isPopup) {
		this.isPopup = isPopup;
	}
	
	
}