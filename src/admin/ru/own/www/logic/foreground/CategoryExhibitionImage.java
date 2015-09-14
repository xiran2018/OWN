package admin.ru.own.www.logic.foreground;

public class CategoryExhibitionImage {
	private static ExhibitionSize type1 = new ExhibitionSize(176, 176);
	private static ExhibitionSize type2 = new ExhibitionSize(210, 210);
	private static ExhibitionSize type3 = new ExhibitionSize(210, 270);
	private static ExhibitionSize type4 = new ExhibitionSize(254, 390);

	private CategoryExhibitionImage() {

	}

	public static ExhibitionSize find(int type) {
		switch (type) {
		case 1:
			return type1;
		case 2:
			return type2;
		case 3:
			return type3;
		case 4:
			return type4;
		default:
			return type1;
		}
	}
}
