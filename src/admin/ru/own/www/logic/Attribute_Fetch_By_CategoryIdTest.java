package admin.ru.own.www.logic;

import static org.junit.Assert.*;

import org.junit.Test;

public class Attribute_Fetch_By_CategoryIdTest {

	@Test
	public void testExecute() {
		Attribute_Fetch_By_CategoryId test=new Attribute_Fetch_By_CategoryId();
		test.setCategoryId(2);
		test.execute();
	}

}
