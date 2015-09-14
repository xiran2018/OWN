package ru.own.page;

/**
 * 
 */

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import admin.ru.own.www.entity.Attribute;

/**
 * 
 * @author jing
 * 
 */
public class Java_Json {
	public static void main(String[] args) {
/*		Attribute attr=new Attribute();
		attr.setAttrId(1);
		attr.setTitle("fs");
		attr.setKeywords("sjldjfls");
		attr.setDescription("sdlfjl");
		JSONObject jsonObject = JSONObject.fromObject(attr);
		System.out.println(jsonObject);*/
//		String mulitLanString="[{'id':7,'other_name':'ert','other_title':'ert','other_keywords':'ert','other_desc':'ert'},{'id':8,'other_name':'ert','other_title':'eer','other_keywords':'ter','other_desc':'tert'}]";
//
//		JSONArray jsonArrary=JSONArray.fromObject(mulitLanString);
//		int size=jsonArrary.size();
//		JSONObject jsonObject =jsonArrary.getJSONObject(0);
////		System.out.println(jsonObject.toString());
//		
//		int i=11;
//		int j=10;
//		int ij=i/j;
		
//		long a= System.currentTimeMillis();
		String productName="sdljflsdjf.jpg";
		 //查找最后一个.所在的位置
		 int pointPos=productName.lastIndexOf(".");
		 productName=productName.substring(0,pointPos);//去掉最后一个.之后的商品名称
		System.out.println(productName);
	}
}
