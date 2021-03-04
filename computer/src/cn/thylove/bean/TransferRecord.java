package cn.thylove.bean;

public class TransferRecord {
	private int transferRecordID;
	private int transferInID;
	private int proID;
	private String proName;
	private String proModel;
	private int proPrice;
	private String proImg;
	private String storageTime;
	private int transferOutID;
	private String userName;
	private int transferNum;
	
	
	public TransferRecord() {
		super();
	}


	public TransferRecord(int transferInID, int proID, String proName, String proModel, int proPrice, String proImg,
			String storageTime, int transferOutID, String userName, int transferNum) {
		super();
		this.transferInID = transferInID;
		this.proID = proID;
		this.proName = proName;
		this.proModel = proModel;
		this.proPrice = proPrice;
		this.proImg = proImg;
		this.storageTime = storageTime;
		this.transferOutID = transferOutID;
		this.userName = userName;
		this.transferNum = transferNum;
	}

	public TransferRecord(int transferRecordID, int transferInID, int proID, String proName, String proModel,
			int proPrice, String proImg, String storageTime, int transferOutID, String userName, int transferNum) {
		super();
		this.transferRecordID = transferRecordID;
		this.transferInID = transferInID;
		this.proID = proID;
		this.proName = proName;
		this.proModel = proModel;
		this.proPrice = proPrice;
		this.proImg = proImg;
		this.storageTime = storageTime;
		this.transferOutID = transferOutID;
		this.userName = userName;
		this.transferNum = transferNum;
	}

	public int getTransferRecordID() {
		return transferRecordID;
	}

	public void setTransferRecordID(int transferRecordID) {
		this.transferRecordID = transferRecordID;
	}

	public int getTransferInID() {
		return transferInID;
	}

	public void setTransferInID(int transferInID) {
		this.transferInID = transferInID;
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

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

	public String getStorageTime() {
		return storageTime;
	}

	public void setStorageTime(String storageTime) {
		this.storageTime = storageTime;
	}

	public int getTransferOutID() {
		return transferOutID;
	}

	public void setTransferOutID(int transferOutID) {
		this.transferOutID = transferOutID;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getTransferNum() {
		return transferNum;
	}

	public void setTransferNum(int transferNum) {
		this.transferNum = transferNum;
	}

	@Override
	public String toString() {
		return "TransferRecord [transferRecordID=" + transferRecordID + ", transferInID=" + transferInID + ", proID="
				+ proID + ", proName=" + proName + ", proModel=" + proModel + ", proPrice=" + proPrice + ", proImg="
				+ proImg + ", storageTime=" + storageTime + ", transferOutID=" + transferOutID
				+ ", userName=" + userName + ", transferNum=" + transferNum + "]";
	}
	
	
	
	
	
	
}
