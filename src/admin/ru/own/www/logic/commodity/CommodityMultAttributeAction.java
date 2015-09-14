package admin.ru.own.www.logic.commodity;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import util.ParameterUtil;

import admin.ru.own.www.entity.AttributeValueMultiLanguage;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.ShippingTemplate;
import admin.ru.own.www.logic.commodity.attributeview.AttributeValueView;
import admin.ru.own.www.mybatis.dao.AtrValueMultiLangDAO;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.LanguageMapper;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
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
	private int atrName_id;//修改多语言时用
	private int texttype; //修改多语言的时候，根据这个判断是多行文本框还是input
	private AttributeValueMultiLanguage atrValueML;
	private int p_id;
	private CommodityManagementService service = new CommodityManagementService();
	private ParameterUtil parameterUtil = new ParameterUtil();
	public String showInfo() {
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		ProductsVO pvo = dao.getInfo(p_id);
		dao.closeSession();
		
		List<List<AttributeVO>> atrslist = service.markProductAttributes(pvo);
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
		logger.trace("插入多语言属性:"+(atrValueML));
		dao.insertAttrValue(atrValueML);
		dao.closeSession();
		this.atrName_id = getAtrValueML().getAttrvalue_id();
		ActionContext.getContext().put("success",true);
		return "insertMultAttribute";
	}
	
	public String updateMultAttribute() {
		AtrValueMultiLangDAO dao = (AtrValueMultiLangDAO) DAOFactory.getInstance().getDAOImp(AtrValueMultiLangDAO.class.getName());
		logger.trace("修改多语言属性:"+(atrValueML));
		dao.update(atrValueML);
		dao.closeSession();
		this.atrName_id = getAtrValueML().getAttrvalue_id();
		ActionContext.getContext().put("success",true);
		return "updateMultAttribute";
	}
	
	public String beforeInsertMultAttribute() {
		AtrValueMultiLangDAO dao = (AtrValueMultiLangDAO) DAOFactory.getInstance().getDAOImp(AtrValueMultiLangDAO.class.getName());
		List<AttributeValueMultiLanguage> multAtrs = dao.getAttrValueByAtrID(getAtrName_id());
		LanguageMapper languageDAO = (LanguageMapper) DAOFactory.getInstance().getDAOImp(LanguageMapper.class.getName());
		List<Language> languages = languageDAO.getAllLanguage();

		for (Iterator<AttributeValueMultiLanguage> iterator = multAtrs.iterator(); iterator.hasNext();) {
			AttributeValueMultiLanguage vo = iterator.next();
			for (Iterator<Language> lgIt = languages.iterator(); lgIt.hasNext();) {
				Language language = lgIt.next();
				if (language.getId() == vo.getLan_id()) {
					vo.setLanguageName(language.getLanguageName());
					lgIt.remove();
				}
				// 语言states为不可用的时候也要剔除
				if (language.getStatus() == 0) {
					iterator.remove();
					lgIt.remove();
				}
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
		List<Integer> cList = service.getAllFutherCategoryID(pvo.getProducts().getP_categoryid());
		for (Integer categoryID : cList) {
			List<AttributeVO> atrlist = attrDAO.getOneCategoryAttribute(categoryID);
			// 每个父category的所拥有的属性名都要进行判断
			for (AttributeVO attribute : atrlist) {
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
	
}
