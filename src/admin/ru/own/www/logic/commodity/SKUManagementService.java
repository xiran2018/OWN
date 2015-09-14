package admin.ru.own.www.logic.commodity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.mybatis.dao.AttrValueMapper;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.AttributeDAOImp;
import admin.ru.own.www.mybatis.dao.AttributeValueDaoImp;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAOImp;
import admin.ru.own.www.vo.AttributeValueVO;
import admin.ru.own.www.vo.Product_Basic_Attr_VO;
import admin.ru.own.www.vo.SkuVO;

public class SKUManagementService {
	/**
	 * //产生属性名id(key)和属性值(value)对应的map。方便在 showinfo.jsp显示
	 * @param pbavlist
	 * @return
	 */
	public Map<Integer, Product_Basic_Attr_VO> createTempID(List<Product_Basic_Attr_VO> pbavlist) {
		Map<Integer, Product_Basic_Attr_VO> atrmap = new HashMap<Integer, Product_Basic_Attr_VO>();
		
		for (Product_Basic_Attr_VO pvo : pbavlist) {
			if(pvo.getInput_style()==2){
				atrmap.put(pvo.getPba().getAttr_name_id(), pvo);
			}
		}
		return atrmap;
	}
	/**
	 * 填补空缺，有的sku中没有后来添加的属性的值，就要填补这个空缺
	 * @param oneProductSKUs
	 * @param atrNames
	 */
	public void fillNullAtr(List<SkuVO> oneProductSKUs, List<Attribute> atrNames) {
		for (SkuVO skuVO : oneProductSKUs) {
			List<AttributeValue> values = skuVO.getAtrValues();
			for (int i=0 ; i<atrNames.size() ; i++) {
				//i==values.size()说明尾巴没有值，则在尾部填补
				if (i==values.size() || atrNames.get(i).getAttrId()!=values.get(i).getAttrId()) {
					AttributeValue attributeValue = new AttributeValue();
					attributeValue.setAttrId(atrNames.get(i).getAttrId());
					attributeValue.setAttrValueName("无");
					values.add(i, attributeValue);
					i--;
				}
			}
		}
	}
	/**
	 * 排序，让属性名和属性值相对应
	 * @param oneProductSKUs
	 * @param atrNames
	 */
	public void sortValues(List<SkuVO> oneProductSKUs, List<Attribute> atrNames) {
		for (SkuVO skuVO : oneProductSKUs) {
			List<AttributeValue> values = skuVO.getAtrValues();
			List<AttributeValue> sortedValues =  new ArrayList<AttributeValue>();
			for (int i=0 ; i<atrNames.size() ; i++) {
				for (AttributeValue attributeValue : values) {
					if(atrNames.get(i).getAttrId()==attributeValue.getAttrId()) {
						sortedValues.add(attributeValue);
					}
				}
			}
			skuVO.setAtrValues(sortedValues);
		}
	}
	/**
	 * 找出所有属性值的属性
	 * @param attributeDAO
	 * @param oneProductSKUs
	 * @return 返回属性值列表中对应的所有属性名
	 */
	public List<Attribute> getAllAtrNameFromAtrValueList(List<SkuVO> oneProductSKUs) {
		AttributeDAO attributeDAO = new AttributeDAOImp();
		List<Attribute> atrNames = new ArrayList<Attribute>();
		
		Set<Integer> atrIDSet = new HashSet<Integer>();
		for (SkuVO skuVO : oneProductSKUs) {
			for (AttributeValue aValue : skuVO.getAtrValues()) {
				int valueID = aValue.getAttrId(); 
				if (!atrIDSet.contains(valueID)) {
					atrNames.add(attributeDAO.getOneAttribute(valueID));
				}
				atrIDSet.add(valueID);
			}
		}
		attributeDAO.closeSession();
		return atrNames;
	}
	
	public void descartes(List<List<AttributeValueVO>> dimvalue, List<List<AttributeValueVO>> result, int layer, List<AttributeValueVO> atrValueList) {
		// 大于一个集合时：
		if (layer < dimvalue.size() - 1) {
			// 大于一个集合时，第一个集合为空
			if (dimvalue.get(layer).size() == 0)
				descartes(dimvalue, result, layer + 1, atrValueList);
			else {
				for (int i = 0; i < dimvalue.get(layer).size(); i++) {
					List<AttributeValueVO> list = new ArrayList<AttributeValueVO>(atrValueList);
					list.add(dimvalue.get(layer).get(i));
					descartes(dimvalue, result, layer + 1, list);
				}
			}
		}
		// 只有一个集合时：
		else if (layer == dimvalue.size() - 1) {
			// 只有一个集合，且集合中没有元素
			if (dimvalue.get(layer).size() == 0)
				result.add(atrValueList);
			// 只有一个集合，且集合中有元素时：其笛卡尔积就是这个集合元素本身
			else {
				for (int i = 0; i < dimvalue.get(layer).size(); i++) {
					List<AttributeValueVO> list = new ArrayList<AttributeValueVO>(atrValueList);
					list.add(dimvalue.get(layer).get(i));
					result.add(list);
				}
			}
		}
	}
	/**
	 * 返回笛卡尔积德结果
	 * @param parameters
	 * @param p_id
	 * @param dao
	 * @return
	 */
	public List<List<AttributeValueVO>> getDescartesResult(String[] parameters, int p_id) {
		ProductBasicAttrDAO dao = new ProductBasicAttrDAOImp();
		AttrValueMapper attrValueDAO = new AttributeValueDaoImp();
		// 原始数据
		List<List<AttributeValueVO>> originalValues = new ArrayList<List<AttributeValueVO>>();
		//生成原始数据
		for (String id : parameters) {
			Product_Basic_Attr pba = new Product_Basic_Attr();
			pba.setP_id(p_id);
			pba.setAttr_name_id(Integer.parseInt(id));
			List<Integer> productValueIDs = dao.getAttrValueIDListByPIDAndAttrNameID(pba);
			List<AttributeValueVO> atrValues = attrValueDAO.getAttributeValueBATCH(productValueIDs);
			originalValues.add(atrValues);
		}
		attrValueDAO.closeSession();
		List<List<AttributeValueVO>> result = new ArrayList<List<AttributeValueVO>>();
		descartes(originalValues, result, 0, new ArrayList<AttributeValueVO>());
		dao.closeSession();
		return result;
	}
	
}
