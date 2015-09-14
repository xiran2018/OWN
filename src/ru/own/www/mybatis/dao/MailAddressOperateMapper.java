package ru.own.www.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

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
 * @data 2015年1月13日 上午10:00:25  
 */
public interface MailAddressOperateMapper extends MybatisCommonOperateMapper
{

	public int addMailAddress(MailAddress mailaddress);

	public List<MailAddressShowVO> getMailAddressList(int userid);

	public int updateMailAddress(MailAddress mailAddress);

	public int delMailAddressByUserIdAndMailId(int userid, int id);

	public int getMailAddressByUseridAndMailId(int userid, int id);

	public MailAddressShowVO getMailAddressShowVOByUserIdAndMailId(int userid,
			int id);


}
