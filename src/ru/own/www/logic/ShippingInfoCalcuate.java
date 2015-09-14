package ru.own.www.logic;

import java.util.List;

import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.ShippingTemplateTime;
import admin.ru.own.www.entity.ShippingTemplateXiangxi;
import admin.ru.own.www.util.Utility;
import ru.own.www.entity.ProductBasicShowVO;
import ru.own.www.entity.ShippingInfo;
import ru.own.www.entity.ShippingShowVO;

/**
 * 计算商品费用和时间信息
 * @author jql
 *
 */
public class ShippingInfoCalcuate 
{
	int shipId; //用户选择的物流方式
	List<ShippingShowVO> ssvo; //该商品所有的物流方式
	int count2; //商品数量
	ProductBasicShowVO pbvo;//商品基本信息
	
	public ShippingInfoCalcuate(int shipId, List<ShippingShowVO> ssvo, int count2, ProductBasicShowVO pbvo) 
	{
		this.shipId=shipId;
		this.ssvo=ssvo;
		this.count2=count2;
		this.pbvo=pbvo;
	}

	public ShippingInfo getShippingFee() 
	{
		ShippingInfo siInfo=new ShippingInfo();
		int len=ssvo.size();
		for(int i=0;i<len;i++)
		{
			ShippingShowVO shipEle=ssvo.get(i);
			Shipping shipping = shipEle.getShip();
			int id=shipping.getId();
			if(id==shipId)
			{//说明是所选择的物流方式，开始计算运费
				
				ShippingTemplateXiangxi shipFee = shipEle.getShipFee();
				float realFee=calculateShippingFee(shipFee,pbvo,count2);
				siInfo.setShippingFee(realFee);
				
				ShippingTemplateTime tempShipTime = shipEle.getShipTime();
				String  shippingTime=calculateShippingTime(tempShipTime);
				siInfo.setShippingTime(shippingTime);
			}
		}
		return siInfo;
	}
	
	/**
	 * 计算货运时间
	 * @param tempShipTime
	 * @returns {String}
	 */
	public String calculateShippingTime(ShippingTemplateTime tempShipTime)
	{
		String realTime=tempShipTime.getShippingTime();
		if(realTime==null||realTime=="")
			realTime="6-30";
		return realTime;
	}
	
	/**
	 * 计算邮费
	 * @param shipFee,相应物流方式的具体信息
	 * @param products ，产品基本信息
	 * @param selectNumber  商品数量
	 * @returns
	 */
	public float calculateShippingFee(ShippingTemplateXiangxi shipFee,ProductBasicShowVO products,int selectNumber)
	{
		float realFee;
		int shipStyle=shipFee.getShippingStyle();
		if(shipStyle==0)
		{//免邮费
			realFee=0;
			
		}
		else
		{//自定义
			int selectMode=shipFee.getSelectMode();
			if(selectMode==1)
			{//标准
				realFee=shipFee.getStandardFee();
			}
			else
			{//自定义
				int selectQwpattern=shipFee.getSelectQwpattern();
				if(selectQwpattern==1)
				{//数量

					Integer clMin = shipFee.getClMin();
					Integer clMax = shipFee.getClMax();
					Integer clPrice = shipFee.getClPrice();
					Integer clAddNum = shipFee.getClAddNum();
					Integer clAddPrice = shipFee.getClAddPrice();
					if(selectNumber<clMax)
					{//在首重的数量范围之内
						realFee=shipFee.getClPrice();
					}
					else
					{
						int addNumber=selectNumber-clMax;
						float addPrice=Utility.floatMultiply(addNumber,clAddPrice);
						realFee=Utility.floatAdd(addPrice, shipFee.getClPrice());
					}
				}
				else
				{//重量
					
					Float weightEnd0 = shipFee.getWeightEnd0(); //首重
					Float weightPrice0 = shipFee.getWeightPrice0(); //首重运费
					Float weightEnd1 = shipFee.getWeightEnd1();  //续重最高重量
					Float weightInterval1 = shipFee.getWeightInterval1();  //每增加的重量
					Float weightPrice1 = shipFee.getWeightPrice1();  //增加多少钱
					if(selectNumber<=0)
						selectNumber=1;
					float pweight = products.getP_weight(); //商品重量
					float totalWeight = Utility.floatMultiply(pweight,selectNumber); //总重量
					if(totalWeight<weightEnd0)
					{//在首重范围之内
						realFee=shipFee.getWeightPrice0();
					}
					else
					{
						 float addWeight = Utility.floatSubtract(totalWeight, weightEnd0);
						 float tempWeigth =Utility.floatDivide(addWeight, weightInterval1, 2);//超过了多少斤
						 float addedPrice = Utility.floatMultiply(tempWeigth, weightPrice1);
						 realFee=Utility.floatAdd(addedPrice, shipFee.getWeightPrice0());
					}
				}
			}
			
		}
		
		return realFee;
	}

}
