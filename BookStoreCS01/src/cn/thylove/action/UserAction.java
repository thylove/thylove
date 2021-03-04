package cn.thylove.action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

import cn.thylove.bean.User;
import cn.thylove.dao.UserDao;

public class UserAction extends ActionSupport {
	private String uid;
	private String alterPwd;
	private String keyWord;
	
	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getAlterPwd() {
		return alterPwd;
	}

	public void setAlterPwd(String alterPwd) {
		this.alterPwd = alterPwd;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	private User user;
	private User register;
	private User alterPwdLogin;
	private ArrayList<User> userlist;
	public ArrayList<User> getUserlist() {
		return userlist;
	}

	public void setUserlist(ArrayList<User> userlist) {
		this.userlist = userlist;
	}

	public User getAlterPwdLogin() {
		return alterPwdLogin;
	}

	public void setAlterPwdLogin(User alterPwdLogin) {
		this.alterPwdLogin = alterPwdLogin;
	}

	public User getRegister() {
		return register;
	}

	public void setRegister(User register) {
		this.register = register;
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String login() throws Exception{
		UserDao userDao = new UserDao();
		user = userDao.userLogin(user.getUsername(), user.getPwd());
		if(user != null) {
			addActionMessage("登录成功");
			return SUCCESS;
		}
		addActionMessage("登录失败，用户名或密码不正确！");
		return ERROR;
	}
	
	
	
	public String register() throws Exception {
		UserDao registerDao = new UserDao();
		register.setPicture("img/p"+(int)Math.floor(Math.random()*24) +".png");
		register.setSex(register.getSex().equals("1") ? "男": "女");
		System.out.println(register.toString());;
		if(registerDao.userAdd(register)) {
			addActionMessage("注册成功");
			return SUCCESS;
		}
		addActionMessage("注册失败！");
		return ERROR;
	}
	
	public String alterPwdLogin() throws Exception {
		UserDao alterPwdDao = new UserDao();
		alterPwdLogin = alterPwdDao.userLogin(alterPwdLogin.getUsername(), alterPwdLogin.getPwd());
		if(alterPwdLogin != null) {
			uid = "" + alterPwdLogin.getUserId();
			addActionMessage("登录成功");
			return SUCCESS;
		}
		addActionMessage("登录失败，用户名或密码不正确！");
		return ERROR;
	}
	public String modifyPwd() throws Exception {
		UserDao modifyDao = new UserDao();
		boolean modifyPwd = modifyDao.modifyPwd(uid, alterPwd);
		if(modifyPwd) {
			addActionMessage("修改密码成功");
			return SUCCESS;
		}
		return ERROR;
	}
	public String searchUser() throws Exception {
		UserDao searchUser = new UserDao();
		userlist = (ArrayList<User>) searchUser.queryByKeyWord(keyWord);
		if(userlist != null) {
			return SUCCESS;
		}
		return ERROR;
	}
	public String deleteUser() throws Exception {
		UserDao deleteUser = new UserDao();
		if(deleteUser.deleteUserById(uid)) {
			addActionMessage("删除成功");
			System.out.println("123删除");
			return SUCCESS;
		}
		return ERROR;
	}
	
}
