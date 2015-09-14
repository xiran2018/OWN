package admin.ru.own.www.entity;

public class Currency {
	private int idcurrency;
	private String currencyname;
	private String currencysymbol;
	private double currencyrate;
	private int defaultcurrency;
	private int status;

	public void setIdcurrency(int idcurrency) {
		this.idcurrency = idcurrency;
	}

	public int getIdcurrency() {
		return idcurrency;
	}

	public void setCurrencyname(String currencyname) {
		this.currencyname = currencyname;
	}

	public String getCurrencyname() {
		return currencyname;
	}

	public void setCurrencysymbol(String currencysymbol) {
		this.currencysymbol = currencysymbol;
	}

	public String getCurrencysymbol() {
		return currencysymbol;
	}

	public double getCurrencyrate() {
		return currencyrate;
	}

	public void setCurrencyrate(double currencyrate) {
		this.currencyrate = currencyrate;
	}

	public int getDefaultcurrency() {
		return defaultcurrency;
	}

	public void setDefaultcurrency(int defaultcurrency) {
		this.defaultcurrency = defaultcurrency;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
