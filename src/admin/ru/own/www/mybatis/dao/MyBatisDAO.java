package admin.ru.own.www.mybatis.dao;

import java.sql.Timestamp;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.ibatis.session.SqlSession;

import admin.ru.own.www.dao.DataAcessObject;
import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.AttributeValueMultiLanguage;
import admin.ru.own.www.entity.AttributeValueMultiLanguageShow;
import admin.ru.own.www.entity.BrandMultiLanguage;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.BrandShow;
import admin.ru.own.www.entity.Category;
import admin.ru.own.www.entity.CategoryMultiLanguage;
import admin.ru.own.www.entity.EditBrandMultiLanguage;
import admin.ru.own.www.entity.EditCategoryMultiLanguage;
import admin.ru.own.www.entity.Language;
import admin.ru.own.www.entity.Pagination;
import admin.ru.own.www.entity.ProductAttrMultiLanguage;
import admin.ru.own.www.entity.ProductAttrMultiLanguageShow;
import admin.ru.own.www.entity.ProductMultiLanguage;
import admin.ru.own.www.entity.Shipping;
import admin.ru.own.www.entity.ShippingCountry;
import admin.ru.own.www.entity.ShippingTemplate;
import admin.ru.own.www.entity.ShippingTemplateTime;
import admin.ru.own.www.entity.ShippingTemplateXiangxi;
import admin.ru.own.www.entity.UpProduct;
import admin.ru.own.www.entity.productImage;

public class MyBatisDAO
{

	public static boolean insertLanguage(Language lan) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	LanguageMapper lanMapper = sqlSession.getMapper(LanguageMapper.class);  
        	lanMapper.insertLanguage(lan); 
	        System.out.println("主键："+lan.getId());
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return false;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return true;
	}
	
	public static List<Language> getAllLanguage() 
	{
		List<Language> listlan=null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	LanguageMapper lanMapper = sqlSession.getMapper(LanguageMapper.class);  
        	listlan=lanMapper.getAllLanguage(); 
//	        System.out.println("语言的数量为："+listlan.size());
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return null;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return listlan;
	}

	public static List<BrandShow> selectBrandByCategoryId(int id) 
	{
		List<BrandShow> list = null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	BrandSeriesMapper relativeMapper = sqlSession.getMapper(BrandSeriesMapper.class);  
        	list=relativeMapper.brandFetchByCategoryId(id); 
//	        System.out.println("数量："+list.size());
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return list;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return list;
	}

	/**
	 *  上传商品，上传的是商品的基本信息
	 * @param upp
	 * @param productName
	 * @return
	 */
	public static int insertProduct(UpProduct upp) 
	{
		int pid=-1;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	ProductOperationMapper pMapper = sqlSession.getMapper(ProductOperationMapper.class);  
        	pMapper.insertPorductByBatch(upp); 
        	pid=upp.getPid();
//	        System.out.println("商品主键："+pid);
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return -1;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return pid;
	}

	public static void insertProductMultiLanguage(ProductMultiLanguage pml) 
	{
		int pid=-1;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	ProductOperationMapper pMapper = sqlSession.getMapper(ProductOperationMapper.class);  
        	pMapper.insertProductMultiLanguage(pml); 
        	pid=pml.getId();
//	        System.out.println("商品主键："+pid);
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
	}

	public static void insertProductImage(productImage temppm)
	{
		int pid;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	ProductOperationMapper pMapper = sqlSession.getMapper(ProductOperationMapper.class);  
        	pMapper.insertProductImage(temppm); 
        	pid=temppm.getId();
//	        System.out.println("商品主键："+pid);
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
	}
/**
 * 参数格式如下：[{'id':7,'other_name':'ert','other_title':'ert','other_keywords':'ert','other_desc':'ert'},{'id':8,'other_name':'ert','other_title':'eer','other_keywords':'ter','other_desc':'tert'}]
 * @param multiLanString
 */
	public static void insertCategoryMulitLanguage(String multiLanString,Integer categoryId) 
	{
		JSONArray jsonArrary=JSONArray.fromObject(multiLanString);
		int size=jsonArrary.size();
		for(int i=0;i<size;i++)
		{
			JSONObject jsonObject =jsonArrary.getJSONObject(i);
			CategoryMultiLanguage cml=new CategoryMultiLanguage();
			cml.setCategory_id(categoryId);
			cml.setLan_id(jsonObject.getInt("id"));
			cml.setName(jsonObject.getString("other_name"));
			cml.setTitle(jsonObject.getString("other_title"));
			cml.setKeywords(jsonObject.getString("other_keywords"));
			cml.setDescription(jsonObject.getString("other_desc"));
			insertForeignCategory(cml);
		}

		
	}

	private static void insertForeignCategory(CategoryMultiLanguage cml) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	CategoryMapper cMapper = sqlSession.getMapper(CategoryMapper.class);  
        	cMapper.insertForeignCategory(cml); 
//	        System.out.println("商品主键："+pid);
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
	}

	public static void insertBrandMultiLanguage(String multiLanString,
			Integer brandId) 
	{
		JSONArray jsonArrary=JSONArray.fromObject(multiLanString);
		int size=jsonArrary.size();
		for(int i=0;i<size;i++)
		{
			JSONObject jsonObject =jsonArrary.getJSONObject(i);
			BrandMultiLanguage cml=new BrandMultiLanguage();
			cml.setBrand_id(brandId);
			cml.setLan_id(jsonObject.getInt("id"));
			cml.setName(jsonObject.getString("other_name"));
			cml.setTitle(jsonObject.getString("other_title"));
			cml.setKeywords(jsonObject.getString("other_keywords"));
			cml.setDescription(jsonObject.getString("other_desc"));
			insertForeignBrand(cml);
		}
	}
	
	private static void insertForeignBrand(BrandMultiLanguage bml) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	BrandSeriesMapper cMapper = sqlSession.getMapper(BrandSeriesMapper.class);  
        	cMapper.insertForeignBrand(bml); 
//	        System.out.println("商品主键："+pid);
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
	}

	public static void deleteMultiForeiCategory(Integer categoryId) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	CategoryMapper cMapper = sqlSession.getMapper(CategoryMapper.class);  
        	cMapper.delForeignCateByCateId(categoryId); 
//	        System.out.println("商品主键："+pid);
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
	}

	public static boolean modifyCategoryBasic(Category category) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	CategoryMapper cMapper = sqlSession.getMapper(CategoryMapper.class);  
        	cMapper.updateCateBasicInfo(category); 
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return false;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return true;
	}

	public static List<EditCategoryMultiLanguage> fetchCategoryMultiLang(Integer categoryId)
	{
		List<EditCategoryMultiLanguage> listlan=null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	CategoryMapper lanMapper = sqlSession.getMapper(CategoryMapper.class);  
        	listlan=lanMapper.fecthCateMultiByCateId(categoryId); 
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return null;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return listlan;
	}

	public static int modifyCategoryXiangXi(Category category) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	CategoryMapper cMapper = sqlSession.getMapper(CategoryMapper.class);  
        	cMapper.updateCateXiangXiInfo(category); 
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return 0;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return 1;
	}

	public static void delMulitForeignBrand(Integer brandId) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	BrandSeriesMapper cMapper = sqlSession.getMapper(BrandSeriesMapper.class);  
    	cMapper.delForeignBrandByBranId(brandId); 
//        System.out.println("商品主键："+pid);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	}

	public static List<EditBrandMultiLanguage> fetchBrandMultiLang(int brandId) 
	{
		List<EditBrandMultiLanguage> listlan=null;
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	BrandSeriesMapper lanMapper = sqlSession.getMapper(BrandSeriesMapper.class);  
        	listlan=lanMapper.fecthBrandMultiBybrandId(brandId); 
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return null;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return listlan;
	}

	public static int modifybrandXiangXi(BrandSeries brand)
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	BrandSeriesMapper cMapper = sqlSession.getMapper(BrandSeriesMapper.class);  
        	cMapper.updatebrandXiangXiInfo(brand); 
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        	return 0;
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		return 1;
	}

	public static void insertProductAttrMultiLang(String multiLanString,	Integer productAttrId) 
	{
		JSONArray jsonArrary=JSONArray.fromObject(multiLanString);
		int size=jsonArrary.size();
		for(int i=0;i<size;i++)
		{
			JSONObject jsonObject =jsonArrary.getJSONObject(i);
			ProductAttrMultiLanguage cml=new ProductAttrMultiLanguage();
			
			cml.setProductattr_id(productAttrId);;
			cml.setLan_id(jsonObject.getInt("id"));
			cml.setName(jsonObject.getString("other_name"));
			cml.setTitle(jsonObject.getString("other_title"));
			cml.setKeywords(jsonObject.getString("other_keywords"));
			cml.setDescription(jsonObject.getString("other_desc"));
			insertForeignProductAttr(cml);
		}
		
	}

	private static void insertForeignProductAttr(ProductAttrMultiLanguage cml) 
	{
		SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
        try 
        {
        	ProductAttrMapper cMapper = sqlSession.getMapper(ProductAttrMapper.class);  
        	cMapper.insertForeignProductAttr(cml); 
//	        System.out.println("商品主键："+pid);
        } 
        catch(Exception e)
        {
        	e.printStackTrace();
        }
        
        finally 
        {
        	sqlSession.commit();
        	sqlSession.close();
        }
		
	}

	/**
	 * //按照json的格式，存放属性值，具体格式为:
	 * [{name:颜色,multiInfo:[{id(语言id）:1,other_name：“23”,other_title:,other_keywords:,other_desc:},{},{}]},{},{}]
	 * @param multiAttrValueString
	 * @param id
	 * @return
	 */
	public static boolean insertProductAttrValues(String multiAttrValueString,Integer id,Integer categoryId) 
	{
		Integer attrValueId=-1;
		 if(!multiAttrValueString.equals("")&&multiAttrValueString!=null)
		 {
				DataAcessObject dao=new DataAcessObject();
				JSONArray jsonArrary=JSONArray.fromObject(multiAttrValueString);
				int size=jsonArrary.size();
				for(int i=0;i<size;i++)
				{
					
					JSONObject jsonObject =jsonArrary.getJSONObject(i);
					ProductAttrMultiLanguage cml=new ProductAttrMultiLanguage();
					
					AttributeValue attrvalue=new AttributeValue();
					attrvalue.setAttrId(id);
					attrvalue.setAttrValueName(jsonObject.getString("name"));
					attrvalue.setCategoryId(categoryId);
					
					Timestamp timestamp=new Timestamp(System.currentTimeMillis());
					attrvalue.setCreateTime(timestamp);
					
					attrValueId=dao.Insert_Attribute_name(attrvalue);
					if(attrValueId==-1||attrValueId.equals(-1))
					{
						return false;
					}
					else
					{
						//插入多国家属性数值信息
						insertProductAttrMultiLang(jsonObject.getJSONArray("multiInfo"),attrValueId);
					}
				} 
		 }
		 return true;
		
	}
/**
 *  * //按照json的格式，存放属性值，具体格式为:
	 * [{name:颜色,multiInfo:[{id(语言id）:1,other_name：“23”,other_title:,other_keywords:,other_desc:},{},{}]},{},{}]
 * @param jsonArray
 * @param attrValueId
 */
	private static void insertProductAttrMultiLang(JSONArray jsonArray,Integer attrValueId) 
	{
		int size=jsonArray.size();
		for(int i=0;i<size;i++)
		{
			JSONObject jsonObject =jsonArray.getJSONObject(i);
			AttributeValueMultiLanguage cml=new AttributeValueMultiLanguage();
			
			cml.setAttrvalue_id(attrValueId);
			cml.setLan_id(jsonObject.getInt("id"));
			cml.setName(jsonObject.getString("other_name"));
			cml.setTitle(jsonObject.getString("other_title"));
			cml.setKeywords(jsonObject.getString("other_keywords"));
			cml.setDescription(jsonObject.getString("other_desc"));
			insertForeignAttrValue(cml);
		}
	}

private static void insertForeignAttrValue(AttributeValueMultiLanguage cml) 
{
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	AttrValueMapper cMapper = sqlSession.getMapper(AttrValueMapper.class);  
    	cMapper.insertForeignAttrValue(cml); 
//        System.out.println("商品主键："+pid);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	
}

public static List<ProductAttrMultiLanguageShow> getProductAttrMultiLangByAttrId(int id) 
{
	List<ProductAttrMultiLanguageShow> pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ProductAttrMapper cMapper = sqlSession.getMapper(ProductAttrMapper.class);  
    	pamu=cMapper.getProductAttrMultiLangShowByAttrId(id); 
//        System.out.println("商品主键："+pid);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static boolean updateBasicInfo(Attribute attr) 
{
	boolean flag=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ProductAttrMapper cMapper = sqlSession.getMapper(ProductAttrMapper.class);  
    	flag=cMapper.updateBasicInfo(attr); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return flag;
}

public static boolean updateAttrXiangXiInfo(ProductAttrMultiLanguage pam)
{
	
	boolean flag=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ProductAttrMapper cMapper = sqlSession.getMapper(ProductAttrMapper.class);  
    	flag=cMapper.updateAttrXiangXiInfo(pam); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return flag;
}

public static boolean delAttrValue(int id) 
{
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	AttrValueMapper cMapper = sqlSession.getMapper(AttrValueMapper.class);  
    	cMapper.delAttrValue(id); 
//        System.out.println("商品主键："+pid);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	return false;
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return true;
}

public static List<AttributeValueMultiLanguageShow> fecthAttrValuesMultiLanByAttrId(int id) 
{
	List<AttributeValueMultiLanguageShow> pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	AttrValueMapper cMapper = sqlSession.getMapper(AttrValueMapper.class);  
    	pamu=cMapper.getAttrValuesMultiLangShowByAttrId(id); 
//        System.out.println("商品主键："+pid);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static AttributeValue fecthAttrValueByAttrId(int id) 
{	
	AttributeValue pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	AttrValueMapper cMapper = sqlSession.getMapper(AttrValueMapper.class);  
    	pamu=cMapper.getAttrValueByAttrId(id); 
//        System.out.println("商品主键："+pid);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static boolean attrValue_modify_basic(AttributeValue attributeValue)
{
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	AttrValueMapper cMapper = sqlSession.getMapper(AttrValueMapper.class);  
    	cMapper.attrValue_modify_basic(attributeValue); 
//        System.out.println("商品主键："+pid);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	return false;
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return true;
}

public static boolean attrValue_modify_xiangxi(AttributeValueMultiLanguage avml) 
{
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	AttrValueMapper cMapper = sqlSession.getMapper(AttrValueMapper.class);  
    	cMapper.attrValue_modify_xiangxi(avml); 
//        System.out.println("商品主键："+pid);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	return false;
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return true;
}

public static boolean updateAttrInputStyle(Attribute attr) 
{
	boolean flag=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ProductAttrMapper cMapper = sqlSession.getMapper(ProductAttrMapper.class);  
    	flag=cMapper.updateAttrInputStyle(attr); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return flag;
}

public static List<Attribute> fetchGlobalAttr() 
{
	List<Attribute> pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ProductAttrMapper cMapper = sqlSession.getMapper(ProductAttrMapper.class);  
    	pamu=cMapper.fetchGlobalAttr(); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static boolean attributeDeleteByAttrId(Integer id) 
{
	boolean flag=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ProductAttrMapper cMapper = sqlSession.getMapper(ProductAttrMapper.class);  
    	flag=cMapper.attributeDeleteByAttrId(id); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return flag;
}

public static boolean modifyCategoryImage(Category category) 
{
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	CategoryMapper cMapper = sqlSession.getMapper(CategoryMapper.class);  
    	cMapper.updateCateBasicImage(category); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	return false;
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return true;
}

public static Integer insertShipping(Shipping ship) 
{
	Integer id=-1;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingMapper cMapper = sqlSession.getMapper(ShippingMapper.class);  
    	id=cMapper.insertShipping(ship); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return id;
}

public static List<Shipping> getShippingByPageNum(Pagination tempp) 
{
	
	List<Shipping> pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingMapper cMapper = sqlSession.getMapper(ShippingMapper.class);  
    	pamu=cMapper.getShippingByPageNum(tempp); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static int getTotalNumberOfShipping() 
{
	int pamu=0;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingMapper cMapper = sqlSession.getMapper(ShippingMapper.class);  
    	pamu=cMapper.getTotalNumberOfShipping(); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static Shipping getShippingById(Integer id) 
{
	Shipping pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingMapper cMapper = sqlSession.getMapper(ShippingMapper.class);  
    	pamu=cMapper.getShippingById(id); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static boolean modifyShipping(Shipping ship) 
{
	boolean pamu=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingMapper cMapper = sqlSession.getMapper(ShippingMapper.class);  
    	pamu=cMapper.modifyShipping(ship); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static boolean deleteShippingById(Integer id) 
{
	boolean pamu=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingMapper cMapper = sqlSession.getMapper(ShippingMapper.class);  
    	pamu=cMapper.deleteShippingById(id); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static List<Shipping> getAllShipping() 
{
	List<Shipping> pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingMapper cMapper = sqlSession.getMapper(ShippingMapper.class);  
    	pamu=cMapper.getAllShipping(); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static Integer insertShippingCountry(ShippingCountry ship) 
{
	Integer id=-1;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingCountryMapper cMapper = sqlSession.getMapper(ShippingCountryMapper.class);  
    	id=cMapper.insertShippingCountry(ship); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return id;
}
public static List<ShippingCountry> getShippingCountryByPageNum(Pagination tempp) 
{
	
	List<ShippingCountry> pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingCountryMapper cMapper = sqlSession.getMapper(ShippingCountryMapper.class);  
    	pamu=cMapper.getShippingCountryByPageNum(tempp); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static int getTotalNumberOfShippingCountry() 
{
	int pamu=0;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingCountryMapper cMapper = sqlSession.getMapper(ShippingCountryMapper.class);  
    	pamu=cMapper.getTotalNumberOfShippingCountry(); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static ShippingCountry getShippingCountryById(Integer id) 
{
	ShippingCountry pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingCountryMapper cMapper = sqlSession.getMapper(ShippingCountryMapper.class);  
    	pamu=cMapper.getShippingCountryById(id); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static boolean modifyShippingCountry(ShippingCountry ship) 
{
	boolean pamu=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingCountryMapper cMapper = sqlSession.getMapper(ShippingCountryMapper.class);  
    	pamu=cMapper.modifyShippingCountry(ship); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static boolean deleteShippingCountryById(Integer id) 
{
	boolean pamu=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingCountryMapper cMapper = sqlSession.getMapper(ShippingCountryMapper.class);  
    	pamu=cMapper.deleteShippingCountryById(id); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}

public static List<ShippingCountry> getAllShippingCountry() 
{
	List<ShippingCountry> pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingCountryMapper cMapper = sqlSession.getMapper(ShippingCountryMapper.class);  
    	pamu=cMapper.getAllShippingCountry(); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}


public static List<ShippingCountry> getAllShowShippingCountry() 
{
	List<ShippingCountry> pamu=null;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingCountryMapper cMapper = sqlSession.getMapper(ShippingCountryMapper.class);  
    	pamu=cMapper.getAllShowShippingCountry(); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
    return pamu;
}


/**
 * json格式为
 * [{"id":"1","shipMode":[{"selectCountryIds":"5|6","selectShipMode":"1","standardInfo":"90"},{"selectCountryIds":"7","selectShipMode":"2","selectQWMode":"1","quanaityInfo":{"cl_min":"1","cl_max":"1","cl_price":"1","cl_add_num":"1","cl_add_price":"1"}},{"selectCountryIds":"8|9","selectShipMode":"2","selectQWMode":"2","weightInfo":{"weight_end_0":"2","weight_price_0":"2","weight_end_1":"2","weight_interval_1":"2","weight_price_1":"2"}}]}]
 * @param name
 * @param shipTemplateJSONArray
 * @return
 */
public static boolean saveAllShipTemplate(String name,JSONArray shipTemplateJSONArray) 
{
	int pamu=-1;
	int len=shipTemplateJSONArray.size();
	ShippingTemplate st=new ShippingTemplate();
	st.setName(name);
	
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  
    	pamu=cMapper.saveShippingTemplateName(st);
    	
    	boolean flag=saveAllShipTemplateXiangXi(st.getId(),shipTemplateJSONArray);
    	if(!flag)
    	{
    		sqlSession.rollback();
    	}
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	sqlSession.rollback();
    	return false;
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return true;
}

/**
 *  json格式为
 * [{"id":"1",
 * "timeStyle":时间的设定方式,"time":货运时间（当选择统一的方式时）,"timeMode":[{"selectCountryIds":所选择国家的id(中间用"|"隔开);"time":承诺到达时间},{}],
 * 
 * "shipStyle":运费的设定方式,"shipMode":[{"shippingCountryIds":"5|6","selectShipMode":"1","standardInfo":"90"},
 * 
 * {"shippingCountryIds":"7","selectShipMode":"2","selectQWMode":"1","quanaityInfo":{"cl_min":"1","cl_max":"1","cl_price":"1","cl_add_num":"1","cl_add_price":"1"}},
 * 
 * {"shippingCountryIds":"8|9","selectShipMode":"2","selectQWMode":"2","weightInfo":{"weight_end_0":"2","weight_price_0":"2","weight_end_1":"2","weight_interval_1":"2","weight_price_1":"2"}}]}]
 * @param pamu  模版的id
 * @param shipTemplateJSONArray
 */
private static boolean saveAllShipTemplateXiangXi(int pamu,JSONArray shipTemplateJSONArray) 
{
	int len=shipTemplateJSONArray.size();
	for(int i=0;i<len;i++)
	{
		JSONObject jsonObj=shipTemplateJSONArray.getJSONObject(i);
		//保存运费相关
		int shipStyle=jsonObj.getInt("shipStyle");
		if(shipStyle==1)
		{//说明是自定义运费
			JSONArray jsonArrayObj=jsonObj.getJSONArray("shipMode");
			int modeLen=jsonArrayObj.size();
			for(int j=0;j<modeLen;j++)
			{
				ShippingTemplateXiangxi stxx=new ShippingTemplateXiangxi();
				stxx.setTemplateId(pamu);
				stxx.setShippingId(jsonObj.getInt("id"));
				stxx.setShippingStyle(shipStyle);
				
				JSONObject jsonModeObj=jsonArrayObj.getJSONObject(j);
				stxx.setShippingCountryIds(jsonModeObj.getString("shippingCountryIds"));
				
				int selectShipMode=jsonModeObj.getInt("selectMode");
				stxx.setSelectMode((short)selectShipMode);
				if(selectShipMode==1)
				{//标准的支付方式
					stxx.setStandardFee((float)jsonModeObj.getLong("standardFee"));
				}
				else if(selectShipMode==2)
				{//自定义支付方式
					int selectQWMode=jsonModeObj.getInt("selectQwpattern");
					stxx.setSelectQwpattern((short)selectQWMode);
					if(selectQWMode==1)
					{//按照数量
						//JSONObject quanaityInfo=jsonModeObj.getJSONObject("quanaityInfo");
						stxx.setClMin(jsonModeObj.getInt("clMin"));
						stxx.setClMax(jsonModeObj.getInt("clMax"));
						stxx.setClPrice(jsonModeObj.getInt("clPrice"));
						stxx.setClAddNum(jsonModeObj.getInt("clAddNum"));
						stxx.setClAddPrice(jsonModeObj.getInt("clAddPrice"));
					}
					else if(selectQWMode==2)
					{//按照重量
						//JSONObject weightInfo=jsonModeObj.getJSONObject("weightInfo");
						stxx.setWeightEnd0((float)jsonModeObj.getLong("weightEnd0"));
						stxx.setWeightPrice0((float)jsonModeObj.getLong("weightPrice0"));
						stxx.setWeightEnd1((float)jsonModeObj.getLong("weightEnd1"));
						stxx.setWeightInterval1((float)jsonModeObj.getLong("weightInterval1"));
						stxx.setWeightPrice1((float)jsonModeObj.getLong("weightPrice1"));
					}
				}
				
				boolean flag=saveShippingTemplate(stxx);
				if(!flag)
				{
					return false;
				}
			}
		}
		else
		{//说明是卖家承担运费
			ShippingTemplateXiangxi stxx=new ShippingTemplateXiangxi();
			stxx.setTemplateId(pamu);
			stxx.setShippingId(jsonObj.getInt("id"));
			stxx.setShippingStyle(shipStyle);
			boolean flag=saveShippingTemplate(stxx);
			if(!flag)
			{
				return false;
			}
		}
		//end of 保存运费相关
		
		//保存运输时间相关
		int timeStyle=jsonObj.getInt("timeStyle");
		if(timeStyle==1)
		{//说明是自定义运输时间
			JSONArray jsonArrayObj=jsonObj.getJSONArray("timeMode");
			int modeLen=jsonArrayObj.size();
			for(int j=0;j<modeLen;j++)
			{
				ShippingTemplateTime stt=new ShippingTemplateTime();
				stt.setTemplateId(pamu);
				stt.setShippingId(jsonObj.getInt("id"));
				stt.setTimeStyle(timeStyle);
				
				JSONObject jsonModeObj=jsonArrayObj.getJSONObject(j);
				stt.setShippingCountryIds(jsonModeObj.getString("shippingCountryIds"));
				stt.setShippingTime(jsonModeObj.getString("shippingTime"));
				
				boolean flag=saveShippingTemplateTime(stt);
				if(!flag)
				{
					return false;
				}
			}
		}
		else
		{//说明是统一一个运输时间
			
			String time=jsonObj.getString("time");
			ShippingTemplateTime stt=new ShippingTemplateTime();
			stt.setTemplateId(pamu);
			stt.setShippingId(jsonObj.getInt("id"));
			stt.setTimeStyle(timeStyle);
			stt.setShippingTime(time);
			
			boolean flag=saveShippingTemplateTime(stt);
			if(!flag)
			{
				return false;
			}
		}
		//end of 保存运输时间相关
	}//end of for
	return true;
}

private static boolean saveShippingTemplateTime(ShippingTemplateTime stt) 
{
	boolean pamu=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  
    	pamu=cMapper.saveShippingTemplateTime(stt);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	sqlSession.rollback();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return pamu;
}

private static boolean saveShippingTemplate(ShippingTemplateXiangxi stxx) 
{

	boolean pamu=false;
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  
    	pamu=cMapper.saveShippingTemplate(stxx);
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	sqlSession.rollback();
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return pamu;
}

public static boolean modifyShipTemplate(int id, String shipTemplateName,JSONArray shipTemplateJSONArray) 
{
//	int pamu=-1;
	//int len=shipTemplateJSONArray.size();
	ShippingTemplate st=new ShippingTemplate();
	st.setId(id);
	st.setName(shipTemplateName);
	
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	ShippingTemplateMapper cMapper = sqlSession.getMapper(ShippingTemplateMapper.class);  
    	boolean pamu=cMapper.modifyShippingTemplateName(st);
    	if(!pamu)
    	{
    		sqlSession.rollback();
    		return false;
    	}
    	
    	boolean delFlag=cMapper.deleteShippingTemplateXiangAndTimeByTemplateId(st);
    	if(!delFlag)
    	{
//    		sqlSession.rollback();
//    		return false;
    	}
    	

    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	sqlSession.rollback();
    	return false;
    }
    
    finally 
    {
    	sqlSession.commit();
    	
    }
    
	boolean flag=saveAllShipTemplateXiangXi(id,shipTemplateJSONArray);
	if(!flag)
	{
		sqlSession.rollback();
		return false;
	}
	sqlSession.close();
    
	return true;
}

public static boolean modifyCategoryIcon(Category category) 
{
	SqlSession sqlSession = MybatisSessionFactory.sqlSessionFactory.openSession();  
    try 
    {
    	CategoryMapper cMapper = sqlSession.getMapper(CategoryMapper.class);  
    	cMapper.updateCateBasicIcon(category); 
    } 
    catch(Exception e)
    {
    	e.printStackTrace();
    	return false;
    }
    
    finally 
    {
    	sqlSession.commit();
    	sqlSession.close();
    }
	return true;
}
}//end of class
