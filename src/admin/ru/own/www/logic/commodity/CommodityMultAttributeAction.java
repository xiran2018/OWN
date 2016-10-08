package admin.ru.own.www.logic.commodity;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import util.ParameterUtil;
import admin.ru.own.www.entity.AttributeValueMultiLanguage;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.entity.ShippingTemplate;
import admin.ru.own.www.logic.commodity.attributeview.AttributeValueView;
import admin.ru.own.www.mybatis.dao.AtrValueMultiLangDAO;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.LanguageMapper;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAOImp;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.ShippingTemplateMapper;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.vo.AttributeVO;
import admin.ru.own.www.vo.ProductsVO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommodityMultAttributeAction extends ActionSupport {
	private static final long serialVersionUID = -1382273914207400180L;
	private static Logger logger = LogManager.getLogger(CommodityMultAttributeAction.class.getName());
	private int atrName_id;//商品属性的id，修改多语言时用
	private int attrValue_id;//商品属性值id，多语言的时候用
	private int texttype; //修改多语言的时候，根据这个判断是多行文本框还是input
	private AttributeValueMultiLanguage atrValueML;
	private int p_id; //商品id
	private CommodityManagementService service = new CommodityManagementService();
	private ParameterUtil parameterUtil = new ParameterUtil();
	public String showInfo() {
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		ProductsVO pvo = dao.getInfo(p_id);
		dao.closeSession();
		
		List<List<AttributeVO>> atrslist = service.markProductAttributes(pvo);
		for(List<AttributeVO> u:atrslist)
			 for(AttributeVO ab:u)
				 Collections.sort(ab.getValueList());
		
		ShippingTemplateMapper shippingTemplateDAOImp = (ShippingTemplateMapper) DAOFactory.getInstance().getDAOImp(ShippingTemplateMapper.class.getName());
		List<ShippingTemplate> templates = shippingTemplateDAOImp.getAllShippingTemplate();
		ActionContext.getContext().getSession().put("pvo", pvo);
		ActionContext.getContext().put("templates", templates);
		ActionContext.getContext().put("atrslist", atrslist);
		ActionContext.getContext().put("success", parameterUtil.getIsSuccessParameter());
		return "showinfo";
	}

	
	public String insertMultAttribute() {
		AtrValueMultiLangDAO dao = (AtrValueMultiLangDAO) DAOFactory.getInstance().getDAOImp(AtrValueMultiLangDAO.class.getName());
//		logger.trace("插入多语言属性值:"+(atrValueML));
		dao.insertAttrValue(atrValueML);
		dao.closeSession();
		this.attrValue_id = getAtrValueML().getAttrvalue_id();  //属性值id
		ActionContext.getContext().put("success",true);
		return "insertMultAttribute";
	}
	
	public String updateMultAttribute() {
		AtrValueMultiLangDAO dao = (AtrValueMultiLangDAO) DAOFactory.getInstance().getDAOImp(AtrValueMultiLangDAO.class.getName());
//		logger.trace("修改多语言属性:"+(atrValueML));
		dao.update(atrValueML);
		dao.closeSession();
//		this.atrName_id = getAtrValueML().getAttrvalue_id();
		this.attrValue_id = getAtrValueML().getAttrvalue_id();
		ActionContext.getContext().put("success",true);
		return "updateMultAttribute";
	}
	
	/**
	 * 把属性为1或者3的属性清空，让其不再在前台显示
	 * @return
	 */
	public String delMultAttribute(){
		
		//在商品基本属性表中，删除商品的这个属性，因为属性值为1或者3，所以也要删除属性值表的这个属性值以及多语言的这个属性值
		Product_Basic_Attr pba=new Product_Basic_Attr();
		pba.setP_id(p_id);
		pba.setAttr_name_id(atrName_id);
		pba.setAttr_value_id(attrValue_id);
		ProductBasicAttrDAO pbad=new ProductBasicAttrDAOImp();
		pbad.deleteBasicAttr13(pba);
		
		ActionContext.getContext().put("success",true);
		return "delMultAttribute";
		
	}
	
	
	public String beforeInsertMultAttribute() {
		AtrValueMultiLangDAO dao = (AtrValueMultiLangDAO) DAOFactory.getInstance().getDAOImp(AtrValueMultiLangDAO.class.getName());
		HashMap<String, Object> parameterTypesMap=new HashMap<String, Object>();
		parameterTypesMap.put("p_id", p_id);
		parameterTypesMap.put("atrName_id", atrName_id);
		parameterTypesMap.put("attrValue_id", attrValue_id);
		List<AttributeValueMultiLanguage> multAtrs = dao.getAttrValueByAtrIDAndPIDAndAttrValueId(parameterTypesMap);
		LanguageMapper languageDAO = (LanguageMapper) DAOFactory.getInstance().getDAOImp(LanguageMapper.class.getName());
		List<Language> languages = languageDAO.getAllLanguage();

		for (Iterator<AttributeValueMultiLanguage> iterator = multAtrs.iterator(); iterator.hasNext();) {
			AttributeValueMultiLanguage vo = iterator.next();
			for (Iterator<Language> lgIt = languages.iterator(); lgIt.hasNext();) {
				Language language = lgIt.next();
				if (language.getId() == vo.getLan_id()) {
					vo.setLanguageName(language.getLanguageName());
					lgIt.remove();  //提出语言中已经有属性值的，这样语言只有没有属性值的了，方便前台处理
				}
				// 语言states为不可用的时候也要剔除，改进之后不用跑出，因为这是后台的功能
//				if (language.getStatus() == 0) {
//					iterator.remove();
//					lgIt.remove();
//				}
			}
		}
		languageDAO.closeSession();
		dao.closeSession();
		ActionContext.getContext().put("texttype", texttype);
		ActionContext.getContext().put("multAtrs", multAtrs);
		ActionContext.getContext().put("atrName_id", getAtrName_id());
		ActionContext.getContext().put("languages", languages);
		return "beforeInsertMultAttribute";
	}
	
	public String updateAttribute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		ProductsVO pvo = (ProductsVO) ActionContext.getContext().getSession().get("pvo");
		int p_id = pvo.getProducts().getP_id();
		
		
		AttributeDAO attrDAO = (AttributeDAO) DAOFactory.getInstance().getDAOImp(AttributeDAO.class.getName());
		List<Integer> cList = service.getAllFutherCategoryID(pvo.getProducts().getP_categoryid());  //取出这个商品所有的父category，因为父category可能包含属性
		for (Integer categoryID : cList) {
			List<AttributeVO> atrlist = attrDAO.getOneCategoryAttribute(categoryID); //取出每一个category的属性和属性值
			// 每个父category的所拥有的属性名都要进行判断
			for (AttributeVO attribute : atrlist) { //处理属性，进行更新
				AttributeValueView.handle(request, p_id, attribute);
			}
		}
		this.p_id = p_id;
		attrDAO.closeSession();
		ActionContext.getContext().put("success",true);
		return "updateAttribute";
	}
	
	public int getAtrName_id() {
		return atrName_id;
	}
	public void setAtrName_id(int atrName_id) {
		this.atrName_id = atrName_id;
	}
	public int getTexttype() {
		return texttype;
	}
	public void setTexttype(int texttype) {
		this.texttype = texttype;
	}
	public AttributeValueMultiLanguage getAtrValueML() {
		return atrValueML;
	}
	public void setAtrValueML(AttributeValueMultiLanguage atrValueML) {
		this.atrValueML = atrValueML;
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}


	public int getAttrValue_id() {
		return attrValue_id;
	}


	public void setAttrValue_id(int attrValue_id) {
		this.attrValue_id = attrValue_id;
	}
	
	
}
