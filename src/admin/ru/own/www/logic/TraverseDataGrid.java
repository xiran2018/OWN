package admin.ru.own.www.logic;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Set;

import net.sf.json.JSONObject;


import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.BrandSeries;

public class TraverseDataGrid<E> {

	public String fetchDataGrid(List<E> list) {
//		String result="{\"total\":";
		String result="[";
		int size=list.size();
//		result=result+size+",\"rows\":[";
		int lastPosition=size-1;
		for(int j=0;j<size;j++)
		{
			E temp=list.get(j);
//			JSONObject jsonObject = JSONObject.fromObject(temp);
			String tempResultStr="{";
			Class EClass=temp.getClass();
			Field[] fields=EClass.getDeclaredFields();
			int length=fields.length;
			int count=1;  //控制是否在最后一个元素添加逗号
//	        String fromOjbect = JSONObject.fromObject(tempBrand).toString();
			for(Field field : fields )
			{
				Object ss = null;
				String fieldName=field.getName();
				Class fieldType=field.getType();
				String MethodName="get"+toUpperCaseFirstOne(fieldName);
				try 
				{
					Method method = EClass.getMethod(MethodName, null);
					ss = method.invoke(temp, null);
					if(ss!=null)
					{
						if(count<length)
						{
							
							tempResultStr+="\""+fieldName+"\":\""+ss+"\","; //添加了逗号
						}
						else
						{
							tempResultStr+="\""+fieldName+"\":\""+ss+"\"}"; //没有添加逗号
						}
					}
					else
					{
						if(count<length)
						{
							
							tempResultStr+="\""+fieldName+"\":\"\",";  //添加了逗号
						}
						else
						{
							tempResultStr+="\""+fieldName+"\":\"\"}";   //没有添加逗号
						}
					}
				} catch (SecurityException e) 
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e)
				{
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
//				System.out.println("****"+field.getType()+"**********"+field.getName()+"*****"+ss);
				count++;
			}
			
			
			if(j==lastPosition){
				
				result=result+tempResultStr;
			}
			else
			{
				
				result=result+tempResultStr+",";
			}
		}
//		result=result+"]}";
		result=result+"]";
		return result;
	}
	//首字母转小写
    public  String toLowerCaseFirstOne(String s)
    {
        if(Character.isLowerCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
    }
    //首字母转大写
    public  String toUpperCaseFirstOne(String s)
    {
        if(Character.isUpperCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder()).append(Character.toUpperCase(s.charAt(0))).append(s.substring(1)).toString();
    }




}