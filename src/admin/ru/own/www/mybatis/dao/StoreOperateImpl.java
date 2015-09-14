package admin.ru.own.www.mybatis.dao;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.CategoryMultiLanguage;
import admin.ru.own.www.entity.StoreFooterInfoEdit;
import admin.ru.own.www.entity.Storefooterinfo;
import admin.ru.own.www.entity.StorefooterinfoClientShow;
import admin.ru.own.www.entity.Storefooterinfomultilanguage;
import admin.ru.own.www.entity.StorefooterinfomultilanguageEdit;
import admin.ru.own.www.entity.shipTemplateEdit;

public class StoreOperateImpl 
{

	public List<StoreFooterInfoEdit> getAllHomeInfo() 
	{
		List<StoreFooterInfoEdit> ste=null;
		//首先获取所有的货运方式
		
		
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	ste=cMapper.getAllHomeInfo(); 
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return ste;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
        
        return ste;
	}

	public int InsertStoreHomeInfo(Storefooterinfo sftInfo) 
	{

		boolean flag = false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.InsertStoreHomeInfo(sftInfo); 
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
        
		int id=-1;
        if(flag)
        {
        	id=sftInfo.getId();
        }
        
        return id;
	}
	/**
	 * 参数格式如下：[{'id':7,'other_name':'ert','other_title':'ert','other_keywords':'ert','other_desc':'ert'},{'id':8,'other_name':'ert','other_title':'eer','other_keywords':'ter','other_desc':'tert'}]
	 * @param multiLanString
	 */
	public boolean insertMultiStoreHomeInfo(int id, String multiLanString) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
       try 
        {
    	   StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);
    		JSONArray jsonArrary=JSONArray.fromObject(multiLanString);
    		int size=jsonArrary.size();
    		for(int i=0;i<size;i++)
    		{
    			JSONObject jsonObject =jsonArrary.getJSONObject(i);
    			Storefooterinfomultilanguage cml=new Storefooterinfomultilanguage();
    			cml.setStorefooterinfoid(id);
    			cml.setLanid(jsonObject.getInt("id"));
    			cml.setName(jsonObject.getString("other_name"));
    			cml.setTitle(jsonObject.getString("other_title"));
    			cml.setKeyword(jsonObject.getString("other_keywords"));
    			cml.setDescription(jsonObject.getString("other_desc"));
    			//insertForeignCategory(cml);
    			cMapper.insertMultiStoreHomeInfo(cml); 
    		}
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return false;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }

       return true;
		
	}

	public boolean deleteStoreHomeInfoById(int id) 
	{
		boolean flag = false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.deleteStoreHomeInfoById(id); 
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
        
        if(flag)
        {
        	return true;
        }
        else
        {
        	return false;
        }
        
	}

	public Storefooterinfo getStorefooterinfoById(int id) 
	{
		Storefooterinfo flag = null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.getStorefooterinfoById(id); 
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

	public List<StorefooterinfomultilanguageEdit> getStorefooterinfoEditByFooterId(int id) 
	{
		List<StorefooterinfomultilanguageEdit> flag = null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.getStorefooterinfoEditByFooterId(id); 
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

	public boolean modify_basic_info(Storefooterinfo sftInfo) 
	{
		boolean flag = false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.modify_basic_info(sftInfo); 
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
        
        if(flag)
        {
        	return true;
        }
        else
        {
        	return false;
        }
	}

	public boolean modify_xiangxi_info(Storefooterinfomultilanguage cml) 
	{
		boolean flag = false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.modify_xiangxi_info(cml); 
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
        
        if(flag)
        {
        	return true;
        }
        else
        {
        	return false;
        }
	}

	public boolean modify_xiangxi_content(Storefooterinfomultilanguage cml) 
	{
		boolean flag = false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.modify_xiangxi_content(cml); 
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
        
        if(flag)
        {
        	return true;
        }
        else
        {
        	return false;
        }
	}

	public List<StorefooterinfoClientShow> getShowStoreFooterInfo(int lanid) 
	{
		List<StorefooterinfoClientShow> flag = null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.getShowStoreFooterInfo(lanid); 
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

	public List<StorefooterinfoClientShow> getShowDetailedInfo(int lanid, int id) 
	{
		List<StorefooterinfoClientShow> flag = null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.getShowDetailedInfo( lanid,  id); 
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

	public StorefooterinfomultilanguageEdit getStorefooterinfoByFooterIdAndLanId(int lanid, int id) 
	{
		StorefooterinfomultilanguageEdit flag = null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		StoreOperateMapper cMapper = sqlSession.getMapper(StoreOperateMapper.class);  

        try 
        {
        	 flag=cMapper.getStorefooterinfoByFooterIdAndLanId(lanid,id); 
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
