package admin.ru.own.www.mybatis.dao;

import java.util.List;

import admin.ru.own.www.entity.StoreFooterInfoEdit;
import admin.ru.own.www.entity.Storefooterinfo;
import admin.ru.own.www.entity.StorefooterinfoClientShow;
import admin.ru.own.www.entity.Storefooterinfomultilanguage;
import admin.ru.own.www.entity.StorefooterinfomultilanguageEdit;

public interface StoreOperateMapper 
{

	List<StoreFooterInfoEdit> getAllHomeInfo();

	boolean InsertStoreHomeInfo(Storefooterinfo sftInfo);

	void insertMultiStoreHomeInfo(Storefooterinfomultilanguage cml);

	boolean deleteStoreHomeInfoById(int id);

	Storefooterinfo getStorefooterinfoById(int id);

	List<StorefooterinfomultilanguageEdit> getStorefooterinfoEditByFooterId(int id);

	boolean modify_basic_info(Storefooterinfo sftInfo);

	boolean modify_xiangxi_info(Storefooterinfomultilanguage cml);

	boolean modify_xiangxi_content(Storefooterinfomultilanguage cml);

	List<StorefooterinfoClientShow> getShowStoreFooterInfo(int lanid);

	List<StorefooterinfoClientShow> getShowDetailedInfo(int lanid, int id);

	StorefooterinfomultilanguageEdit getStorefooterinfoByFooterIdAndLanId(int lanid, int id);

}
