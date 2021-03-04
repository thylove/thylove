package cn.thylove.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import cn.thylove.bean.TransferRecord;
import cn.thylove.utils.HibernateUtils;

public class TransferDao {
	public boolean addTransfer(TransferRecord transferRecord) {
		Session session = HibernateUtils.currentSession(); 
		try {
			Transaction tx = session.beginTransaction();
			Serializable save1 = session.save(transferRecord);
			HibernateUtils.closeSession();
			return true;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}
	
	public List<TransferRecord> queryAllTransfer() {
		List<TransferRecord> transRec = null;
		Session session = HibernateUtils.currentSession();
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM TransferRecord";
		try {
			Query salesRecord = session.createQuery(strSQL, TransferRecord.class);
			transRec = salesRecord.list();
			tx.commit();
			HibernateUtils.closeSession();
			return transRec;
		} catch(Exception ex) {
			System.out.println("Transfer query exception:"+ex.getMessage());
			return transRec;
		}
	}
}
