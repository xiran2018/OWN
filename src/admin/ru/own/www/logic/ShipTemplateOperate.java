package admin.ru.own.www.logic;


import java.util.List;

import net.sf.json.JSONArray;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.ShippingTemplate;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.ShippingTemplateDAOImp;
import admin.ru.own.www.entity.shipTemplateEdit;

import com.opensymphony.xwork2.ActionSupport;

public class ShipTemplateOperate extends ActionSupport 
{
	private String shipTemplateName;
	private String shipTemplate;
	private List<ShippingTemplate> stlist;
	private int id;
	
	private ShippingTemplate st=null;
	private List<shipTemplateEdit> ste=null;
	String returnJson;
	

	
	public String shipTemplateEdit()
	{
		
		ShippingTemplateDAOImp stdao=new ShippingTemplateDAOImp();
		st=stdao.getShipTemplateByTemplateId(id);
		ste=stdao.getShipTemplateEditByTemplateId(id);  //id为货运模板的id
		JSONArray tempJson=JSONArray.fromObject(ste);
		
		returnJson=tempJson.toString();
		returnJson.replace("\"", "\'");
		//System.out.println("\n"+returnJson);
		
		if(ste==null)
		{
			return ERROR;
		}
		else
		{
			return SUCCESS;
		}
	}
	
	public String deleteShippingTemplateById()
	{
		boolean flag;
		ShippingTemplateDAOImp stdao=new ShippingTemplateDAOImp();
		flag=stdao.deleteShippingTemplateById(id);
		if(!flag)
		{
			return ERROR;
		}
		else
		{
			return SUCCESS;
		}
	}
	
	public String getAllShipTemplate()
	{
		ShippingTemplateDAOImp stdao=new ShippingTemplateDAOImp();
		stlist=stdao.fetchAllShippingTemplate();
		if(stlist==null)
		{
			return ERROR;
		}
		else
		{
			return SUCCESS;
		}
	}
	
	public String saveAllShipTemplate()
	{
		JSONArray shipTemplateJSONArray=JSONArray.fromObject(shipTemplate);
		boolean flag=MyBatisDAO.saveAllShipTemplate(shipTemplateName,shipTemplateJSONArray);
		if(flag)
		{			
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}

	public String modifyShipTemplate()
	{
		JSONArray shipTemplateJSONArray=JSONArray.fromObject(shipTemplate);
		boolean flag=MyBatisDAO.modifyShipTemplate(id,shipTemplateName,shipTemplateJSONArray);
		if(flag)
		{			
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String getShipTemplateName() {
		return shipTemplateName;
	}

	public void setShipTemplateName(String shipTemplateName) {
		this.shipTemplateName = shipTemplateName;
	}

	public String getShipTemplate() {
		return shipTemplate;
	}

	public void setShipTemplate(String shipTemplate) {
		this.shipTemplate = shipTemplate;
	}

	public List<ShippingTemplate> getStlist() {
		return stlist;
	}

	public void setStlist(List<ShippingTemplate> stlist) {
		this.stlist = stlist;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<shipTemplateEdit> getSte() {
		return ste;
	}

	public void setSte(List<shipTemplateEdit> ste) {
		this.ste = ste;
	}

	public String getReturnJson() {
		return returnJson;
	}

	public void setReturnJson(String returnJson) {
		this.returnJson = returnJson;
	}

	public ShippingTemplate getSt() {
		return st;
	}

	public void setSt(ShippingTemplate st) {
		this.st = st;
	}
	
	
}
