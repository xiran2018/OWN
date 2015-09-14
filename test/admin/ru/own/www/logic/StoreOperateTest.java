package admin.ru.own.www.logic;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;

public class StoreOperateTest 
{

	@Test
	public void testGetStoreFooterInfo() 
	{
		StoreOperate so=new StoreOperate();
		so.getStoreFooterInfo();
	}
	
//	@Test
	@Ignore
	public void testSetStoreFooterInfo() 
	{
		StoreOperate so=new StoreOperate();
		so.setInfo("<b>sjlfjsf</b>");
		so.setStoreFooterInfo();
	}

}
