package cn.thylove.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import cn.thylove.bean.SalesRecord;
import cn.thylove.dao.ProductDao;
import cn.thylove.dao.SalesRecordDao;
import net.sf.json.JSONArray;

public class SalesRecordAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private SalesRecord salesRecord;
	private List<SalesRecord> queryAllRecord;
	private JSONArray salesRecordJson;
	public JSONArray getSalesRecordJson() {
		return salesRecordJson;
	}
	public void setSalesRecordJson(JSONArray salesRecordJson) {
		this.salesRecordJson = salesRecordJson;
	}
	public List<SalesRecord> getQueryAllRecord() {
		return queryAllRecord;
	}
	public void setQueryAllRecord(List<SalesRecord> queryAllRecord) {
		this.queryAllRecord = queryAllRecord;
	}
	public SalesRecord getSalesRecord() {
		return salesRecord;
	}
	public void setSalesRecord(SalesRecord salesRecord) {
		this.salesRecord = salesRecord;
	}
	public String saleRe() {
		salesRecord.setSalesTime(new SimpleDateFormat("yyyyMMddHHmmss").format(new Date().getTime()));
		SalesRecordDao recordDao = new SalesRecordDao();
		boolean alterComputerRs2 = new ProductDao().alterComputerRs2(salesRecord.getProID());
		boolean addRecord = recordDao.addRecord(salesRecord);
		if(addRecord && alterComputerRs2) {
			addActionMessage("出库成功");
			return SUCCESS;
		}
		addActionMessage("出库失败");
		return ERROR;
	}
	
	public String salesRecordComputer() {
		SalesRecordDao salesRecordDao = new SalesRecordDao();
		queryAllRecord = salesRecordDao.queryAllRecord();
		salesRecordJson = JSONArray.fromObject(queryAllRecord);	
		if(queryAllRecord != null) {
			return SUCCESS;
		}
		return ERROR;
	}
	public String saleRecord() {
		SalesRecordDao salesRecordDao = new SalesRecordDao();
		queryAllRecord = salesRecordDao.queryAllRecord();
		if(queryAllRecord != null) {
			return SUCCESS;
		}
		return ERROR;
	}
	
}
