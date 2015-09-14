package admin.ru.own.www.logic;

import static org.junit.Assert.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Expression;
import org.junit.Ignore;
import org.junit.Test;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import admin.ru.own.www.entity.AdminUser;

public class LoginTest {

	@Ignore
	public void testExecute() 
	{
		Session session=HibernateSessionFactory.getSession();
		session.beginTransaction();
		Criteria criteria=session.createCriteria(AdminUser.class);
		Criterion cri1=Expression.eq("UName", "admin");
		Criterion cri2=Expression.eq("UPassword", "admin");
		criteria.add(cri1);
		criteria.add(cri2);
		List list=criteria.list();
		session.close();
		assertEquals(1, list.size());
	}
	
	@Test
	public void generateOrderId()
	{
//		String newFileName = ""; // 保存新的文件名
//		Random r = new Random();
//		// 生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
//		int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; // 获取随机数
//		SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); // 时间格式化的格式
//		String nowTimeStr = sDateFormat.format(new Date()); // 当前时间
//		
//		newFileName = nowTimeStr + rannum; // 文件重命名后的名字
//		
//		//UUID.randomUUID().toString().replaceAll("-", "");
//		System.out.println(newFileName);
		float subtotalPrice=(float) 20.00;  //商品总价格
		float shippingPrice=(float) 30.00;  //运费总价格
		int usejifen=10;//使用积分
		
		float realPrice=subtotalPrice+shippingPrice-usejifen;//减去积分之后的价格
		
		System.out.println(realPrice);
	}


}
