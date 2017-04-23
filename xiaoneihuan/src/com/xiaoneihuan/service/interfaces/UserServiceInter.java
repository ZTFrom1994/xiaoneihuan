package com.xiaoneihuan.service.interfaces;
import java.util.List;

import com.xiaoneihuan.basic.BasicServiceInter;
import com.xiaoneihuan.domain.Goods;
import com.xiaoneihuan.domain.User;



public interface UserServiceInter extends BasicServiceInter{

	public User checkUser(User u);
	public List<Goods> queryGoodsByUsername(String username);
	public User getUserByName(String username);
}
