package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.User;

public interface UserOperateMapper 
{
	public abstract boolean addUser(User user);

	public abstract int getTotalNumberOfUser();

	public abstract List getUsersByPageNum(Pagination pagination);

	public abstract boolean deleteUserById(int i);

	public abstract User getUserById(int i);

	public abstract boolean modifyUserById(User user);

	public abstract User getUserByMail(String s);

	public abstract boolean updateTimeForgetPass(long l, Integer integer, String s);

	public abstract boolean resetPassword(int i, String s);

	public abstract User getUserByNameAndPassword(String s, String s1);

	public abstract void updateUserJifen(User user);

	public abstract List getUserByUserName(String s);

	public abstract boolean clienSidetModifyUserById(User user);

	public abstract boolean newUserActivate(int i);
//	boolean addUser(User user);
//	int getTotalNumberOfUser();
//	List<User> getUsersByPageNum(Pagination tempp);
//	boolean deleteUserById(int id);
//	User getUserById(int id);
//	boolean modifyUserById(User user);
//	User getUserByMail(String mail);
//	boolean updateTimeForgetPass(long currentTimeMillis, Integer id);
//	boolean resetPassword(int id, String passw);
//	User getUserByNameAndPassword(String username, String password);
//	void updateUserJifen(User tempUser);
//	List<User> getUserByUserName(String username);
//	boolean clienSidetModifyUserById(User user);
//	boolean newUserActivate(int i);

}
