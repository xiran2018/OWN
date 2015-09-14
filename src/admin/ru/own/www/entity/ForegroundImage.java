package admin.ru.own.www.entity;

public class ForegroundImage {
	private int id;
	private String imgsrc;
	private String imghref;
	private String leftcolor;
	private String rightcolor;
	private int type;
	private int used;

	public int getUsed() {
		return used;
	}

	public void setUsed(int used) {
		this.used = used;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getId() {
		return id;
	}

	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}

	public String getImgsrc() {
		return imgsrc;
	}

	public void setImghref(String imghref) {
		this.imghref = imghref;
	}

	public String getImghref() {
		return imghref;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getType() {
		return type;
	}

	public String getLeftcolor() {
		return leftcolor;
	}

	public void setLeftcolor(String leftcolor) {
		this.leftcolor = leftcolor;
	}

	public String getRightcolor() {
		return rightcolor;
	}

	public void setRightcolor(String rightcolor) {
		this.rightcolor = rightcolor;
	}

	@Override
	public String toString() {
		return "ForegroundImage [id=" + id + ", imgsrc=" + imgsrc + ", imghref=" + imghref + ", leftcolor=" + leftcolor + ", rightcolor=" + rightcolor + ", type=" + type + ", used=" + used + "]";
	}

}
