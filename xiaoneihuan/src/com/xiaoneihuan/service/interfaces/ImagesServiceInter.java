package com.xiaoneihuan.service.interfaces;

import java.util.List;
import java.util.Map;

import com.xiaoneihuan.basic.BasicServiceInter;
import com.xiaoneihuan.domain.Goods;
import com.xiaoneihuan.domain.Image;

public interface ImagesServiceInter extends BasicServiceInter {
	public List<Image> getImageByGoodsId(int goodsId) ; 
//	public List<Good> executeQueryGoodsByPage(int pageNow, int pageSize);
//	public int getPageCount(int pageSize); 
//	//查询
//	public List<Good> findGoodsByTitleWithPage(String title,int pageNow,int pageSize);
//	public List<Good> findGoodsByPublishTimeWithPage(int pageNow,int pageSize);
//	public List<Good> findGoodsByMainClassWithPage(String mainclass,int pageNow,int pageSize);
//	public List<Good> findGoodsBySubClassWithPage(String subclass,int pageNow,int pageSize);
//	public List<Good> findGoodsByClickRateWithPage(int pageNow,int pageSize);
//	public List<Good> findGoodsByGoodDealWithPage(int pageNow,int pageSize);
//	public List<Good> findGoodsByKeyWordWithPage(String keyWord,int pageNow,int pageSize);
//	public List<Good> findUniqueGoodById(int id);
}