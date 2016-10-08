package admin.ru.own.www.logic.commodity.attributeview;

import javax.servlet.http.HttpServletRequest;

import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.mybatis.dao.AttrValueMapper;
import admin.ru.own.www.mybatis.dao.AttributeValueDaoImp;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.vo.AttributeVO;
import admin.ru.own.www.vo.AttributeValueVO;
import util.ValidateUtil;

public class InputeAttributeView extends AttributeValueView {
	@Override
	protected void doHandle(HttpServletRequest request, int p_id, AttributeVO attribute) {
		ProductBasicAttrDAO dao = (ProductBasicAttrDAO) DAOFactory.getInstance().getDAOImp(ProductBasicAttrDAO.class.getName());
		AttrValueMapper attributeDao = (AttrValueMapper) DAOFactory.getInstance().getDAOImp(AttrValueMapper.class.getName());
		// 更新的文本框内容
		String content = request.getParameter(attribute.getAtr().getAttrId().toString());
		// 原先文本框内容的id
		String attrValueID = request.getParameter(attribute.getAtr().getAttrId() + "ID");
		
		
		int attrVid = -1;// 如果为-1，说明原先属性名下没有属性值
//		if(attrValueID==null || attrValueID.equals("")) {
//			return;
//		}
//		
//		if (!ValidateUtil.isInteger(attrValueID)) {
//			return;
//		}
		if(attrValueID!=null && !attrValueID.equals("")&&ValidateUtil.isInteger(attrValueID)){
			attrVid = Integer.parseInt(attrValueID);
		}
		
		if (content != null && !content.equals("")) {
			int tempAttrVid = attrVid;
			// 不为-1说明属性名下有值,该产品也有该属性
			if (attrVid != -1) {
				// 通过这个id查询原来的内容，并比较，如果不同，说明跟新了值，要做出修改
				AttributeValueVO attributeValue = attributeDao.getAttributeValue(attrVid);
				if (!attributeValue.getAtrValue().getAttrValueName().equals(content)) {
					AttributeValue value = new AttributeValue();
					value.setAttrValueName(content);
					value.setAttrValueId(attributeValue.getAtrValue().getAttrValueId());
					// update attrValue表
					attributeDao.attrValue_modify_basic(value);
				}
			} else {
				// content有内容而 attrvid==-1
				// 则说明，原先属性名下添加了新属性值，还需根据新属性值添加后的键,添加基础属性表
				AttributeValue value = new AttributeValue();
				value.setAttrValueName(content);
				value.setAttrId(attribute.getAtr().getAttrId());
				// 得到插入后的新id
				tempAttrVid = attributeDao.insert(value);
				Product_Basic_Attr pba = new Product_Basic_Attr(p_id, attribute.getAtr().getAttrId(), tempAttrVid,0);
				dao.insertBasicAttr(pba);
			}
		}
		else {
			// 说明该product要删除这个属性值
			if (attrVid != -1) {
				AttributeValue value = new AttributeValue();
				value.setAttrValueName("");
				value.setAttrValueId(attrVid);
				attributeDao.attrValue_modify_basic(value);
			}
		}
		attributeDao.closeSession();
		dao.closeSession();
	}

}
