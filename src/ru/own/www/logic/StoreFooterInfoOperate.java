package ru.own.www.logic;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.net.httpserver.Authenticator.Success;

import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryClientShow;
import admin.ru.own.www.entity.StorefooterinfoClientShow;
import admin.ru.own.www.entity.Storefooterinfomultilanguage;
import admin.ru.own.www.entity.StorefooterinfomultilanguageEdit;
import admin.ru.own.www.logic.StoreOperate;
import admin.ru.own.www.mybatis.dao.CategoryDAOImp;
import admin.ru.own.www.mybatis.dao.CategoryMapper;
import admin.ru.own.www.mybatis.dao.StoreOperateImpl;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月8日 下午3:03:22  
 */
public class StoreFooterInfoOperate extends ActionSupport implements SessionAware
{
	private Map session; 
	
	private int id;
	
	private String  info=null;
	StorefooterinfomultilanguageEdit content;
	List<StorefooterinfoClientShow> ccs;
	
	public String getCopyRightInfo()
	{
		StoreOperate so=new StoreOperate();
		info=so.getCopyRightInfo();
		if(info!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String getShowStoreFooterInfo()
	{
		int lanid=Integer.parseInt((String) session.get("languageId"));
		
		StoreOperateImpl soi = new StoreOperateImpl();
		ccs= soi.getShowStoreFooterInfo(lanid);
		if(ccs!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	
	public String getShowDetailedInfo()
	{
		int lanid=Integer.parseInt((String) session.get("languageId"));
		
		StoreOperateImpl soi = new StoreOperateImpl();
		ccs= soi.getShowDetailedInfo(lanid,id);
		content=soi.getStorefooterinfoByFooterIdAndLanId(lanid,id);
		if(ccs!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}




	public void setSession(Map session) {
		this.session = session;
	}




	public List<StorefooterinfoClientShow> getCcs() {
		return ccs;
	}




	public void setCcs(List<StorefooterinfoClientShow> ccs) {
		this.ccs = ccs;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public StorefooterinfomultilanguageEdit getContent() {
		return content;
	}


	public void setContent(StorefooterinfomultilanguageEdit content) {
		this.content = content;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}



	
	

}
