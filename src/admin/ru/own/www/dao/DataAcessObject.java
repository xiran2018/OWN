package admin.ru.own.www.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import ru.own.www.UtilHibernateFactory.HibernateSessionFactory;
import admin.ru.own.www.entity.Attribute;
import admin.ru.own.www.entity.AttributeValue;
import admin.ru.own.www.entity.BrandSeries;
import admin.ru.own.www.entity.Category;

public class DataAcessObject {
	
	public DataAcessObject(){
		
	}
	
	public List getBrandSeriesByCategoryId(int categoryId) {
		List<BrandSeries> list = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			System.out
					.println("<<<<<<<<<<<<<<<<<<<<<<<<<<<<bgein brand_series");
			list = session.createCriteria(BrandSeries.class).add(
					Restrictions.eq("classId", categoryId)).list();

			tx.commit();
		} catch (Exception e) {
			System.out
					.println(">>>>>>>>>>>>>>>>thers is a bug for get brand_series!!!!"
							+ e);
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
			if (list.size() == 0) {
				list = null;
			}
			return list;
		}
	}

	public int Insert_Brand_Series(BrandSeries brand1) {
		BrandSeries brand = brand1;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(brand);
			BrandSeries temp = (BrandSeries) session.get(BrandSeries.class,
					brand.getParentBrandId());
			if (temp != null) {

				temp.setIsParent((short) 1);
			}
			tx.commit();
		} catch (Exception e) {
			System.out
					.println(">>>>>>>>>>>>>>>>thers is a bug for save BrandSeries!!!!");
			System.out.println(e);
			if (tx != null)
				tx.rollback();
			return -1;
		} finally {
			session.close();
			int temp = brand.getBrandId();
			return temp;
		}
	}

	public BrandSeries getBrandSeriesByBrandId(int brandId) {
		BrandSeries brand = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			brand = (BrandSeries) session.get(BrandSeries.class, brandId);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
			return brand;
		}
	}

	public List<BrandSeries> getBrandSeriesListByparentId(Integer tempbrandId) {
		List list = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			list = session.createCriteria(BrandSeries.class).add(
					Restrictions.eq("parentBrandId", tempbrandId)).list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
			return list;
		}
	}

	public void DeleteBrandbyBrandId(Integer brandId) {
		BrandSeries brand;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			brand = (BrandSeries) session.get(BrandSeries.class, brandId);
			session.delete(brand);
			tx.commit();
		} catch (Exception e) {
			System.out
					.println(">>>>>>>>>>>>>>>>thers is a bug for delete brand!!!!"
							+ e);
			if (tx != null)
				tx.rollback();

		} finally {
			session.close();

		}

	}

	public Integer Insert_Product_attr(Attribute attr1) {
		Attribute attr = attr1;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(attr);
			tx.commit();
		} catch (Exception e) {
			System.out.println(">>>>>>>>>>>>>>>>thers is a bug for save Product_attr!!!!");
			System.out.println(e);
			if (tx != null)
				tx.rollback();
			return -1;
		} finally {
			session.close();
			int temp = attr.getAttrId(); // 返回主键
			return temp;
		}
	}

	public Integer Insert_Attribute_name(AttributeValue attrvalue1) {
		AttributeValue attrvalue = attrvalue1;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(attrvalue);
			tx.commit();
		} catch (Exception e) {
			System.out
					.println(">>>>>>>>>>>>>>>>thers is a bug for save AttributeValue!!!!");
			System.out.println(e);
			if (tx != null)
				tx.rollback();
			return -1;
		} finally {
			session.close();
			int temp = attrvalue.getAttrValueId(); // 返回主键
			return temp;
		}
	}

	public List<Attribute> getAttributeByCategoryId(int categoryId) {
		List list = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			list = session.createCriteria(Attribute.class).add(
					Restrictions.eq("categoryId", categoryId)).list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
			return list;
		}
	}

	public Attribute getAttributeByAttrId(int id) {
		Attribute attr = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			attr = (Attribute) session.get(Attribute.class, id);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
			return attr;
		}
	}

	public List<AttributeValue> getAttrValueByAttrId(int id) {
		// TODO Auto-generated method stub
		List attrvalueList = null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			attrvalueList = session.createCriteria(AttributeValue.class).add(
					Restrictions.eq("attrId", id)).list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
		} finally {
			session.close();
			return attrvalueList;
		}
	}

	public boolean deleteAttributeValueById(int id) 
	{
		AttributeValue attrValue=null;
		Session session = HibernateSessionFactory.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			attrValue = (AttributeValue) session.get(AttributeValue.class, id);
			if(attrValue!=null)
			{
				session.delete(attrValue);
			}
			tx.commit();
		} catch (Exception e) 
		{
			System.out.println(">>>>>>>>>>>>>>>>thers is a bug for delete AttributeValue!!!!");
			e.printStackTrace();
			if (tx != null)
				tx.rollback();
			return false;

		} finally {
			session.close();
		}
		return true;
	}
	
	public static Category getcategoryById(Integer categoryId)
	{
		Category category=null;
		Session session=HibernateSessionFactory.getSession();
		Transaction tx = null;
		 try 
		 {
				tx=session.beginTransaction();
				category=(Category) session.get(Category.class, categoryId);
				tx.commit();
		 }
		 catch (Exception e) 
		 {
			 System.out.println(">>>>>>>>>>>>>>>>thers is a bug for save category!!!!"+e);
		     if (tx!=null) tx.rollback();
			
		 }
		 finally 
		 {
				session.close();
		 }
		 return category;
	}
}
