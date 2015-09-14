package admin.ru.own.www.logic;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;




import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.config.ConfigurationSource;
import org.apache.logging.log4j.core.config.Configurator;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.json.JSONArray;

import systemlog.Log;
import admin.ru.own.www.config.Parameters;
import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.StoreFooterInfoEdit;
import admin.ru.own.www.entity.Storefooterinfo;
import admin.ru.own.www.entity.Storefooterinfomultilanguage;
import admin.ru.own.www.entity.StorefooterinfomultilanguageEdit;
import admin.ru.own.www.entity.User;
import admin.ru.own.www.logic.commodity.CommodityManagementAction;
import admin.ru.own.www.mail.EmailSend;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.StoreOperateImpl;
import admin.ru.own.www.mybatis.dao.UserOperateImpl;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;

public class StoreOperate extends ActionSupport 
{

	private int fatherId;
	private int id;
	String pageName;
    String mui_input_name;
    String multiLanString;  //多语言的信息
    String image;
    short isShow;
	
    private String  info;//1:保存页面页脚信息  2：保存页脚之上相应的超链接需要展示的内容  
	
	//商店首页页脚之上需要显示的信息
	List<StoreFooterInfoEdit> storeFooterInfoList;
	
	
	
	
	Storefooterinfo sftInfo=null;
	
	//编辑多语言信息时需要的list
	List<StorefooterinfomultilanguageEdit> cml;
	JSONArray jo=null;
	String jostr;
	
	//保存多语言信息的时候，需要用到的变量
	private String  title;
	private String  keyword;
	private String  description;
	
	
	
	
	
	public String modify_xiangxi_content()
	{
		Storefooterinfomultilanguage cml=new Storefooterinfomultilanguage();
		cml.setId(id);
		cml.setContent(info);

		StoreOperateImpl soi=new StoreOperateImpl();
		boolean flag=soi.modify_xiangxi_content(cml);

		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String modify_xiangxi_info()
	{
		Storefooterinfomultilanguage cml=new Storefooterinfomultilanguage();
		cml.setId(id);
		cml.setName(mui_input_name);
		cml.setTitle(title);
		cml.setKeyword(keyword);
		cml.setDescription(description);
		
		StoreOperateImpl soi=new StoreOperateImpl();
		boolean flag=soi.modify_xiangxi_info(cml);

		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String modify_basic_info()
	{
		sftInfo=new Storefooterinfo();
		sftInfo.setId(id);
		sftInfo.setName(mui_input_name);
		sftInfo.setStatus(isShow);
		sftInfo.setImage(image);
		
		StoreOperateImpl soi=new StoreOperateImpl();
		boolean flag=soi.modify_basic_info(sftInfo);

		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}

	}
	
	public String fetchStoreHomeInfoById()
	{
		StoreOperateImpl soi=new StoreOperateImpl();
		sftInfo=soi.getStorefooterinfoById(id);
		if(sftInfo!=null)
		{
			cml=soi.getStorefooterinfoEditByFooterId(id);
			if(cml!=null)
			{
				jo=new JSONArray(cml);
				jostr=jo.toString();
//				System.out.println("********************************************"+jo);
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
		}
		else
		{
			return ERROR;
		}
	}
	
	public String deleteStoreHomeInfo()
	{
		StoreOperateImpl soi=new StoreOperateImpl();
		//删除相应的jsp文件
		sftInfo=soi.getStorefooterinfoById(id);
		String getPageName=sftInfo.getPagename();
		int fatherFlag=sftInfo.getFatherid();
		if(getPageName!=null&&!("").equals(getPageName)&&fatherFlag!=1)
		{

			//说明增加的是具体的页面，需要根据pageName的信息，在相应的位置生成相应的页面
				String rootPath=Utility.getRootPath();
				String fileAddr=rootPath+"/"+sftInfo.getPagename();
				Utility.deletFile(fileAddr);
		}
		//删除数据库中的记录
		boolean flag=soi.deleteStoreHomeInfoById(id);
		if(flag)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}

	}
	
	public  String InsertStoreHomeInfo()
	{
		sftInfo=new Storefooterinfo();
		String tempPageName="common/footer/"+pageName;
		sftInfo.setPagename(tempPageName);
		sftInfo.setName(mui_input_name);
		sftInfo.setFatherid(fatherId);
		sftInfo.setStatus(isShow);
		sftInfo.setImage(image);
		
		StoreOperateImpl soi=new StoreOperateImpl();
		int id=-1;
		id=soi.InsertStoreHomeInfo(sftInfo);
		if(id>0)
		{
			boolean flag=soi.insertMultiStoreHomeInfo(id,multiLanString);
			if(flag)
			{
				if(fatherId!=1)
				{//说明增加的是具体的页面，需要根据pageName的信息，在相应的位置生成相应的页面
					String rootPath=Utility.getRootPath();
					String src=rootPath+"/common/footer/template.jsp";
					String des=rootPath+"/common/footer/"+pageName;
					
					Utility.CopyWithStringPath(src,des);
				}
				return SUCCESS;
			}
			else
			{
				return ERROR;
			}
		}
		else
		{
			return ERROR;
		}
	}
	
	public String getAllHomeInfo()
	{
		StoreOperateImpl soi=new StoreOperateImpl();
		storeFooterInfoList=soi.getAllHomeInfo();
		if(storeFooterInfoList!=null)
		{
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
	}
	
	public String getStoreFooterInfo()
	{
		info=getCopyRightInfo();
		if(info!=null)
		{
//			logger.trace(info);
//			Log.log4jLog(StoreOperate.class, info);
			return SUCCESS;
		}
		else
		{
			return ERROR;
		}
		
	}

	
	public String getCopyRightInfo() 
	{
		String content=null;
		try 
		{
			
		    String configFilePath = Parameters.configPath;//相对于根目录的路径
		    //获取根目录
		    String rootPath=Utility.getRootPath();
		    
		    configFilePath=rootPath+"/"+configFilePath;
		
			SAXReader saxReader = new SAXReader();
			Document document = saxReader.read(new File(configFilePath));
			Iterator<?> iter;
			String value = null;
			// 初始化接收报文的服务器所在的IP地址
			iter = document.selectNodes("/Config/StoreConfig/Footer").iterator();
			while (iter.hasNext()) {
				Element ip = (Element) iter.next();
				value = ip.getText();
			}
			content = value;
		
		} catch (DocumentException e)
		{
			Log.log4jLogError(StoreOperate.class, "Parse the config file is wrong!!!!!!");
//			logger.error("Parse the config file is wrong!!!!!!");
			e.printStackTrace();
		}
		return content;
	}

	public String setStoreFooterInfo()
	{
	    String configFilePath = Parameters.configPath;//相对于根目录的路径
	    //获取根目录
	    String rootPath=Utility.getRootPath();
	    
	    configFilePath=rootPath+"/"+configFilePath;
	    
	    Document document ;
		try 
		{
		
			SAXReader saxReader = new SAXReader();
			document = saxReader.read(new File(configFilePath));
			Iterator<?> iter;
			String value = null;
			// 初始化接收报文的服务器所在的IP地址
			iter = document.selectNodes("/Config/StoreConfig/Footer").iterator();
			while (iter.hasNext()) 
			{
				Element ip = (Element) iter.next();
				ip.setText(info);
			}
		
		} catch (DocumentException e)
		{
			Log.log4jLogTrace(StoreOperate.class, "Parse the config file is wrong when set config value!!!!!!");
//			logger.error("Parse the config file is wrong!!!!!!");
			e.printStackTrace();
			return ERROR;
		}
		Utility.writeXML(configFilePath, document);
//		Log.log4jLog(StoreOperate.class, "set config file is right!!!!!!");
		return SUCCESS;
		
	}


	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getInfo() {
		return info;
	}



	public void setInfo(String info) {
		this.info = info;
	}





	public List<StoreFooterInfoEdit> getStoreFooterInfoList() {
		return storeFooterInfoList;
	}


	public Storefooterinfo getSftInfo() {
		return sftInfo;
	}

	public void setSftInfo(Storefooterinfo sftInfo) {
		this.sftInfo = sftInfo;
	}

	public void setStoreFooterInfoList(List<StoreFooterInfoEdit> storeFooterInfoList) {
		this.storeFooterInfoList = storeFooterInfoList;
	}

	public List<StorefooterinfomultilanguageEdit> getCml() {
		return cml;
	}

	public void setCml(List<StorefooterinfomultilanguageEdit> cml) {
		this.cml = cml;
	}

	public String getMui_input_name() {
		return mui_input_name;
	}

	public void setMui_input_name(String mui_input_name) {
		this.mui_input_name = mui_input_name;
	}

	public String getMultiLanString() {
		return multiLanString;
	}

	public void setMultiLanString(String multiLanString) {
		this.multiLanString = multiLanString;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public short getIsShow() {
		return isShow;
	}

	public void setIsShow(short isShow) {
		this.isShow = isShow;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getFatherId() {
		return fatherId;
	}

	public void setFatherId(int fatherId) {
		this.fatherId = fatherId;
	}

	public String getPageName() {
		return pageName;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	public JSONArray getJo() {
		return jo;
	}

	public void setJo(JSONArray jo) {
		this.jo = jo;
	}

	public String getJostr() {
		return jostr;
	}

	public void setJostr(String jostr) {
		this.jostr = jostr;
	}
	
	

}
