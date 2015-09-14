package admin.ru.own.www.logic.foreground;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import util.PageUtil;
import util.ParameterUtil;
/**
 * @author Tian
 * 用于像数据库查询筛选产品和搜索产品用的字段类
 */
public class FilterAndSearchArgs {
	private ParameterUtil parameterUtil = new ParameterUtil();
	private List<Integer> categoryIDs;
	private int startPrice;
	private int endPrice;
	private Set<Integer> attributes;
	private String searchMsg;
	private int lan_id;
	
	public FilterAndSearchArgs( int lan_id, String searchMsg,int startPrice, int endPrice) {
		super();
		this.startPrice = startPrice;
		this.endPrice = endPrice;
		this.searchMsg = searchMsg;
		this.lan_id = lan_id;
	}

	
	public FilterAndSearchArgs(List<Integer> categoryIDs,int startPrice, int endPrice, Set<Integer> attributes) {
		super();
		this.categoryIDs = categoryIDs;
		if(startPrice > endPrice) {
			this.startPrice = endPrice;
			this.endPrice = startPrice;
		}else {
			this.startPrice = startPrice;
			this.endPrice = endPrice;
		}
		this.attributes = attributes;
	}
	
	public FilterAndSearchArgs(List<Integer> categoryIDs, int startPrice, int endPrice) {
		this(categoryIDs,startPrice, endPrice, null);
	}
	
	public Map<String, Object> getSearchArgs() {
		int initPage = parameterUtil.getInitPageParameter();
		Map<String, Object> args = new HashMap<String, Object>();
		args.put("lan_id", lan_id);
		args.put("searchMsg", "%"+searchMsg+"%");
		args.put("startPrice", startPrice);
		args.put("endPrice", endPrice);
		args.put("begain",0+initPage*PageUtil.getPageSize());
		args.put("size",PageUtil.getPageSize());
		return args;
	}
	
	public Map<String, Object> getSearchCountArgs() {
		Map<String, Object> args = getSearchArgs();
		args.put("begain",0);
		args.put("size",Integer.MAX_VALUE);
		return args;
	}
	
	public Map<String, Object> getArgs() {
		int initPage = parameterUtil.getInitPageParameter();
		Map<String, Object> argss = new HashMap<String, Object>();
		argss.put("begain",0+initPage*PageUtil.getPageSize());
		argss.put("size",PageUtil.getPageSize());
		
		argss.put("categoryIDs", categoryIDs);
		argss.put("startPrice", startPrice);
		argss.put("endPrice", endPrice);
		if(attributes!=null && attributes.size()!=0){
			argss.put("atrValues", attributes);
			argss.put("atrNum", attributes.size()-1);
		}
		return argss;
	}
	/**
	 * 返回所有符合条件的product的args,为了计算符合条件的产品的，数目
	 * limt里的参数是（0,MAX）
	 * @return
	 */
	public Map<String, Object> getComputeCountArgs() {
		Map<String, Object> argss = getArgs();
		argss.put("begain",0);
		argss.put("size",Integer.MAX_VALUE);
		return argss;
	}

	public void setAttributes(Set<Integer> attributes) {
		this.attributes = attributes;
	}
}
