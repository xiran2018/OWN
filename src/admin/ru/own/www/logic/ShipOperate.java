package admin.ru.own.www.logic;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.json.JSONObject;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import ru.own.www.entity.User;
import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryShow;
import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShipOperate extends ActionSupport 
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//添加时需要的信息
	private Integer id;
	private String name;
	private Short status;
	private String beizhu;
	//获取信息时需要的信息
	private Integer pagenum=1;//需要获取的信息所在的页数,默认从第一页开始取数据
	private Integer numberInPage=10;//每一页需要显示的行数，默认是10行数据
	
	private String errCode;
	private String errMessage;
	private Integer totalNumberPage; //总页数
	private List<Shipping> shippingInfo;
	
	//获取某一个物流信息时需要的变量
	private Shipping ship;
	
	
	JSONObject jo = new JSONObject();	//返回值页面需要的变量
	/**
	 * 添加物流方式
	 * @return
	 */
	public String addShipping()
	{
			Shipping ship=new Shipping();
			ship.setName(name);
			ship.setStatus(status);
			ship.setBeizhu(beizhu);
			id=MyBatisDAO.insertShipping(ship);
			
			if(id!=-1)
			{
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
    }

	public String getShipping()
	{
		int count=MyBatisDAO.getTotalNumberOfShipping();//总页数
		totalNumberPage=(count/numberInPage)+1;//设定有多少页
		
		int offset=(pagenum-1)*numberInPage;//从哪一个偏移量开始取数据
		Pagination tempp=new Pagination();
		tempp.setNumberInPage(numberInPage);
		tempp.setOffset(offset);
		
		shippingInfo= MyBatisDAO.getShippingByPageNum(tempp);
        if(shippingInfo == null) 
        {
        	errCode="100";
        	errMessage="服务器异常，请稍后再试";
        	jo.put("errCode", "100");
        	jo.put("errMessage","服务器异常，请稍后再试");
        }
        else 
        {
        	errCode="200";
        	errMessage="get the data success!";
        	
        	jo.put("errCode", "200");
        	jo.put("errMessage", "get the data success!");
        	jo.put("totalNumberPage", "50");
			jo.put("entireTransInfo", shippingInfo);
        }
        return SUCCESS;
	}
	
	public String getAllShipping()
	{	
		
		shippingInfo= MyBatisDAO.getAllShipping();
        if(shippingInfo == null) 
        {
        	errCode="100";
        	errMessage="服务器异常，请稍后再试";
        	jo.put("errCode", "100");
        	jo.put("errMessage","服务器异常，请稍后再试");
        }
        else 
        {
        	errCode="200";
        	errMessage="get the data success!";
        	
        	jo.put("errCode", "200");
        	jo.put("errMessage", "get the data success!");
        	jo.put("totalNumberPage", "50");
			jo.put("entireTransInfo", shippingInfo);
        }
        return SUCCESS;
	}
	
	public String getShippingById()
	{
		ship=MyBatisDAO.getShippingById(id);
		if(ship==null)
		{
			return ERROR;
		}
		else
		{
			return SUCCESS;
		}
	}
	
	public String modify_shipping()
	{
		Shipping ship=new Shipping();
		ship.setId(id);
		ship.setName(name);
		ship.setStatus(status);
		ship.setBeizhu(beizhu);
		boolean flag=MyBatisDAO.modifyShipping(ship);
		
		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String deleteShippingById()
	{
		boolean flag=MyBatisDAO.deleteShippingById(id);
		
		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Short getStatus() {
		return status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}

	public String getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getErrCode() {
		return errCode;
	}

	public void setErrCode(String errCode) {
		this.errCode = errCode;
	}

	public String getErrMessage() {
		return errMessage;
	}

	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}



	public Integer getPagenum() {
		return pagenum;
	}

	public void setPagenum(Integer pagenum) {
		this.pagenum = pagenum;
	}

	public Integer getTotalNumberPage() {
		return totalNumberPage;
	}

	public void setTotalNumberPage(Integer totalNumberPage) {
		this.totalNumberPage = totalNumberPage;
	}

	public List<Shipping> getShippingInfo() {
		return shippingInfo;
	}

	public void setShippingInfo(List<Shipping> shippingInfo) {
		this.shippingInfo = shippingInfo;
	}

	public JSONObject getJo() {
		return jo;
	}

	public void setJo(JSONObject jo) {
		this.jo = jo;
	}

	public Integer getNumberInPage() {
		return numberInPage;
	}

	public void setNumberInPage(Integer numberInPage) {
		this.numberInPage = numberInPage;
	}

	public Shipping getShip() {
		return ship;
	}

	public void setShip(Shipping ship) {
		this.ship = ship;
	}






	
}