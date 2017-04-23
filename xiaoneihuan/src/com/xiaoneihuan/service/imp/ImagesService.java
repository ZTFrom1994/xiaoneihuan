package com.xiaoneihuan.service.imp;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import com.xiaoneihuan.basic.BasicService;
import com.xiaoneihuan.domain.Goods;
import com.xiaoneihuan.domain.Image;
import com.xiaoneihuan.service.interfaces.GoodsServiceInter;
import com.xiaoneihuan.service.interfaces.ImagesServiceInter;

@Transactional
public class ImagesService extends BasicService implements ImagesServiceInter{
	
	private List<Image> list=null;
	String hql="";
	public List<Image> getImageByGoodsId(int goodsId) {
		 hql = "from Image where goodsId = ?";
		 Object[] objects={goodsId};
		 list=this.executeQuery(hql, objects);
		 return list.size()!=0?list:null;
	}
}
