package ru.own.www.logic;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class CommodityShow extends ActionSupport  {
	// 总共的数据量
	private int total;

	// 每页显示多少条
	private int pageSize;

	// 共有多少页
	private int totalPage;

	// 当前是第几页
	private int index;

	// 数据
	private List<?> data;

	public String execute() {
		
		
		
		return  SUCCESS;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

}
