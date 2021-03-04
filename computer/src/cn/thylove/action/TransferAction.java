package cn.thylove.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import cn.thylove.bean.Product;
import cn.thylove.bean.TransferRecord;
import cn.thylove.dao.ProductDao;
import cn.thylove.dao.TransferDao;

public class TransferAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private TransferRecord transferRecord;
	private Product pro;
	
	public Product getPro() {
		return pro;
	}
	public void setPro(Product pro) {
		this.pro = pro;
	}

	private List<TransferRecord> queryAllTransfer;
	
	public List<TransferRecord> getQueryAllTransfer() {
		return queryAllTransfer;
	}
	public void setQueryAllTransfer(List<TransferRecord> queryAllTransfer) {
		this.queryAllTransfer = queryAllTransfer;
	}
	public TransferRecord getTransferRecord() {
		return transferRecord;
	}
	public void setTransferRecord(TransferRecord transferRecord) {
		this.transferRecord = transferRecord;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String addTransfer() {
		transferRecord.setStorageTime(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime()));
		pro = new Product(transferRecord.getProName(), transferRecord.getProModel(), transferRecord.getStorageTime(), 1, transferRecord.getProImg(), transferRecord.getProPrice(), transferRecord.getTransferNum(), transferRecord.getTransferInID());
		TransferDao transferDao = new TransferDao();
		
		boolean addTransfer = transferDao.addTransfer(transferRecord);
		boolean alterComputerRs2 = new ProductDao().alterComputerRsByID(transferRecord.getProID(), transferRecord.getTransferNum());
		boolean addComputer = new ProductDao().addComputer(pro);
		if(addTransfer && alterComputerRs2 && addComputer) {
			addActionMessage("调拨成功");
			return SUCCESS;
		}
		addActionMessage("调拨失败");
		return ERROR;
	}
	public String showTransferRecord() {
		TransferDao transferDao = new TransferDao();
		queryAllTransfer = transferDao.queryAllTransfer();
		if(queryAllTransfer != null) {
			return SUCCESS;
		}
		return ERROR;
	}
	
}
