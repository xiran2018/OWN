package admin.ru.own.www.mybatis.dao;

import java.util.List;

import ru.own.www.entity.ShippingShowVO;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.ShippingTemplate;
import admin.ru.own.www.entity.ShippingTemplateTime;
import admin.ru.own.www.entity.ShippingTemplateXiangxi;
import admin.ru.own.www.entity.shipTemplateEdit;

public interface ShippingTemplateMapper 
{
	int saveShippingTemplateName(ShippingTemplate st);

	boolean saveShippingTemplate(ShippingTemplateXiangxi stxx);	
	
	List<ShippingTemplate> getAllShippingTemplate();
	
	List<ShippingTemplate> fetchAllShippingTemplate();

	boolean saveShippingTemplateTime(ShippingTemplateTime stt);

	boolean deleteShippingTemplateById(int id);

	List<shipTemplateEdit> getShipTemplateEditByTemplateId(int id);

	ShippingTemplate getShipTemplateByTemplateId(int id);

	boolean modifyShippingTemplateName(ShippingTemplate st);

	boolean deleteShippingTemplateXiangAndTimeByTemplateId(ShippingTemplate st);

	List<ShippingShowVO> getShipInfoByTemplateIdAndCountryId(int shipTemplateId,
			int tempCountryId);

}
