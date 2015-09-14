package admin.ru.own.www.logic;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import admin.ru.own.www.entity.BrandSeries;

public class TraverseTest {

	@Test
	public void testFetchChildren() {
		List templist=new ArrayList<BrandSeries>();
		
		BrandSeries temp=new BrandSeries();
		temp.setBrandId(1);
		temp.setBrandName("lv");
		temp.setClassId(1);
		temp.setParentBrandId(0);
		templist.add(temp);
		

			BrandSeries temp1=new BrandSeries();
			temp1.setBrandId(2);
			temp1.setBrandName("lv1");
			temp1.setClassId(1);
			temp1.setParentBrandId(0);
			templist.add(temp1);

			BrandSeries temp2=new BrandSeries();
			temp2.setBrandId(3);
			temp2.setBrandName("lv2");
			temp2.setClassId(1);
			temp2.setParentBrandId(2);
			templist.add(temp2);
			
			BrandSeries temp3=new BrandSeries();
			temp3.setBrandId(4);
			temp3.setBrandName("lv3");
			temp3.setClassId(1);
			temp3.setParentBrandId(2);
			templist.add(temp2);
			
			
		Traverse tr=new Traverse();
		String result=tr.fetchChildren(templist);
		System.out.println(result);
	}

}
