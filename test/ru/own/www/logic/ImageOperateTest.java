package ru.own.www.logic;

import static org.junit.Assert.*;

import org.junit.Test;

import systemlog.Log;

/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2014年12月8日 下午12:18:08  
 */
public class ImageOperateTest {

	@Test
	public void testGetIndexPlayImage()
	{
		ImageOperate io=new ImageOperate();
		String ss = io.getIndexPlayImage();
		Log.log4jLogInfo(this.getClass(),""+io.getFilist().size() );
	}

}
