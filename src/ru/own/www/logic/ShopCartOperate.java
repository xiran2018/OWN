package ru.own.www.logic;

import java.io.File;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

















import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.apache.struts2.interceptor.SessionAware;

import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.ProductBasicShowVO;
import ru.own.www.entity.ShippingShowVO;
import ru.own.www.entity.shopCartShowVO;
import ru.own.www.mybatis.dao.CartOperateDAOImpl;
import ru.own.www.mybatis.dao.CartOperateMapper;
import ru.own.www.mybatis.dao.CartProductImageDAOImpl;
import ru.own.www.mybatis.dao.CartProductImageMapper;
import systemlog.Log;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateMapper;
import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;


/**  
 * This class is used for ...  
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月8日 下午3:49:59  
 */
public class ShopCartOperate extends ActionSupport implements SessionAware
{
	private Map session; 
	private int count;//数量
	private int registerFlag=0;//是否登录标志
	private int id;//the id of the product or country
	private int cartid;//the id of the cart
	private int shippingid;//the id of the shipping
	private int sku_id=-1;//the sku_id of the select product,选择的商品的skuid,如果是负数,比如-1，则代表加入购物车的商品不是sku商品
	private String skuImageAttr; //如果是sku商品，该商品sku所对应的图片
	
	private String name;
	private float price;
	private String attrStrings="-1";//所有的属性值字符串，用“|“分割，存放在购物车表中
	private String skuStrings="-1"; //sku的属性值字符串，用“|“分割,存放在图片表中
	
	private boolean newInsertCartProductImage=true;//标示找到的购物车图片，是不是新加入数据库中的图片，如果是，则不需要取出数据库中的数据，对索引的那个字段加1
	
	private List<ShippingCountry> sc;//货运国家信息
	
	private List<shopCartShowVO> shopCartList;
	
	
	private int cartTotal=0;//获取购物车总数
	
	/**
	 *获取购物车总数
	 * @return
	 */
	public String  fetchCartTotal()
	{
		Integer userid=(Integer) session.get("customeruserid");
		if(userid==null||userid<=0)
		{//说明没有登录
			cartTotal=0;
			return SUCCESS;
		}
		else 
		{
			CartOperateMapper cpid=new CartOperateDAOImpl();
			cpid.openSession();
			try 
			{
				cartTotal=cpid.getCartTotalByUserId(userid);
				cpid.commit();
			}catch (Exception e) {
				e.printStackTrace();
			}finally{
				cpid.closeSession();
			}
			return SUCCESS;
		}

	}
	
	
	public String changeCountry()
	{
		session.put("defaultShippingCountryId", id);
		return SUCCESS;
	}
	
	public String deleteShopCartItem()
	{
		int cpi=0;
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		Transaction newTransaction=MybatisSessionFactory.getTranscation(cpid.getSqlSession());
		try 
		{
			//取购物车所引用图片的数量信息，如果数量为1，则删除此购物车选相时，相应图片被应用的数量为0，应该删除该图片
			Cart tmeCart=cpid.getCartItemByCartId(cartid);
			CartProductImage pimg=cpid.getCartProductImageById(tmeCart.getProductimageaddrid());
			cpi=cpid.deleteShopCartItem(cartid);
			if(pimg.getProductimageindexcount()==1)
			{//删除该图片在数据库中的记录
				cpid.deleteProductImageById(pimg.getId());
			}
			else 
			{
				cpid.reduceProductImageIndexCountById(pimg.getId());
			}
			
			if(cpi>0)
			{//更新成功
				
				//删除真实的图片
				String tempPrefilePath=Utility.getRootPath()+File.separator+pimg.getProductimageaddr();
				Utility.deletFile(tempPrefilePath);
				return SUCCESS;
			}
			else 
			{//更新错误
				return ERROR;
			}
		}catch (Exception e) {
			e.printStackTrace();
			try {
				newTransaction.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				newTransaction.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			cpid.closeSession();
		}
		
		return  SUCCESS;
	}
	
	/**
	 * 改变购物车数量
	 * @return
	 */
	public String updateShopCartQuantity()
	{
		int cpi=0;
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cpi=cpid.updateShopCartQuantity(cartid,count);
			cpid.commit();
			if(cpi>0)
			{//更新成功
				return SUCCESS;
			}
			else 
			{//更新错误
				return ERROR;
			}
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		
		return  SUCCESS;
	}
	
	/**
	 * 改变货运信息
	 * @return
	 */
	public String updateShipId()
	{
		int cpi=0;
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cpi=cpid.updateShipId(cartid,shippingid);
			cpid.commit();
			if(cpi>0)
			{//更新成功
				return SUCCESS;
			}
			else 
			{//更新错误
				return ERROR;
			}
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		
		return  SUCCESS;
	}
	
	/**
	 * 获取购物车信息展示
	 * @return
	 */
	public String getCartShowDetailedInfo()
	{
		//获取所有的国家信息
		sc=MyBatisDAO.getAllShowShippingCountry();
		
		//获取购物车中的信息
		int userid=(Integer) session.get("customeruserid");
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			shopCartList=cpid.getShopCartItemList(userid);
			cpid.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			cpid.closeSession();
		}
		
		//获取货运信息等
		int size=shopCartList.size();
		int countryId=(Integer) session.get("defaultShippingCountryId");
		ShippingTemplateMapper stm=new	ShippingTemplateDAOImp();
		for(int i=0;i<size;i++)
		{
			shopCartShowVO shopCartItem = shopCartList.get(i);   //购物车某一项
			//购物车商品的货运信息
			ProductBasicShowVO PBaiscInfo = shopCartItem.getPbvo(); //购物车商品的基本信息
			int freight_templet=PBaiscInfo.getP_freight_templet();
			List<ShippingShowVO> ssvo=null;
			if(countryId>0&&freight_templet>0)
			{
				ssvo = stm.getShipInfoByTemplateIdAndCountryId(freight_templet,countryId);//购物车商品的货运信息
			}
			shopCartItem.setSsvo(ssvo);
			
			//购物车商品的属性信息
			Cart cartvo=shopCartItem.getCartvo();
			int tempCartid=cartvo.getCartid();//购物车id
			//取出名为languageId的session属性，因为在filter中已经对其进行了赋值，所以运行到这里时，这个值一定是存在的
			String languageId=(String)session.get("languageId");
			int tempanguageId=Integer.parseInt(languageId);
			
			if(tempCartid>0)
			{
				List<CartProductAttrShowVO> pAttrShowVOs=getCartProductAttrs(tempCartid,tempanguageId);
				shopCartItem.setpAttrShowVOs(pAttrShowVOs);
			}
		}
		
		return SUCCESS;
	}
	
	private List<CartProductAttrShowVO> getCartProductAttrs(int cartid2,int tempanguageId) 
	{
		List<CartProductAttrShowVO> pAttrShowVOs=null;
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			pAttrShowVOs=cpid.getCartProductAttrs(cartid2,tempanguageId);
			cpid.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			cpid.closeSession();
		}
		return pAttrShowVOs;
	}

	/**
	 * 加入购物车
	 * @return
	 */
	public String addToCart()
	{
		if(!Utility.isLogin(session, "customeruserid"))
		{//没有登录
			registerFlag=0;
		}
		else
		{//已经登录
			registerFlag=1;
			int userid=(Integer) session.get("customeruserid");
			
			String sortAttrString=getSortAttrString(attrStrings);
			
			
			Cart tmeCart=new Cart();
			tmeCart.setUserid(userid);
			tmeCart.setProductid(id);
			tmeCart.setSkuid(sku_id);
			tmeCart.setShipid(shippingid);//选择的货运方式
			if(sortAttrString==null || sortAttrString.length()==0)
			{
				sortAttrString="-1";
			}
			tmeCart.setProductattrids(sortAttrString);
			List<Cart> alreadyCart=getAlreadyCartInDB(tmeCart);
			
			if(alreadyCart!=null&&alreadyCart.size()>0)
			{//说明在购物车中找到了相同的产品，包括产品id，属性，skuid都一样，只需要把此购物车的数量加1即可
				Cart tempCart=alreadyCart.get(0); //取第一个增加相应的数量即可
				addCartNumberOfProduct(tempCart.getCartid(),count);
			}
			else 
			{//没有找到，需要重新加入
				Cart cart=new Cart();
				cart.setProductid(id);
				CartProductImage cpImage=getCartProductImage(tmeCart,skuImageAttr);
				if(cpImage!=null)
				{//说明找到了相应的图片
					cart.setProductimageaddrid(cpImage.getId());
					if(!newInsertCartProductImage)
					{//不是新插入数据库中的图片
						addCartProductImageIndexCount(cpImage.getId());  //把引用索引增加1个，因为即将加入数据库
					}
				}
				cart.setSkuid(sku_id);
				cart.setProductname(name);
				cart.setProductnumber(count);
				cart.setProductprice(price);
				cart.setUserid(userid);
				cart.setProductattrids(sortAttrString);
				cart.setShipid(shippingid);//选择的货运方式
				
				CartOperateMapper com=new CartOperateDAOImpl();
				com.openSession();
				boolean sucessFlag=com.insertShopCart(cart);
	//			if(sucessFlag)
	//			{
	//				Log.log4jLogInfo(this.getClass(),""+cart.getCartid() );
	//			}
				boolean insertAttrValueFlag=com.insertShopCartProductAttrValues(cart.getCartid(),attrStrings);
				
				com.commit();
				com.closeSession();
			}
		}
		return SUCCESS;
	}
	
	/**
	 * 增加购物车中相应条目的数量
	 * @param cartid
	 * @param count2
	 */
	private boolean addCartNumberOfProduct(Integer cartid, int count2) 
	{
		int cpi=0;
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cpi=cpid.addCartNumberOfProduct(cartid,count2);
			cpid.commit();
			if(cpi>0)
			{//更新成功
				return true;
			}
			else 
			{//更新错误
				return false;
			}
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		
		return false;
	}

	/**
	 * 得到用|分割的，升序排列的所选择的商品属性值id
	 * @param attrStrings2  用“|”分割的商品属性值
	 * @return
	 */
	private String getSortAttrString(String attrStrings2) 
	{
		String returnString="";
		String [] attrValueStrings=attrStrings2.split("\\|");
		int len=attrValueStrings.length;
		int []arrayInt=new int[len];
		for(int i=0;i<len;i++)
		{
			arrayInt[i]=Integer.parseInt(attrValueStrings[i]);
		}
		Arrays.sort(arrayInt);
		for(int j=0;j<len;j++)
		{
			if(returnString.equals(""))
			{
				returnString+=arrayInt[j];
			}
			else
			{
				returnString+="|"+arrayInt[j];
			}
		}
		
		return returnString;
		
	}

	/**
	 * 根据商品id和商品属性字符串，查找已经加入购物车中的商品，比如商品id和商品属性字符串都相等才可以
	 * 
	 * @return
	 */
	private List<Cart> getAlreadyCartInDB(Cart tmeCart) 
	{
		List<Cart> cartList=null;
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			cartList=cpid.getAlreadyCartInDB(tmeCart);
		}catch (Exception e) {
			e.printStackTrace();
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		
		return cartList;
	}

	/**
	 * 更新购物车商品的图片的索引值
	 * @param id2
	 * @return
	 */
	private boolean addCartProductImageIndexCount(int id2) 
	{
		int cpi=0;
		CartProductImageMapper cpid=new CartProductImageDAOImpl();
		cpid.openSession();
		try 
		{
			cpi=cpid.addCartProductImageIndexCount(id2);
			cpid.commit();
			if(cpi>0)
			{//更新成功
				return true;
			}
			else 
			{//更新错误
				return false;
			}
		}catch (Exception e) {
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		
		return false;
	}
	
	private Cart copyOfCartAccordingSku(Cart tmeCart)
	{
		Cart tempCart=new Cart();
		tempCart.setProductid(tmeCart.getProductid());
		tempCart.setSkuid(tmeCart.getSkuid());
		int skuId=tmeCart.getSkuid();
		if(skuId>0)
		{//说明是sku商品，把商品属性字符串，变为sku的属性，放入购物车image表中
			String sortAttrString=getSortAttrString(skuStrings);
			tempCart.setProductattrids(sortAttrString);
		}
		else
		{
			tempCart.setProductattrids("-1");
		}
		return tempCart;
	}
	
	/**
	 * 根据购物车所加入的商品
	 * 得到购物车所加入商品的图片
	 * @param tmeCart
	 * @param skuImageAddr，sku传过来的图片地址
	 * @return
	 */
	private CartProductImage getCartProductImage(Cart tmeCart,String skuImageAddr) 
	{
		CartProductImage cpi = null;

		CartProductImageMapper cpid=new CartProductImageDAOImpl();
		cpid.openSession();
		try 
		{
			Cart tempCart=copyOfCartAccordingSku(tmeCart);
			List<CartProductImage> cpiList=cpid.getCartProductImageAddrByPidAndAttrs(tempCart);
			if(cpiList!=null&&cpiList.size()>0)
			{//找到了这样的商品的image
				newInsertCartProductImage=false;  //不是新插入的图片
				cpi=cpiList.get(0);//如果多余两个，取第一个就可以了
				return cpi;
			}
			else 
			{//没有找到，需要自己构建
				String productimageaddr=getProductOriginImage(tmeCart.getProductid(),skuImageAddr);
				if(productimageaddr!=null)
				{//找到了商品图片，则插入数据库，没有找到则不插入数据库
					cpi=new CartProductImage();
					
					cpi.setProductid(id);
					cpi.setProductimageaddr(productimageaddr);
					cpi.setProductimageindexcount(1);
					if(tmeCart.getSkuid()>0)
					{//是sku商品，把该sku的属性加入
						cpi.setProductattrs(tempCart.getProductattrids());
					}
					else 
					{//不是sku商品，把图片中的属性值字段设为-1，表示大家共用的图片
						cpi.setProductattrs("-1");
					}
					
					cpid.insertCartProductImage(cpi); //插入数据库
					newInsertCartProductImage=true; //是新插入的
					cpid.commit();
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			cpi = null;
			cpid.rollBack();
		}finally{
			cpid.closeSession();
		}
		
		return cpi;
	}

	/**
	 *返回null，说明该商品压根没有任何图片
	 * @param id2
	 * @param skuImageAddr  表示该sku所属图片的地址
	 * @return
	 */
	private String getProductOriginImage(int id2,String skuImageAddr) 
	{
		
		
		String imageRelativeAddrString="",originImageAddr = null; //originImageAddr为原图片所在的地址，imageRelativeAddrString为复制后图片所在的地址
		int flag=0;//标志是否找到了需要的图片
		
		if(skuImageAddr!=null && !skuImageAddr.equals("")&&skuImageAddr.startsWith("productImage"))
		{//说明有图片地址，使用此地址作为图片地址即可
			flag=1;
			originImageAddr=skuImageAddr;
		}
		else
		{//说明不是sku商品,skuImageAttr没有对应的地址，需要查找数据库，从数据库中查找对应商品的图片
			
			int bigImage=0;
			//获取商品图片
			ProductImageDAO pDAO = new ProductImageDAOImp();
			List<productImage> pimg = pDAO.getImg(id2);
			if(pimg!=null&&pimg.size()>0)
			{
				productImage tempImage = null;
				int len=pimg.size();
				//for 循环的作用是尽量获取主图
				for(int i=0;i<len;i++)
				{
					tempImage=pimg.get(i);
					if(tempImage.getImageSort()==1)
					{
						originImageAddr=tempImage.getImageAddr();
						bigImage=1;
						flag=1;
						break;
					}
				}
				
				//运行到这里，说明没有找到imageSort为1的图片你，也就是主图，取第一个图片即可
				if(bigImage==0)
				{
					flag=1;
					tempImage=pimg.get(0);
					originImageAddr=tempImage.getImageAddr();
				}
			}
		}
		

		if(flag!=0&&originImageAddr!=null&&!originImageAddr.equals(""))
		{
			String rootString=Utility.getRootPath();
			String souceImageAddrString=rootString+java.io.File.separator+originImageAddr;
			
			String destImageAddrString=rootString+java.io.File.separator+"shopCartImage";
			
			File file=new File(souceImageAddrString);
			String randomFileNameString=Utility.getRandomFileName(file);
			destImageAddrString+=java.io.File.separator+randomFileNameString;
			
			imageRelativeAddrString="shopCartImage"+java.io.File.separator+randomFileNameString;
			
			Utility.CopyWithStringPath(souceImageAddrString, destImageAddrString);
			return imageRelativeAddrString;
		}
		return null;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(int registerFlag) {
		this.registerFlag = registerFlag;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSku_id() {
		return sku_id;
	}

	public void setSku_id(int sku_id) {
		this.sku_id = sku_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getAttrStrings() {
		return attrStrings;
	}

	public void setAttrStrings(String attrStrings) {
		this.attrStrings = attrStrings;
	}

	public String getSkuImageAttr() {
		return skuImageAttr;
	}

	public void setSkuImageAttr(String skuImageAttr) {
		this.skuImageAttr = skuImageAttr;
	}

	public String getSkuStrings() {
		return skuStrings;
	}

	public void setSkuStrings(String skuStrings) {
		this.skuStrings = skuStrings;
	}

	public boolean isNewInsertCartProductImage() {
		return newInsertCartProductImage;
	}

	public void setNewInsertCartProductImage(boolean newInsertCartProductImage) {
		this.newInsertCartProductImage = newInsertCartProductImage;
	}

	public List<ShippingCountry> getSc() {
		return sc;
	}

	public void setSc(List<ShippingCountry> sc) {
		this.sc = sc;
	}

	public int getCartid() {
		return cartid;
	}

	public void setCartid(int cartid) {
		this.cartid = cartid;
	}

	public int getShippingid() {
		return shippingid;
	}

	public void setShippingid(int shippingid) {
		this.shippingid = shippingid;
	}

	public List<shopCartShowVO> getShopCartList() {
		return shopCartList;
	}

	public void setShopCartList(List<shopCartShowVO> shopCartList) {
		this.shopCartList = shopCartList;
	}


	public void setCartTotal(int cartTotal) {
		this.cartTotal = cartTotal;
	}


	public int getCartTotal() {
		return cartTotal;
	}


	
	
	
}
