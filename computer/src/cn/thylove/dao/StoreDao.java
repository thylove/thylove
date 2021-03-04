package cn.thylove.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import cn.thylove.bean.Store;
import cn.thylove.utils.HibernateUtils;

public class StoreDao {
	public List<Store> stores() {
		List<Store> storeRec = null;
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession();
		// 开始事务
		try {
			Transaction tx = session.beginTransaction();
			String strSQL = "FROM Store";
			Query storeQuery = session.createQuery(strSQL, Store.class);
			storeRec = storeQuery.list();
			tx.commit();
			HibernateUtils.closeSession();
			return storeRec;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return storeRec;
		}
		
	}
}
