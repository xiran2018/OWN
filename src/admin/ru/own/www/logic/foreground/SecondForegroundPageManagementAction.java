package admin.ru.own.www.logic.foreground;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.struts2.ServletActionContext;
import util.PageUtil;
import util.ParameterUtil;
import admin.ru.own.www.entity.CategoryImage;
import admin.ru.own.www.logic.category.CategoryService;
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

import javax.servlet.http.HttpServletRequest;

public class SecondForegroundPageManagementAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private SecondForegroundPageService service;
	private List<CategoryImage> categoryImages;
	private List<AttributeVO> allAttributes;
	private ParameterUtil parameterUtil;
	private CategoryService categoryService;
	List productsVOs;
	String attrStr;
	int totalNumber;

	public SecondForegroundPageManagementAction()
	{
		service = new SecondForegroundPageService();
		parameterUtil = new ParameterUtil();
		categoryService = new CategoryService();
	}

	private FilterAndSearchArgs initIndexArgs()
	{
		int page = parameterUtil.getInitPageParameter();
		int startPrice = parameterUtil.getStartPriceParameter();
		int endPrice = parameterUtil.getEndPriceParameter();
		int categoryid = parameterUtil.getCategoryIDParameter();
		List categoryIDs = categoryService.getAllSubCategoryID(categoryid);
		FilterAndSearchArgs args = new FilterAndSearchArgs(categoryIDs, startPrice, endPrice, page);
		return args;
	}

	private FilterAndSearchArgs initIndexArgsWithAttribute()
	{
		FilterAndSearchArgs args = initIndexArgs();
		HttpServletRequest request = ServletActionContext.getRequest();
		attrStr = request.getParameter("attrArgs");
		ActionContext.getContext().put("attrStr", attrStr);
		return args;
	}

	public String showAllByAttributFilter()
	{
		FilterAndSearchArgs args = initIndexArgsWithAttribute();
		ActionContext.getContext().put("args", args);
		ProductFilter filter = ProductFilter.getImp();
		totalNumber = filter.getProductsCountByAttributeArgs(args.getArgs());
		return "showAll";
	}

	public String showAll() {
		showAllByAttributFilter();

		int categoryid = parameterUtil.getCategoryIDParameter();  //得到商品分类id
		
		List<Integer> categoryIDs = categoryService.getAllSubCategoryID(categoryid); //得到所有的子category id
		
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
//		System.out.println( PageUtil.getTotalPageNumber(dao.getProductsCountByCategory(categoryIDs)));
		ActionContext.getContext().put("totalPageNumber", Integer.valueOf(PageUtil.getTotalPageNumber(totalNumber)));
//		ActionContext.getContext().put("totalNumber", PageUtil.getTotalPageNumber(dao.getProductsCountByCategory(categoryIDs)));
		ActionContext.getContext().put("categoryid", categoryid);
		
		int lanID = DefaultLanguageUtil.getDefaultLanguageID(); //得到默认语言id
		ActionContext.getContext().put("route", RouteService.getRouteBar(categoryid,lanID));
		//展示图片的大小
		ExhibitionSize categoryExhibitionSize = service.getCategoryExhibitionSize(categoryid);
		ActionContext.getContext().put("categoryExhibitionSize", categoryExhibitionSize);
		dao.closeSession();
		return "showAll";
	}

	/**
	 * 得到 左侧导航条中的分类
	 * 
	 * @return
	 */
	public String getSecondLevelNavigation() {
		int categoryid = parameterUtil.getCategoryIDParameter();
		int lanid = DefaultLanguageUtil.getDefaultLanguageID();
		Map<Integer, NavigationVO> navigation = service.getSecondNavigations(categoryid, lanid);
		ActionContext.getContext().put("navigation", navigation); //key是categoryid含有的分类的id，value是分类和子分类
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
	 * 得到某个商品分类的所有属性
	 * 
	 * @return
	 */
	public String getAllAttribute() {
		int categoryid = parameterUtil.getCategoryIDParameter(); //得到商品分类id
		int lanID = DefaultLanguageUtil.getDefaultLanguageID(); //得到默认语言id
//		CategoryMapper categoryDAO = (CategoryMapper) DAOFactory.get(CategoryMapper.class.getName());
		AttributeDAO attributeDAO = (AttributeDAO) DAOFactory.get(AttributeDAO.class.getName());
//		AttrValueMapper attrValueDAO = (AttrValueMapper) DAOFactory.get(AttrValueMapper.class.getName());
		
		CategoryService categoryService = new CategoryService();
		List<Integer> categoryIDs = categoryService.getAllFutherCategoryID(categoryid);  //得到所有的父类id和自己的id
		
		
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("lanID", lanID);
		
		allAttributes=new ArrayList<AttributeVO>();
		//顺着树结构取所有的可检索属性
		for(Integer id : categoryIDs){
			args.put("categoryID", id);
			//得到某一分类的可以检索的属性信息和属性值信息
			List<AttributeVO> secondAttributes = attributeDAO.getOneMultiCategorySearchAttribute(args);
			allAttributes.addAll(secondAttributes);
		}
		
		//以下的代码是得到从第一级分来开始，包括全部的二级和三级分类的属性
//		categoryid = service.getFirstLevelCategoryID(categoryid, categoryDAO); //得到该分类的第一级的category id
//		Map<String, Object> args = new HashMap<String, Object>();
//		args.put("lanID", lanID);
//		args.put("categoryID", categoryid);
//		allAttributes = attributeDAO.getOneMultiCategorySearchAttribute(args); //得到一级分类的可以检索的属性信息和属性值信息
//		
//		// 得到所有的二级分类
//		List<Integer> secondLevelID = categoryDAO.getSubCategoryID(categoryid);
//		for (Integer id : secondLevelID) {//针对每一个子分类得到可以检索的属性和属性值
//			
//			args.put("categoryID", id);
//			
//			//得到一级分类的可以检索的属性信息和属性值信息
//			List<AttributeVO> secondAttributes = attributeDAO.getOneMultiCategorySearchAttribute(args);
//			allAttributes.addAll(secondAttributes);
//			
//			// 得到所有的三级分类
//			List<Integer> thridLevelID = categoryDAO.getSubCategoryID(id);
//			for (Integer tid : thridLevelID) {
//				args.put("categoryID", tid);
//				List<AttributeVO> thirdAttributes = attributeDAO.getOneMultiCategorySearchAttribute(args);
//				allAttributes.addAll(thirdAttributes);
//			}
//		}
//		categoryDAO.closeSession();
		attributeDAO.closeSession();
//		attrValueDAO.closeSession();
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
