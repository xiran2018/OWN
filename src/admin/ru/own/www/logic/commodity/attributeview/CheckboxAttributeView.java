package admin.ru.own.www.logic.commodity.attributeview;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.vo.AttributeVO;
import admin.ru.own.www.vo.AttributeValueVO;

public class CheckboxAttributeView extends AttributeValueView {
	/**
	 * 根据前台传回来的checkbox的parameters的值，返回set
	 * 
	 * @param request
	 * @param attrName
	 * @return
	 */
	private Set<String> getCheckBoxSetByParameters(HttpServletRequest request, int attrID) {
		String[] parameters = request.getParameterValues(String.valueOf((attrID)));
		Set<String> parameterSet = null;
		if (parameters != null) {
			parameterSet = new HashSet<String>(Arrays.asList(parameters));
		}
		return parameterSet;
	}
	
	@Override
	protected void doHandle(HttpServletRequest request, int p_id, AttributeVO attribute) {
		ProductBasicAttrDAO dao = (ProductBasicAttrDAO) DAOFactory.getInstance().getDAOImp(ProductBasicAttrDAO.class.getName());
		Set<String> parameterSet = getCheckBoxSetByParameters(request, attribute.getAtr().getAttrId());
		
		for (AttributeValueVO attributeValue : attribute.getValueList()) {
			String atrValueID = attributeValue.getAtrValue().getAttrValueId().toString();
			boolean have = Boolean.parseBoolean(request.getParameter(atrValueID + "Have"));
			if (parameterSet != null) {
				// 原先是否拥有这个属性值
				if (have) {
					// 原先有，set里也有说明这个属性值不需要update，否则说明该属性值删除
					if (!parameterSet.contains(atrValueID)) {
						dao.deleteBasicAttr(new Product_Basic_Attr(p_id, 0, Integer.parseInt(atrValueID),1));
					}
				} else {
					// 原先没有，现在有，则说明新增
					if (parameterSet.contains(atrValueID)) {
						Product_Basic_Attr pba = new Product_Basic_Attr(p_id, attribute.getAtr().getAttrId(), Integer.parseInt(atrValueID),1);
						dao.insertBasicAttr(pba);
					}
				}
			} else {
				// 说明该产品需要删除这个属性值
				if (have) {
					dao.deleteBasicAttr(new Product_Basic_Attr(p_id, 0, Integer.parseInt(atrValueID),1));
				}
			}
		}
		
		dao.closeSession();
	}

}
