package admin.ru.own.www.mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.CategoryImage;
import admin.ru.own.www.entity.ForegroundImage;

public class CategoryImageDAOImp implements CategoryImageDAO 
{
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private CategoryImageDAO dao = sqlSession.getMapper(CategoryImageDAO.class);
	
	
	@Override
	public List<CategoryImage> getImageByCategoryId(int categoryId) 
	{
		List<CategoryImage> all = dao.getImageByCategoryId(categoryId);
		return all;
	}

	@Override
	public void closeSession() {
		sqlSession.close();
	}

	@Override
	public void updateImgSrc(Map<String, Object> map) {
		dao.updateImgSrc(map);
		sqlSession.commit();
	}

	@Override
	public CategoryImage getCategoryImageByID(int id) {
		CategoryImage foregroundImageByID = dao.getCategoryImageByID(id);
		return foregroundImageByID;
	}

	@Override
	public void update(CategoryImage img) {
		dao.update(img);
		sqlSession.commit();
	}
	@Override
	public void insert(CategoryImage img) {
		dao.insert(img);
		sqlSession.commit();
	}
	@Override
	public void delete(int id) {
		dao.delete(id);
		sqlSession.commit();
	}


}
