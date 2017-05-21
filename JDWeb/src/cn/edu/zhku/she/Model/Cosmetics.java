package cn.edu.zhku.she.Model;

public class Cosmetics extends Product{
	private String brank;
	private String cosSize;
	private String cosMonth;
	private String fitSkin;
	private String cosEffect;
	private String period;
	private String proAddress;
	public Cosmetics()
	{
		super();
	}
	public String getBrank() {
		return brank;
	}
	public void setBrank(String brank) {
		this.brank = brank;
	}
	public String getCosSize() {
		return cosSize;
	}
	public void setCosSize(String cosSize) {
		this.cosSize = cosSize;
	}
	public String getCosMonth() {
		return cosMonth;
	}
	public void setCosMonth(String cosMonth) {
		this.cosMonth = cosMonth;
	}
	public String getFitSkin() {
		return fitSkin;
	}
	public void setFitSkin(String fitSkin) {
		this.fitSkin = fitSkin;
	}
	public String getCosEffect() {
		return cosEffect;
	}
	public void setCosEffect(String cosEffect) {
		this.cosEffect = cosEffect;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getProAddress() {
		return proAddress;
	}
	public void setProAddress(String proAddress) {
		this.proAddress = proAddress;
	}
}
