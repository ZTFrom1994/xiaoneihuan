package com.xiaoneihuan.service.interfaces;

import java.util.List;
import java.util.Map;

import com.xiaoneihuan.basic.BasicServiceInter;
import com.xiaoneihuan.domain.Goods;

public interface GoodsServiceInter extends BasicServiceInter {
	public List<Goods> executeGoods(); 
	public List<Goods> executeQueryGoodsByPage(int pageNow, int pageSize);
	public int getPageCount(int pageSize); 
	//查询
	public List<Goods> findGoodsByTitleWithPage(String title,int pageNow,int pageSize);
	public List<Goods> findGoodsByPublishTimeWithPage(int pageNow,int pageSize);
	public List<Goods> findGoodsByMainClassWithPage(String mainclass,int pageNow,int pageSize);
	public List<Goods> findGoodsBySubClassWithPage(String subclass,int pageNow,int pageSize);
	public List<Goods> findGoodsByClickTimesWithPage(int pageNow,int pageSize);
	public List<Goods> findGoodsByGoodDealWithPage(int pageNow,int pageSize);
	public List<Goods> findGoodsByKeyWordWithPage(String keyWord,int pageNow,int pageSize);
	public Goods findUniqueGoodById(int id);
	public List<Goods> getGoodsByPublisher(String username);
	public Goods updateGoodsStatus(int id,String status);
} 