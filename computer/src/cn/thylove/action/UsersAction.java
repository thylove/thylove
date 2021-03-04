package cn.thylove.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import cn.thylove.bean.Store;
import cn.thylove.bean.Users;
import cn.thylove.dao.StoreDao;
import cn.thylove.dao.UsersDao;

public class UsersAction extends ActionSupport {
	
	private static final long serialVersionUID = 1L;
	private Users user;
	private Users register;
	private String uid;
	private List<Store> stores;
	
	public List<Store> getStores() {
		return stores;
	}

	public void setStores(List<Store> stores) {
		this.stores = stores;
	}
	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public Users getRegister() {
		return register;
	}

	public void setRegister(Users register) {
		this.register = register;
	}
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}
	public String login() throws Exception{
		UsersDao userDao = new UsersDao();
		user = userDao.userLogin(user);
		if(user != null) {
			ServletActionContext.getRequest().getSession().setAttribute("userID", user.getUserID());
			ServletActionContext.getRequest().getSession().setAttribute("userName", user.getUserName());
			ServletActionContext.getRequest().getSession().setAttribute("userType", user.getUserType());
			ServletActionContext.getRequest().getSession().setAttribute("userImg", user.getUserImg());
			ServletActionContext.getRequest().getSession().setAttribute("storeID", user.getStoreID());
			ServletActionContext.getRequest().getSession().setAttribute("uaperror", "");
			return SUCCESS;
		}
		ServletActionContext.getRequest().getSession().setAttribute("uaperror", "输入有误！请检查！");
		return ERROR;
	}
	
	public String register() throws Exception {
		UsersDao registerDao = new UsersDao();
		boolean userAdd = registerDao.userAdd(register);
		StoreDao storeDao = new StoreDao();
		stores = storeDao.stores();
		if(userAdd && storeDao != null) {
			addActionMessage("注册成功");
			return SUCCESS;
		}
		addActionMessage("注册失败！");
		return ERROR;
	}
	
	private File myFile; // 上传的文件
	private String myFileFileName; // 文件名称
	private String myFileContentType; // 文件类型
	private String path;
	
	
	
	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	public String getMyFileContentType() {
		return myFileContentType;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	String uuid = UUID.randomUUID().toString().replace("-", "");
	public String uploadImg() throws Exception{
		String path = new Date().getTime() + "";
		String realpath = "D:\\APP\\code\\java\\worksoace2\\computer\\WebContent\\img";
		//如果图片不为空
		if (myFile != null) {
			
			String fileType = myFileFileName.substring(myFileFileName.lastIndexOf("."));
		 	//获取个随机数
			
			//文件名 拼接来的
			myFileFileName =path + fileType;
			System.out.println("myFileFileName:" +myFileFileName);
			System.out.println("realpath:" +realpath);
			
			//创建文件 
			File savefile = new File(new File(realpath), myFileFileName);
			//判断你需要保存图片的路径是否存在
			if (!savefile.getParentFile().exists()) {
						//如果不存在就新建
				System.out.println("no");
				savefile.getParentFile().mkdirs();
			}
				
			try {
				//根据org.apache.commons.io.FileUtils 复制文件 到保存路径
				FileUtils.copyFile(myFile, savefile);
				UsersDao usersDao = new UsersDao();
				boolean modifyImgResult = usersDao.modifyImg(uid, myFileFileName);
				System.out.println("modifyImgResult:" +modifyImgResult);
				return SUCCESS;
			} catch (IOException e) {
				System.out.println(e);
				return ERROR;
			}
		}

		return SUCCESS;
	}
	HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();


}
