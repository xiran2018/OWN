package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;

import ru.own.www.entity.Cart;
import ru.own.www.mybatis.dao.CartOperateDAOImpl;
import ru.own.www.mybatis.dao.CartOperateMapper;
import systemlog.Log;
import admin.ru.own.www.entity.Language;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月5日 上午10:14:05  
 */
public class LanguageDAOImpTest {

	@Test
	public void testGetDefaultLanguage() 
	{
		LanguageDAOImp landao=new LanguageDAOImp();
		Language defaultLan=landao.getDefaultLanguage();
		Log.log4jLogInfo(LanguageDAOImpTest.class, defaultLan.getForeignerName());
		landao.closeSession();
	}
	
	
	@Ignore
	public void testBBb(){
		
		Cart tmeCart=new Cart();
		tmeCart.setProductid(108);
		tmeCart.setProductattrids("1|2");
		
		List<Cart> cartList=null;
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cartList=cpid.getAlreadyCartInDB(tmeCart);
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		Log.log4jLogInfo(LanguageDAOImpTest.class, ""+cartList.size());
	}
	
	@Ignore
	public void getalreadyCart()
	{
		Cart tmeCart=new Cart();
		tmeCart.setProductid(108);
		String sortAttrString="17|61";
		if(sortAttrString==null || sortAttrString.length()==0)
		{
			sortAttrString="-1";
		}
		tmeCart.setProductattrids(sortAttrString);
		List<Cart> cartList=null;
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cartList=cpid.getAlreadyCartInDB(tmeCart);
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		
	}

}
