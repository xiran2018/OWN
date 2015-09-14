package admin.ru.own.www.mybatis.dao;

import static org.junit.Assert.*;

import org.junit.Test;

import admin.ru.own.www.logic.StoreOperate;

public class TestStoreOperate {

	@Test
	public void test() 
	{
		StoreOperate so=new StoreOperate();
		so.setId(23);
		so.setInfo("sjdfl");
		so.modify_xiangxi_content();
	}

}
