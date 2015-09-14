package admin.ru.own.www.entity;

import java.sql.Timestamp;

public class Language 
{
	private int id;
	private String languageName;
	private String foreignerName;
	private String languageCode;
	private String countryCode;
	private Short show;
	private int defaultlanuage;
	private int status;
	private Timestamp createTime;
    
	public Language() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLanguageName() {
		return languageName;
	}
	public void setLanguageName(String languageName) {
		this.languageName = languageName;
	}
	public String getForeignerName() {
		return foreignerName;
	}
	public void setForeignerName(String foreignerName) {
		this.foreignerName = foreignerName;
	}
	public String getLanguageCode() {
		return languageCode;
	}
	public void setLanguageCode(String languageCode) {
		this.languageCode = languageCode;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public Short getShow() {
		return show;
	}
	public void setShow(Short show) {
		this.show = show;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Language other = (Language) obj;
		if (id != other.id)
			return false;
		return true;
	}
	public int getDefaultlanuage() {
		return defaultlanuage;
	}
	public void setDefaultlanuage(int defaultlanuage) {
		this.defaultlanuage = defaultlanuage;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
    
}
