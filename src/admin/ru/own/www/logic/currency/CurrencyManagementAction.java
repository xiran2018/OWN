package admin.ru.own.www.logic.currency;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import admin.ru.own.www.entity.Currency;
import admin.ru.own.www.mybatis.dao.CurrencyDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CurrencyManagementAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private CurrencyDAO dao = (CurrencyDAO) DAOFactory.getInstance().getDAOImp(CurrencyDAO.class.getName());
	private Currency c;
	public String showAll() {
		List<Currency> list = dao.getAll();
		ActionContext.getContext().put("list", list);
		HttpServletRequest request = ServletActionContext.getRequest();
		String isSuccessStr = request.getParameter("isSuccess");
		ActionContext.getContext().put("isSuccess", isSuccessStr);
		return "showAll";
	}
	
	public String update() {
		if(c.getDefaultcurrency()!=1){
			dao.update(c);
		} else {
			//修改其他的货币类别为非默认
			List<Currency> list = dao.getAll();
			for (Currency currency : list) {
				if(currency.getIdcurrency() != c.getIdcurrency()){
					currency.setDefaultcurrency(0);
					dao.update(currency);
				} else {
					dao.update(c);
				}
			}
		}
		ActionContext.getContext().put("isSuccess",true);
		return "update";
	}
	
	public String delete() {
		dao.delete(c.getIdcurrency());
		return "delete";
	}
	public String insert() {
		dao.insert(c);
		return "insert";
	}
	public Currency getC() {
		return c;
	}
	public void setC(Currency c) {
		this.c = c;
	}
	
	
}
