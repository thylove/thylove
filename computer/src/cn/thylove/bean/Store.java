package cn.thylove.bean;

public class Store {
	private int storeID;
	private String shopowner;
	
	public Store() {
		super();
	}
	public Store(String shopowner) {
		super();
		this.shopowner = shopowner;
	}
	public Store(int storeID, String shopowner) {
		super();
		this.storeID = storeID;
		this.shopowner = shopowner;
	}
	public int getStoreID() {
		return storeID;
	}
	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}
	public String getShopowner() {
		return shopowner;
	}
	public void setShopowner(String shopowner) {
		this.shopowner = shopowner;
	}
	@Override
	public String toString() {
		return "Store [storeID=" + storeID + ", shopowner=" + shopowner + "]";
	}
	
	
}
