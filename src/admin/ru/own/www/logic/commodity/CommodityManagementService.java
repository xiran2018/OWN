package admin.ru.own.www.logic.commodity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.AttributeValueDaoImp;
import admin.ru.own.www.mybatis.dao.CategoryMapper;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.vo.AttributeVO;
import admin.ru.own.www.vo.AttributeValueVO;
import admin.ru.own.www.vo.Product_Basic_Attr_VO;
import admin.ru.own.www.vo.ProductsVO;

public class CommodityManagementService {

	/**
	 * 判断当前产品是否有category对应的属性，方便前台展示
	 * 
	 * @param pbaList
	 * @param atrlist
	 */
	private void checkIsHave(List<Product_Basic_Attr_VO> pbaList, List<AttributeVO> atrlist) {
		for (Product_Basic_Attr_VO pbavo : pbaList) {
			for (AttributeVO avo : atrlist) {
				if (avo.getAtr().getAttrId() == pbavo.getPba().getAttr_name_id()) {
					for (AttributeValueVO atrvaluevo : avo.getValueList()) {
						if (pbavo.getPba().getAttr_value_id() == atrvaluevo.getAtrValue().getAttrValueId()) {
							atrvaluevo.setHave(true);
							break;
						}
					}
				}
			}
		}
	}
	/**
	 * 在所有的attributevalue里标记该产品是否拥有此属性
	 * @param pvo
	 */
	public List<List<AttributeVO>> markProductAttributes(ProductsVO pvo) {
		List<Product_Basic_Attr_VO> pbaList = pvo.getpBasic_Attrs();;
		int categoryid = pvo.getProducts().getP_categoryid();
		
		AttributeDAO attrDAO = (AttributeDAO) DAOFactory.get(AttributeDAO.class.getName());
		List<List<AttributeVO>> atrslist = new ArrayList<List<AttributeVO>>();
		List<Integer> cList = getAllFutherCategoryID(categoryid);
		for (Integer categoryID : cList) {
			List<AttributeVO> atrlist = attrDAO.getOneCategoryAttribute(categoryID);
			checkIsHave(pbaList, atrlist);
			atrslist.add(atrlist);
		}
		attrDAO.closeSession();
		return atrslist;
	}
	
	public List<Integer> getAllFutherCategoryID(int categoryid) {
		CategoryMapper categoryDAO = (CategoryMapper) DAOFactory.get(CategoryMapper.class.getName());
		List<Integer> categoryIDs = categoryDAO.getAllFutherCategoryID(categoryid);
		categoryDAO.closeSession();
		return categoryIDs;
	}
}
