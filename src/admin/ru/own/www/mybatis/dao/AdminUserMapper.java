package admin.ru.own.www.mybatis.dao;

import admin.ru.own.www.entity.AdminUser;

public interface AdminUserMapper 
{
	public AdminUser selectAdminUserById(int id);

}
