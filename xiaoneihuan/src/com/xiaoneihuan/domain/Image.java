package com.xiaoneihuan.domain;

public class Image implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1123213123123L;
	private Integer id;
	private String src;
	private Goods goods;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
}
