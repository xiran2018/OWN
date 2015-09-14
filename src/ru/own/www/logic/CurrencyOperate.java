package ru.own.www.logic;

import java.util.List;

import admin.ru.own.www.entity.Currency;
import admin.ru.own.www.entity.ForegroundImage;
import admin.ru.own.www.mybatis.dao.CurrencyDAO;
import admin.ru.own.www.mybatis.dao.CurrencyDAOImp;
import admin.ru.own.www.mybatis.dao.ForegroundImageDAO;
import admin.ru.own.www.mybatis.dao.ForegroundImageDAOImp;

import com.opensymphony.xwork2.ActionSupport;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月5日 下午2:46:02  
 */
public class CurrencyOperate  extends ActionSupport 
{
	
	List<Currency> curlist;
	
	
	public String getCurrency()
	{
		CurrencyDAO fid=new CurrencyDAOImp();
		curlist=fid.getAllShowCurrency();
		if(curlist!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}


	public List<Currency> getCurlist() {
		return curlist;
	}


	public void setCurlist(List<Currency> curlist) {
		this.curlist = curlist;
	}
	
	
}
