package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;

import ru.own.www.entity.Product_Basic_Attr_ShowVO;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月31日 上午11:32:17  
 */
public class ProductBasicAttrDAOImpTest 
{

	@Test
	public void testGetAttrValueIDListByPIDAndAttrNameID() 
	{
		ProductBasicAttrDAO pba=new ProductBasicAttrDAOImp();
		List<Product_Basic_Attr_ShowVO> tempPBAS=pba.getOneProductBasicAttrVOByPidAndLanId(108,7);
		pba.closeSession();
	}

}
