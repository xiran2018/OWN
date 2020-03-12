/**  
* This class is used for ...  
* @author jingquanliang
* @version  
*       1.0, 2015年1月15日 下午10:57:44  
*/   
package ru.own.www.entity;

public class CartProductAttrShowVO 
{
	private String attrName;  //属性名
	private String attrValueName; //属性值名称
	private int attrvalueid;
	public CartProductAttrShowVO()
	{
	}

	public String getAttrName()
	{
		return attrName;
	}

	public void setAttrName(String attrName)
	{
		this.attrName = attrName;
	}

	public String getAttrValueName()
	{
		return attrValueName;
	}

	public void setAttrValueName(String attrValueName)
	{
		this.attrValueName = attrValueName;
	}

	public int getAttrvalueid()
	{
		return attrvalueid;
	}

	public void setAttrvalueid(int attrvalueid)
	{
		this.attrvalueid = attrvalueid;
	}
}
