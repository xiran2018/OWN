package ru.own.www.entity;

import admin.ru.own.www.entity.ShippingCountry;

public class MailAddressShowVO 
{
	MailAddress mailAddress;
	ShippingCountry shppingCountry;
	
	
	public MailAddress getMailAddress() {
		return mailAddress;
	}
	public void setMailAddress(MailAddress mailAddress) {
		this.mailAddress = mailAddress;
	}
	public ShippingCountry getShppingCountry() {
		return shppingCountry;
	}
	public void setShppingCountry(ShippingCountry shppingCountry) {
		this.shppingCountry = shppingCountry;
	}
	
}
