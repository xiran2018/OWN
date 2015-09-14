package admin.ru.own.www.mybatis.dao.factory;

import admin.ru.own.www.mybatis.dao.AtrValueMultiLangDAO;
import admin.ru.own.www.mybatis.dao.AtrValueMultiLangDAOImp;
import admin.ru.own.www.mybatis.dao.AttrValueMapper;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.AttributeDAOImp;
import admin.ru.own.www.mybatis.dao.AttributeValueDaoImp;
import admin.ru.own.www.mybatis.dao.CategoryDAOImp;
import admin.ru.own.www.mybatis.dao.CategoryImageDAO;
import admin.ru.own.www.mybatis.dao.CategoryImageDAOImp;
import admin.ru.own.www.mybatis.dao.CategoryMapper;
import admin.ru.own.www.mybatis.dao.CurrencyDAO;
import admin.ru.own.www.mybatis.dao.CurrencyDAOImp;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;
import admin.ru.own.www.mybatis.dao.LanguageMapper;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAOImp;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAOImp;
import admin.ru.own.www.mybatis.dao.ProductMultiLanguageDAO;
import admin.ru.own.www.mybatis.dao.ProductMultiLanguageDAOImp;
import admin.ru.own.www.mybatis.dao.ProductSkuDAO;
import admin.ru.own.www.mybatis.dao.ProductSkuDAOImp;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.ProductsDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateMapper;
import admin.ru.own.www.mybatis.dao.productfilter.ProductFilterDAO;
import admin.ru.own.www.mybatis.dao.productfilter.ProductFilterDAOImp;

public class DAOFactory {
	private static DAOFactory instance = new DAOFactory();
	private DAOFactory() {
	}
	public static DAOFactory getInstance() {
		return instance;
	}
	public static Object get(String name) {
		return DAOFactory.getInstance().getDAOImp(name);
	}
	
	public Object getDAOImp(String name) {
		if(name.equals(CurrencyDAO.class.getName())) {
			return new CurrencyDAOImp();
		}
		if(name.equals(ProductsDAO.class.getName())){
			return new ProductsDAOImp();
		}
		if(name.equals(AttributeDAO.class.getName())) {
			return new AttributeDAOImp();
		}
		if(name.equals(CategoryMapper.class.getName())) {
			return new CategoryDAOImp();
		}
		if(name.equals(LanguageMapper.class.getName())){
			return new LanguageDAOImp();
		}
		if(name.equals(ShippingTemplateMapper.class.getName())){
			return new ShippingTemplateDAOImp();
		}
		if(name.equals(AttrValueMapper.class.getName())){
			return new AttributeValueDaoImp();
		}
		if(name.equals(AtrValueMultiLangDAO.class.getName())) {
			return new AtrValueMultiLangDAOImp();
		}
		if(name.equals(ProductBasicAttrDAO.class.getName())) {
			return new ProductBasicAttrDAOImp();
		}
		if(name.equals(CategoryImageDAO.class.getName())) {
			return new CategoryImageDAOImp();
		}
		if(name.equals(ProductSkuDAO.class.getName())) {
			return new ProductSkuDAOImp();
		}
		if(name.equals(CategoryMapper.class.getName())) {
			return new CategoryDAOImp();
		}
		if(name.equals(ProductMultiLanguageDAO.class.getName())) {
			return new ProductMultiLanguageDAOImp();
		}
		if(name.equals(ProductImageDAO.class.getName())){
			return new ProductImageDAOImp();
		}
		if(name.equals(ProductFilterDAO.class.getName())){
			return new ProductFilterDAOImp();
		}
		return null;
	}
}
