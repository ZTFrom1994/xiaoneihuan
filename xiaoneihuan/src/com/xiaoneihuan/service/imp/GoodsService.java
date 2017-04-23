package com.xiaoneihuan.service.imp;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import com.xiaoneihuan.basic.BasicService;
import com.xiaoneihuan.domain.Goods;
import com.xiaoneihuan.service.interfaces.GoodsServiceInter;

@Transactional
public class GoodsService extends BasicService implements GoodsServiceInter{ 
	
	private List<Goods> list=null;
	String hql="";
	public List<Goods> executeGoods() {
		return list;
	}
	@SuppressWarnings("unchecked")
	public List<Goods> executeQueryGoodsByPage(int pageNow, int pageSize) {
		hql="from Good order By publish_date desc";
		list=this.executeQueryByPage(hql, null, pageNow, pageSize);
		return list;
	}
	public int getPageCount(int pageSize) {
		return this.queryPageCount(null, null, pageSize);
	}

	@SuppressWarnings("unchecked")
	public List<Goods> findGoodsByTitleWithPage(String title, int pageNow,
			int pageSize) {
		hql="from Goods where goods_title like'%"+title+"%'";
		list=this.executeQueryByPage(hql, null, pageNow, pageSize);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Goods> findGoodsByPublishTimeWithPage(int pageNow, int pageSize) {
		hql="from Goods order by publish_date desc ";
		list=this.executeQueryByPage(hql, null, pageNow, pageSize);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Goods> findGoodsByMainClassWithPage(String mainClass,
			int pageNow, int pageSize) {
		hql="from Goods where main_class like '%"+mainClass+"%'";
		list=this.executeQueryByPage(hql, null, pageNow, pageSize);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Goods> findGoodsBySubClassWithPage(String subClass,
			int pageNow, int pageSize) {
		hql="from Goods where sub_class like '%"+subClass+"%'";
		list=this.executeQueryByPage(hql, null, pageNow, pageSize);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Goods> findGoodsByClickTimesWithPage(int pageNow, int pageSize) {
		hql="from Goods g order by g.clicks desc "; 
		list=this.executeQueryByPage(hql, null, pageNow, pageSize);
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Goods> findGoodsByGoodDealWithPage(int pageNow, int pageSize) {
		hql="from Goods g where deal_status = '已交易' order by g.endDate desc"; 
		list=this.executeQueryByPage(hql, null, pageNow, pageSize);
		return list;
	}
	public List<Goods> findGoodsByKeyWordWithPage(String keyWord, int pageNow,
			int pageSize) {
		hql="from Goods where goods_title like '%"+keyWord+"%' or from_school like '%"+keyWord+"%' or publisher like '%"+keyWord+"%' or  main_class like '%"+keyWord+"%' or sub_class like '%"+keyWord+"%'";
		list=this.executeQueryByPage(hql, null, pageNow, pageSize);
		return list;
	}
	
	public Goods findUniqueGoodById(int id) {
		hql="from Goods where goods_id=?";
		Object[] objects={id};
		list = this.executeQuery(hql, objects);
		return list.size()!=0?list.get(0):null;
	}
	public List<Goods> getGoodsByPublisher(String username) {
		hql = "from Goods where publisher = ?";
		Object[] objects={username};
		list = this.executeQuery(hql, objects);
		return list.size()!=0?list:null;
	}
	public Goods updateGoodsStatus(int id, String  status) {
		Goods g = (Goods) this.findUniqueGoodById(id);
		if(g!=null){
			g.setDealStatus(status);
			this.update(g);
		}
		return g!=null?g:null;
	}
}
