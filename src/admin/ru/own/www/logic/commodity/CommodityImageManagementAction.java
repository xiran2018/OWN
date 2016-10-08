package admin.ru.own.www.logic.commodity;


import java.util.List;

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
	
	private String imageElements;//修改图片的排序时用到此属性，
	//格式为128;224;1#128;225;2#128;233;3 分别代表：  商品id；图片id；图片序号
	
	public String showImg() {
		ProductsDAO dao = (ProductsDAO) DAOFactory.get(ProductsDAO.class.getName());
		ProductsVO pvo = dao.getImg(util.getProductIDParameter());
		dao.closeSession();
		
		List<productImage> tempImageURL = pvo.getImageURLs();
		for(int i=0;i<tempImageURL.size();i++)
			if(tempImageURL.get(i).getImageAddr().contains("\\"))
				tempImageURL.get(i).setImageAddr(hadleSpeicficCharacter(tempImageURL.get(i).getImageAddr()));
		
		ActionContext.getContext().put("success", util.getIsSuccessParameter());
		ActionContext.getContext().put("pvo", pvo);
		return "showimg";
	}
	
	/**
	 * 处理特殊字符，把反斜杠  \转为斜杠 /
	 * @param a
	 */
	public String hadleSpeicficCharacter(String a)
	{
		String tempString=a;
		if(a.contains("\\"))
			tempString=a.replaceAll("\\\\", "/");
		return tempString;
	}
	
	
	public String updateImage() {
		ProductImageDAO imageDAOImp = (ProductImageDAO) DAOFactory.get(ProductImageDAO.class.getName());;
		
		String[] imageElementArray = imageElements.split("#");
		for(int i=0;i<imageElementArray.length;i++)
		{//格式为128;224;1#128;225;2#128;233;3 分别代表：  商品id；图片id；图片序号
			String[] imageArray=imageElementArray[i].split(";");
			productImage tempImage =new productImage();
			tempImage.setId(Integer.parseInt(imageArray[1]));
//			tempImage.setProductId(imageArray[0]);
			tempImage.setImageSort(Integer.parseInt(imageArray[2]));
			
			imageDAOImp.update(tempImage); //保存
		}
//		ActionContext.getContext().put("p_id",image.getProductId());
//		ActionContext.getContext().put("success",true);
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

	public String getImageElements() {
		return imageElements;
	}

	public void setImageElements(String imageElements) {
		this.imageElements = imageElements;
	}
	
}
