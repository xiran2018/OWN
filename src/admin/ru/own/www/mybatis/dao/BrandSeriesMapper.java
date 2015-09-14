package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.BrandMultiLanguage;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.EditBrandMultiLanguage;


public interface BrandSeriesMapper 
{
	public List brandFetchByCategoryId(int id);

	public void insertForeignBrand(BrandMultiLanguage bml);

	public void delForeignBrandByBranId(Integer brandId);

	public List<EditBrandMultiLanguage> fecthBrandMultiBybrandId(int brandId);

	public void updatebrandXiangXiInfo(BrandSeries brand);

}
