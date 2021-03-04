package cn.thylove.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import cn.thylove.bean.Users;
import cn.thylove.utils.HibernateUtils;

public class UsersDao {

	public Users userLogin(Users user) {
		Users singleResult = null;
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession();
		// 开始事务
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM Users where userName =? and userPwd = ? and userType = ?";
		try {
			Query createQuery = session.createQuery(strSQL, Users.class).setParameter(0, user.getUserName())
					.setParameter(1, "" + user.getUserPwd()).setParameter(2, user.getUserType());
			tx.commit();
			singleResult = (Users) createQuery.getSingleResult();
			HibernateUtils.closeSession();
			return singleResult;
		} catch (Exception ex) {
			System.out.println("ex:" + ex.getMessage());
			return singleResult;
		}
	}

	public boolean userAdd(Users u) { 
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession(); // 开始事务
		try {
			Transaction tx = session.beginTransaction();
			session.save(u);
			HibernateUtils.closeSession();
			return true;
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}

	public boolean modifyImg(String uid, String userImg) { 
		// 获得Hibernate Session 
		Session session = HibernateUtils.currentSession(); // 开始事务 
		try {
			Transaction tx = session.beginTransaction(); 
			Users user = session.get(Users.class, Integer.parseInt(uid));
			user.setUserImg(userImg);
			session.update(user); 
			session.flush(); 
			HibernateUtils.closeSession(); 
			return true; 
		} catch(Exception ex) { 
			
			System.out.println(ex.getMessage()); 
			
		return false; 
		} 
	} 

}
