package cn.edu.zhku.she.Model;

public class Shop {
	private int sid;
	private int uid;
	private String shopname;
	private String ownername;
	private String phoneNumber;
	private String identifyImg;
	private String shopstate;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getOwnername() {
		return ownername;
	}
	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}
	public String getIdentifyImg() {
		return identifyImg;
	}
	public void setIdentifyImg(String identifyImg) {
		this.identifyImg = identifyImg;
	}
	public String getShopstate() {
		return shopstate;
	}
	public void setShopstate(String shopstate) {
		this.shopstate = shopstate;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
}
