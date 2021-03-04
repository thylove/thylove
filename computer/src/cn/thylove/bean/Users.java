package cn.thylove.bean;
public class Users {
	private int userID;
	private String userName;
	private String userPwd;
	private int userType;
	private String userImg;
	private int storeID;
	public int getStoreID() {
		return storeID;
	}

	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}

	public Users() {
		super();
	}
	
	
	public Users(String userName, String userPwd, int userType, String userImg, int storeID) {
		super();
		this.userName = userName;
		this.userPwd = userPwd;
		this.userType = userType;
		this.userImg = userImg;
		this.storeID = storeID;
	}

	public Users(String userName, String userPwd, int userType, int storeID) {
		super();
		this.userName = userName;
		this.userPwd = userPwd;
		this.userType = userType;
		this.storeID = storeID;
	}

	public Users(int userID, String userName, String userPwd, int userType, String userImg, int storeID) {
		super();
		this.userID = userID;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userType = userType;
		this.userImg = userImg;
		this.storeID = storeID;
	}

	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	@Override
	public String toString() {
		return "Users [userID=" + userID + ", userName=" + userName + ", userPwd=" + userPwd + ", userType=" + userType
				+ ", userImg=" + userImg + ", storeID=" + storeID + "]";
	}
	
	
	
}
