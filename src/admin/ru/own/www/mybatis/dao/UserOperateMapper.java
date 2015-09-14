package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.User;

public interface UserOperateMapper 
{

	boolean addUser(User user);
	int getTotalNumberOfUser();
	List<User> getUsersByPageNum(Pagination tempp);
	boolean deleteUserById(int id);
	User getUserById(int id);
	boolean modifyUserById(User user);
	User getUserByMail(String mail);
	boolean updateTimeForgetPass(long currentTimeMillis, Integer id);
	boolean resetPassword(int id, String passw);
	User getUserByNameAndPassword(String username, String password);
	void updateUserJifen(User tempUser);
	List<User> getUserByUserName(String username);
	boolean clienSidetModifyUserById(User user);

}
