package cn.thylove.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import cn.thylove.bean.SalesRecord;
import cn.thylove.utils.HibernateUtils;

public class SalesRecordDao {
	public boolean addRecord(SalesRecord salesRecord) {
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession();
		// 开始事务
		try {
			Transaction tx = session.beginTransaction();
			Serializable save1 = session.save(salesRecord);
			HibernateUtils.closeSession();
			return true;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}
	public List<SalesRecord> queryAllRecord() {
		List<SalesRecord> salesRec = null;
		Session session = HibernateUtils.currentSession();
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM SalesRecord";
		try {
			Query salesRecord = session.createQuery(strSQL, SalesRecord.class);
			salesRec = salesRecord.list();
			tx.commit();
			HibernateUtils.closeSession();
			return salesRec;
		} catch(Exception ex) {
			System.out.println("Pro query exception:"+ex.getMessage());
			return salesRec;
		}
	}
}
