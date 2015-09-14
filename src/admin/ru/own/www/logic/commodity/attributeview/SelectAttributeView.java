package admin.ru.own.www.logic.commodity.attributeview;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.mybatis.dao.AttrValueMapper;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.vo.AttributeVO;
import util.ValidateUtil;

public class SelectAttributeView extends AttributeValueView {

	@Override
	protected void doHandle(HttpServletRequest request, int p_id, AttributeVO attribute) {
		ProductBasicAttrDAO dao = (ProductBasicAttrDAO) DAOFactory.getInstance().getDAOImp(ProductBasicAttrDAO.class.getName());
		AttrValueMapper attributeDao = (AttrValueMapper) DAOFactory.getInstance().getDAOImp(AttrValueMapper.class.getName());
		String atrValueIDStr = request.getParameter(attribute.getAtr().getAttrId().toString());
		
		if(atrValueIDStr==null || atrValueIDStr.equals("")) {
			return;
		}
		
		if(!ValidateUtil.isInteger(atrValueIDStr)) {
			return;
		}
		//默认空白项是-1
		int atrValueID = Integer.parseInt(atrValueIDStr);
		Product_Basic_Attr pba = new Product_Basic_Attr(p_id, attribute.getAtr().getAttrId(), atrValueID,1);
		List<Integer> valueList = dao.getAttrValueIDListByPIDAndAttrNameID(pba);
		if(atrValueIDStr.equals("-1")) {
			//如果原先有ID，而atrValueIDStr等于-1，说说明要删除
			if(valueList.size()!=0){
				pba.setAttr_value_id(valueList.get(0));
				dao.deleteBasicAttr(pba);
			}
		} else {
			//如果原先没ID，而atrValueIDStr等于其他值，说明要新增
			if(valueList.size()==0){
				dao.insertBasicAttr(pba);
			} else {//如果原先有ID，而atrValueIDStr等于其他值，说明要更新
				dao.updateAttrValueId(pba);
			}
		}
		dao.closeSession();
		attributeDao.closeSession();
	}

}
