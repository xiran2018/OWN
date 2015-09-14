package admin.ru.own.www.logic.commodity;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.ProductSku;
import admin.ru.own.www.entity.Products;
import admin.ru.own.www.entity.SKU_AtrValue;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.AttributeDAOImp;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAOImp;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAOImp;
import admin.ru.own.www.mybatis.dao.ProductSkuDAO;
import admin.ru.own.www.mybatis.dao.ProductSkuDAOImp;
import admin.ru.own.www.mybatis.dao.Sku_AtrValueDAO;
import admin.ru.own.www.mybatis.dao.Sku_AtrValueDAOImp;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.util.Utility;
import admin.ru.own.www.vo.AttributeValueVO;
import admin.ru.own.www.vo.Product_Basic_Attr_VO;
import admin.ru.own.www.vo.SkuVO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.lang.StringUtils;
public class SKUManagement extends ActionSupport{
	private static Logger logger = LogManager.getLogger(SKUManagement.class.getName());
	private static final long serialVersionUID = 1L;
	
	private SKUManagementService service = new SKUManagementService();
	private Products product;
	private ProductSku sku;
	
	public String showAll() {
		ProductSkuDAO skuDAO = new ProductSkuDAOImp();
		List<SkuVO> oneProductSKUs = skuDAO.getOneProductSKUs(product.getP_id());
		skuDAO.closeSession();
		
		ProductImageDAO imageDAO = new ProductImageDAOImp();
		List<Attribute> atrNames = service.getAllAtrNameFromAtrValueList(oneProductSKUs);
		service.sortValues(oneProductSKUs,atrNames);
		service.fillNullAtr(oneProductSKUs, atrNames);
		
		List<productImage> imgs = imageDAO.getImg(product.getP_id());
		ActionContext.getContext().put("SKUVO", oneProductSKUs);
		ActionContext.getContext().put("imgs", imgs);
		ActionContext.getContext().put("atrNames", atrNames);
		return "showAll";
	}

	public String showInfo() {
		ProductBasicAttrDAO dao = new ProductBasicAttrDAOImp();
		List<Product_Basic_Attr_VO> pbavlist = dao.getOneProductBasicAttrVO(product.getP_id());
		Map<Integer, Product_Basic_Attr_VO> atrmap = service.createTempID(pbavlist);
		ActionContext.getContext().put("pbavlist", pbavlist);
		ActionContext.getContext().put("atrmap", atrmap);
		ActionContext.getContext().put("product", product);
		dao.closeSession();
		return "showInfo";
	}
	
	//生成sku临时视图
	public String creatSKU() {
		ProductSkuDAO skuDAO = (ProductSkuDAO) DAOFactory.get(ProductSkuDAO.class.getName());
		List<SkuVO> oneProductSKUs = skuDAO.getOneProductSKUs(product.getP_id());
		skuDAO.closeSession();
		
		List<Attribute> oneProductAtrNames = service.getAllAtrNameFromAtrValueList(oneProductSKUs);
		service.sortValues(oneProductSKUs,oneProductAtrNames);
		service.fillNullAtr(oneProductSKUs, oneProductAtrNames);
		ActionContext.getContext().put("SKUVO", oneProductSKUs);
//		ActionContext.getContext().put("atrNames", oneProductAtrNames);
		
//		String[] atrNameIDs = new String[oneProductAtrNames.size()];
//		for (int i = 0; i < oneProductAtrNames.size(); i++) {
//			atrNameIDs[i] = oneProductAtrNames.get(i).getAttrId() +"";
//		}
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String[] atrNameIDs = request.getParameterValues(String.valueOf("skuatr"));
		
		AttributeDAO attributeDAO = new AttributeDAOImp();
		if (atrNameIDs!=null) {
			
			List<List<AttributeValueVO>> resultList = service.getDescartesResult(atrNameIDs,product.getP_id());
			
			//去除掉现在已经有的sku
			for (Iterator<List<AttributeValueVO>> iterator = resultList.iterator(); iterator.hasNext();) {
				List<AttributeValueVO> list = iterator.next();
				for (SkuVO sku : oneProductSKUs) {
					List<AttributeValue> skuAttributeValues = sku.getAtrValues();
					
					int i = 0;
					for (AttributeValue attributeValue : skuAttributeValues) {
						for (AttributeValueVO attributeValueVO : list) {
							if(attributeValueVO.getAtrValue().equals(attributeValue)){
								i++;
							}
						}
					}
					
					if(i == skuAttributeValues.size()){
						iterator.remove();
					}
				}
			}
			
			List<Attribute> atrNames = new ArrayList<Attribute>();
			//返回所有的属性名
			for (String id : atrNameIDs) {
				Attribute attribute = attributeDAO.getOneAttribute(Integer.parseInt(id));
				atrNames.add(attribute);
			}
			//生成临时ID
			Map<Integer,List<AttributeValueVO>> tempIDMap = new HashMap<Integer, List<AttributeValueVO>>();
			int tempid = 0;
			for (List<AttributeValueVO> result : resultList) {
				tempIDMap.put(tempid, result);
				tempid ++;
			}
			ActionContext.getContext().put("tempIDMap", tempIDMap);
			ActionContext.getContext().put("atrNames", atrNames);
			ActionContext.getContext().put("product", product);
		}
		
		attributeDAO.closeSession();
		
		
		
		return "creatSKU";
	}
	
	public String insertSKU() {
		ProductSkuDAO skuDAO = new ProductSkuDAOImp();
		HttpServletRequest request = ServletActionContext.getRequest();
		Sku_AtrValueDAO saDAO = new Sku_AtrValueDAOImp(); 
		String[] insertSKUNumbers = request.getParameterValues(String.valueOf("sID"));
		String pnStr = request.getParameter("pn");
		if(insertSKUNumbers!=null){
			for (String id : insertSKUNumbers) {
				ProductSku sku = new ProductSku();
				String numStr = request.getParameter("num"+id);
				String priceStr = request.getParameter("price"+id);
				String snameStr = request.getParameter("sname"+id);
				String imageStr = request.getParameter("image"+id);
				String stateStr = request.getParameter("state"+id);
				if (numStr!=null && !numStr.isEmpty() &&StringUtils.isNumeric(numStr)) {
					sku.setCount(Integer.parseInt(numStr));
				}
				if(priceStr!=null && !priceStr.isEmpty() && Utility.isDouble(priceStr)) {
					sku.setPrice(Double.parseDouble(priceStr));
				}
				if(stateStr!=null && !stateStr.isEmpty()){
					sku.setStatus(Integer.parseInt(stateStr));
				}
				if(imageStr!=null && !imageStr.isEmpty()){
					sku.setImage(Integer.parseInt(imageStr));
				}
				sku.setCreate_time(new Date());
				sku.setSku_name(snameStr);
				sku.setProduct_id(Integer.parseInt(pnStr));
				
				String atrs[] = request.getParameterValues("atrs"+id);
				skuDAO.insert(sku);
				
				for (String atrvid : atrs) {
					SKU_AtrValue s_a = new SKU_AtrValue();
					s_a.setSku_id(sku.getSku_id());
					s_a.setAttr_value_id(Integer.parseInt(atrvid));
					saDAO.insert(s_a);
				}
			}
		}
		skuDAO.closeSession();
		saDAO.closeSession();
		ActionContext.getContext().put("p_id", pnStr);
		return "insertSKU";
	}
	
	public String deleteSKU() {
		Sku_AtrValueDAO skuAtrDAO = new Sku_AtrValueDAOImp();
		logger.info("删除product_sku:"+sku);
		skuAtrDAO.delete(sku.getSku_id());
		skuAtrDAO.closeSession();
		ProductSkuDAO skuDAO = new ProductSkuDAOImp();
		logger.info("删除sku_value表中对应关系,所删除sku_id="+sku.getSku_id());
		skuDAO.delete(sku);
		ActionContext.getContext().put("p_id", sku.getProduct_id());
		return "deleteSKU";
	}
	
	public String updateSKU() {
		ProductSkuDAO skuDAO = new ProductSkuDAOImp();
		skuDAO.update(sku);
		skuDAO.closeSession();
		ActionContext.getContext().put("p_id", sku.getProduct_id());
		return "updateSKU";
	}
	
	public Products getProduct() {
		return product;
	}

	public void setProduct(Products product) {
		this.product = product;
	}
	public ProductSku getSku() {
		return sku;
	}
	public void setSku(ProductSku sku) {
		this.sku = sku;
	}
	
}
