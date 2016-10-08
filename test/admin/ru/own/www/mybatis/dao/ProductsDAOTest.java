package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Ignore;
import org.junit.Test;

import systemlog.Log;
import util.PageUtil;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ProductMultiLanguage;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.vo.ProductsVO;

public class ProductsDAOTest {

	@Test
	public void testgGetTotalNumberProductByParameters() {
		String initPageStr = "1";
		String productName = "8";
		String brandName = "";
		String productStatus = "1";
//		String gmtBeginDate = "10/20/2014";//2014-10-20
//		String gmtEndDate = "10/20/2015"; //2015-10-20
		String gmtBeginDate = "2014-10-20";//2014-10-20
		String gmtEndDate = "2015-10-20"; //2015-10-20
		
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		Map<String, Object> map = new HashMap<String, Object>();
		
		int size = 15;
		int initPage = PageUtil.validatePageNumber(initPageStr);
		map.put("begain",0+initPage*size);
		map.put("size",size);
		map.put("productName",productName);
		map.put("brandName",brandName);
		map.put("productStatus",productStatus);
		map.put("gmtBeginDate",gmtBeginDate);
		map.put("gmtEndDate",gmtEndDate);
		
		int count=dao.getTotalNumberProductByParameters(map);//总页数
		System.out.println(count);
	}
	
//	@Test
	@Ignore
	public void testGetAllVOLimit()
	{
		String initPageStr = "1";
		String productName = "22";
		String brandName = "22";
		String productStatus = "0";
		String gmtBeginDate = "0";
		String gmtEndDate = "0";
		
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		Map<String, Object> map = new HashMap<String, Object>();
		
		int size = 15;
		int initPage = PageUtil.validatePageNumber(initPageStr);
		map.put("begain",0+initPage*size);
		map.put("size",size);
		map.put("productName",productName);
		map.put("brandName",brandName);
		map.put("productStatus",productStatus);
		map.put("gmtBeginDate",gmtBeginDate);
		map.put("gmtEndDate",gmtEndDate);
		
		List<ProductsVO> commoditys = dao.getAllVOLimit(map);
		System.out.println(commoditys.size());
	}
	
	

}
