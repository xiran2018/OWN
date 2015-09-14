package admin.ru.own.www.mybatis.dao;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.AdminUser;
import admin.ru.own.www.mybatis.dao.AdminUserMapper;;

public class mybataisTest 
{
    public static void main(String[] args) 
    {  
//    	mybatisSessionFactory.sqlSessionFactory.getConfiguration().addMapper(AdminUserMapper.class);
        SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	ProductsDAO adminUserMapper = sqlSession.getMapper(ProductsDAO.class);  
        } finally 
        {
        	sqlSession.close();
        }
  
    }  
}
