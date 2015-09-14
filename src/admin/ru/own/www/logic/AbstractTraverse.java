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
import admin.ru.own.www.entity.AbstraTreeGrid;


import admin.ru.own.www.entity.BrandSeries;

public class AbstractTraverse{

	public String fetchChildren(List<AbstraTreeGrid> list) 
	{
		String resultStr="[";
		HashMap<Integer, List> hashBrand=new HashMap<Integer, List>(); //按照Pid作为key，放入不同的List
		for(int i=0;i<list.size();i++)
		{
			AbstraTreeGrid tempBrand=list.get(i);
			Integer PId=tempBrand.getParentId();
			if(hashBrand.containsKey(PId))
			{
				List tempList=hashBrand.get(PId);
				tempList.add(tempBrand);
			}
			else
			{
				List<AbstraTreeGrid> tempList=new ArrayList<AbstraTreeGrid>();
				tempList.add(tempBrand);
				hashBrand.put(PId, tempList);
			}
		}
		//key 为0的List，是所有的根元素
		List rootList=hashBrand.get(0);
//		System.out.println("******parentid=0 count***********"+rootList.size());
		int rootListSize=rootList.size()-1;
		for(int i=0;i<rootList.size();i++)
		{
			int temp=i+1;
//			System.out.println("***************根元素执行次数************************************"+temp);
			AbstraTreeGrid tempBrand=(AbstraTreeGrid) rootList.get(i);
			//rootList.remove(i);//移除
			String tempResultStr="{";
			Class BrandClass=tempBrand.getClass();
			Field[] fields=BrandClass.getDeclaredFields();
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
					Method method = BrandClass.getMethod(MethodName, null);
					ss = method.invoke(tempBrand, null);
					if(ss!=null)
					{
						if(count<length)
						{
							
							tempResultStr+="\""+fieldName+"\":\""+ss+"\","; //添加了逗号
						}
						else
						{
							tempResultStr+="\""+fieldName+"\":\""+ss+"\""; //没有添加逗号
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
							tempResultStr+="\""+fieldName+"\":\"\"";   //没有添加逗号
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
			
			String children="";
			children=getChildren(tempBrand,hashBrand);
			if(children==""||children.equals(""))
			{

				if(i==rootListSize)
				{
					
					tempResultStr+="}";
				}
				else
				{
					tempResultStr+="},";
				}
			}
			else
			{

				if(i==rootListSize)
				{
					
					tempResultStr+=",\"children\":"+children+"}";  //直接添加了逗号
				}
				else
				{
					tempResultStr+=",\"children\":"+children+"},";  //直接添加了逗号
				}
				
				
			}
			
			
			resultStr+=tempResultStr;
			
		}//end of for
		
		resultStr+="]";
		
		return resultStr;
	}
	
	
	private String getChildren(AbstraTreeGrid tempBrand0,HashMap<Integer, List> hashBrand)
	{
		String resultString="[";
		Integer id=tempBrand0.getId();
		if(hashBrand.containsKey(id))
		{
			//key为id的List，是tempBrand0的所有children元素
			List rootList=hashBrand.get(id);
//			System.out.println("*****************"+rootList.size());
			int rootListSize=rootList.size()-1;
			for(int i=0;i<rootList.size();i++)
			{
//				System.out.println("***************************************************");
				AbstraTreeGrid tempBrand=(AbstraTreeGrid) rootList.get(i);
				//rootList.remove(i);//移除
				if(rootList.size()==0)//如果没有，则删除这个key为id的哈希值
				{
					hashBrand.remove(id);
				}
				String tempResultStr="{";
				Class BrandClass=tempBrand.getClass();
				Field[] fields=BrandClass.getDeclaredFields();
				int length=fields.length;
				int count=1;  //控制是否在最后一个元素添加逗号
				for(Field field : fields )
				{
					
					Object ss = null;
					String fieldName=field.getName();
					Class fieldType=field.getType();
					String MethodName="get"+toUpperCaseFirstOne(fieldName);
					try 
					{
						Method method = BrandClass.getMethod(MethodName, null);
						ss = method.invoke(tempBrand, null);
						if(ss!=null)
						{
							if(count<length)
							{
								
								tempResultStr+="\""+fieldName+"\":\""+ss+"\","; //添加了逗号
							}
							else
							{
								tempResultStr+="\""+fieldName+"\":\""+ss+"\""; //没有添加逗号
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
								tempResultStr+="\""+fieldName+"\":\"\"";   //没有添加逗号
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
					count++;
//					System.out.println("****"+field.getType()+"**********"+field.getName()+"*****"+ss);
				}//end of for
				
				String children="";
				children=getChildren(tempBrand,hashBrand);
				if(children==""||children.equals(""))
				{				
					
					if(i==rootListSize)
					{
						
						tempResultStr+="}";
					}
					else
					{
						tempResultStr+="},";
					}
				}
				else
				{
					
					if(i==rootListSize)
					{
						
						tempResultStr+=",\"children\":"+children+"}";  //
					}
					else
					{
						tempResultStr+=",\"children\":"+children+"},";  //
					}
					 //直接添加了逗号
				}
				resultString+=tempResultStr;
			}//end of for
			resultString+="]";
			return resultString;
		}//end of if hashBrand.containsKey(id)
		else
		{
			return "";
		}
		
		
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