package admin.ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ru.own.www.entity.Product_Basic_Attr13_ShowVO;
import ru.own.www.entity.Product_Basic_Attr_ShowVO;
import admin.ru.own.www.entity.Product_Basic_Attr;
import admin.ru.own.www.vo.Product_Basic_Attr_VO;

public class ProductBasicAttrDAOImp implements ProductBasicAttrDAO {
	private SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
	private ProductBasicAttrDAO dao = sqlSession.getMapper(ProductBasicAttrDAO.class);
	@Override
	public void deleteBasicAttr(Product_Basic_Attr pba) {
		dao.deleteBasicAttr(pba);
		sqlSession.commit();
	}

	@Override
	public void deleteBasicAttrByP_id(int p_id) {
		dao.deleteBasicAttrByP_id(p_id);
		sqlSession.commit();
	}

	@Override
	public int insertBasicAttr(Product_Basic_Attr pba) {
		dao.insertBasicAttr(pba);
		sqlSession.commit();
		return pba.getP_basic_attr_id();
	}

	@Override
	public List<Product_Basic_Attr_VO> getOneProductBasicAttrVO(int p_id) {
		List<Product_Basic_Attr_VO> list = dao.getOneProductBasicAttrVO(p_id);
		return list;
	}

	@Override
	public List<Integer> getAttrValueIDListByPIDAndAttrNameID(Product_Basic_Attr pba) {
		List<Integer> rlist = dao.getAttrValueIDListByPIDAndAttrNameID(pba);
		return rlist;
	}

	@Override
	public void closeSession() {
		if(sqlSession!=null){
			sqlSession.close();
		}
	}

	@Override
	public List<Integer> getTextAttrValueIdsByProduct_id(int product_id) {
		List<Integer> list = dao.getTextAttrValueIdsByProduct_id(product_id);
		return list;
	}

	@Override
	public List<Product_Basic_Attr_ShowVO> getOneProductBasicAttrVOByPidAndLanId(int id, int lanid) {
		List<Product_Basic_Attr_ShowVO> list = dao.getOneProductBasicAttrVOByPidAndLanId(id,lanid);
		return list;
	}
	
	@Override
	public List<Product_Basic_Attr13_ShowVO> getOneProductBasicAttr4VOByPidAndLanId(int id, int lanid) {
		List<Product_Basic_Attr13_ShowVO> list = dao.getOneProductBasicAttr4VOByPidAndLanId(id,lanid);
		return list;
	}
	
	@Override
	public List<Product_Basic_Attr13_ShowVO> getOneProductBasicAttr13VOByPidAndLanId(int id, int lanid) {
		List<Product_Basic_Attr13_ShowVO> list =null;
		try {
			list = dao.getOneProductBasicAttr13VOByPidAndLanId(id,lanid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateAttrValueId(Product_Basic_Attr pba) {
		dao.updateAttrValueId(pba);
		sqlSession.commit();
	}
}
