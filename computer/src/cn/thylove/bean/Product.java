package cn.thylove.bean;


public class Product {
	private int proID;
	private String proName;
	private String proModel;
	private String storageTime;
	private int proStatus;
	private String proImg;
	private int proPrice;
	private int proNum;
	private int storeID;
	
	
	
	public int getStoreID() {
		return storeID;
	}

	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}
	public Product() {
		super();
	}
	
	

	public Product(String proName, String proModel, String storageTime, int proStatus, String proImg, int proPrice,
			int proNum, int storeID) {
		super();
		this.proName = proName;
		this.proModel = proModel;
		this.storageTime = storageTime;
		this.proStatus = proStatus;
		this.proImg = proImg;
		this.proPrice = proPrice;
		this.proNum = proNum;
		this.storeID = storeID;
	}

	public Product(int proID, String proName, String proModel, String storageTime, int proStatus, String proImg,
			int proPrice, int proNum, int storeID) {
		super();
		this.proID = proID;
		this.proName = proName;
		this.proModel = proModel;
		this.storageTime = storageTime;
		this.proStatus = proStatus;
		this.proImg = proImg;
		this.proPrice = proPrice;
		this.proNum = proNum;
		this.storeID = storeID;
	}

	public int getProID() {
		return proID;
	}
	public void setProID(int proID) {
		this.proID = proID;
	}
	public String getProName() {
		return proName;
	}
	public void setProName(String proName) {
		this.proName = proName;
	}
	public String getProModel() {
		return proModel;
	}
	public void setProModel(String proModel) {
		this.proModel = proModel;
	}
	public String getStorageTime() {
		return storageTime;
	}

	public void setStorageTime(String storageTime) {
		this.storageTime = storageTime;
	}

	public int getProStatus() {
		return proStatus;
	}
	public void setProStatus(int proStatus) {
		this.proStatus = proStatus;
	}
	public String getProImg() {
		return proImg;
	}
	public void setProImg(String proImg) {
		this.proImg = proImg;
	}
	public int getProPrice() {
		return proPrice;
	}
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	public int getProNum() {
		return proNum;
	}
	public void setProNum(int proNum) {
		this.proNum = proNum;
	}

	@Override
	public String toString() {
		return "Product [proID=" + proID + ", proName=" + proName + ", proModel=" + proModel + ", storageTime="
				+ storageTime + ", proStatus=" + proStatus + ", proImg=" + proImg + ", proPrice=" + proPrice
				+ ", proNum=" + proNum + ", storeID=" + storeID + "]";
	}
	
}
