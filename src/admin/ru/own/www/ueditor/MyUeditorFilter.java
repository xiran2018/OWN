package admin.ru.own.www.ueditor;

import java.io.IOException;  
import javax.servlet.FilterChain;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServletRequest;  
 
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;
 
public class MyUeditorFilter extends StrutsPrepareAndExecuteFilter {
public void doFilter(ServletRequest req, ServletResponse res,FilterChain chain) 
throws IOException, ServletException {  
       HttpServletRequest request = (HttpServletRequest) req;  
       //不过滤的url  
       String url = request.getRequestURI();  
//       System.out.println("ueditor urL:"+url);
       if ("/own/ueditor/jsp/controller.jsp".equals(url))
       {  
          //这个过滤，是为了ueditor上传图片使用
           chain.doFilter(req, res);  
       }
       else if("/ckfinder/core/connector/java/connector.java".equals(url))
       {//以前if语句的这个地方是"/own/ckfinder/core/connector/java/connector.java"，加了own是错误的，own是最初的项目名
    	 //这个过滤，是为了ckeditor上传图片使用
//    	   System.out.println("使用自定义的过滤器"+url);  
    	   chain.doFilter(req, res);  
       }
       else{  
//           System.out.println("使用默认的过滤器");  
           super.doFilter(req, res, chain);  
       }  
   }  
}
