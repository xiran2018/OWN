package admin.ru.own.www.logic;



import java.util.List;

import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.AttributeValueMultiLanguage;
import admin.ru.own.www.entity.AttributeValueMultiLanguageShow;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import com.opensymphony.xwork2.ActionSupport;

public class AttributeValuesDAO extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private int categoryId;
	private String Name;
	private String title;
	private String keyword;
	private String description;
	private Short InputStyle;
	
	private Attribute attribute=null;
	private AttributeValue av=null;
	private List<AttributeValue> attrValueList=null;
	private List<AttributeValueMultiLanguageShow> avmls=null;
	private String multiAttrValueString=null;


	public String execute()
	{

			DataAcessObject dao=new DataAcessObject();
			attribute=dao.getAttributeByAttrId(id);
			attrValueList=dao.getAttrValueByAttrId(id);
			return SUCCESS;	


    }
	
	public String attrValue_insert()
	{
		//存储多国语言相应的属性值
		boolean attflag=MyBatisDAO.insertProductAttrValues(multiAttrValueString,id,categoryId);
		
		Attribute attr=new Attribute();
		attr.setInputStyle(InputStyle);
		attr.setAttrId(id);
		boolean bttflag=MyBatisDAO.updateAttrInputStyle(attr);
		
		boolean cflag=attflag&bttflag;
		
		if(cflag==false)
		{
			return ERROR;
		}
		else
		{
			return SUCCESS;
		}
	}
	
	public String attrValue_modify_xiangxi()
	{
			AttributeValueMultiLanguage avml=new AttributeValueMultiLanguage();
			avml.setId(id);
			avml.setName(Name);
			avml.setTitle(title);
			avml.setKeywords(keyword);
			avml.setDescription(description);
			boolean flag=MyBatisDAO.attrValue_modify_xiangxi(avml);
			if(flag)
			{
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
    }
	
	public String attrValue_modify_basic()
	{
			AttributeValue  attributeValue=new AttributeValue();
			attributeValue.setAttrValueId(id);
			attributeValue.setAttrValueName(Name);
			boolean flag=MyBatisDAO.attrValue_modify_basic(attributeValue);
			if(flag)
			{
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
    }
	
	public String multiAttributeValues_fecth_byAttrId()
	{
		av=MyBatisDAO.fecthAttrValueByAttrId(id);
		avmls=MyBatisDAO.fecthAttrValuesMultiLanByAttrId(id);
		return SUCCESS;	
	}
	
	public String delAttrValue()
	{
		boolean flag=MyBatisDAO.delAttrValue(id);
		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public List<AttributeValue> getAttrValueList() {
		return attrValueList;
	}


	public Attribute getAttribute() {
		return attribute;
	}


	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}


	public void setAttrValueList(List<AttributeValue> attrValueList) {
		this.attrValueList = attrValueList;
	}

	public AttributeValue getAv() {
		return av;
	}

	public void setAv(AttributeValue av) {
		this.av = av;
	}

	public List<AttributeValueMultiLanguageShow> getAvmls() {
		return avmls;
	}

	public void setAvmls(List<AttributeValueMultiLanguageShow> avmls) {
		this.avmls = avmls;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
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


	public String getMultiAttrValueString() {
		return multiAttrValueString;
	}


	public void setMultiAttrValueString(String multiAttrValueString) {
		this.multiAttrValueString = multiAttrValueString;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public Short getInputStyle() {
		return InputStyle;
	}

	public void setInputStyle(Short inputStyle) {
		InputStyle = inputStyle;
	}



}