package ru.own.www.logic;

import java.io.File;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


































import java.util.Random;

import javax.swing.text.ChangedCharSetException;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.validator.Var;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.apache.logging.log4j.core.tools.Generate;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import ru.own.www.entity.Cart;
import ru.own.www.entity.CartProductAttrShowVO;
import ru.own.www.entity.CartProductImage;
import ru.own.www.entity.MailAddress;
import ru.own.www.entity.MailAddressShowVO;
import ru.own.www.entity.Order;
import ru.own.www.entity.Orderdetail;
import ru.own.www.entity.Orderdetailproductattr;
import ru.own.www.entity.ProductBasicShowVO;
import ru.own.www.entity.ShippingInfo;
import ru.own.www.entity.ShippingShowVO;
import ru.own.www.entity.SkuShowVO;
import ru.own.www.entity.shopCartShowVO;
import ru.own.www.mybatis.dao.CartOperateDAOImpl;
import ru.own.www.mybatis.dao.CartOperateMapper;
import ru.own.www.mybatis.dao.CartProductImageDAOImpl;
import ru.own.www.mybatis.dao.CartProductImageMapper;
import ru.own.www.mybatis.dao.MailAddressOperateDAOImpl;
import ru.own.www.mybatis.dao.MailAddressOperateMapper;
import ru.own.www.mybatis.dao.OrderOperateDAOImpl;
import ru.own.www.mybatis.dao.OrderOperateMapper;
import systemlog.Log;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.entity.User;
import admin.ru.own.www.entity.productImage;
import admin.ru.own.www.mybatis.dao.MyBatisDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAO;
import admin.ru.own.www.mybatis.dao.ProductImageDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateDAOImp;
import admin.ru.own.www.mybatis.dao.ShippingTemplateMapper;
import admin.ru.own.www.mybatis.dao.MybatisSessionFactory;
import admin.ru.own.www.mybatis.dao.UserOperateImpl;
import admin.ru.own.www.mybatis.dao.UserOperateMapper;
import admin.ru.own.www.util.Utility;

import com.opensymphony.xwork2.ActionSupport;


/**  
 * This class is used for 生成订单之前和生成订单中的订单相关操作 
 * @author jingquanliang,
 * @version 1.0, 
 * @data 2015年1月8日 下午3:49:59  
 */
public class OrderOperate extends ActionSupport implements SessionAware
{
	private Map session; 
	private int count;//数量
	private int registerFlag=0;//是否登录标志
	private int cartid;//the id of the cart
	private	int mailAddressId=-1;//the id of the mailAddress
	private int shippingid;//the id of the shipping	
	private String availableProductShopcartIds;//the ids of cartId for buying,用逗号分隔
	private String leaveMessageString;//用户留言信息，用字符串的形式把前台组成的json字符串传过来{“购物车id”：message，……}
	
	private float subtotalPrice;  //商品总价格
	private float shippingPrice;  //运费总价格
	private int usejifen=0;//使用积分
	private float realPrice;//实际付款的价格，这个值是后台根据以上的三个价格算出来的，不是前台传过来的，以上的三个价格是前台传过来的
	
	
	private List<shopCartShowVO> shopCartList;
	private String returnJsonString;  //商品信息

	private int currencyId;  //使用的货币信息，货币的主键
	private Double currencyRate;

	private List<ShippingCountry> sc;//货运国家信息
	private String returnCountryJsonString;//国家信息
	
	
	private String redirctURL;//修改商品数量，或者货运方式，以及修改货运地址等信息时，需要返回的URL，也就是需要返回到哪一个订单页面
	
	
	private List<MailAddressShowVO> mailAddressList;
	private String returnMailAddressJsonString;//邮寄地址信息
	
	
	private int orderId; //订单主键


	/**
	 * 确认订单，生成相应的订单
	 * @return
	 */
	public String placeOrder()
	{
		int cpi=0;
		OrderOperateMapper cpid=new OrderOperateDAOImpl();
		cpid.openSession();
		SqlSession sqlSession = cpid.getSqlSession();
		Transaction newTransaction=MybatisSessionFactory.getTranscation(cpid.getSqlSession());
		try 
		{//生成订单
			getSelectShopCartId();//得到选择的具体的订单项，具体的值放在shopCartList中
			boolean hasCartItem=checkHasCartItem();
			if(hasCartItem)
			{
				String orderIdString=generateOrderId();//订单编号
				Order order=generateOrder(subtotalPrice,shippingPrice,mailAddressId,currencyId,orderIdString,cpid,sqlSession);
				orderId=order.getId();
				generateOrderDetail(order,leaveMessageString,availableProductShopcartIds,cpid,sqlSession); //生成订单详情表
				//changeJiFen(order,cpid,sqlSession); //改变用户积分，包括使用的积分和本次购买获取的积分,因为没有支付成功，所以不再这个地方改变用户积分
				deleteShopCartItems(availableProductShopcartIds,cpid,sqlSession); //删除加入订单中的购物车中的商品
			}
			else 
			{
				return SUCCESS;
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
				newTransaction.commit();
				newTransaction.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			cpid.closeSession();
		}
		
		return SUCCESS;
	}
	
	private boolean checkHasCartItem() 
	{
		int len=shopCartList.size();
		for(int i=0;i<len;i++)
		{
			shopCartShowVO shopCartItem=shopCartList.get(i);
			if(shopCartItem==null)
			{
				return false;
			}
		}
		return true;
	}

	/**
	 * 删除购物车中的项
	 * @param availableProductShopcartIds2
	 * @param cpid
	 * @param sqlSession
	 */
	private void deleteShopCartItems(String availableProductShopcartIds2,
			OrderOperateMapper cpid, SqlSession sqlSession) 
	{
		//具体的订单项
		String []cartIdList=availableProductShopcartIds2.split(",");
		int len=cartIdList.length;
		
		//删除选中的购物车商品
		for(int i=0;i<len;i++)
		{
			int cartId=Integer.parseInt(cartIdList[i]);
			CartOperateMapper cartMapper = sqlSession.getMapper(CartOperateMapper.class);
			cartMapper.deleteCartAttrs(cartId);
			cartMapper.deleteShopCartItem(cartId);
		}			

	}

	/**
	 * 生成订单详细信息表
	 * @param order
	 * @param leaveMessageString2
	 * @param availableProductShopcartIds2
	 * @param cpid
	 * @param sqlSession
	 */
	private boolean generateOrderDetail(Order order, String leaveMessageString2,String availableProductShopcartIds2, OrderOperateMapper cpid,
			SqlSession sqlSession) 
	{
		
		
		int len=shopCartList.size();
		for(int i=0;i<len;i++)
		{
			shopCartShowVO shopCartItem=shopCartList.get(i);
			if(shopCartItem!=null)
			{
				Cart cartvo=shopCartItem.getCartvo();
				ProductBasicShowVO pbvo=shopCartItem.getPbvo();  //商品基本信息
				SkuShowVO skuvo=shopCartItem.getSkuvo();//如果是sku商品，则该商品的sku信息
				List<CartProductAttrShowVO> pAttrShowVOs=shopCartItem.getpAttrShowVOs();//商品的属性信息
				
				int cartId=cartvo.getCartid();//得到购物车id
				int count=cartvo.getProductnumber();//得到数量
				int productid=cartvo.getProductid();//商品的id
				String  productname=cartvo.getProductname();
				int productImageAddrId=cartvo.getProductimageaddrid();//得到商品图片
				float price=getProductPrice(cartvo,pbvo,skuvo);
				int shipId=cartvo.getShipid();//物流id
				
				List<ShippingShowVO> ssvo = shopCartItem.getSsvo();//商品货运信息
				ShippingInfo shippingInfo=getShippFee(shipId,ssvo,count,pbvo);
				
				JSONObject lm=JSONObject.fromObject(leaveMessageString2);
				String keyString=Integer.toString(cartId);
				String usermessage=lm.getString(keyString);
				
				Orderdetail od=new Orderdetail();
				od.setOrderid(order.getId()); //订单的主键
				od.setOrdercount(count);
				od.setProductid(productid);
				od.setProductname(productname);
				od.setPrice(price);
				od.setShipid(shipId);
				od.setShipfee(shippingInfo.getShippingFee());
				od.setShiptime(shippingInfo.getShippingTime());
				od.setUsermessage(usermessage);
				od.setProductimageaddrid(productImageAddrId);
				
				int j=cpid.insertOrderDetail(od);
				if(j<=0)
				{
					return false;
				}
				else 
				{
					insertOrderProductAttr(od,pAttrShowVOs,cpid);//插入商品属性信息
				}
			}
			
		}
		
		return true;
	}

	/**
	 * 计算商品的货运费用
	 * @param shipId 用户选择的该商品所选择的货运方式
	 * @param ssvo 该商品所有的货运方式
	 * @return
	 */
	private ShippingInfo getShippFee(int shipId, List<ShippingShowVO> ssvo,int count2, ProductBasicShowVO pbvo) 
	{
		ShippingInfoCalcuate sf=new ShippingInfoCalcuate(shipId,ssvo,count2,pbvo);
		ShippingInfo shippingInfo=sf.getShippingFee();
		return shippingInfo;
	}

	/**
	 * 插入商品属性信息
	 * @param od
	 * @param pAttrShowVOs
	 * @param cpid
	 */
	private void insertOrderProductAttr(Orderdetail od,List<CartProductAttrShowVO> pAttrShowVOs, OrderOperateMapper cpid) 
	{
		int len=pAttrShowVOs.size();
		for(int i=0;i<len;i++)
		{
			CartProductAttrShowVO productAttr=pAttrShowVOs.get(i);
			String attrName=productAttr.getAttrName(); //属性名称
			String attrValueName=productAttr.getAttrValueName();//属性值名称
			Orderdetailproductattr opa=new Orderdetailproductattr();
			opa.setOrderdetailid(od.getId());
			opa.setAttrname(attrName);
			opa.setAttrvalue(attrValueName);
			cpid.insertOrderProductAttr(opa);
		}
	}

	/**
	 * 插入商品属性信息
	 * @param od
	 * @param pAttrShowVOs
	 */
	private void insertOrderProductAttr(Orderdetail od,List<CartProductAttrShowVO> pAttrShowVOs) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 得到商品的价格
	 * @param cartvo
	 * @param pbvo
	 * @param skuvo
	 * @return
	 */
	private float getProductPrice(Cart cartvo, ProductBasicShowVO pbvo,
			SkuShowVO skuvo) {
		int skuid=cartvo.getSkuid();
		float price=0;
		if(skuid>0)
		{//说明是sku商品
			price=skuvo.getPrice();//得到该sku商品的id
		}
		if(0>=price)
		{//说明sku项目的价格没有设定，需要采用商品的基本价格
			price=(float) pbvo.getP_nowprice();
		}
		return price;
	}

	/**
	 * 生成订单主表
	 * @param stotalPrice
	 * @param sPrice
	 * @param addressId
	 * @param orderId
	 * @param cpid
	 * @param sqlSession
	 * @return
	 */
	public Order generateOrder(float stotalPrice,float sPrice,int addressId,int currencyId,String ordernumber,OrderOperateMapper cpid,SqlSession sqlSession)
	{
		float totalPrice=Utility.floatAdd(stotalPrice, sPrice);//所有的总价格=商品价格+运费
		float tempSubPrice=Utility.floatMultiply(usejifen, (float)0.01);
		realPrice=Utility.floatSubtract(totalPrice, tempSubPrice);//实际付款的价格=所有价格-积分
		int userId=(Integer)session.get("customeruserid");
		
		Order order=new Order();
		order.setOrdernumber(ordernumber);
		order.setUserid(userId);
		order.setUseraddressid(addressId);//邮寄地址的id
		order.setOrderstate((short)0);//表示没有支付

		order.setCurrencyId(currencyId);
		order.setCurrencyrate(currencyRate);
		
		order.setCountprice(totalPrice);
		order.setRealpay(realPrice);  //减去积分之后的价格
		order.setMailfee(sPrice);
		order.setGivejifen((int)totalPrice); //获得积分
		order.setUsejifen(usejifen);
		
		String userip=ServletActionContext.getRequest().getRemoteAddr();
		order.setUserip(userip);//设定用户的ip地址
		
		cpid.insertOrder(order);
		
		return order;
	}
	
	/**
	 * 生成订单号码，时间+随机数+用户id
	 */
	public String generateOrderId()
	{
		String orderId = ""; // 保存新的文件名
		Random r = new Random();
		// 生成随机文件名：当前年月日时分秒+五位随机数（为了在实际项目中防止文件同名而进行的处理）
		int rannum = (int) (r.nextDouble() * (99999 - 10000 + 1)) + 10000; // 获取随机数
		SimpleDateFormat sDateFormat = new SimpleDateFormat("yyyyMMddHHmmss"); // 时间格式化的格式
		String nowTimeStr = sDateFormat.format(new Date()); // 当前时间
		int userId=(Integer)session.get("customeruserid");
		
		orderId = nowTimeStr + rannum+userId; // 文件重命名后的名字
		
		//UUID.randomUUID().toString().replaceAll("-", "");
		return orderId;
	}
	/**
	 * 改变货运信息
	 * @return
	 */
	public String updateShipIdInConfirmOrder()
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
	 * 改变购物车数量
	 * @return
	 */
	public String updateShopCartQuantityInConfirmOrder()
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
	 * 开始确认订单，在订单页面，或许会改变其他的选项，比如数量或者邮寄地址等
	 * @return
	 */
	public String confirmOrder() 
	{
		//获取所有的国家信息
		returnCountryJsonString=getCountryJsonString();
		
		//获取货运国家的信息
		returnMailAddressJsonString=getMailAddressJsonString();
		
		//具体的订单项
		returnJsonString=getShippingList();
		
		//用户积分信息
		User user=getUser();
		usejifen=user.getJifen();
		
		//货运信息
		
		redirctURL=(String)session.get("customerRequestPage");
		return SUCCESS;
	}
	
	private User getUser() 
	{
		int userId=(Integer)session.get("customeruserid");
		UserOperateImpl cMapper = new UserOperateImpl();
		User user=cMapper.getUserById(userId);
		return user;
	}

	private String getShippingList() {
		
		getSelectShopCartId();//得到选择的具体的订单项，具体的值放在shopCartList中
		//商品信息
		JSONArray tempJsonArray = JSONArray.fromObject(shopCartList);
		//返回的商品信息
		String tempString=tempJsonArray.toString();
		
		return tempString;
	}

	
	
	private void getSelectShopCartId() 
	{
		//具体的订单项
		String []cartIdList=availableProductShopcartIds.split(",");
		int len=cartIdList.length;
		shopCartList=new ArrayList<shopCartShowVO>();
		//取选中的购物车商品
		CartOperateMapper cpid=new CartOperateDAOImpl();
		cpid.openSession();
		try 
		{
			for(int i=0;i<len;i++)
			{
				int cartId=Integer.parseInt(cartIdList[i]);
				shopCartShowVO shopCartItem = cpid.getShopCartItemByCartId(cartId);
				shopCartList.add(shopCartItem);
			}			
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
			if(shopCartItem!=null)
			{
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
			
			
		}
	}

	private String getCountryJsonString() 
	{
		sc=MyBatisDAO.getAllShowShippingCountry();
		//国家信息
		JSONArray tempCJsonArray = JSONArray.fromObject(sc);
		String tempString=tempCJsonArray.toString();
		return tempString;
	}

	private String getMailAddressJsonString() 
	{
		int userid=(Integer) session.get("customeruserid");
		
		//取邮寄地址信息
		MailAddressOperateMapper cpid=new MailAddressOperateDAOImpl();
		cpid.openSession();
		try 
		{
			mailAddressList=cpid.getMailAddressList(userid);
			cpid.commit();
		}catch (Exception e) {
				e.printStackTrace();
		}finally{
				cpid.closeSession();
		}
		
		//选取第一个地址作为前台显示的默认地址，这时需要改变默认的国家id信息为此邮寄地址的id信息，从而在前台确认订单页面可以正确显示到相应国家的邮费信息
		if(mailAddressList.size()>0&&mailAddressId<0&&mailAddressId==-1)
		{
			MailAddressShowVO temp=mailAddressList.get(0);
			MailAddress mailAddress=temp.getMailAddress();
			mailAddressId=mailAddress.getId();
			int countryId=mailAddress.getCountryId();
			session.put("defaultShippingCountryId", countryId);
		}
		
		//邮寄地址信息
		JSONArray tempCJsonArray = JSONArray.fromObject(mailAddressList);
		String tempString=tempCJsonArray.toString();
		return tempString;
	}

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

	public String getAvailableProductShopcartIds() {
		return availableProductShopcartIds;
	}

	public void setAvailableProductShopcartIds(String availableProductShopcartIds) {
		this.availableProductShopcartIds = availableProductShopcartIds;
	}

	public String getReturnJsonString() {
		return returnJsonString;
	}

	public void setReturnJsonString(String returnJsonString) {
		this.returnJsonString = returnJsonString;
	}

	public String getRedirctURL() {
		return redirctURL;
	}

	public void setRedirctURL(String redirctURL) {
		this.redirctURL = redirctURL;
	}

	public List<ShippingCountry> getSc() {
		return sc;
	}

	public void setSc(List<ShippingCountry> sc) {
		this.sc = sc;
	}

	public String getReturnCountryJsonString() {
		return returnCountryJsonString;
	}

	public void setReturnCountryJsonString(String returnCountryJsonString) {
		this.returnCountryJsonString = returnCountryJsonString;
	}

	public String getReturnMailAddressJsonString() {
		return returnMailAddressJsonString;
	}

	public void setReturnMailAddressJsonString(String returnMailAddressJsonString) {
		this.returnMailAddressJsonString = returnMailAddressJsonString;
	}

	public int getMailAddressId() {
		return mailAddressId;
	}

	public void setMailAddressId(int mailAddressId) {
		this.mailAddressId = mailAddressId;
	}

	public List<MailAddressShowVO> getMailAddressList() {
		return mailAddressList;
	}

	public void setMailAddressList(List<MailAddressShowVO> mailAddressList) {
		this.mailAddressList = mailAddressList;
	}

	public String getLeaveMessageString() {
		return leaveMessageString;
	}

	public void setLeaveMessageString(String leaveMessageString) {
		this.leaveMessageString = leaveMessageString;
	}

	public double getSubtotalPrice() {
		return subtotalPrice;
	}

	public float getShippingPrice() {
		return shippingPrice;
	}

	public void setShippingPrice(float shippingPrice) {
		this.shippingPrice = shippingPrice;
	}

	public void setSubtotalPrice(float subtotalPrice) {
		this.subtotalPrice = subtotalPrice;
	}

	public int getUsejifen() {
		return usejifen;
	}

	public void setUsejifen(int usejifen) {
		this.usejifen = usejifen;
	}

	public float getRealPrice() {
		return realPrice;
	}

	public void setRealPrice(float realPrice) {
		this.realPrice = realPrice;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getCurrencyId() {
		return currencyId;
	}

	public void setCurrencyId(int currencyId) {
		this.currencyId = currencyId;
	}

	public Double getCurrencyRate() {
		return currencyRate;
	}

	public void setCurrencyRate(Double currencyRate) {
		this.currencyRate = currencyRate;
	}
}
