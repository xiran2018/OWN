package ru.own.www.logic;

import static org.junit.Assert.*;

import org.junit.Test;

import ru.own.www.entity.ProductShowVO;
import admin.ru.own.www.entity.Products;
import admin.ru.own.www.mybatis.dao.ProductOperationDAOImp;
import admin.ru.own.www.mybatis.dao.ProductOperationMapper;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月29日 下午4:04:37  
 */
public class ProductOperateTest {

	@Test
	public void testGetProductBasicInfo() 
	{
		int lanid=7,id=108;
		ProductShowVO productvo = new ProductShowVO();
		//获取基本信息
		ProductOperationMapper pom=new ProductOperationDAOImp();
		Products tempProduct=pom.getProductByPIdWithLanId(id,lanid);
		productvo.setProducts(tempProduct); //基本信息赋值
	}

}
