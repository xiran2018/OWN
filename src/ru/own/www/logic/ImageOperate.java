package ru.own.www.logic;

import java.util.List;

import admin.ru.own.www.entity.ForegroundImage;
import admin.ru.own.www.mybatis.dao.ForegroundImageDAO;
import admin.ru.own.www.mybatis.dao.ForegroundImageDAOImp;

import com.opensymphony.xwork2.ActionSupport;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月5日 下午2:46:02  
 */
public class ImageOperate  extends ActionSupport 
{
	
	List<ForegroundImage> filist;
	ForegroundImage smallImage;
	
	
	public String getIndexSmallImage()
	{
		ForegroundImageDAO fid=new ForegroundImageDAOImp();
		smallImage=fid.getShowIndexSmallImage();
		fid.closeSession();
		if(smallImage!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String getIndexPlayImage()
	{
		ForegroundImageDAO fid=new ForegroundImageDAOImp();
		filist=fid.getShowIndexPlayImage();
		fid.closeSession();
		if(filist!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	public List<ForegroundImage> getFilist() {
		return filist;
	}
	public void setFilist(List<ForegroundImage> filist) {
		this.filist = filist;
	}

	public ForegroundImage getSmallImage() {
		return smallImage;
	}

	public void setSmallImage(ForegroundImage smallImage) {
		this.smallImage = smallImage;
	}
	
	
}
