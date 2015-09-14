package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import ru.own.www.entity.ShippingShowVO;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月5日 上午9:48:07  
 */
public class ShippingTemplateDAOImpTest {

	@Test
	public void testGetShipInfoByTemplateIdAndCountryId() 
	{
		ShippingTemplateDAOImp aa = new ShippingTemplateDAOImp();
		@SuppressWarnings("unused")
		List<ShippingShowVO> bb = aa.getShipInfoByTemplateIdAndCountryId(33, 5);
		System.out.println(bb.size());
	}

}
