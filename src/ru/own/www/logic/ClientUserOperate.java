package ru.own.www.logic;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import ru.own.www.mybatis.dao.OrderOperateDAOImpl;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import admin.ru.own.www.entity.User;
import admin.ru.own.www.mybatis.dao.UserOperateImpl;
import admin.ru.own.www.mybatis.dao.UserOperateMapper;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.mail.imap.protocol.UID;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月8日 下午3:49:59  
 */
public class ClientUserOperate extends ActionSupport implements SessionAware
{
	private Map session; 
	private int id;//用户id,用户性别
	private short sex;
	private int loginFlag=0;//登录失败或者成功标志  1：验证码不对   2:登陆正确    3：用户名或者密码不对
	private int loginTime;//登陆次数
	private String username="";
	private String curpassword;//修改密码的时候，用户的当前密码
	private String password="";
	private String mail="";//用户email
	private String tel;//用户电话
	private String checkcode="";
	
	

	
    //该字段的意思表示，当用户登录时，应该返回何种类型的值，0（默认）：表示可以按照常规的方式返回，1：表示登录成功之后，只能返回json的格式数据，使页面保留在发出请求的页面（防止页面跳转），然后继续登录之前的请求
    int type=0;
    
    //登录前页面
    private String customerPrePage;
    
    //用户信息
    private User uinfo;
    //所有的订单信息
    private int orderCount=0;
    
    //用户注册完成之后需要返回的页面
    private String redirctURLString;
    
    
    private int codeError=0;//0:表示成功，1:表示新用户注册时，验证码是错误的,2:用户名不是唯一的,3:email重复,4:修改密码的时候，原密码不正确
    
    
    /**
     * 更改用户密码
     * @return
     */
    public String changePasswordSecurity()
    {
    	if(password==null||password.equals(""))
    	{
    		return INPUT;//让用户输入信息
    	}
    	else
    	{
    		Integer uid=(Integer) session.get("customeruserid");
    		if(uid==null||uid<=0)
    			return LOGIN;
    		if(checkPasswordCorrect(uid))
    		{
    			UserOperateImpl uoim=new UserOperateImpl();
    			boolean flag=uoim.resetPassword(id, password);//
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
    		{
				codeError=4;
				return SUCCESS;
			}
		}
    	
    }
    
    private boolean checkPasswordCorrect(int uid) 
    {
    	UserOperateImpl uoi=new UserOperateImpl();
    	User tempuinfo=uoi.getUserById(uid);
    	if(tempuinfo.getUserpassword().equals(curpassword))
    		return true;
    	else
    		return false;
	}

	/**
     * 改变用户基本信息
     * @return
     */
	public String modifyUserByUserId()
	{
		User user=new User();
		user.setUserid(id);
		user.setUsername(username);
		user.setUsermail(mail);
		user.setUsertel(tel);
		user.setSex(sex);
		if(user.containUserName(username))
		{//用户名已经包含了
			codeError=2;
			return SUCCESS;
		}
		else if(user.containEmail(mail))
		{//邮箱已经包含了
			codeError=3;
			return SUCCESS;
		}
		else 
		{//修改用户
			UserOperateImpl uoim=new UserOperateImpl();
			boolean flag=uoim.clienSidetModifyUserById(user);//
			if(flag)
			{
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
		}
		

	}
    /**
     * 新用户注册
     * @return
     */
    public String newCustomerRegister()
    {
    	redirctURLString="/usermanage/expressJoin.jsp";
    	if(username==null||username.equals("")||password==null||password.equals("")||mail==null||mail.equals(""))
    	{//说明是初次登陆这个页面，还没有填写注册信息
    		return SUCCESS;
    	}
    	else
    	{//新用户注册
    		String tempSessionCode=(String) session.get("CLIENT_REGISTER_SESSION_SECURITY_CODE");
    		tempSessionCode=tempSessionCode.toLowerCase();
			checkcode=checkcode.toLowerCase();
    		if(checkcode!=null&&checkcode.equals(tempSessionCode))
    		{//验证码是正确的
    			User user=new User();
    			if(user.containUserName(username))
    			{//用户名已经包含了
    				codeError=2;
    				return SUCCESS;
    			}
    			else if(user.containEmail(mail))
    			{//邮箱已经包含了
    				codeError=3;
    				return SUCCESS;
    			}
    			if(addUser())
    			{
    				return "home";
    			}
    			else 
    			{
    				return SUCCESS;
				}
    		}
    		else
    		{//验证码是错误的
    			codeError=1;
    			return SUCCESS;
			}
		}
    }
    

    
    /**
     * 添加用户
     * @return
     */
	public boolean addUser()
	{
		User user=new User();
		user.setUsername(username);
		user.setUserpassword(password);
		user.setUsermail(mail);
		user.setStatus((short) 1);
		
		boolean flag=UserOperateImpl.addUser(user);
		if(flag)
		{
			return true;
		}
		else
		{
			return false;
		}
		
	}
    
    
    /**
     * 用户中心导航首页
     * @return
     */
    public String buyerIndex()
    {
    	Integer uid=(Integer) session.get("customeruserid");
    	if(uid==null||uid<0)
    	{
    		return LOGIN;
    	}
    	else 
    	{
    		getUserById();//获取用户信息
    		orderCount=getTotalOrderCountByUserId(uid);//获取用户的所有订单信息
		}
    	return SUCCESS;
    }
    
    public int getTotalOrderCountByUserId(int uid)
    {
    	OrderOperateMapper oomMapper=new OrderOperateDAOImpl();
		oomMapper.openSession();
		int count=oomMapper.getTotalOrderCountByUserId(uid);
		oomMapper.closeSession();
		return count;
	}
   
    /**
     *  获取用户的信息
     * @return
     */
    public String getUserById()
    {
    	Integer uid=(Integer) session.get("customeruserid");
    	if(uid==null||uid<0)
    	{
    		return LOGIN;
    	}
    	UserOperateImpl uoi=new UserOperateImpl();
    	uinfo=uoi.getUserById(uid);
    	return SUCCESS;
    	
    }
    
    public String userLogout() 
    {
    	//清除session中的数据
		   session.remove("customeruserid");
		   session.remove("customerusername");
		   return SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public String userLogin()
	{
		//首先验证校验码是否正确
		boolean checkCodeFlag=checkCode();
		if(!checkCodeFlag)
		{//check code is wrong
			loginFlag=1;
		}
		else
		{
			UserOperateImpl uoi=new UserOperateImpl();
			User u=uoi.getUserByNameAndPassword(username,password);
			if(u!=null&&u.getUserid()!=null&&u.getUserid()>0)
			{//get the username from the db
				loginFlag=2;
				session.put("customeruserid", u.getUserid());
				session.put("customerusername", u.getUsername());
			}
			else
			{//username or password is wrong
				loginFlag=3;
			}
		}
		
       if(type==0)
       {
    	   if(loginFlag==2)
    	   {
    		   //获取跳转到登陆界面之前的页面地址，由拦截器提供
    		   customerPrePage = (String)session.get("customerPrePage");
    		   //清除session中的数据
    		   session.remove("customerPrePage");
    		   if (customerPrePage == null||"".equals(customerPrePage)) 
    		   {
    			   //不是拦截器跳转到登陆页面的，直接访问的登陆页面
    			   return "HOME";
    		   } else 
    		   {
    			   return SUCCESS;
    		   }
    	   }
    	   else 
    	   {
    		   return ERROR;
    	   }
    	   
       }
       else if(type==1)
       {
    	   return "JSONRESULT";
       }
		
		return SUCCESS;
	}
	
	/***
	 * 用户登录测试大于等于三次才会进行真正的校验，否则不进行校验
	 * @return
	 */
	private boolean checkCode()
	{
		String tempCount=(String) session.get("login_count_time");
		int a=0;
		if(tempCount!=null)
		{
			a=Integer.parseInt(tempCount);
			
		}
		loginTime=++a;
		if(a<3)
		{
			String tempNumber=""+a;
			session.put("login_count_time",tempNumber);
			return true;
		}
			
		else
		{
			String sessioncheckcode=(String) session.get("SESSION_SECURITY_CODE");
			sessioncheckcode=sessioncheckcode.toLowerCase();
			checkcode=checkcode.toLowerCase();
			if(sessioncheckcode.equals(checkcode))
				return true;
			else
				return false;
		}
	}
	
	public void setSession(Map session) {
		this.session = session;
	}




	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCheckcode() {
		return checkcode;
	}

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	public int getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(int loginFlag) {
		this.loginFlag = loginFlag;
	}

	public int getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(int loginTime) {
		this.loginTime = loginTime;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getCustomerPrePage() {
		return customerPrePage;
	}

	public void setCustomerPrePage(String customerPrePage) {
		this.customerPrePage = customerPrePage;
	}


	public User getUinfo() {
		return uinfo;
	}


	public void setUinfo(User uinfo) {
		this.uinfo = uinfo;
	}


	public String getRedirctURLString() {
		return redirctURLString;
	}


	public void setRedirctURLString(String redirctURLString) {
		this.redirctURLString = redirctURLString;
	}


	public int getCodeError() {
		return codeError;
	}


	public void setCodeError(int codeError) {
		this.codeError = codeError;
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

	public short getSex() {
		return sex;
	}
	public void setSex(short sex) {
		this.sex = sex;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public String getCurpassword() {
		return curpassword;
	}

	public void setCurpassword(String curpassword) {
		this.curpassword = curpassword;
	}
	
	
}
