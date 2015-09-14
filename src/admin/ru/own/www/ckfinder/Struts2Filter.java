package admin.ru.own.www.ckfinder;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class Struts2Filter extends StrutsPrepareAndExecuteFilter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain fc)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		String filterURL = request.getRequestURI();
		if ("/DRTS/ckfinder/core/connector/java/connector.java".equals(filterURL)) {
			try {
				fc.doFilter(req, res);
			} catch (Exception e) {

			}
		} else {
			super.doFilter(req, res, fc);
		}
	}
}
