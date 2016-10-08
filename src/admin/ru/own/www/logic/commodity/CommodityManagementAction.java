package admin.ru.own.www.logic.commodity;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import admin.ru.own.www.entity.AttributeValueMultiLanguage;
import admin.ru.own.www.entity.Products;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.AtrValueMultiLangDAO;
import admin.ru.own.www.mybatis.dao.AttrValueMapper;
import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import admin.ru.own.www.mybatis.dao.ProductBasicAttrDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductSkuDAO;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.Sku_AtrValueDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.util.Utility;
import admin.ru.own.www.vo.ProductsVO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import util.PageUtil;

public class CommodityManagementAction extends ActionSupport {
	private static Logger logger = LogManager.getLogger(CommodityManagementAction.class.getName());
	private static final long serialVersionUID = 1L;
	private int p_id;
	private Products products;
	private AttributeValueMultiLanguage atrValueML;
	private int atrName_id;//修改多语言时用
	private int texttype; //修改多语言的时候，根据这个判断是多行文本框还是input
	
	private int totalNumber; //需要显示的总页数
	List<ProductsVO> commoditys;

	public String showList() {
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		totalNumber=PageUtil.getTotalPageNumber(dao.getCount());
		ActionContext.getContext().put("totalNumber", PageUtil.getTotalPageNumber(dao.getCount())); //放到context中，前台页面获取此数据
		dao.closeSession();
		return "showList";
	}
	/**
	 * 在页面点击搜索    和  点击 相应页数的时候 需要调用此函数
	 * @return
	 */
	public String returnCommoditys() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String initPageStr = request.getParameter("initPage");
		String productName = request.getParameter("productName");
		String brandName = request.getParameter("brandName");
		String productStatus = request.getParameter("productStatus");
		String gmtBeginDate = request.getParameter("gmtBeginDate");
		String gmtEndDate = request.getParameter("gmtEndDate");
		
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		Map<String, Object> map = new HashMap<String, Object>();
		
		int size = 15;
		int initPage = PageUtil.validatePageNumber(initPageStr);
		map.put("begain",0+initPage*size);
		map.put("size",size);
		map.put("productName",productName);
		map.put("brandName",brandName);
		map.put("productStatus",productStatus);
		map.put("gmtBeginDate",gmtBeginDate);
		map.put("gmtEndDate",gmtEndDate);
		
		int count=dao.getTotalNumberProductByParameters(map);//总页数
		totalNumber=PageUtil.getTotalPageNumber(count);
//		ActionContext.getContext().put("totalNumber", PageUtil.getTotalPageNumber(count)); //放到context中，前台页面获取此数据
		
		commoditys = dao.getAllVOLimit(map);
//		ActionContext.getContext().put("commoditys", commoditys);
 		dao.closeSession();
		return "returnCommoditys";
	}


	public String updateCommodity() {
		SqlSession session = MybatisSessionFactory.sqlSessionFactory.openSession();
		Transaction transcation = MybatisSessionFactory.getTranscation(session);
		
		ProductBasicAttrDAO basicAtrDAO = session.getMapper(ProductBasicAttrDAO.class);
		ProductsDAO productsDAO = session.getMapper(ProductsDAO.class);
		AtrValueMultiLangDAO  atrMultDAO = session.getMapper(AtrValueMultiLangDAO.class);
		AttrValueMapper aImp = session.getMapper(AttrValueMapper.class);
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String p_date_added = request.getParameter("p_date_added");
		String p_last_modified = request.getParameter("p_last_modified");
		try {
			int categoryid = Integer.parseInt(request.getParameter("Op_categoryid"));
			try {
				if (isCategoryIDChange(categoryid)) {
					List<Integer> list = aImp.getTextInputStyleAtrValueIDListByProductID(products.getP_id());
					for (Integer i : list) {
						aImp.delete(i);
						atrMultDAO.delAttrValueByAtrID(i);
					}
					basicAtrDAO.deleteBasicAttrByP_id(products.getP_id());
				} else {
					// 如果为零说明没有修改类别id（页面里，如果不点击类别选项，在input中就不赋值value，所以传过来的就是0）
					products.setP_categoryid(categoryid);
				}

				if (products.getP_brandid() == 0) {
					// 同上
					int brandid = Integer.parseInt(request.getParameter("Op_brandid"));
					products.setP_brandid(brandid);
				}
				products.setP_date_added(new Date(p_date_added));
				products.setP_last_modified(new Date(p_last_modified));
				productsDAO.update(products);
			} catch (Exception e) {
				transcation.rollback();
			} finally {
				transcation.close();
				session.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.p_id = products.getP_id();
		ActionContext.getContext().put("success",true);
		return "updateCommodity";
	}

	public boolean isCategoryIDChange(int categoryid) {
		// 如果改变categoryid，则要在属性值表中删除该产品文本框类型的属性值，因为该产品的文本框类型的属性值是这个产品独有的。category改变后，需删除
		if(products.getP_categoryid() != 0) {
			return categoryid != products.getP_categoryid();
		} else {
			return false;
		}
	}
	
	
	public String delete() {
		// 删sku,attributevalue,attributevaluemultilanguage,product,product
		// basic,productmulitylanguage,product_sku;
		ProductBasicAttrDAO basicAtrDAO = null;
		ProductsDAO productsDao = null;
		Sku_AtrValueDAO sku_atrDAO = null;
		ProductSkuDAO productSkuDAO = null;
		AttrValueMapper valuesDAO = null;
		AtrValueMultiLangDAO valueMultilanguageDAO = null;
		ProductImageDAO imageDAO = null;

		SqlSession session = MybatisSessionFactory.sqlSessionFactory.openSession();
		Transaction transcation = MybatisSessionFactory.getTranscation(session);
		basicAtrDAO = session.getMapper(ProductBasicAttrDAO.class);
		sku_atrDAO = session.getMapper(Sku_AtrValueDAO.class);
		productsDao = session.getMapper(ProductsDAO.class);
		productSkuDAO = session.getMapper(ProductSkuDAO.class);
		valuesDAO = session.getMapper(AttrValueMapper.class);
		imageDAO = session.getMapper(ProductImageDAO.class);
		valueMultilanguageDAO = session.getMapper(AtrValueMultiLangDAO.class);

		try {
			try {
				int product_id = p_id;
				// attributevalue
				List<Integer> attributeValueIDs = basicAtrDAO.getTextAttrValueIdsByProduct_id(product_id);
				for (Integer atrValueID : attributeValueIDs) {
					valuesDAO.delAttrValue(atrValueID);
					valueMultilanguageDAO.delAttrValueByAtrID(atrValueID);
				}
				basicAtrDAO.deleteBasicAttrByP_id(product_id);
				// sku相关删除
				List<Integer> skuids = productSkuDAO.getSku_idsByProduct_id(product_id);
				for (Integer sku_id : skuids) {
					sku_atrDAO.delete(sku_id);
				}
				String rootPath = ServletActionContext.getServletContext().getRealPath("");
				List<productImage> imgs = imageDAO.getImg(product_id);
				for (productImage img : imgs) {
					Utility.deletFile(rootPath + "/" + img.getImageAddr());
					imageDAO.delete(img.getId());
				}
				productSkuDAO.deleteByProduct_id(product_id);
				productsDao.deleteProductByProduct_id(product_id);
			} catch (Exception e) {
				transcation.rollback();
				e.printStackTrace();
			} finally {
				transcation.close();
				session.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "delete";
	}

	public int getP_id() {
		return p_id;
	}

	public void setP_id(int p_id) {
		this.p_id = p_id;
	}

	public Products getProducts() {
		return products;
	}

	public void setProducts(Products products) {
		this.products = products;
	}

	public int getAtrName_id() {
		return atrName_id;
	}

	public void setAtrName_id(int atrName_id) {
		this.atrName_id = atrName_id;
	}

	public AttributeValueMultiLanguage getAtrValueML() {
		return atrValueML;
	}

	public void setAtrValueML(AttributeValueMultiLanguage atrValueML) {
		this.atrValueML = atrValueML;
	}

	public int getTexttype() {
		return texttype;
	}

	public void setTexttype(int texttype) {
		this.texttype = texttype;
	}
	public int getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	public List<ProductsVO> getCommoditys() {
		return commoditys;
	}
	public void setCommoditys(List<ProductsVO> commoditys) {
		this.commoditys = commoditys;
	}
	
}
