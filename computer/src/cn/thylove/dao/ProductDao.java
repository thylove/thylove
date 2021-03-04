package cn.thylove.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import cn.thylove.bean.Product;
import cn.thylove.utils.HibernateUtils;

public class ProductDao {
	public boolean delPro(int proID) {
		Session session = HibernateUtils.currentSession(); 
		try {
			Transaction tx = session.beginTransaction();
			Product proRes = session.get(Product.class, proID);
			session.delete(proRes);
			session.flush();
			HibernateUtils.closeSession();
			return true;
		} catch(Exception ex) {
			System.out.println(ex.getMessage()); 
			return false;
		}
	}

	public List<Product> queryAllPro(int storeID) {
		List <Product> pros = null;
		Session session = HibernateUtils.currentSession(); 
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM Product WHERE proName LIKE ? and storeID = ?";
		try {
			Query proRes = session.createQuery(strSQL, Product.class).setParameter(0, "%%").setParameter(1, storeID);
			pros = proRes.list();
			tx.commit();
			HibernateUtils.closeSession();
		} catch(Exception ex) {
			System.out.println("Pro query exception:"+ex.getMessage());
			return pros;
		}
		return pros;
	}

	public boolean addComputer(Product pro) {
		pro.setStorageTime(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime()));
		boolean singleResult = false;
		Session session = HibernateUtils.currentSession();
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM Product where proName = ? and proModel = ? and storeID = ?";
		try {
			Query productres = session.createQuery(strSQL, Product.class).setParameter(0, pro.getProName()).setParameter(1, pro.getProModel()).setParameter(2, pro.getStoreID());
			List list=productres.list();
			if(list.size() != 0) {
				Product queryProduct = (Product)list.get(0);
				queryProduct.setProNum(queryProduct.getProNum() + pro.getProNum());
				session.update(queryProduct);
			} else {
				session.save(pro);
			}
			session.flush();
			tx.commit();
			HibernateUtils.closeSession(); 
			return true; 
			
		} catch(Exception ex) {
			System.out.println("ex:" + ex.getMessage());
			return singleResult;
		}
	}
	
	
	
	
	public Product alterComputer(int proID) {
		Product pro = null;
		Session session = HibernateUtils.currentSession();
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM Product where proID = ?";
		try {
			Query productres = session.createQuery(strSQL, Product.class).setParameter(0, proID);
			List list=productres.list();
			pro = (Product)list.get(0);
			session.flush();
			tx.commit();
			HibernateUtils.closeSession();
			return pro;
		}catch(Exception ex) {
			System.out.println("ex: " + ex.getMessage());
			return pro;
			
		}
	}

	public boolean alterComputerRs(Product alterRs) {
		Product pro = null;
		Session session = HibernateUtils.currentSession();
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM Product where proID = ?";
		try {
			Query productres = session.createQuery(strSQL, Product.class).setParameter(0, alterRs.getProID());
			List list=productres.list();
			pro = (Product)list.get(0);
			pro.setProPrice(alterRs.getProPrice());
			session.update(pro);
			session.flush();
			tx.commit();
			HibernateUtils.closeSession();
			return true;
		}catch(Exception ex) {
			System.out.println("ex: " + ex.getMessage());
			return false;
		}
	}
	public boolean alterComputerRs2(int proID) {
		Product pro = null;
		Session session = HibernateUtils.currentSession();
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM Product where proID = ?";
		try {
			Query productres = session.createQuery(strSQL, Product.class).setParameter(0, proID);
			List list=productres.list();
			pro = (Product)list.get(0);
			pro.setProNum(pro.getProNum() - 1);
			session.update(pro);
			session.flush();
			tx.commit();
			HibernateUtils.closeSession();
			return true;
		}catch(Exception ex) {
			System.out.println("ex: " + ex.getMessage());
			return false;
		}
	}
	public boolean alterComputerRsByID(int proID, int transferNum) {
		Product pro = null;
		Session session = HibernateUtils.currentSession();
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM Product where proID = ?";
		try {
			Query productres = session.createQuery(strSQL, Product.class).setParameter(0, proID);
			List list=productres.list();
			pro = (Product)list.get(0);
			pro.setProNum(pro.getProNum() - transferNum);
			session.update(pro);
			session.flush();
			tx.commit();
			HibernateUtils.closeSession();
			return true;
		}catch(Exception ex) {
			System.out.println("ex: " + ex.getMessage());
			return false;
		}
	}
}
