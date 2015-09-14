package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import systemlog.Log;
import admin.ru.own.www.entity.StorefooterinfoClientShow;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月12日 下午3:08:35  
 */
public class StoreOperateImplTest {

	@Test
	public void testGetShowStoreFooterInfo() 
	{
		StoreOperateImpl sot=new StoreOperateImpl();
		List<StorefooterinfoClientShow> ss = sot.getShowStoreFooterInfo(7);
		Log.log4jLogInfo(this.getClass(), ""+ss.size());
	}

}
