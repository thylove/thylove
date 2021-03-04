package cn.thylove.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import cn.thylove.bean.Store;
import cn.thylove.dao.StoreDao;
import net.sf.json.JSONArray;

public class StoreAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	private List<Store> stores;
	private JSONArray storesJsonArray;
	public JSONArray getStoresJsonArray() {
		return storesJsonArray;
	}

	public void setStoresJsonArray(JSONArray storesJsonArray) {
		this.storesJsonArray = storesJsonArray;
	}

	public List<Store> getStores() {
		return stores;
	}

	public void setStores(List<Store> stores) {
		this.stores = stores;
	}

	public String storeID() {
		StoreDao storeDao = new StoreDao();
		stores = storeDao.stores();
		storesJsonArray = JSONArray.fromObject(stores);
		if(stores != null) {
			return SUCCESS;
		}
		return ERROR;
	}
	

}
