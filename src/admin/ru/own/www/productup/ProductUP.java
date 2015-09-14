package admin.ru.own.www.productup;

import java.io.File;
import java.net.URISyntaxException;
import java.util.Properties;

import systemlog.Log;
import admin.ru.own.www.entity.ProductMultiLanguage;
import admin.ru.own.www.entity.UpProduct;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;

import com.opensymphony.xwork2.ActionSupport;

public class ProductUP extends ActionSupport
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String uploadpath;
	private int categoryId;
	private int brandId;
	private String companyname;
	private String fromurl;
	private String companyorder;
	private String myorder;
	private float buyprice;
	private float originprice;
	private float nowPrice;
	private int storNumber;
	private int minBuyCount;
	private byte nomailtax;
	private byte status;
	private byte isNew;
	private byte isHot;
	private byte isRecommend;
	private String beizhu;
	private float jifen;
	
	
	private String en_other_name;
	private String en_product_description;
	private String en_title;
	private String en_keywords;
	private String en_description;
	
	private String ru_other_name;
	private String ru_product_description;
	private String ru_title;
	private String ru_keywords;
	private String ru_description;
	/**
	 * 针对商品的属性，每一个属性用json串传递，总体的形式如下所示
	 * {attrnameID:attvalueID}
	 * 如果属性值ID有多个，中间用#隔开
	 */
	private String attValue;
	private byte isSku;
	/**
	 * 针对商品的sku，每一个sku用json串传递，总体的形式如下所示
	 * {sku：
	 * 	[
	 * 		{skuelement:[{attrID：attvalue},{attrID：attvalue}],price:XX,image:xx},
	 * 		{skuelement:[{attrID：attvalue},{attrID：attvalue}],price:XX,image:xx}
	 * 	]
	 * }
	 */
	private String skuString;//
	
	@Override
	public String execute() throws Exception 
	{
		BatchProductUp bpu=new BatchProductUp();
		int flag = bpu.Up(); //成功返回1，错误返回-1  
		if(flag==1)
		{
			return SUCCESS;
			
		}
		else
		{
			
			return ERROR;
		}
	}
	
	
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}





	public float getJifen() {
		return jifen;
	}



	public void setJifen(float jifen) {
		this.jifen = jifen;
	}



	public float getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(float nowPrice) {
		this.nowPrice = nowPrice;
	}
	public int getStorNumber() {
		return storNumber;
	}
	public void setStorNumber(int storNumber) {
		this.storNumber = storNumber;
	}
	public int getMinBuyCount() {
		return minBuyCount;
	}
	public void setMinBuyCount(int minBuyCount) {
		this.minBuyCount = minBuyCount;
	}
	public byte getIsHot() {
		return isHot;
	}
	public void setIsHot(byte isHot) {
		this.isHot = isHot;
	}
	public byte getIsNew() {
		return isNew;
	}
	public void setIsNew(byte isNew) {
		this.isNew = isNew;
	}
	public byte getIsRecommend() {
		return isRecommend;
	}
	public void setIsRecommend(byte isRecommend) {
		this.isRecommend = isRecommend;
	}
	public byte getStatus() {
		return status;
	}
	public void setStatus(byte status) {
		this.status = status;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	
	public String getUploadpath() {
		return uploadpath;
	}



	public void setUploadpath(String uploadpath) {
		this.uploadpath = uploadpath;
	}



	public String getCompanyname() {
		return companyname;
	}



	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}



	public String getFromurl() {
		return fromurl;
	}



	public void setFromurl(String fromurl) {
		this.fromurl = fromurl;
	}



	public String getCompanyorder() {
		return companyorder;
	}



	public void setCompanyorder(String companyorder) {
		this.companyorder = companyorder;
	}



	public String getMyorder() {
		return myorder;
	}



	public void setMyorder(String myorder) {
		this.myorder = myorder;
	}



	public float getBuyprice() {
		return buyprice;
	}



	public void setBuyprice(float buyprice) {
		this.buyprice = buyprice;
	}



	public float getOriginprice() {
		return originprice;
	}



	public void setOriginprice(float originprice) {
		this.originprice = originprice;
	}



	public byte getNomailtax() {
		return nomailtax;
	}



	public void setNomailtax(byte nomailtax) {
		this.nomailtax = nomailtax;
	}



	public String getEn_other_name() {
		return en_other_name;
	}



	public void setEn_other_name(String en_other_name) {
		this.en_other_name = en_other_name;
	}



	public String getEn_product_description() {
		return en_product_description;
	}



	public void setEn_product_description(String en_product_description) {
		this.en_product_description = en_product_description;
	}



	public String getEn_title() {
		return en_title;
	}



	public void setEn_title(String en_title) {
		this.en_title = en_title;
	}



	public String getEn_keywords() {
		return en_keywords;
	}



	public void setEn_keywords(String en_keywords) {
		this.en_keywords = en_keywords;
	}



	public String getEn_description() {
		return en_description;
	}



	public void setEn_description(String en_description) {
		this.en_description = en_description;
	}



	public String getRu_other_name() {
		return ru_other_name;
	}



	public void setRu_other_name(String ru_other_name) {
		this.ru_other_name = ru_other_name;
	}



	public String getRu_product_description() {
		return ru_product_description;
	}



	public void setRu_product_description(String ru_product_description) {
		this.ru_product_description = ru_product_description;
	}



	public String getRu_title() {
		return ru_title;
	}



	public void setRu_title(String ru_title) {
		this.ru_title = ru_title;
	}



	public String getRu_keywords() {
		return ru_keywords;
	}



	public void setRu_keywords(String ru_keywords) {
		this.ru_keywords = ru_keywords;
	}



	public String getRu_description() {
		return ru_description;
	}



	public void setRu_description(String ru_description) {
		this.ru_description = ru_description;
	}



	public String getAttValue() {
		return attValue;
	}



	public void setAttValue(String attValue) {
		this.attValue = attValue;
	}



	public byte getIsSku() {
		return isSku;
	}



	public void setIsSku(byte isSku) {
		this.isSku = isSku;
	}



	public String getSkuString() {
		return skuString;
	}



	public void setSkuString(String skuString) {
		this.skuString = skuString;
	}

	public  String getRootPath()
	{    
		
	       //因为类名为"SaveAction"，因此" SaveAction.class"一定能找到    
		
//	       String result = ProductUP.class.getResource("ProductUP.class").toString();    
	       String result = null;
		try {
			result = ProductUP.class.getResource("ProductUP.class").toURI().getPath();
		} 
		catch (URISyntaxException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			Log.getInstance().out("路径下的文件错误，可能是因为空格等原因");
		} 
		  //windows系统获取的路径以“/”开始，把这个符号去掉
		   Properties props=System.getProperties(); //系统属性
	       String osName = props.getProperty("os.name"); //操作系统名称  
	       if(osName.startsWith("Windows")||osName.startsWith("w"))
	       {
	    	   if(result.startsWith("/"))
	    	   {
	    		   int len=result.length();
	    		   result=result.substring(1);
	    	   }
	       }
	       
	       int index = result.indexOf("WEB-INF");  
		
	       if(index == -1){    
		
	           index = result.indexOf("bin");    
		
	       }    
		
	       result = result.substring(0,index);    
		
	       if(result.startsWith("jar")){    
		
	           // 当class文件在jar文件中时，返回"jar:file:/F:/ ..."样的路径     
		
	           result = result.substring(10);    
		
	       }else if(result.startsWith("file")){    
		
	           // 当class文件在class文件中时，返回"file:/F:/ ..."样的路径     
		
	           result = result.substring(6);    
		
	       }    
		
	       if(result.endsWith("/"))result = result.substring(0,result.length()-1);//不包含最后的"/"    
		
	       return result;    
		
	 }    

	class BatchProductUp
	{
		public BatchProductUp() 
		{
		}
		
		public int  Up()
		{
			String basePath=getRootPath();
//			System.out.println("********************basePath:"+basePath);
			String fileName=basePath+"/productImage/"+uploadpath;
			File productDir=new File(fileName);
			File[] tempList = productDir.listFiles();
//			System.out.println("该目录下对象个数："+tempList.length);
			int j=0;//记录上一次添加文件至数据库中所在的位置
			
			
//		   if (tempList[j].isDirectory()) 
//		   {//把文件夹之前的文件加入数据库			   
//			   	//遍历这个文件夹
//			   	ProductUP pup=new ProductUP();
//			   	pup.setUploadpath(uploadpath+"/"+tempList[j].getName());
//				try 
//				{
//					pup.execute();
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			   
//				
//				
//			   j=j+1;//当前元素的从下一个元素开始,也就是跳过文件夹这个位置
//
//		   }
		   
			String tempcomparName=tempList[j].getName();//记录第一个要添加至数据库中的文件的名字
			int compartpos=tempcomparName.indexOf("("); //获取右括号所在的位置
			String comparName=tempcomparName;
			//比对商品的名称是否相等，作为是否是同一个商品的依据
			if(compartpos!=-1)
			{//说明有括号，如果为-1说明没有括号
				
				 comparName=tempcomparName.substring(0,compartpos);//截取左括号之后的文件名字
			}
			
			
		    for (int i = 0; i < tempList.length; i++) 
		    {
			   if (tempList[i].isFile()) 
			   {
//				   System.out.println("文     件："+tempList[i]);
				   //获取相应的文件
				   File tempFile=tempList[i];
				   //获取文件的名字,行为 sss(1)
				   String tempfileName=tempFile.getName();
				   

				   //获取左括号所在的位置
				   int pos=tempfileName.indexOf("(");
				   
				   String tempRealName=tempfileName;//tempRealName的作用是记录上传商品去除括号的名字
				   if(pos!=-1)
				   {//说明有括号，如果为-1说明没有括号
					   //截取之后的文件名字
					   tempRealName=tempfileName.substring(0,pos);
//					   System.out.println("截取之后的文件名字为："+tempRealName);
				   }

				   
				   if(tempRealName.equals(comparName))//如果两者的文件名相同，则继续读取下一个文件，查看是否相同的商品所属的图片
				   {
//					   continue;
					   //一下的代码是针对当i=tempList.length-1的时候，也就是当i已经是最后一个的情形，这时候，应该把j到i 之前的商品上传至数据库即可
					   int count=tempList.length-1;
					   if(i==count)
					   {//说明已经到了最后一个了,上传商品即可
						   upLoad(j,i,tempList);
						   
					   }
				   }
				   else
				   {//如果不相同就要把该商品加入数据库了，该商品图片所属的范围是：tempList[j]至tempList[i-1]，
					//tempList[i]为下一个要加入的商品的开始
					   int i1=i-1;
					   upLoad(j,i1,tempList);//上传文件
					   //以下的代码为修改comparName变量，为了之后可以比对商品的名称是否相等，作为是否是同一个商品的依据
					   j=i;
					   comparName=tempRealName;
					   
					   //一下的代码是针对当i=tempList.length-1的时候，也就是当i已经是最后一个的情形，这时候，应该把j到i 之前的商品上传至数据库即可
					   int count=tempList.length-1;
					   if(i==count)
					   {//说明已经到了最后一个了,上传商品即可
						   upLoad(j,i,tempList);
						   
					   }

				   }
			   }//end of is_file
			   if (tempList[i].isDirectory()) 
			   {
				   //把文件夹之前的文件加入数据库
				   int end=i-1;
				   int start=j;
				   if(end>=start)
				   {
					   upLoad(j,i-1,tempList);
				   }
				   
				   	//遍历这个文件夹
				   	ProductUP pup=new ProductUP();
				   	pup.setUploadpath(uploadpath+"/"+tempList[i].getName());
					try 
					{
						pup.execute();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				   
					
					
				   j=i+1;//当前元素的从下一个元素开始,也就是跳过文件夹这个位置
				   if(j<tempList.length)
				   {
					   tempcomparName=tempList[j].getName();
					   compartpos=tempcomparName.indexOf("("); 
					   comparName=tempcomparName;
					   
					   if(compartpos!=-1)
					   {//说明有括号，如果为-1说明没有括号
						   
						   comparName=tempcomparName.substring(0,compartpos);//截取左括号之后的文件名字
					   }
				   }
			   }
		     }
		    
		    return 1;
		}//end of up

		private void upLoad(int start, int end, File[] tempList) 
		{//上传商品
			 
			 String  tempcomparName=tempList[start].getName();
			 if(tempcomparName.endsWith("db")||tempcomparName.startsWith("Thumbs"))
				   return; //如果文件名字是Thumbs.db，则不加入数据库，这个文件为系统文件，经常出现
			 int  compartpos=tempcomparName.indexOf("("); 
			 String  productName=tempcomparName;
			 if(compartpos!=-1)
			 {
				 
				   productName=tempcomparName.substring(0,compartpos);//商品名称
			 }
			 //查找最后一个.所在的位置
			 int pointPos=productName.lastIndexOf(".");
			 if(pointPos!=-1)
			 {
				 productName=productName.substring(0,pointPos);//去掉最后一个.之后的商品名称
			 }
			 
			 //上传
			 //首先上传商品的基本信息
			 UpProduct upp=new UpProduct(categoryId,brandId,companyname,fromurl,companyorder,myorder,buyprice,originprice,nowPrice,storNumber,minBuyCount,nomailtax,status,isNew,isHot,isRecommend,beizhu,jifen,productName,en_other_name,en_product_description,en_title,
					 en_keywords,en_description,ru_other_name,ru_product_description,ru_title,ru_keywords,ru_description);
			 int pid=MyBatisDAO.insertProduct(upp);//该商品的主键
//			 System.out.println("返回的主键id："+pid);
			 
			 //上传商品多语言描述
			 upLoadProductMulitLanguage(pid);
			 
			 //上传商品图片
			 uploadProductImage(pid,start,end,tempList);
			
		}

		private void upLoadProductMulitLanguage(int pid) 
		{//首先上传英语的商品描述,英语的lanuague_id是7
			int lan_id=7;
			ProductMultiLanguage enpml=new ProductMultiLanguage(pid,lan_id,en_other_name,en_product_description,en_title,en_keywords,en_description);
			MyBatisDAO.insertProductMultiLanguage(enpml);
			
			lan_id=8;//俄语的lanuague_id是8
			ProductMultiLanguage rupml=new ProductMultiLanguage(pid,lan_id,ru_other_name,ru_product_description,ru_title,ru_keywords,ru_description);
			MyBatisDAO.insertProductMultiLanguage(rupml);
		}

		private void uploadProductImage(int pid,int start, int end, File[] tempList) 
		{
			String basePath="productImage/"+uploadpath;
			if(basePath.endsWith("/")||basePath.endsWith("\\"))
			{
				
			}
			else
			{
				basePath=basePath+"/";
			}
			
			for(int i=start,j=0;i<end+1;i++,j++)//j的作用是记录图片的排序，为0的是主图
			{//上传图片
				String tempName=tempList[i].getName();
				String imageRealPath=basePath+tempName;
				productImage temppm=new productImage(pid, imageRealPath, j);
				MyBatisDAO.insertProductImage(temppm);
			}
		}
		
	}//end of class BatchProductUp
	
}
