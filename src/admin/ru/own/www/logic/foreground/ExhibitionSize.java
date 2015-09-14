package admin.ru.own.www.logic.foreground;

public class ExhibitionSize {
	private int height;
	private int width;

	public ExhibitionSize(int width, int height) {
		this.height = height;
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public int getWidth() {
		return width;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public void setWidth(int width) {
		this.width = width;
	}
}
