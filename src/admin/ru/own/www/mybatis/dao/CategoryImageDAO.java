package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;

import admin.ru.own.www.entity.CategoryImage;
import admin.ru.own.www.entity.ForegroundImage;

public interface CategoryImageDAO extends MyBatisMapper {

	List<CategoryImage> getImageByCategoryId(int categoryId) ;

	void updateImgSrc(Map<String, Object> map);

	CategoryImage getCategoryImageByID(int id);

	void update(CategoryImage img);

	void insert(CategoryImage img);
	
	void delete(int id);

}
