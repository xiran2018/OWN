package admin.ru.own.www.logic.commodity;

import java.util.ArrayList;
import java.util.List;
import admin.ru.own.www.logic.category.CategoryService;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.vo.AttributeVO;
import admin.ru.own.www.vo.AttributeValueVO;
import admin.ru.own.www.vo.Product_Basic_Attr_VO;
import admin.ru.own.www.vo.ProductsVO;

public class CommodityManagementService {
	private CategoryService categoryService = new CategoryService();
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
		return categoryService.getAllFutherCategoryID(categoryid);
	}
}
