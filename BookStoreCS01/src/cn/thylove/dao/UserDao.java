package cn.thylove.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import cn.thylove.bean.User;
import cn.thylove.utils.HibernateUtils;

public class UserDao {
	private static final String User = null;
	public  User userLogin(String username, String pwd) {
		User singleResult = null;
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession();
		// 开始事务
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM User where username =? and pwd = ?";
		try {
			Query createQuery = session.createQuery(strSQL, User.class).setParameter(0, username).setParameter(1, pwd);
			tx.commit();
			singleResult = (User)createQuery.getSingleResult();
			HibernateUtils.closeSession();
			return singleResult;

			
		} catch(Exception ex) {
			return singleResult;
		}
	}
	public boolean userAdd(User u) {
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession();
		// 开始事务
		try {
			Transaction tx = session.beginTransaction();
			session.save(u);
			HibernateUtils.closeSession();
			return true;
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}
	public boolean modifyPwd(String uid, String alterPwd) {
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession();
		// 开始事务
		try {
			Transaction tx = session.beginTransaction();
			User user = session.get(User.class, Integer.parseInt(uid));
			System.out.println(user.toString());
			user.setPwd(alterPwd);
			session.update(user);
			session.flush();
			HibernateUtils.closeSession();
			return true;
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}
	public List<User> queryByKeyWord(String keyWord) {
		List<User> userlist = null;
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession();
		Transaction tx = session.beginTransaction();
		String strSQL = "FROM User where username like ? or pwd like ?";
		try {
			Query createQuery = session.createQuery(strSQL, User.class).setParameter(0,"%" +  keyWord + "%").setParameter(1, "%" +  keyWord + "%");
			tx.commit();
			userlist = createQuery.list();
			HibernateUtils.closeSession();
			return userlist;
			
		} catch(Exception ex) {
			return userlist;
		}
	}
	public boolean deleteUserById(String uid) {
		// 获得Hibernate Session
		Session session = HibernateUtils.currentSession();
		// 开始事务
		try {
			Transaction tx = session.beginTransaction();
			User user = session.get(User.class, Integer.parseInt(uid));
			session.delete(user);
			session.flush();
			HibernateUtils.closeSession();
			return true;
		} catch(Exception ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}
}
