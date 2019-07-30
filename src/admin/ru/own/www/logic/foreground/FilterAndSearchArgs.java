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
	private ParameterUtil parameterUtil;
	private List<Integer> categoryIDs;
	private int startPrice;
	private int endPrice;
	private Set<Integer> attributes;  ///////////////////////
	private String searchMsg;
	private int lan_id;
	private int initPage;

	public FilterAndSearchArgs(int lan_id, String searchMsg, int startPrice, int endPrice)
	{
		parameterUtil = new ParameterUtil();
		this.startPrice = startPrice;
		this.endPrice = endPrice;
		this.searchMsg = searchMsg;
		this.lan_id = lan_id;
	}

	public FilterAndSearchArgs(int lan_id, String searchMsg, int startPrice, int endPrice, int page)
	{
		parameterUtil = new ParameterUtil();
		this.startPrice = startPrice;
		this.endPrice = endPrice;
		this.searchMsg = searchMsg;
		this.lan_id = lan_id;
		initPage = page;
	}

	public FilterAndSearchArgs(List categoryIDs, int startPrice, int endPrice, Set attributes)
	{
		parameterUtil = new ParameterUtil();
		this.categoryIDs = categoryIDs;
		if (startPrice > endPrice)
		{
			this.startPrice = endPrice;
			this.endPrice = startPrice;
		} else
		{
			this.startPrice = startPrice;
			this.endPrice = endPrice;
		}
		this.attributes = attributes;
	}

	public FilterAndSearchArgs(List categoryIDs, int startPrice, int endPrice, Set attributes, int page)
	{
		parameterUtil = new ParameterUtil();
		this.categoryIDs = categoryIDs;
		if (startPrice > endPrice)
		{
			this.startPrice = endPrice;
			this.endPrice = startPrice;
		} else
		{
			this.startPrice = startPrice;
			this.endPrice = endPrice;
		}
		this.attributes = attributes;
		initPage = page;
	}

	public FilterAndSearchArgs(List categoryIDs, int startPrice, int endPrice)
	{
		this(categoryIDs, startPrice, endPrice, ((Set) (null)));
	}

	public FilterAndSearchArgs(List categoryIDs, int startPrice, int endPrice, int page)
	{
		this(categoryIDs, startPrice, endPrice, ((Set) (null)), page);
	}


	public Map getSearchArgs()
	{
		initPage = parameterUtil.getInitPageParameter();
		Map args = new HashMap();
		args.put("lan_id", Integer.valueOf(lan_id));
		args.put("searchMsg", (new StringBuilder("%")).append(searchMsg).append("%").toString());
		args.put("startPrice", Integer.valueOf(startPrice));
		args.put("endPrice", Integer.valueOf(endPrice));
		args.put("begain", Integer.valueOf(0 + initPage * PageUtil.getPageSize()));
		args.put("size", Integer.valueOf(PageUtil.getPageSize()));
		return args;
	}
	
	public Map<String, Object> getSearchCountArgs() {
		Map<String, Object> args = getSearchArgs();
		args.put("begain",0);
		args.put("size",Integer.MAX_VALUE);
		return args;
	}

	public Map getArgs()
	{
		initPage = parameterUtil.getInitPageParameter();
		Map argss = new HashMap();
		argss.put("begain", Integer.valueOf(initPage * PageUtil.getPageSize()));
		argss.put("size", Integer.valueOf(PageUtil.getPageSize()));
		argss.put("categoryIDs", categoryIDs);
		argss.put("startPrice", Integer.valueOf(startPrice));
		argss.put("endPrice", Integer.valueOf(endPrice));
		if (attributes != null && attributes.size() != 0)
		{
			argss.put("atrValues", attributes);
			argss.put("atrNum", Integer.valueOf(attributes.size() - 1));
		}
		return argss;
	}

	public Map getPushArgs()
	{
		initPage = parameterUtil.getInitPageParameter();
		Map argss = new HashMap();
		argss.put("begain", Integer.valueOf(0 + initPage * PageUtil.getPageSize()));
		argss.put("size", Integer.valueOf(PageUtil.getPageSize()));
		argss.put("startPrice", Integer.valueOf(startPrice));
		argss.put("endPrice", Integer.valueOf(endPrice));
		return argss;
	}
	/**
	 * 返回所有符合条件的product的args,为了计算符合条件的产品的，数目
	 * limt里的参数是（0,MAX）
	 * @return
	 */
	public Map<String, Object> getComputeCountArgs() {
		Map argss = getArgs();
		argss.put("begain", Integer.valueOf(0));
		argss.put("size", Integer.valueOf(0x7fffffff));
		return argss;
	}

	public void setAttributes(Set<Integer> attributes) {
		this.attributes = attributes;
	}
}
