package admin.ru.own.www.logic.foregroundimage;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import admin.ru.own.www.entity.ForegroundImage;
import admin.ru.own.www.fileupload.UtilCommon;
import admin.ru.own.www.mybatis.dao.ForegroundImageDAO;
import admin.ru.own.www.mybatis.dao.ForegroundImageDAOImp;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ForegroundImageManagementAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private ForegroundImage img;
	private File fileupload;
	private String fileuploadFileName; // 上传来的文件的名字
	public String showAll() 
	{
		ForegroundImageDAO dao = new ForegroundImageDAOImp();
		List<ForegroundImage> list = dao.getAll();
		ActionContext.getContext().put("list", list);
		dao.closeSession();
		return "showAll";
	}

	public String showInfo() {
		ForegroundImageDAO dao = new ForegroundImageDAOImp();
		ForegroundImage oneimg = dao.getForegroundImageByID(img.getId());
		dao.closeSession();
		ActionContext.getContext().put("fimg", oneimg);
		return "showInfo";
	}

	public String update() {
		ForegroundImageDAO dao = new ForegroundImageDAOImp();
		dao.update(img);
		dao.closeSession();
		return "update";
	}

	public String insert() {
		String rootPath = ServletActionContext.getServletContext().getRealPath(""); // 获取项目根路径
		String uploadFullPath = rootPath + File.separator + "upload" + File.separator + "foregroundImage" + File.separator;
		// 上传文件的临时目录
		if (!new File(uploadFullPath).isDirectory()) {
			new File(uploadFullPath).mkdirs();
		}
		String filePath = null;
		HttpServletRequest request = ServletActionContext.getRequest();
		if (UtilCommon.checkIsImage(fileuploadFileName.substring(fileuploadFileName.lastIndexOf(".")))) {
			Random r = new Random();
			int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; // 获取随机数
			SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); // 时间格式化的格式
			String nowTimeStr = sDateFormat.format(new Date()); // 当前时间
			String generateFullFileName = nowTimeStr + rannum + fileuploadFileName.substring(fileuploadFileName.lastIndexOf("."));
			String relativePathInDB = "upload" + File.separator + "foregroundImage" + File.separator + generateFullFileName;
			filePath = uploadFullPath + generateFullFileName;
			try {
				FileUtils.copyFile(fileupload, new File(filePath));// 复制图片到相应的目录下
				ForegroundImageDAO dao = new ForegroundImageDAOImp();
				img.setImgsrc(relativePathInDB);
				dao.insert(img);
				dao.closeSession();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "insert";
		} else {
			request.setAttribute("fimg", img);
			request.setAttribute("failMessage", "上传失败，请确定你选择的文件为图片！");
			return "insertfail";
		}
	}

	public String delete() {
		ForegroundImageDAO dao = new ForegroundImageDAOImp();
		ForegroundImage deleteimg = dao.getForegroundImageByID(img.getId());
		String rootPath = ServletActionContext.getServletContext().getRealPath(""); // 获取项目根路径
		Utility.deletFile(rootPath + File.separator +deleteimg.getImgsrc());
		dao.delete(img.getId());
		dao.closeSession();
		return "delete";
	}
	
	public ForegroundImage getImg() {
		return img;
	}

	public void setImg(ForegroundImage img) {
		this.img = img;
	}

	public String getFileuploadFileName() {
		return fileuploadFileName;
	}

	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}

	public File getFileupload() {
		return fileupload;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

}
