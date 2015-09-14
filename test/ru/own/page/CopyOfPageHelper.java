package ru.own.page;

/**
 * 
 */

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 
 * @author jing
 * 
 */
public class CopyOfPageHelper {

	public static void main(String[] args){
		String temp="%u521A%u521A";
		String aa = "";
		try {
			aa = new String(temp.getBytes("UTF-8"),"GBK" );
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>des:"+aa);
	}
}
