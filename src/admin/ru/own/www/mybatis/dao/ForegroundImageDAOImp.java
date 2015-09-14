package admin.ru.own.www.mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.entity.ForegroundImage;

public class ForegroundImageDAOImp implements ForegroundImageDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private ForegroundImageDAO dao = sqlSession.getMapper(ForegroundImageDAO.class);
	public static void main(String[] args) {
		ForegroundImageDAO dao = new ForegroundImageDAOImp();
		Map<String, Object> attrmap = new HashMap<String, Object>();
		attrmap.put("id",1);
		attrmap.put("imgsrc","ss");
		dao.updateImgSrc(attrmap);
		dao.closeSession();
	}
	@Override
	public List<ForegroundImage> getAll() {
		List<ForegroundImage> all = dao.getAll();
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
	public ForegroundImage getForegroundImageByID(int id) {
		ForegroundImage foregroundImageByID = dao.getForegroundImageByID(id);
		return foregroundImageByID;
	}

	@Override
	public void update(ForegroundImage img) {
		dao.update(img);
		sqlSession.commit();
	}
	@Override
	public void insert(ForegroundImage img) {
		dao.insert(img);
		sqlSession.commit();
	}
	@Override
	public void delete(int id) {
		dao.delete(id);
		sqlSession.commit();
	}
	@Override
	public List<ForegroundImage> getShowIndexPlayImage() 
	{
		List<ForegroundImage> all = dao.getShowIndexPlayImage();
		return all;
	}
	@Override
	public ForegroundImage getShowIndexSmallImage() {
		ForegroundImage smallImage = dao.getShowIndexSmallImage();
		return smallImage;
	}

}
