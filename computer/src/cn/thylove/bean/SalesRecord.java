package cn.thylove.bean;

public class SalesRecord {

	private int salesID;
	private int userID;
	private int proID;
	private String userName;
	private String salesTime;
	private String proModel;
	private int proPrice;
	private String proName;
	private int storeID;
	public int getStoreID() {
		return storeID;
	}

	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}
	public SalesRecord() {
		super();
	}
	
	

	public SalesRecord(int userID, int proID, String userName, String salesTime, String proModel, int proPrice,
			String proName, int storeID) {
		super();
		this.userID = userID;
		this.proID = proID;
		this.userName = userName;
		this.salesTime = salesTime;
		this.proModel = proModel;
		this.proPrice = proPrice;
		this.proName = proName;
		this.storeID = storeID;
	}

	public SalesRecord(int salesID, int userID, int proID, String userName, String salesTime, String proModel,
			int proPrice, String proName, int storeID) {
		super();
		this.salesID = salesID;
		this.userID = userID;
		this.proID = proID;
		this.userName = userName;
		this.salesTime = salesTime;
		this.proModel = proModel;
		this.proPrice = proPrice;
		this.proName = proName;
		this.storeID = storeID;
	}

	public int getSalesID() {
		return salesID;
	}
	public void setSalesID(int salesID) {
		this.salesID = salesID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getProID() {
		return proID;
	}
	public void setProID(int proID) {
		this.proID = proID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSalesTime() {
		return salesTime;
	}
	public void setSalesTime(String salesTime) {
		this.salesTime = salesTime;
	}
	public String getProModel() {
		return proModel;
	}
	public void setProModel(String proModel) {
		this.proModel = proModel;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}

	@Override
	public String toString() {
		return "SalesRecord [salesID=" + salesID + ", userID=" + userID + ", proID=" + proID + ", userName=" + userName
				+ ", salesTime=" + salesTime + ", proModel=" + proModel + ", proPrice=" + proPrice + ", proName="
				+ proName + ", storeID=" + storeID + "]";
	}
	
	
}
