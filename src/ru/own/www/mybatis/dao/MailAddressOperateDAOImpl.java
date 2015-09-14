package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttr;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.MailAddress;
import ru.own.www.entity.MailAddressShowVO;
import ru.own.www.entity.shopCartShowVO;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月13日 上午10:00:39  
 */
public class MailAddressOperateDAOImpl implements MailAddressOperateMapper
{
///////////////////////////////////////must be included//////////////////////////////////////////////
	private SqlSession sqlSession;
	private MailAddressOperateMapper mailAddressMapper;
/////////////////////////////////////////////////////////////////////////////////////
	public MailAddressShowVO getMailAddressShowVOByUserIdAndMailId(int userid, int id) 
	{
		return mailAddressMapper.getMailAddressShowVOByUserIdAndMailId(userid, id);
	}
	
	public int getMailAddressByUseridAndMailId(int userid, int id) 
	{
		int count=0;
		count=mailAddressMapper.getMailAddressByUseridAndMailId(userid, id);
		return count;
		
	}
	@Override
	public int delMailAddressByUserIdAndMailId(int userid, int id) 
	{
		int i=mailAddressMapper.delMailAddressByUserIdAndMailId(userid, id);
		return i;
	}
	
	public java.util.List<ru.own.www.entity.MailAddressShowVO> getMailAddressList(int userid) 
	{
		List<MailAddressShowVO> tempList=mailAddressMapper.getMailAddressList(userid);
		return tempList;
	}

	@Override
	public int addMailAddress(MailAddress mailaddress) 
	{
		int i=mailAddressMapper.addMailAddress(mailaddress);
		return i;
	}
	
	@Override
	public int updateMailAddress(MailAddress mailAddress) 
	{
		int i=mailAddressMapper.updateMailAddress(mailAddress);
		return i;
	}
	
	
////////////////////////////////////////must be included/////////////////////////////
	@Override
	public void openSession()
	{
		sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();
		mailAddressMapper = sqlSession.getMapper(MailAddressOperateMapper.class);
	}
	
	@Override
	public void closeSession() {
		sqlSession.close();
	}

	@Override
	public void commit() {
		sqlSession.commit();
		
	}

	@Override
	public void rollBack() 
	{
		sqlSession.rollback();
	}

	@Override
	public SqlSession getSqlSession() {
		return sqlSession;
	}
/////////////////////////////////////////////////////////////////////////////////////

}
