package admin.ru.own.www.entity;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sun.xml.internal.bind.v2.model.core.ID;

import ru.own.www.entity.Order;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import admin.ru.own.www.mybatis.dao.UserOperateImpl;
import admin.ru.own.www.mybatis.dao.UserOperateMapper;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userid=-1;
	private String username;
	private String userpassword;
	private String userrealname;
	private String usertel;
	private String usermail="-1";
	private Integer userlevel;
	private Short sex;//0是女性 female    1是男性 male
	private String passwordtishi;
	private String passworddaan;
	private Double totalbuycount;
	private Short status;
	private Long timeforgetpass;
	private Timestamp createtime;
	private Timestamp lasttime;
	private int jifen;//积分

	// Constructors

	/** default constructor */
	public User() {
	}
	
	/**
	 * 更改用户的积分
	 * @param order
	 * @param cpid
	 * @param sqlSession
	 */
	public void changeJiFen(Order order,SqlSession sqlSession) 
	{
		int userid=order.getUserid();
		UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);
		User user=cMapper.getUserById(userid);
		int jifen=user.getJifen();
		int remainJiFen=jifen-order.getUsejifen()+order.getGivejifen();//剩余的积分=以前的-本次交易使用的+本次交易获得的
		User tempUser=new User();
		tempUser.setUserid(userid);
		tempUser.setJifen(remainJiFen);
		cMapper.updateUserJifen(tempUser);
	}

	/** minimal constructor */
	public User(String username, String userpassword, String usremail,
			Short status, Timestamp createtime, Timestamp lasttime) {
		this.username = username;
		this.userpassword = userpassword;
		this.usermail = usremail;
		this.status = status;
		this.createtime = createtime;
		this.lasttime = lasttime;
	}

	/** full constructor */
	public User(String username, String userpassword, String userrealname,
			String usertel, String usremail, Integer userlevel, Short sex,
			String passwordtishi, String passworddaan, Double totalbuycount,
			Short status, Long timeforgetpass, Timestamp createtime,
			Timestamp lasttime) {
		this.username = username;
		this.userpassword = userpassword;
		this.userrealname = userrealname;
		this.usertel = usertel;
		this.usermail = usremail;
		this.userlevel = userlevel;
		this.sex = sex;
		this.passwordtishi = passwordtishi;
		this.passworddaan = passworddaan;
		this.totalbuycount = totalbuycount;
		this.status = status;
		this.timeforgetpass = timeforgetpass;
		this.createtime = createtime;
		this.lasttime = lasttime;
	}
	
    public boolean containUserName(String username)
    {
		List userList=UserOperateImpl.getUserByUserName(username);
		if(userList.size()>0)
		{
			//下面的for语句是为了排除自己，也就是查找除了自己之外，还有没有别人的用户名是和我自己一样的
			for(int i=0;i<userList.size();i++)
			{
				User tempUser=(User) userList.get(i);
				if(userid!=tempUser.getUserid())
				{//说明找到了一个和自身用户名相同，但是主键不一样的用户,说明确实包含
					return true;
				}
			}
			return false;
			
		}
		else
		{
			return false;
		}
    }
    
	public boolean containEmail(String mail) 
	{
		UserOperateImpl uoi=new UserOperateImpl();
		User user = uoi.getUserByMail(mail);
		if(user!=null&&user.getUserid()>0)
		{
			//下面的语句是为了排除自己，也就是查找除了自己之外，还有没有别人的用户名是和我自己一样的
			if(userid!=user.getUserid())
			{//说明找到了一个和自身用户名相同，但是主键不一样的用户,说明确实包含
				return true;
			}
			else
			{
				return false;
			}
		}
		else
		{
			return false;
		}
	}
	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpassword() {
		return this.userpassword;
	}

	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}

	public String getUserrealname() {
		return this.userrealname;
	}

	public void setUserrealname(String userrealname) {
		this.userrealname = userrealname;
	}

	public String getUsertel() {
		return this.usertel;
	}

	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}



	public String getUsermail() {
		return usermail;
	}

	public void setUsermail(String usermail) {
		this.usermail = usermail;
	}

	public Integer getUserlevel() {
		return this.userlevel;
	}

	public void setUserlevel(Integer userlevel) {
		this.userlevel = userlevel;
	}

	public Short getSex() {
		return this.sex;
	}

	public void setSex(Short sex) {
		this.sex = sex;
	}

	public String getPasswordtishi() {
		return this.passwordtishi;
	}

	public void setPasswordtishi(String passwordtishi) {
		this.passwordtishi = passwordtishi;
	}

	public String getPassworddaan() {
		return this.passworddaan;
	}

	public void setPassworddaan(String passworddaan) {
		this.passworddaan = passworddaan;
	}

	public Double getTotalbuycount() {
		return this.totalbuycount;
	}

	public void setTotalbuycount(Double totalbuycount) {
		this.totalbuycount = totalbuycount;
	}

	public Short getStatus() {
		return this.status;
	}

	public void setStatus(Short status) {
		this.status = status;
	}


	public Long getTimeforgetpass() {
		return timeforgetpass;
	}

	public void setTimeforgetpass(Long timeforgetpass) {
		this.timeforgetpass = timeforgetpass;
	}

	public Timestamp getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(Timestamp createtime) {
		this.createtime = createtime;
	}

	public Timestamp getLasttime() {
		return this.lasttime;
	}

	public void setLasttime(Timestamp lasttime) {
		this.lasttime = lasttime;
	}

	public int getJifen() {
		return jifen;
	}

	public void setJifen(int jifen) {
		this.jifen = jifen;
	}



}