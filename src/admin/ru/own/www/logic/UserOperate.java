package admin.ru.own.www.logic;

import java.util.List;

import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.User;
import admin.ru.own.www.mail.*;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.UserOperateImpl;

import admin.ru.own.www.validcode.SecurityCode;
import com.opensymphony.xwork2.ActionSupport;
import util.Encrypt;

public class UserOperate extends ActionSupport 
{
	

	private int id;
	private String name;
	private String passw;
	private String checkcode;
	private String mail;
	private Short status;
	private String tel;
	
	//分页需要的信息
	private String errCode;
	private String errMessage;
	private Integer pagenum=1;//需要获取的信息所在的页数,默认从第一页开始取数据
	private Integer numberInPage=10;//每一页需要显示的行数，默认是10行数据
	private int totalNumberPage; //总页数
	
	private List<User> userInfo;
	private User user;
	
	
	public String resetPassword()
	{

		UserOperateImpl uoim = new UserOperateImpl();
		user = uoim.getUserById(id);
		if ((checkcode != null) & (user.getCheckcodeforgetpass() != null) & checkcode.equals(user.getCheckcodeforgetpass()))
		{
			long gettime = user.getTimeforgetpass().longValue();
			long nowtime = System.currentTimeMillis();
			long interval = (nowtime - gettime) / 1000L / 60L / 60L;
			if (interval < 2L)
			{//在两个小时之内
				String encodePasString = Encrypt.StringEncrypt(passw, "");
				boolean flag = uoim.resetPassword(id, encodePasString);
				if (flag)
				{
					errCode = "0";
					return "success";
				} else
				{
					errCode = "1";
					return "success";
				}
			}
			else
			{//超过了两个小时
				errCode = "2";
				return "success";
			}
		} else
		{
			errCode = "3";
			return "success";
		}
	}
	
	public String getPasswordByMail()
	{
		UserOperateImpl uoim = new UserOperateImpl();
		user = uoim.getUserByMail(mail);
		if (user != null)
		{
			String randomString = (new StringBuilder(String.valueOf(SecurityCode.getActiveCode()))).append(user.getUsername()).append(user.getUsermail()).toString();
			String checkCodeString = Encrypt.StringEncrypt(randomString, "");
			boolean flag = uoim.updateTimeForgetPass(System.currentTimeMillis(), user.getUserid(), checkCodeString);
			user.setCheckcodeforgetpass(checkCodeString);
			EmailEntity emailEntiey = (new EmailHtml()).getPasswordHtml(user);
			boolean sendMailFlag = (new EmailSend()).sendHtmlMailwithEmbeddedImages(EmailStaticArgs.emailArgs, emailEntiey);
			if (flag && sendMailFlag)
				return "success";
			else
				return "error";
		} else
		{
			return "error";
		}
	}
	
	public String handleGetPassword()
	{
		return SUCCESS;
	}
	
	public String modifyUserById()
	{
		User user=new User();
		user.setUserid(id);
		user.setUsermail(mail);
		user.setUsertel(tel);
		user.setStatus(status);
		UserOperateImpl uoim=new UserOperateImpl();
		boolean flag=uoim.modifyUserById(user);//
		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String getUserById()
	{
		UserOperateImpl uoim=new UserOperateImpl();
		user=uoim.getUserById(id);//总页数
		if(user!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String deleteUserById()
	{
		UserOperateImpl uoim=new UserOperateImpl();
		boolean flag=uoim.deleteUserById(id);//总页数
		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String getUsers()
	{
		int count=UserOperateImpl.getTotalNumberOfUser();//总页数
		totalNumberPage=count/numberInPage;//设定有多少页
		if(count>numberInPage&&count%numberInPage!=0)
		{//说明不能整除
			totalNumberPage++;
		}
		
		int offset=(pagenum-1)*numberInPage;//从哪一个偏移量开始取数据
		Pagination tempp=new Pagination();
		tempp.setNumberInPage(numberInPage);
		tempp.setOffset(offset);
		
		userInfo= UserOperateImpl.getUsersByPageNum(tempp);
        if(userInfo == null) 
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
	
	public String addUser()
	{
		User user=new User();
		user.setUsername(name);
		user.setUserpassword(passw);
		user.setUsermail(mail);
		user.setStatus(status);
		
		int flag=UserOperateImpl.addUser(user);
		if(flag > 0)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
		
	}
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassw() {
		return passw;
	}
	public void setPassw(String passw) {
		this.passw = passw;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}







	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Short getStatus() {
		return status;
	}



	public void setStatus(Short status) {
		this.status = status;
	}

	public Integer getPagenum() {
		return pagenum;
	}

	public void setPagenum(Integer pagenum) {
		this.pagenum = pagenum;
	}

	public Integer getNumberInPage() {
		return numberInPage;
	}

	public void setNumberInPage(Integer numberInPage) {
		this.numberInPage = numberInPage;
	}

	public int getTotalNumberPage() {
		return totalNumberPage;
	}

	public void setTotalNumberPage(int totalNumberPage) {
		this.totalNumberPage = totalNumberPage;
	}

	public List<User> getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(List<User> userInfo) {
		this.userInfo = userInfo;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
}
