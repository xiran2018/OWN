// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.
// Jad home page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3) fieldsfirst ansi space 
// Source File Name:   PageUtil.java

package util;


public class PageUtil
{

	private static int pageSize = 60;
	private static int pageSizeInAdmin = 40;

	public PageUtil()
	{
	}

	public static int getTotalPageNumber(int count)
	{
		int num = count / pageSize;
		if (count > pageSize && count % pageSize != 0)
			num++;
		return num;
	}

	public static int getTotalPageNumberInAdmin(int count)
	{
		int num = count / pageSizeInAdmin;
		if (count > pageSizeInAdmin && count % pageSizeInAdmin != 0)
			num++;
		return num;
	}

	public static int validatePageNumber(String initPageStr)
	{
		int initPage = 1;
		if (initPageStr != null)
			initPage = Integer.parseInt(initPageStr) - 1;
		if (initPage < 0)
			initPage = 0;
		return initPage;
	}

	public static int getPageSize()
	{
		return pageSize;
	}

	public static int getPageSizeInAdmin()
	{
		return pageSizeInAdmin;
	}

	public static void setPageSizeInAdmin(int pageSizeInAdmin)
	{
		pageSizeInAdmin = pageSizeInAdmin;
	}

}
