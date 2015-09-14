package admin.ru.own.www.logic;

import java.util.List;

import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.User;
import admin.ru.own.www.mail.EmailSend;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.UserOperateImpl;

import com.opensymphony.xwork2.ActionSupport;

public class UserOperate extends ActionSupport 
{
	

	private int id;
	private String name;
	private String passw;
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
		UserOperateImpl uoim=new UserOperateImpl();
		user=uoim.getUserById(id);
		long gettime=user.getTimeforgetpass();
		long nowtime=System.currentTimeMillis();
		long interval=(nowtime-gettime)/1000/60/60;
		if(interval<2)
		{//在两个小时之内
			
			boolean flag=uoim.resetPassword(id,passw);//重置密码
			if(flag)
			{
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
		}
		else
		{//超过了两个小时
			return ERROR;
		}
		
	}
	
	public String getPasswordByMail()
	{
		UserOperateImpl uoim=new UserOperateImpl();
		user=uoim.getUserByMail(mail);//总页数
		if(user!=null)
		{
			boolean flag=uoim.updateTimeForgetPass(System.currentTimeMillis(),user.getUserid());
			String sendMailString="<div><b>Dear:"+user.getUsername()+"</b></div>";
		    sendMailString+="<div><b>click the following link to get password</b></div>";
			sendMailString+="http://localhost:8080/own/handleGetPassword.action?id="+user.getUserid();
			sendMailString+="<div>---------------------------------------------------------------------------------</div>";
			sendMailString+="<div>Email: sales@poplanding.com</div>";
			sendMailString+="<div>Website: www.poplanding.com</div>";
			sendMailString+="<div>Tel:+86-13436838059</div>";
			boolean sendMailFlag=EmailSend.sendHtmlMail(user,sendMailString);
			if(flag&&sendMailFlag)
			{
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
		}
		else
		{
			return ERROR;
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
		
		boolean flag=UserOperateImpl.addUser(user);
		if(flag)
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

}
