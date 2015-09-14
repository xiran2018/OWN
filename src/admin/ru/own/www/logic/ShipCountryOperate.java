package admin.ru.own.www.logic;



import java.util.List;




import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionSupport;

public class ShipCountryOperate extends ActionSupport 
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
	private List<ShippingCountry> shippingInfo;
	
	//获取某一个物流信息时需要的变量
	private ShippingCountry ship;
	
	
	/**
	 * 添加
	 * @return
	 */
	public String addShippingCountry()
	{
			ShippingCountry ship=new ShippingCountry();
			ship.setName(name);
			ship.setStatus(status);
			ship.setBeizhu(beizhu);
			id=MyBatisDAO.insertShippingCountry(ship);
			
			if(id!=-1)
			{
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
    }

	public String fetchShippingCountry()
	{
		int count=MyBatisDAO.getTotalNumberOfShippingCountry();//总页数
		totalNumberPage=(count/numberInPage)+1;//设定有多少页
		
		int offset=(pagenum-1)*numberInPage;//从哪一个偏移量开始取数据
		Pagination tempp=new Pagination();
		tempp.setNumberInPage(numberInPage);
		tempp.setOffset(offset);
		
		shippingInfo= MyBatisDAO.getShippingCountryByPageNum(tempp);
        if(shippingInfo == null) 
        {
        	errCode="100";
        	errMessage="服务器异常，请稍后再试";
        }
        else 
        {
        	errCode="200";
        	errMessage="get the data success!";
        }
        return SUCCESS;
	}
	
	public String fetchAllShippingCountry()
	{	
		
		shippingInfo= MyBatisDAO.getAllShippingCountry();
        if(shippingInfo == null) 
        {
        	errCode="100";
        	errMessage="服务器异常，请稍后再试";
        }
        else 
        {
        	errCode="200";
        	errMessage="get the data success!";
        }
        return SUCCESS;
	}
	
	public String getShippingCountryById()
	{
		ship=MyBatisDAO.getShippingCountryById(id);
		if(ship==null)
		{
			return ERROR;
		}
		else
		{
			return SUCCESS;
		}
	}
	
	public String modify_ShippingCountry()
	{
		ShippingCountry ship=new ShippingCountry();
		ship.setId(id);
		ship.setName(name);
		ship.setStatus(status);
		ship.setBeizhu(beizhu);
		boolean flag=MyBatisDAO.modifyShippingCountry(ship);
		
		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String deleteShippingCountryById()
	{
		boolean flag=MyBatisDAO.deleteShippingCountryById(id);
		
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




	public Integer getNumberInPage() {
		return numberInPage;
	}

	public void setNumberInPage(Integer numberInPage) {
		this.numberInPage = numberInPage;
	}

	public List<ShippingCountry> getShippingInfo() {
		return shippingInfo;
	}

	public void setShippingInfo(List<ShippingCountry> shippingInfo) {
		this.shippingInfo = shippingInfo;
	}

	public ShippingCountry getShip() {
		return ship;
	}

	public void setShip(ShippingCountry ship) {
		this.ship = ship;
	}








	
}