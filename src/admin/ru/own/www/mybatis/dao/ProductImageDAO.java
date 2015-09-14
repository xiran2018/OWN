package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.productImage;

public interface ProductImageDAO {
	/**
	 * 返回一个产品的所有图片
	 * @param p_id
	 * @return
	 */
	public List<productImage> getImg(int p_id);
	productImage getOneImgByID(int id);
	int insert(productImage p);
	void delete(int id);
	void update(productImage p);
}
