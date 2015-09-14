package util;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

public class ParameterUtil {
	public int getInitPageParameter() {
		int initPage = 0;
		try {
			initPage = PageUtil.validatePageNumber(getIntParameter("initPage")+"");
		} catch (Exception e) {
		}
		return initPage;
	}
	
	public int getCategoryIDParameter() {
		int categoryid = -1;
		try {
			categoryid = getIntParameter("categoryid");
		} catch (Exception e) {
			System.out.println("categoryid参数异常");
		}
		return categoryid;
	}
	
	public int getEndPriceParameter() {
		int endPrice = Integer.MAX_VALUE;
		try {
			endPrice = getIntParameter("endPrice");
			if(endPrice < 0) {
				endPrice = Integer.MAX_VALUE;
			}
		} catch (Exception e) {
		}
		return endPrice;
	}
	public int getStartPriceParameter() {
		int startPrice = 0;
		try {
			startPrice = getIntParameter("startPrice");
			if(startPrice <0) {
				startPrice = 0;
			}
		} catch (Exception e) {
		}
		return startPrice;
	}
	public int getProductIDParameter() {
		int p_id = -1;
		try {
			p_id = getIntParameter("p_id");
		} catch (Exception e) {
			System.out.println("p_id参数异常");
		}
		return p_id;
	}
	
	public String getIsSuccessParameter() {
		return getStrParameter("success");
	}
	
	public String getStrParameter(String parameterName){
		HttpServletRequest request = ServletActionContext.getRequest();
		String str = request.getParameter(parameterName);
		return str;
	}
	public int getIntParameter(String parameterName) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		int intParameter = -1;
		try {
			String parameter = request.getParameter(parameterName);
			intParameter = Integer.parseInt(parameter);
		} catch (Exception e) {
			throw e;
		}
		return intParameter;
	}
}
