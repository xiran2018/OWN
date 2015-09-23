package admin.ru.own.www.logic.foreground;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import admin.ru.own.www.mybatis.dao.CategoryMapper;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.util.DefaultLanguageUtil;
import admin.ru.own.www.vo.ProductsVO;
/**
 * 筛选商品时的辅助类
 * @author Tian
 *
 */
public class ProductFilterBaseService {
	/**
	 * 根据productsIDs得到相应语言的商品信息。
	 * @param productsIDs
	 * @return
	 */
	public List<ProductsVO> getProducts(List<Integer> productsIDs) {
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("lanid",DefaultLanguageUtil.getDefaultLanguageID());
		args.put("list",productsIDs);
		if (productsIDs == null || productsIDs.size()==0) {
			return new ArrayList<ProductsVO>();
		}
		List<ProductsVO> productsVOs = dao.getProductsByLanguangeID(args);
		dao.closeSession();
		return productsVOs;
	}
	/**
	 * 得到展示图片的大小(4种)
	 * @param category_id
	 * @return
	 */
	public ExhibitionSize getCategoryExhibitionSize(int category_id) {
		CategoryMapper dao = (CategoryMapper) DAOFactory.get(CategoryMapper.class.getName());
		short imagesize = dao.getCategory(category_id).getImagesize();
		dao.closeSession();
		return CategoryExhibitionImage.find(imagesize);
	}
}