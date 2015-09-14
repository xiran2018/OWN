package ru.own.test.main;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import admin.ru.own.www.util.UtilityTest;
import ru.own.www.logic.ImageOperateTest;
import ru.own.www.logic.OrderOperateTest;
import ru.own.www.logic.ProductOperateTest;
import ru.own.www.mybatis.dao.MailAddressOperateDAOImplTest;
import ru.own.www.payment.paymentOperateTest;

@RunWith(Suite.class)
@SuiteClasses({
	paymentOperateTest.class,
	MailAddressOperateDAOImplTest.class,
	ProductOperateTest.class,
	OrderOperateTest.class,
	ImageOperateTest.class,
	UtilityTest.class
	
})
public class AllTests {

}
