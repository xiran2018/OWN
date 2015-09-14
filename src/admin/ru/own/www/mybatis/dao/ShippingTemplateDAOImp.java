package admin.ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ru.own.www.entity.ShippingShowVO;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.ShippingTemplate;
import admin.ru.own.www.entity.ShippingTemplateTime;
import admin.ru.own.www.entity.ShippingTemplateXiangxi;
import admin.ru.own.www.entity.shipTemplateEdit;

public class ShippingTemplateDAOImp implements ShippingTemplateMapper {

	@Override
	public int saveShippingTemplateName(ShippingTemplate st) {
		return 0;
	}

	@Override
	public boolean saveShippingTemplate(ShippingTemplateXiangxi stxx) {
		return false;
	}

	@Override
	public List<ShippingTemplate> getAllShippingTemplate() {
		List<ShippingTemplate> list = null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		ShippingTemplateMapper dao = sqlSession.getMapper(ShippingTemplateMapper.class);
		list = dao.getAllShippingTemplate();
		sqlSession.close();
		return list;
	}
	
	public static void main(String[] args) {
		ShippingTemplateDAOImp daoImp = new ShippingTemplateDAOImp();
//		List<ShippingTemplate> list = daoImp.getAllShippingTemplate();
//		daoImp.getShipTemplateEditByTemplateId(31);
		ShippingTemplate st=new ShippingTemplate();
		st.setId(31);
		st.setName("jjbb");
		daoImp.modifyShippingTemplateName(st);
//		System.out.println(list.size());
		
//		String a="\"id\"";
//		a.replace("\"", "\'");
//		System.out.println(a);
		
	}

	@Override
	public boolean saveShippingTemplateTime(ShippingTemplateTime stt) {
		// TODO Auto-generated method stub
		
		return false;
	}

	@Override
	public List<ShippingTemplate> fetchAllShippingTemplate() 
	{
		List<ShippingTemplate> list = null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		ShippingTemplateMapper dao = sqlSession.getMapper(ShippingTemplateMapper.class);
		list = dao.fetchAllShippingTemplate();
		sqlSession.commit();
		sqlSession.close();
		return list;
	}

	public boolean deleteShippingTemplateById(int id)
	{
		// TODO Auto-generated method stub
		boolean flag=false;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  
        	flag=cMapper.deleteShippingTemplateById(id); 
//	        System.out.println("商品主键："+pid);
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
		return flag;
	}

	/**
	 * 为了返回所需要的类型，实际取的时候，还有货运方式的id
	 */
	public List<shipTemplateEdit>  getShipTemplateEditByTemplateId(int id) 
	{
		List<shipTemplateEdit> ste=null;
		//首先获取所有的货运方式
		
		
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  

        try 
        {
        	ste=cMapper.getShipTemplateEditByTemplateId(id); 
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

        //针对取出来的数据，指定	 timeStyle; time; shipStyle;三个的值
        int shipLen=ste.size();
        for(int i=0;i<shipLen;i++)
        {
        	shipTemplateEdit tempEdit=ste.get(i);
        	//针对运输时间进行设置
        	List<ShippingTemplateTime> tempTimeList=tempEdit.getTimeMode();
        	if(tempTimeList!=null&&tempTimeList.size()>0)
        	{
        		ShippingTemplateTime tempTime=tempTimeList.get(0);
        		int tempTimeStyle=tempTime.getTimeStyle();
        		tempEdit.setTimeStyle(tempTimeStyle);
        		if(tempTimeStyle==0)
        		{//所有的都一个运输时间
        			String tempTimeInt=tempTime.getShippingTime();
        			tempEdit.setTime(tempTimeInt);
        			//把timeMode置空
        			tempEdit.setTimeMode(null);
        			tempTimeList=null;
        		}
        		
        	}
        	//针对运费进行设置
        	List<ShippingTemplateXiangxi> tempFeeList=tempEdit.getShipMode();
        	if(tempFeeList!=null&&tempFeeList.size()>0)
        	{
        		ShippingTemplateXiangxi tempFee=tempFeeList.get(0);
        		int tempShipStyle=tempFee.getShippingStyle();
        		tempEdit.setShipStyle(tempShipStyle);
        		if(tempShipStyle==0)
        		{//卖家承担运费
        			//把shipMode置空
        			tempEdit.setShipMode(null);
        			tempFeeList=null;
        		}
        	}
        }
        	
		return ste;
	}

	public ShippingTemplate getShipTemplateByTemplateId(int id) 
	{
		ShippingTemplate ste=null;
		//首先获取所有的货运方式
		
		
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  

        try 
        {
        	ste=cMapper.getShipTemplateByTemplateId(id); 
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

	@Override
	public boolean modifyShippingTemplateName(ShippingTemplate st) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
	    try 
	    {
	    	ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  
	    	boolean pamu=cMapper.modifyShippingTemplateName(st);
	    	if(!pamu)
	    	{
	    		sqlSession.rollback();
	    		return false;
	    	}
	    	
	    	boolean delFlag=cMapper.deleteShippingTemplateXiangAndTimeByTemplateId(st);
	    	if(!delFlag)
	    	{
	    		sqlSession.rollback();
	    		return false;
	    	}
	    	

	    } 
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    	sqlSession.rollback();
	    	return false;
	    }
	    
	    finally 
	    {
	    	sqlSession.commit();
	    	
	    }
	    
		return true;
	}

	@Override
	public boolean deleteShippingTemplateXiangAndTimeByTemplateId(
			ShippingTemplate st) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ShippingShowVO> getShipInfoByTemplateIdAndCountryId(int shipTemplateId,int tempCountryId) 
	{
		List<ShippingShowVO> ste=null;
		//首先获取所有的货运方式
		
		
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
		ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  

        try 
        {
        	ste=cMapper.getShipInfoByTemplateIdAndCountryId(shipTemplateId,tempCountryId); 
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
}
