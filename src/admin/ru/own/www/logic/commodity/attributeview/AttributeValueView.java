package admin.ru.own.www.logic.commodity.attributeview;

import javax.servlet.http.HttpServletRequest;

import admin.ru.own.www.vo.AttributeVO;

public abstract class AttributeValueView {
	private static final int CHECKBOX = 2;
	private static final int INPUT = 1;
	private static final int TEXT = 3;
	private static final int SELECT = 4;

	protected abstract void doHandle(HttpServletRequest request, int p_id, AttributeVO attribute);

	public static AttributeValueView create(int inputStyle) {
		AttributeValueView valueView = null;
		switch (inputStyle) {
		case CHECKBOX:
			valueView = new CheckboxAttributeView();
			break;
		case INPUT:
			valueView = new InputeAttributeView();
			break;
		case TEXT:
			valueView = new InputeAttributeView();
			break;
		case SELECT:
			valueView = new SelectAttributeView();
			break;
		default:
			break;
		}
		return valueView;
	}
	/**
	 * 用于处理商品属性是否变更，新增，和删除
	 * 
	 * @param request  请求，包含属性值等参数
	 * @param p_id  商品id
	 * @param attribute  类型为AttributeVO，是从数据库里取出来的已经有的属性
	 */
	public static void handle(HttpServletRequest request, int p_id, AttributeVO attribute) {
		AttributeValueView valueView = create(attribute.getAtr().getInputStyle());
		if(valueView != null){
			valueView.doHandle(request, p_id, attribute);
		}
	}
}
