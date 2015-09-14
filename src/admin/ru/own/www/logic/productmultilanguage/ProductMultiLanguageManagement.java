package admin.ru.own.www.logic.productmultilanguage;

import java.util.Iterator;
import java.util.List;

import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ProductMultiLanguage;
import admin.ru.own.www.mybatis.dao.LanguageDAOImp;
import admin.ru.own.www.mybatis.dao.LanguageMapper;
import admin.ru.own.www.mybatis.dao.ProductOperationDAOImp;
import admin.ru.own.www.mybatis.dao.ProductOperationMapper;
import admin.ru.own.www.vo.ProductMultiLanguageVO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProductMultiLanguageManagement extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private int product_id;
	private ProductMultiLanguage entity;
	
	public String showAll() {
		LanguageMapper languageDAO = new LanguageDAOImp();
		List<Language> languages = languageDAO.getAllLanguage();
		
		ProductOperationMapper dao = new ProductOperationDAOImp();
		//得到产品现在已经填写了的语言id，有的语言还没填写所以要剔除
		List<ProductMultiLanguageVO> allLanguage = dao.getAllLanguage(product_id);
		for (Iterator<ProductMultiLanguageVO> iterator = allLanguage.iterator(); iterator.hasNext();) {
			ProductMultiLanguageVO vo = iterator.next();
			if(languages.contains(vo.getLanguage())) {
				languages.remove(vo.getLanguage());
			}
			//语言states为不可用的时候也要剔除
			if(vo.getLanguage().getStatus()==0) {
				iterator.remove();
			}
			
		}
		for (Iterator<Language> iterator = languages.iterator(); iterator.hasNext();) {
			if(iterator.next().getStatus()==0){
				iterator.remove();
			}
		}
		languageDAO.closeSession();
		dao.closeSession();
		ActionContext.getContext().put("all", allLanguage);
		ActionContext.getContext().put("languages", languages);
		ActionContext.getContext().put("product_id", product_id);
		return "showAll";
	}
	
	public String editProductDetailDesc() {
		ProductOperationMapper dao = new ProductOperationDAOImp();
		if(entity!=null) {
			ProductMultiLanguage pLanguageEntity = dao.getProductMultiLanguage(entity.getId());
			ActionContext.getContext().put("plentity", pLanguageEntity);
		}
		dao.closeSession();
		return "editProductDetailDesc";
	}
	
	public String updateProductDetailDesc() {
		ProductOperationMapper dao = new ProductOperationDAOImp();
		if(entity!=null) {
			ProductMultiLanguage pLanguageEntity = dao.getProductMultiLanguage(entity.getId());
			pLanguageEntity.setProduct_detail_desc(entity.getProduct_detail_desc());
			dao.updateProductDesc(pLanguageEntity);
			entity.setProduct_id(pLanguageEntity.getProduct_id());
		}
		dao.closeSession();
		return "updateProductDetailDesc";
	}
	
	public String update() {
		ProductOperationMapper dao = new ProductOperationDAOImp();
		dao.update(entity);
		dao.closeSession();
		return "update";
	}
	
	public String insert() {
		ProductOperationMapper dao = new ProductOperationDAOImp();
		dao.insertProductMultiLanguage(entity);
		dao.closeSession();
		return "insert";
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public ProductMultiLanguage getEntity() {
		return entity;
	}

	public void setEntity(ProductMultiLanguage entity) {
		this.entity = entity;
	}
	
}
