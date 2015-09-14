package admin.ru.own.www.logic.commodity;


import org.apache.struts2.ServletActionContext;

import util.ParameterUtil;

import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAOImp;
import admin.ru.own.www.mybatis.dao.ProductsDAO;
import admin.ru.own.www.mybatis.dao.factory.DAOFactory;
import admin.ru.own.www.util.Utility;
import admin.ru.own.www.vo.ProductsVO;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CommodityImageManagementAction extends ActionSupport {
	private static final long serialVersionUID = -1679275578313841899L;
	private productImage image;
	private ParameterUtil util = new ParameterUtil();
	
	public String showImg() {
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		ProductsVO pvo = dao.getImg(util.getProductIDParameter());
		dao.closeSession();
		
		ActionContext.getContext().put("success", util.getIsSuccessParameter());
		ActionContext.getContext().put("pvo", pvo);
		return "showimg";
	}
	
	public String updateImage() {
		ProductImageDAO imageDAOImp = (ProductImageDAO) DAOFactory.get(ProductImageDAO.class.getName());;
		imageDAOImp.update(image);
		ActionContext.getContext().put("p_id",image.getProductId());
		ActionContext.getContext().put("success",true);
		return "updateImage";
	}

	public String deleteImage() {
		ProductImageDAO imageDAOImp = new ProductImageDAOImp();
		productImage p = imageDAOImp.getOneImgByID(image.getId());
		if (p != null) {
			String rootPath = ServletActionContext.getServletContext().getRealPath("");
			Utility.deletFile(rootPath + "/" + p.getImageAddr());
			imageDAOImp.delete(image.getId());
		}
		ActionContext.getContext().put("p_id",image.getProductId());
		ActionContext.getContext().put("success",true);
		return "deleteImage";
	}
	
	public productImage getImage() {
		return image;
	}

	public void setImage(productImage image) {
		this.image = image;
	}
	
}
