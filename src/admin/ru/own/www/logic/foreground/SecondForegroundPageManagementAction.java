package admin.ru.own.www.logic.foreground;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import util.PageUtil;
import util.ParameterUtil;

import admin.ru.own.www.entity.CategoryImage;
import admin.ru.own.www.mybatis.dao.AttrValueMapper;
import admin.ru.own.www.mybatis.dao.AttributeDAO;
import admin.ru.own.www.mybatis.dao.CategoryImageDAO;
import admin.ru.own.www.mybatis.dao.CategoryMapper;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.util.DefaultLanguageUtil;
import admin.ru.own.www.vo.AttributeVO;
import admin.ru.own.www.vo.NavigationVO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SecondForegroundPageManagementAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private SecondForegroundPageService service = new SecondForegroundPageService();
	private List<CategoryImage> categoryImages;
	private List<AttributeVO> allAttributes;
	private ParameterUtil parameterUtil = new ParameterUtil();
	
	public String showAll() {
		int categoryid = parameterUtil.getCategoryIDParameter();
		
		List<Integer> categoryIDs = service.getAllSubCategoryID(categoryid);
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		ActionContext.getContext().put("totalNumber", PageUtil.getTotalPageNumber(dao.getProductsCountByCategory(categoryIDs),PageUtil.getPageSize()));
		ActionContext.getContext().put("categoryid", categoryid);
		//展示图片的大小
		ExhibitionSize categoryExhibitionSize = service.getCategoryExhibitionSize(categoryid);
		ActionContext.getContext().put("categoryExhibitionSize", categoryExhibitionSize);
		dao.closeSession();
		return "showAll";
	}

	/**
	 * 得到 左侧导航条
	 * 
	 * @return
	 */
	public String getSecondLevelNavigation() {
		int categoryid = parameterUtil.getCategoryIDParameter();
		int lanid = DefaultLanguageUtil.getDefaultLanguageID();
		Map<Integer, NavigationVO> navigation = service.getSecondNavigations(categoryid, lanid);
		ActionContext.getContext().put("navigation", navigation);
		return "getSecondLevelNavigation";
	}

	/**
	 * 得到滚动图片
	 * 
	 * @return
	 */
	public String getSecondLevelCategoryRollImage() {
		int categoryid = parameterUtil.getCategoryIDParameter();
		CategoryImageDAO dao = (CategoryImageDAO) DAOFactory.get(CategoryImageDAO.class.getName());
		categoryImages = dao.getImageByCategoryId(categoryid);
		return "getSecondLevelCategoryRollImage";
	}

	/**
	 * 得到所有属性
	 * 
	 * @return
	 */
	public String getAllAttribute() {
		int categoryid = parameterUtil.getCategoryIDParameter();
		int lanID = DefaultLanguageUtil.getDefaultLanguageID();
		CategoryMapper categoryDAO = (CategoryMapper) DAOFactory.get(CategoryMapper.class.getName());
		AttributeDAO attributeDAO = (AttributeDAO) DAOFactory.get(AttributeDAO.class.getName());
		AttrValueMapper attrValueDAO = (AttrValueMapper) DAOFactory.get(AttrValueMapper.class.getName());
		
		categoryid = service.getFirstLevelCategoryID(categoryid, categoryDAO);
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("lanID", lanID);
		args.put("categoryID", categoryid);
		allAttributes = attributeDAO.getOneMultiCategoryAttribute(args);
		// 二级
		List<Integer> secondLevelID = categoryDAO.getSubCategoryID(categoryid);
		for (Integer id : secondLevelID) {
			args.put("categoryID", id);
			List<AttributeVO> secondAttributes = attributeDAO.getOneMultiCategoryAttribute(args);
			allAttributes.addAll(secondAttributes);
			// 三级
			List<Integer> thridLevelID = categoryDAO.getSubCategoryID(id);
			for (Integer tid : thridLevelID) {
				args.put("categoryID", tid);
				List<AttributeVO> thirdAttributes = attributeDAO.getOneMultiCategoryAttribute(args);
				allAttributes.addAll(thirdAttributes);
			}
		}
		categoryDAO.closeSession();
		attributeDAO.closeSession();
		attrValueDAO.closeSession();
		return "getAllAttribute";
	}

	public List<CategoryImage> getCategoryImages() {
		return categoryImages;
	}

	public void setCategoryImages(List<CategoryImage> categoryImages) {
		this.categoryImages = categoryImages;
	}

	public List<AttributeVO> getAllAttributes() {
		return allAttributes;
	}

	public void setAllAttributes(List<AttributeVO> allAttributes) {
		this.allAttributes = allAttributes;
	}
}
