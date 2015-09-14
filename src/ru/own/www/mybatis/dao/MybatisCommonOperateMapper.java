package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttr;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.shopCartShowVO;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 上午10:00:25  
 */
public interface MybatisCommonOperateMapper {

/////must contain in the mapper	////////////////
	void openSession();
	void closeSession();
	void commit();
	void rollBack();
	SqlSession getSqlSession();
////////////////////////////////////////////////



}
