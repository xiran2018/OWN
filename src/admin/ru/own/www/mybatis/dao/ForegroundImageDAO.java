package admin.ru.own.www.mybatis.dao;

import java.util.List;
import java.util.Map;

import admin.ru.own.www.entity.ForegroundImage;

public interface ForegroundImageDAO extends MyBatisMapper {

	List<ForegroundImage> getAll();

	void updateImgSrc(Map<String, Object> map);

	ForegroundImage getForegroundImageByID(int id);

	void update(ForegroundImage img);

	void insert(ForegroundImage img);
	
	void delete(int id);

	List<ForegroundImage> getShowIndexPlayImage();

	ForegroundImage getShowIndexSmallImage();

}
