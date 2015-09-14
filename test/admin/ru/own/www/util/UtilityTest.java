package admin.ru.own.www.util;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;

public class UtilityTest {

	@Test
	public void testgetQueryDate() {
		System.out.println(Utility.getQueryDate("04/15/2015"));
		System.out.println(Utility.getQueryDate(""));
		
	}
	@Test
	public void testDecimalFormat() 
	{
		float a=(float) 4.1223;
		String bString=Utility.decimalFormat(a);
//		System.out.println(bString);
	}
	
	@Test
	public void testSplit() 
	{
		
		String bString="+20";
		String [] ss=bString.split("\\+");
//		System.out.println(ss[1]);
	}

}
