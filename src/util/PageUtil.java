package util;

public class PageUtil {
	private static int pageSize = 40;
	public static int getTotalPageNumber(int count,int size) {
		int num = count/size;
		if(count>size && count%size !=0){
			num += 1;
		}
		return num;
	}

	public static int validatePageNumber(String initPageStr) {
		int initPage = 1;
		if(initPageStr != null){
			initPage = Integer.parseInt(initPageStr)-1;
		}
		if(initPage<0){
			initPage = 0;
		}
		return initPage;
	}

	public static int getPageSize() {
		return pageSize;
	}

}
