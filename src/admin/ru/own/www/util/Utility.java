package admin.ru.own.www.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.net.URISyntaxException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.dom4j.Document;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import systemlog.Log;
import admin.ru.own.www.entity.Currency;
import admin.ru.own.www.mybatis.dao.CurrencyDAO;
import admin.ru.own.www.mybatis.dao.CurrencyDAOImp;
import admin.ru.own.www.productup.ProductUP;

import com.opensymphony.xwork2.ActionInvocation;

public class Utility {
	
		/**
		 * // 进行四舍五入操作
		 * @param d
		 * @param len
		 * @return
		 */
		public static double round(double d,int len) 
		{     
		         BigDecimal b1 = new BigDecimal(d);
		         BigDecimal b2 = new BigDecimal(1);
		        // 任何一个数字除以1都是原数字
		        // ROUND_HALF_UP是BigDecimal的一个常量，表示进行四舍五入的操作
		        return b1.divide(b2, len,BigDecimal.ROUND_HALF_UP).doubleValue();
		     
		}
	   	/**
	   	 * 两个浮点数相除,返回float
	   	 * @param a
	   	 * @param b
	   	 * @param len 几位有效数字
	   	 * @return
	   	 */
	   	public static float floatDivide(float a,float b,int len)
	   	{
	   		BigDecimal b1 = new BigDecimal(Float.toString(a));
	   		BigDecimal b2 = new BigDecimal(Float.toString(b));
	   		// ROUND_HALF_UP是BigDecimal的一个常量，表示进行四舍五入的操作
	   		float div= b1.divide(b2,len,BigDecimal.ROUND_HALF_UP).floatValue();
	   		return div;
	   	}
	/**
	 * 两个浮点数相乘,返回float
	 * @param a
	 * @param b
	 * @return
	 */
	public static float floatMultiply(float a,float b)
	{
		BigDecimal b1 = new BigDecimal(Float.toString(a));
		BigDecimal b2 = new BigDecimal(Float.toString(b));
		Float mul = b1.multiply(b2).floatValue();
		return mul;
	}
	
	/**
	 * 两个浮点数相加,返回float
	 * @param a
	 * @param b
	 * @return
	 */
	public static float floatAdd(float a,float b)
	{
		BigDecimal b1 = new BigDecimal(Float.toString(a));
		BigDecimal b2 = new BigDecimal(Float.toString(b));
		Float add = b1.add(b2).floatValue();
		return add;
	}
	
	/**
	 * 两个浮点数相减,返回float
	 * @param a
	 * @param b
	 * @return
	 */
	public static float floatSubtract(float a,float b)
	{
		BigDecimal b1 = new BigDecimal(Float.toString(a));
		BigDecimal b2 = new BigDecimal(Float.toString(b));
		Float less = b1.subtract(b2).floatValue();
		return less;
	}
	
	/**
	 * 格式化float类型的数据
	 * 返回含有两位小数的字符串,已经四舍五入了
	 * @param number
	 * @return
	 */
	public static String decimalFormat(float number)
	{
		DecimalFormat decimalFormat=new DecimalFormat("0.00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
		String p=decimalFormat.format(number);//format 返回的是字符串
		return p;
	}
	
	/**
	 * 
	 * @param session session参数
	 * @param key  在session中需要查找的键值
	 * @return
	 */
	public static   boolean isLogin(Map session,String key)
	{
		if(session.get(key)!=null)
			return true;
		else
			return false;
	}
	
	/**
	 * DOM4J写入
	 * 
	 * @param path
	 * @param document
	 */
	public static void writeXML(String path, Document document) 
	{
		try 
		{
			OutputFormat format = OutputFormat.createPrettyPrint();
			format.setEncoding("gbk");
			XMLWriter writer = new XMLWriter(new FileWriter(path), format);
			writer.write(document);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void deletFile(String tempPrefilePath) {
		File preImageFile = new File(tempPrefilePath);
		if (preImageFile.exists()) {
			preImageFile.delete();
		}
	}
	
	
	/**
	 * 复制文件，参数为File
	 * @param sourceFile
	 * @param targetFile
	 * @throws IOException
	 */
    public static void copyFile(File sourceFile, File targetFile) throws IOException 
    {
        BufferedInputStream inBuff = null;
        BufferedOutputStream outBuff = null;
        try 
        {
            // 新建文件输入流并对它进行缓冲
            inBuff = new BufferedInputStream(new FileInputStream(sourceFile));

            // 新建文件输出流并对它进行缓冲
            outBuff = new BufferedOutputStream(new FileOutputStream(targetFile));

            // 缓冲数组
            byte[] b = new byte[1024 * 5];
            int len;
            while ((len = inBuff.read(b)) != -1) 
            {
                outBuff.write(b, 0, len);
            }
            // 刷新此缓冲的输出流
            outBuff.flush();
        } finally 
        {
            // 关闭流
            if (inBuff != null)
                inBuff.close();
            if (outBuff != null)
                outBuff.close();
        }
    }

    /**
     * 复制文件，参数为String
     * @param oldPath
     * @param newPath
     */
    public  static void CopyWithStringPath(String   oldPath,String  newPath)
    {    
           try     
           {    
               int  bytesum = 0;    
               int  byteread = 0;    
               File oldfile =  new File(oldPath);    
               if(oldfile.exists())     
               {      
                   InputStream  inStream = new FileInputStream(oldPath);
                   FileOutputStream fs = new FileOutputStream(newPath);
                   byte[]  buffer  =  new byte[1444];    
                   while((byteread=inStream.read(buffer))!=-1)
                   {    
                     bytesum += byteread;
                     fs.write(buffer, 0, byteread); 
                   }    
                   inStream.close();  
                   fs.close();
               }    
           }    
           catch     (Exception  e)     
           {    
                   System.out.println( "error  ");    
                   e.printStackTrace();    
           }    
     }     
    

    /**
     *     // 复制文件夹  复制文件夹，参数为String
     * @param sourceDir
     * @param targetDir
     * @throws IOException
     */
    public static void copyDirectiory(String sourceDir, String targetDir) throws IOException 
    {
        // 新建目标目录
        (new File(targetDir)).mkdirs();
        // 获取源文件夹当前下的文件或目录
        File[] file = (new File(sourceDir)).listFiles();
        for (int i = 0; i < file.length; i++) {
            if (file[i].isFile()) {
                // 源文件
                File sourceFile = file[i];
                // 目标文件
                File targetFile = new File(new File(targetDir).getAbsolutePath() + File.separator + file[i].getName());
                copyFile(sourceFile, targetFile);
            }
            if (file[i].isDirectory()) {
                // 准备复制的源文件夹
                String dir1 = sourceDir + "/" + file[i].getName();
                // 准备复制的目标文件夹
                String dir2 = targetDir + "/" + file[i].getName();
                copyDirectiory(dir1, dir2);
            }
        }
    }

	public static boolean isDouble(String str) 
	{
		Pattern pattern = Pattern.compile("^[-\\+]?[.\\d]*$");
		return pattern.matcher(str).matches();
	}
	
	/**
	  * 返回请求的地址
	  * @param request
	  * @return
	  */
	 public static String getRequestURL(HttpServletRequest request)   
    {     
		  String url;//最终地址
		  String path;//地址
		  String queryString = "";//请求参数

	  	 path= request.getServletPath().substring(1);//用这个函数之后不需要考虑项目名称长度的问题.substring(1)的目的是把第一个“/”去除
	  	
        if(!path.endsWith("login.action"))
        {
       	 // 获得请求中的参数
	         Map<String,String[]> zzMap = request.getParameterMap();   
            if(zzMap!=null)   
            {   
                for(String s:zzMap.keySet())   
                {   

                		String[] value=zzMap.get(s);   
                		for(String val:value)   
                		{   
                        	if(!s.equals("languageId")&&!s.equals("currencyId"))
                        	{//不再包含languageId的信息，这个languageId之在前台生成即可
	                			// 拼凑得到登陆之前的参数
	                			if(queryString==null||queryString.equals(""))
	                			{
	                				queryString=queryString+s+"="+val;  
	                			}
	                			else
	                			{
	                				queryString=queryString+"&"+s+"="+val;   
	                			}
                        	}
                        	else if(s.equals("currencyId"))
                        	{//把货币的id加入session
                        		setCurrencySession(request,val);
                        	}
                        	else
                        	{//把语言的id加入session
                        		HttpSession session = request.getSession();
            		            session.setAttribute("languageId", val);
                        	}
                		}   

                       
                }   
             }  
        }

	      if(path==null || path.equals(""))   
	      { 
	    	  url="";
	      }
	      else
	      {	  
	    	  // 拼凑得到登陆之前的地址
	    	  if(queryString==null||queryString.equals(""))
	    	  {
	    		  url = path ;
	    	  }
	    	  else
	    	  {
	    		  url = path + "?" + queryString;
	    	  }
	      }
		  return url;
    }
	 
	/**
	 * 根据请求的url中的currencyId，设置相应的货币
	 * 
	 */
	public static void setCurrencySession(HttpServletRequest request,String currencyId)
	{
//		Log.log4jLogInfo(QequestURLFilter.class, (String)session.getAttribute("languageId"));
		String currencyRate,currencyName,currencySymbol;
		
		int tempId=Integer.parseInt(currencyId);
		CurrencyDAO fid=new CurrencyDAOImp();
		Currency defaultCurrency=fid.getCurrencyById(tempId);
		currencyRate=""+defaultCurrency.getCurrencyrate();
		currencyName=""+defaultCurrency.getCurrencyname();
		currencySymbol=""+defaultCurrency.getCurrencysymbol();
		
		HttpSession session = request.getSession();
		session.setAttribute("currencyId", currencyId);
		session.setAttribute("currencyRate", currencyRate);
		session.setAttribute("currencyName", currencyName);
		session.setAttribute("currencySymbol", currencySymbol);
		return;
		
	}
	
	/**
	 * 返回发起请求之前(或者发起请求）的页面，该函数是纯粹针对action这样的请求的
	 * 目前该函数还有缺陷，比如没有参数的时候后面会多一个？，有参数的时候会多一个&，暂时不要用这个函数，用getGoingURL即可
	 * @param request
	 * @param session
	 * @param invocation
	 * @return
	 */
	private String setToGoingURL(HttpServletRequest request,HttpSession session,ActionInvocation invocation)   
    {   
        //如果referer不为空 直接使用它。如果为空我们分别获得命名空间，action名,以及请求参数   
        //从新构造成一个URL保存在session中   
        String url=request.getHeader("referer");   
        //log.info("待转向URL:"+request.getHeader("referer"));   
        if(url==null || url.equals(""))   
        {   
            url="";   
            String path=request.getContextPath();   
            String actionName=invocation.getProxy().getActionName();   
            String nameSpace=invocation.getProxy().getNamespace();   
            if(nameSpace!=null||!("").equals(nameSpace)) 
            //if(StringUtil.validateNull(nameSpace))   
            {   
                url = url+path+nameSpace;   
                   
            }   
            if(actionName!=null||!("").equals(actionName))   
            {   
                url = url+"/"+actionName+".action"+"?";   
            }   
               
            Map<String,String[]> zzMap = request.getParameterMap();   
            if(zzMap!=null)   
            {   
                for(String s:zzMap.keySet())   
                {   
                    String[] value=zzMap.get(s);   
                    for(String val:value)   
                    {   
                        url=url+s+"="+val+"&";
                        
                    }   
                       
                }   
            }   
//                log.info("完整URL:"+url);   
        }   
        return url;
//               session.setAttribute(GOTO_URL_KEY, url);   
    }
	
	/**
	 * 返回发起请求之前(或者发起请求）的页面
	 * @param request
	 * @param invocation
	 * @return
	 */
	 public static String getGoingURL(HttpServletRequest request,ActionInvocation invocation)   
     {     
		  String url;//最终地址
		  String path="";//地址
		  String queryString = "";//请求参数
		  path=request.getHeader("Referer");   
	      if(path==null || path.equals(""))   
	      {   
	            
		         //method1： 获取此请求的地址，请求地址包含application name，进行subString操作，去除application name
	    	 	 //path= request.getRequestURI().substring(5); //5的原因是“/own/”5个字符,该种方式已经通过验证可以，该种方式下每一次工程的名字改变，需要改动数字5
				 
				 //method2
//	    	  	 String tempURI=request.getRequestURI();
//	    	  	 path= tempURI.substring(tempURI.indexOf("/", 2)+1, tempURI.length());

	            
	    	  	 //method 3
	    	  	 path= request.getServletPath();//用这个函数之后不需要考虑项目名称长度的问题
	    	 	 
		         if(path.endsWith("action")&&!path.endsWith("login.action"))
		         {
	//	        	 Map parameters = invocation.getInvocationContext().getParameters();
	//	        	 Set<String> keySet = parameters.keySet();
	//	        	 int len=keySet.size();
	//	        	 for(String k:keySet)
	//	        	 {
	//	        		 queryString+=k+"="+parameters.get(k)+"&";
	//	        	 }
		        	 // 获得请求中的参数
			         Map<String,String[]> zzMap = request.getParameterMap();   
		             if(zzMap!=null)   
		             {   
		                 for(String s:zzMap.keySet())   
		                 {   
		                     String[] value=zzMap.get(s);   
		                     for(String val:value)   
		                     {   
			                	    // 拼凑得到登陆之前的参数
			                		  if(queryString==null||queryString.equals(""))
			                		  {
			                			  queryString=queryString+s+"="+val;  
			                		  }
			                		  else
			                		  {
			                			  queryString=queryString+"&"+s+"="+val;  
			                		  } 
		                     }   
		                        
		                 }   
		              }  
		         }
	      }
//        else
//        {
//            // 获得请求中的参数
//            queryString = request.getQueryString();
//            // 预防空指针
//            if (queryString == null) 
//            {
//                queryString = "";
//            }
//        }

      if(path==null || path.equals(""))   
      { 
    	  url="";
      }
      else
      {	  
    	  // 拼凑得到登陆之前的地址
    	  if(queryString==null||queryString.equals(""))
    	  {
    		  url = path ;
    	  }
    	  else
    	  {
    		  url = path + "?" + queryString;
    	  }
      }
	  return url;
 }
	/**
	 * 返回发起请求之前(或者发起请求）的页面
	 * @param request
	 * @return
	 */
	 public static String getGoingURL(HttpServletRequest request)   
     {     
		  String url;//最终地址
		  String path;//地址
		  String queryString = "";//请求参数
		  path=request.getHeader("Referer");   
	      if(path==null || path.equals(""))   
	      {   
	    	  	 
		         //method1： 获取此请求的地址，请求地址包含application name，进行subString操作，去除application name
	    	 	 //path= request.getRequestURI().substring(5); //5的原因是“/own/”5个字符,该种方式已经通过验证可以，该种方式下每一次工程的名字改变，需要改动数字5
				 
				 //method2
//	    	  	 String tempURI=request.getRequestURI();
//	    	  	 path= tempURI.substring(tempURI.indexOf("/", 2)+1, tempURI.length());

	            
	    	  	 //method 3
	    	  	 path= request.getServletPath();//用这个函数之后不需要考虑项目名称长度的问题
	    	  	 
		         if((path.endsWith("action")||path.endsWith("jsp"))&&!path.endsWith("login.action"))
		         {
	//	        	 Map parameters = invocation.getInvocationContext().getParameters();
	//	        	 Set<String> keySet = parameters.keySet();
	//	        	 int len=keySet.size();
	//	        	 for(String k:keySet)
	//	        	 {
	//	        		 queryString+=k+"="+parameters.get(k)+"&";
	//	        	 }
		        	 // 获得请求中的参数
			         Map<String,String[]> zzMap = request.getParameterMap();   
		             if(zzMap!=null)   
		             {   
		                 for(String s:zzMap.keySet())   
		                 {   
		                     String[] value=zzMap.get(s);   
		                     for(String val:value)   
		                     {   
			                	    // 拼凑得到登陆之前的参数
			                		  if(queryString==null||queryString.equals(""))
			                		  {
			                			  queryString=queryString+s+"="+val;  
			                		  }
			                		  else
			                		  {
			                			  queryString=queryString+"&"+s+"="+val;   
			                		  }
		                     }   
		                        
		                 }   
		              }  
		         }
	      }
//         else
//         {
//             // 获得请求中的参数
//             queryString = request.getQueryString();
//             // 预防空指针
//             if (queryString == null) 
//             {
//                 queryString = "";
//             }
//         }

	      if(path==null || path.equals(""))   
	      { 
	    	  url="";
	      }
	      else
	      {	  
	    	  // 拼凑得到登陆之前的地址
	    	  if(queryString==null||queryString.equals(""))
	    	  {
	    		  url = path ;
	    	  }
	    	  else
	    	  {
	    		  url = path + "?" + queryString;
	    	  }
	      }
		  return url;
  }
	/**
	 * 不包含最后的"/"    
	 * 得到项目的根目录
	 * @return
	 */
	public static String getRootPath()
	{    
		
	       //因为类名为"SaveAction"，因此" SaveAction.class"一定能找到    
		
//	    String result = ProductUP.class.getResource("ProductUP.class").toString();    
	    String result = null;
		try 
		{
			result = Utility.class.getResource("Utility.class").toURI().getPath();
		} 
		catch (URISyntaxException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.getInstance().out("路径下的文件错误，可能是因为空格等原因");
		}    
		
	   Properties props=System.getProperties(); //系统属性
       String osName = props.getProperty("os.name"); //操作系统名称  
       if(osName.startsWith("Windows")||osName.startsWith("w"))
       {
    	   if(result.startsWith("/"))
    	   {
    		   int len=result.length();
    		   result=result.substring(1);
    	   }
       }
		
       int index = result.indexOf("WEB-INF");  
	
       if(index == -1)
       {    
	
           index = result.indexOf("bin");    
	
       }    
	
       result = result.substring(0,index);    
	
       if(result.startsWith("jar"))
       {    
	
           // 当class文件在jar文件中时，返回"jar:file:/F:/ ..."样的路径     
	
           result = result.substring(10);    
	
       }
       else if(result.startsWith("file"))
       {    
	
           // 当class文件在class文件中时，返回"file:/F:/ ..."样的路径     
	
           result = result.substring(6);    
	
       }    
	
       if(result.endsWith("/"))result = result.substring(0,result.length()-1);//不包含最后的"/"    
	
       return result;    
		
	 }  
	
	public static boolean checkIsWindowsOs()
	{
    	Properties props=System.getProperties(); //系统属性
    	String osName = props.getProperty("os.name"); //操作系统名称  
    	String osArch = props.getProperty("os.arch"); //操作系统构架  
    	String osVersion = props.getProperty("os.version"); //操作系统版本
    	System.out.println(osName+"---"+osArch+"---"+osVersion);
        if(osName.startsWith("Windows")||osName.startsWith("w"))
        {
        		return true;
        }
        else
        {
        	return false;
        }
	}
	
    public static void main(String[] args)  
    {  
    	//D:\apache-tomcat-7.0.56\webapps\own/upload\/categoryImage\/2014111010222449608.jpg
//    	String fileName="D:/apache-tomcat-7.0.56/webapps/own/upload/categoryImage/2014111010431964385.jpg";
//
//    	deletFile(fileName);
    	String rootPath="D:/apache-tomcat-7.0.56/webapps/own";
		String src=rootPath+"/common/footer/template.jsp";
		String des=rootPath+"/common/footer/6.jsp";
    	CopyWithStringPath(src,des);
//		File srcFile=new File(src);
//		File desFile=new File(des);
//		
//		try {
//			copyFile(srcFile,desFile);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
    	
//    	String a=getRootPath(); 
//    	a="/D:/Workspaces/MyEclipse Professional 2014/20141106/own/WebRoot";
//    	System.out.println(a);
//    	a=a.substring(1);
//    	a.replace("/", "\\");
//    	System.out.println(a);
    	

    }

	public static String getRandomFileName(File file) 
	{
		Random r = new Random();
		// 生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
		int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; // 获取随机数
		SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); // 时间格式化的格式
		String nowTimeStr = sDateFormat.format(new Date()); // 当前时间
		
		
		String extName = ""; // 保存文件拓展名
		// 获取拓展名
		String fileNameString=file.getName();
		if (fileNameString.lastIndexOf(".") >= 0) 
		{
			extName = fileNameString.substring(fileNameString.lastIndexOf("."));
		}
		String newFileName = nowTimeStr + rannum + extName; // 文件重命名后的名字
		
		return newFileName;
	}
	
	/**
	 * 把04/17/2015这样的时间格式转换为20150417这样的时间格式，方便数据库查询使用
	 * @param gmtBeginDate
	 * @return
	 */
	public static String getQueryDate(String gmtBeginDate) 
	{
		String result="";
		if(gmtBeginDate!=null&&!gmtBeginDate.equals(""))
		{
			String [] splitStrings=gmtBeginDate.split("/");
			result=splitStrings[2]+splitStrings[0]+splitStrings[1];
		}
		else
		{
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
			String temp=df.format(new Date());// new Date()为获取当前系统时间
			String [] splitStrings=temp.split("-");
			result=splitStrings[0]+splitStrings[1]+splitStrings[2];
		}
		
		return result;
	} 
}
