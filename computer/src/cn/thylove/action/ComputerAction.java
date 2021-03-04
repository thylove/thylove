package cn.thylove.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;

import cn.thylove.bean.Product;
import cn.thylove.dao.ProductDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ComputerAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	
	private Product product;
	private Product alterPro;
	private File proImg; // 上传的文件
	private String proImgFileName; // 文件名称
	private String proImgContentType; // 文件类型
	private String path;
	private int proID;
	private int storeID;
	private JSONArray prosJsonStr;
	
	
	public int getStoreID() {
		return storeID;
	}

	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}
	public JSONArray getProsJsonStr() {
		return prosJsonStr;
	}

	public void setProsJsonStr(JSONArray prosJsonStr) {
		this.prosJsonStr = prosJsonStr;
	}
	//	---------
	private List<Product> pros;
	
	
	public Product getAlterPro() {
		return alterPro;
	}

	public void setAlterPro(Product alterPro) {
		this.alterPro = alterPro;
	}

	public int getProID() {
		return proID;
	}

	public void setProID(int proID) {
		this.proID = proID;
	}
	public List<Product> getPros() {
		return pros;
	}

	public void setPros(List<Product> pros) {
		this.pros = pros;
	}


	public Product getProduct() {
		return product;
	}


	public void setProduct(Product product) {
		this.product = product;
	}


	public File getProImg() {
		return proImg;
	}


	public void setProImg(File proImg) {
		this.proImg = proImg;
	}


	public String getProImgFileName() {
		return proImgFileName;
	}


	public void setProImgFileName(String proImgFileName) {
		this.proImgFileName = proImgFileName;
	}


	public String getProImgContentType() {
		return proImgContentType;
	}


	public void setProImgContentType(String proImgContentType) {
		this.proImgContentType = proImgContentType;
	}


	public String getPath() {
		return path;
	}


	public void setPath(String path) {
		this.path = path;
	}

	public String  addComputer() {
		String path = new Date().getTime() + "";
		String realpath = "D:\\APP\\code\\java\\worksoace2\\computer\\WebContent\\img";
		//如果图片不为空
		if (proImg != null) {
			
			String fileType = proImgFileName.substring(proImgFileName.lastIndexOf("."));
		 	//获取个随机数
			String uuid = UUID.randomUUID().toString().replace("-", "").substring(16);
			//文件名 拼接来的
			proImgFileName =uuid + path + fileType;
			product.setProImg(proImgFileName);
			System.out.println("proImgFileName:" + proImgFileName);
			//创建文件 
			File savefile = new File(new File(realpath), proImgFileName);
			//判断你需要保存图片的路径是否存在
			if (!savefile.getParentFile().exists()) {
						//如果不存在就新建
				savefile.getParentFile().mkdirs();
			}
				
			try {
				//根据org.apache.commons.io.FileUtils 复制文件 到保存路径
				FileUtils.copyFile(proImg, savefile);
				ProductDao productDao = new ProductDao();
				boolean addComputerRes = productDao.addComputer(product);
				if(addComputerRes) {
					addActionMessage("入库成功");
					return SUCCESS;
				}
				addActionMessage("入库失败");
				return ERROR;
			} catch (IOException e) {
				System.out.println(e);
				addActionMessage("入库失败");
				return ERROR;
			}
		}
		return ERROR;
	}
	
	
	public String showComputer() {
		ProductDao proDao = new ProductDao();
		pros = proDao.queryAllPro(storeID);
		if(pros == null)
			return ERROR;
		return SUCCESS;
	}
	
	public String deleteComputer() {
		boolean delProRes = new ProductDao().delPro(proID);
		if(delProRes) {
			return SUCCESS;
		}
		return ERROR;
	}

	public String alterComputer() {
		ProductDao proDao = new ProductDao();
		product = proDao.alterComputer(proID);
		if(product != null) {
			return SUCCESS;
		}
		return ERROR;
	}
	public String alterComputerRs() {
		ProductDao proDao = new ProductDao();
		boolean alterRs = proDao.alterComputerRs(alterPro);
		if(alterRs) {
			return SUCCESS;
		}
		return ERROR;
	}
	public String saleProduct() {
		ProductDao proDao = new ProductDao();
		pros = proDao.queryAllPro(storeID);
		prosJsonStr = JSONArray.fromObject(pros);
		if(pros == null)
			return ERROR;
		return SUCCESS;
	}
}
