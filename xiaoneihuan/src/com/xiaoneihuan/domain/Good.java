package com.xiaoneihuan.domain;

public class Good implements java.io.Serializable{
	private static final long serialVersionUID = 4589978341817490668L;
	
	private String ownername;
	private Integer goodsid;
	private String goodstitle;
	private String fromschool;
	private java.util.Date publishdate;
	private String imgsrc;
	private String mainclass;
	private String subclass;
	private String introduction;
	private String dealstatus;
	private java.util.Date  enddate;
	private Integer clicks; 
	public Integer getClicks() {
		return clicks;
	}
	public void setClicks(Integer clicks) {
		this.clicks = clicks;
	}
	public String getOwnername() {
		return ownername;
	}
	public void setOwnername(String ownername) {
		this.ownername = ownername;
	}
	public Integer getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}
	public String getGoodstitle() {
		return goodstitle;
	}
	public void setGoodstitle(String goodstitle) {
		this.goodstitle = goodstitle;
	}
	public String getFromschool() {
		return fromschool;
	}
	public void setFromschool(String fromschool) {
		this.fromschool = fromschool;
	}
	public java.util.Date getPublishdate() {
		return publishdate;
	}
	public void setPublishdate(java.util.Date publishdate) {
		this.publishdate = publishdate;
	}
	public String getImgsrc() {
		return imgsrc;
	}
	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}
	public String getMainclass() {
		return mainclass;
	}
	public void setMainclass(String mainclass) {
		this.mainclass = mainclass;
	}
	public String getSubclass() {
		return subclass;
	}
	public void setSubclass(String subclass) {
		this.subclass = subclass;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public String getDealstatus() {
		return dealstatus;
	}
	public void setDealstatus(String dealstatus) {
		this.dealstatus = dealstatus;
	}
	public java.util.Date getEnddate() {
		return enddate;
	}
	public void setEnddate(java.util.Date enddate) {
		this.enddate = enddate;
	}
	
}
