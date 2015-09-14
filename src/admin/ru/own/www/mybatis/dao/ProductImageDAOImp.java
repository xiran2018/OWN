package admin.ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.productImage;

public class ProductImageDAOImp implements ProductImageDAO {

	@Override
	public List<productImage> getImg(int p_id) {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		ProductImageDAO productsDAO = sqlSession.getMapper(ProductImageDAO.class);
		List<productImage> list = productsDAO.getImg(p_id);
		sqlSession.close();
		return list;
	}

	@Override
	public int insert(productImage p) {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		ProductImageDAO productsDAO = sqlSession.getMapper(ProductImageDAO.class);
		productsDAO.insert(p);
		sqlSession.commit();
		sqlSession.close();
		return p.getId();
	}

	@Override
	public void delete(int id) {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		ProductImageDAO imageDAO = sqlSession.getMapper(ProductImageDAO.class);
		imageDAO.delete(id);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public static void main(String[] args) {
		ProductImageDAOImp p = new ProductImageDAOImp();
		productImage pImage = new productImage();
		pImage.setImageAddr("s");
		System.out.println(p.insert(pImage));
		
	}

	@Override
	public void update(productImage p) {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		ProductImageDAO imageDAO = sqlSession.getMapper(ProductImageDAO.class);
		imageDAO.update(p);
		sqlSession.commit();
		sqlSession.close();
	}

	@Override
	public productImage getOneImgByID(int id) {
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		ProductImageDAO imageDAO = sqlSession.getMapper(ProductImageDAO.class);
		productImage image = imageDAO.getOneImgByID(id);
		sqlSession.commit();
		sqlSession.close();
		return image;
	}

}
