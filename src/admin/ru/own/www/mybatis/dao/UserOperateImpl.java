package admin.ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.User;

public class UserOperateImpl
{

	public static boolean addUser(User user) 
	{
		boolean flag=false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
        	flag=cMapper.addUser(user); 
//	        System.out.println("商品主键："+pid);
        } 
        catch(Exception e)
        {
        	sqlSession.rollback();
        	e.printStackTrace();
        	return false;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return flag;
	}

	public static int getTotalNumberOfUser()
	{
		int count=0;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	count=cMapper.getTotalNumberOfUser(); 
	    } 
	    catch(Exception e)
	    {
	    	sqlSession.rollback();
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return count;
	}

	public static List<User> getUsersByPageNum(Pagination tempp) 
	{
		List<User> pamu=null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	pamu=cMapper.getUsersByPageNum(tempp); 
	    } 
	    catch(Exception e)
	    {
	    	
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return pamu;
	}

	public boolean deleteUserById(int id) 
	{
		boolean flag=false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	flag=cMapper.deleteUserById(id); 
	    } 
	    catch(Exception e)
	    {
	    	sqlSession.rollback();
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return flag;
	}

	public User getUserById(int id) 
	{
		User user=null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	user=cMapper.getUserById(id); 
	    } 
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return user;
	}

	/**
	 * 后台更改用户的信息
	 * 
	 * @param user
	 * @return
	 */
	public boolean modifyUserById(User user)
	{
		boolean flag=false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	flag=cMapper.modifyUserById(user); 
	    } 
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return flag;
	}

	public User getUserByMail(String mail) 
	{
		User user=null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	user=cMapper.getUserByMail(mail); 
	    } 
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return user;
	}

	public boolean updateTimeForgetPass(long currentTimeMillis, Integer id) 
	{
		boolean flag=false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	flag=cMapper.updateTimeForgetPass(currentTimeMillis,id); 
	    } 
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return flag;
	}

	public boolean resetPassword(int id, String passw) 
	{
		boolean flag=false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	flag=cMapper.resetPassword(id,passw); 
	    } 
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return flag;
	}

	public User getUserByNameAndPassword(String username, String password) 
	{
		User user=null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	user=cMapper.getUserByNameAndPassword(username,password); 
	    } 
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return user;
	}

	public static List getUserByUserName(String username) 
	{
		List<User> pamu=null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	pamu=cMapper.getUserByUserName(username); 
	    } 
	    catch(Exception e)
	    {
	    	
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return pamu;
	}

	/**
	 * 客户自己，更改用户的信息
	 * @param user
	 * @return
	 */
	public boolean clienSidetModifyUserById(User user) 
	{
		boolean flag=false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	UserOperateMapper cMapper = sqlSession.getMapper(UserOperateMapper.class);  
	    	flag=cMapper.clienSidetModifyUserById(user); 
	    } 
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	sqlSession.close();
	    }
	    return flag;
	}

}
