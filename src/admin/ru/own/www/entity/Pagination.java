package admin.ru.own.www.entity;

public class Pagination 
{
	private Integer pagenum;//需要获取的信息所在的页数
	private Integer numberInPage=10;//每一页需要显示的行数
	private Integer offset; //偏移量，分页的时候需要，表明从哪一行开始取数据
	
	public Pagination() {
		// TODO Auto-generated constructor stub
	}
	public Integer getPagenum() {
		return pagenum;
	}
	public void setPagenum(Integer pagenum) {
		this.pagenum = pagenum;
	}
	public Integer getNumberInPage() {
		return numberInPage;
	}
	public void setNumberInPage(Integer numberInPage) {
		this.numberInPage = numberInPage;
	}
	public Integer getOffset() {
		return offset;
	}
	public void setOffset(Integer offset) {
		this.offset = offset;
	}
	
	
}
