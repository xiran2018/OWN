package admin.ru.own.www.fileupload;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletResponseAware;


import admin.ru.own.www.entity.Category;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;

public class UploadUtilActionJson extends ActionSupport implements ServletResponseAware {

	private String resultString="";//需要返回的字符串
	
	private String preimage="";//在需要上传单张图片的情形中，如果提交多次，删除上一次提交的图片
	private File fileupload; // 和JSP中input标记name同名
	// Struts2拦截器获得的文件名,命名规则，File的名字+FileName
	// 如此处为 'fileupload' + 'FileName' = 'fileuploadFileName'
	private String fileuploadFileName; // 上传来的文件的名字
	
	private String imageUrl; //显示图片的变量
	
	private String attachmentUrl;
	private String fileRealName;
	
	
	private HttpServletResponse response;

	
	private Integer modify_self_id;//所修改的行的主键
	private String modify_preimage="";//在需要上传修改图片的情形中，该变量代表上一次上传的图片
	private File modify_fileupload; // 在需要上传修改图片的情形中，该变量代表修改上传的图片， 和JSP中input标记name同名
	private String modify_fileuploadFileName; // 上传来的文件的名字
	
	private String modify_imageUrl; //显示图片的变量
	

	public String uploadFile() 
	{

		System.out.println("**********preimage************"+preimage);

		
		String extName = ""; // 保存文件拓展名
		String newFileName = ""; // 保存新的文件名
		String nowTimeStr = ""; // 保存当前时间
		PrintWriter out = null;
		SimpleDateFormat sDateFormat;
		Random r = new Random();

		String rootPath = ServletActionContext.getServletContext().getRealPath(
				""); // 获取项目根路径
		String relativePath="upload/categoryImage/";
		String savePath = rootPath +"/"+relativePath;
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8"); // 务必，防止返回文件名是乱码

		// 生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
		int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; // 获取随机数
		sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); // 时间格式化的格式
		nowTimeStr = sDateFormat.format(new Date()); // 当前时间
		// 获取拓展名
		if (fileuploadFileName.lastIndexOf(".") >= 0) 
		{
			extName = fileuploadFileName.substring(fileuploadFileName
					.lastIndexOf("."));
		}
		try 
		{
			//out = response.getWriter();
			newFileName = nowTimeStr + rannum + extName; // 文件重命名后的名字
			String filePath = savePath + newFileName;//保存至后台的物理路径
			String relativePathInDB=relativePath + newFileName;//保存至数据库的相对路径
			filePath = filePath.replace("\\", "/");
			//检查上传的是否是图片
			if (UtilCommon.checkIsImage(extName)) 
			{
				FileUtils.copyFile(fileupload, new File(filePath));//复制图片到相应的目录下
				//删除上次提交的图片
				if(!preimage.equals("")&&preimage!=null)
				{
					String tempPrefilePath = rootPath+"/" + preimage;//先前的图片保存至后台的物理路径
					tempPrefilePath = tempPrefilePath.replace("\\", "/");
			    	boolean flag=Utility.checkIsWindowsOs();
			    	if(flag)
			    	{
			    		tempPrefilePath = tempPrefilePath.replace("//", "/");
			    		
			    	}
			    	
					Utility.deletFile(tempPrefilePath);
				}
//				out.print("<font color='red'>" + fileuploadFileName
//						+ "</font>#" + filePath + "#" + relativePathInDB);
				resultString+="<font color='red'>" + fileuploadFileName+ "</font>#" + filePath + "#" + relativePathInDB;
//				System.out.println("**********resultString************"+resultString);
				
			} else 
			{
//				out.print("<font color='red'>上传的文件类型错误，请选择jpg,jpeg,png和gif格式的图片!</font>");
				resultString+="<font color='red'>上传的文件类型错误，请选择jpg,jpeg,png和gif格式的图片!</font>";
			}
//			out.flush();
//			out.close();
		} catch (IOException e) 
		{
			e.printStackTrace();
//			out.print("上传失败，出错啦!");
			return ERROR;
		}
		return SUCCESS;
	}


	public String showImage() throws Exception 
	{
		// 根据图片地址构造file对象
		File file = new File(imageUrl);
		InputStream is = new FileInputStream(file);
		Image image = ImageIO.read(is);// 读图片
		String imageType = imageUrl.substring(imageUrl.lastIndexOf(".") + 1);
		RenderedImage img = (RenderedImage) image;
		OutputStream out = response.getOutputStream();
		ImageIO.write(img, imageType, out);
		out.flush();
		out.close();
		is.close();//关闭文件流，要不然不能正常的删除文件
		return null;
	}

	public String modifyFile() 
	{

//		System.out.println("**********fileuploadFileName************"+fileuploadFileName);

		
		String extName = ""; // 保存文件拓展名
		String newFileName = ""; // 保存新的文件名
		String nowTimeStr = ""; // 保存当前时间
		PrintWriter out = null;
		SimpleDateFormat sDateFormat;
		Random r = new Random();

		String rootPath = ServletActionContext.getServletContext().getRealPath(
				""); // 获取项目根路径
		String relativePath="upload/categoryImage/";
		String savePath = rootPath +"/"+relativePath;
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8"); // 务必，防止返回文件名是乱码

		// 生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
		int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; // 获取随机数
		sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); // 时间格式化的格式
		nowTimeStr = sDateFormat.format(new Date()); // 当前时间
		// 获取拓展名
		if (modify_fileuploadFileName.lastIndexOf(".") >= 0)
		{
			extName = modify_fileuploadFileName.substring(modify_fileuploadFileName
					.lastIndexOf("."));
		}
		try 
		{
//			out = response.getWriter();
			newFileName = nowTimeStr + rannum + extName; // 文件重命名后的名字
			String filePath = savePath + newFileName;//保存至后台的物理路径
			String relativePathInDB=relativePath + newFileName;//保存至数据库的相对路径
			filePath = filePath.replace("\\", "/");
			//检查上传的是否是图片
			if (UtilCommon.checkIsImage(extName)) 
			{
				FileUtils.copyFile(modify_fileupload, new File(filePath));//复制图片到相应的目录下
				//删除上次提交的图片
				if(!modify_preimage.equals("")&&modify_preimage!=null)
				{
					String tempPrefilePath = rootPath+"/" + modify_preimage;//先前的图片保存至后台的物理路径
					tempPrefilePath = tempPrefilePath.replace("\\", "/");
			    	boolean flag=Utility.checkIsWindowsOs();
			    	if(flag)
			    	{
			    		tempPrefilePath = tempPrefilePath.replace("//", "/");
			    		
			    	}
					Utility.deletFile(tempPrefilePath);
				}
				//修改数据库中相应的图片信息
				//修改内容
//				Category category=new Category();
//				category.setCategoryId(modify_self_id);
//				category.setImage(relativePathInDB);
//				boolean flag=MyBatisDAO.modifyCategoryImage(category);
				//end of 修改内容
				
//				out.print("<font color='red'>上传成功!</font>#" + filePath + "#" + relativePathInDB);
				
				resultString+="<font color='red'>" + fileuploadFileName+ "</font>#" + filePath + "#" + relativePathInDB;

			} else 
			{
//				out.print("<font color='red'>上传的文件类型错误，请选择jpg,jpeg,png和gif格式的图片!</font>");
				resultString+="<font color='red'>上传的文件类型错误，请选择jpg,jpeg,png和gif格式的图片!</font>";
			}
//			out.flush();
//			out.close();
		} catch (IOException e) 
		{
			e.printStackTrace();
//			out.print("上传失败，出错啦!");
			return ERROR;
		}
		return SUCCESS;
	}
	
	public File getFileupload() {
		return fileupload;
	}

	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getAttachmentUrl() {
		return attachmentUrl;
	}

	public void setAttachmentUrl(String attachmentUrl) {
		this.attachmentUrl = attachmentUrl;
	}

	public String getFileRealName() {
		return fileRealName;
	}

	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public String getFileuploadFileName() {
		return fileuploadFileName;
	}

	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}

	public String getPreimage() {
		return preimage;
	}

	public void setPreimage(String preimage) {
		this.preimage = preimage;
	}

	public String getModify_preimage() {
		return modify_preimage;
	}

	public void setModify_preimage(String modify_preimage) {
		this.modify_preimage = modify_preimage;
	}

	public File getModify_fileupload() {
		return modify_fileupload;
	}

	public void setModify_fileupload(File modify_fileupload) {
		this.modify_fileupload = modify_fileupload;
	}

	public String getModify_fileuploadFileName() {
		return modify_fileuploadFileName;
	}

	public void setModify_fileuploadFileName(String modify_fileuploadFileName) {
		this.modify_fileuploadFileName = modify_fileuploadFileName;
	}

	public String getModify_imageUrl() {
		return modify_imageUrl;
	}

	public void setModify_imageUrl(String modify_imageUrl) {
		this.modify_imageUrl = modify_imageUrl;
	}


	public Integer getModify_self_id() {
		return modify_self_id;
	}


	public void setModify_self_id(Integer modify_self_id) {
		this.modify_self_id = modify_self_id;
	}


	public String getResultString() {
		return resultString;
	}


	public void setResultString(String resultString) {
		this.resultString = resultString;
	}
	
	
    
}
