package com.xiaoneihuan.service.imp;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.xiaoneihuan.basic.BasicService;
import com.xiaoneihuan.domain.Goods;
import com.xiaoneihuan.domain.User;
import com.xiaoneihuan.service.interfaces.UserServiceInter;

@Transactional
public class UserService extends BasicService implements UserServiceInter {
	
	public User checkUser(User u) {
		String hql="from User where username=? and password=?";
		Object[] objects={u.getUsername(),u.getPassword()};
		List<User> list=this.executeQuery(hql, objects);
		return list.size()==1?list.get(0):null;
	}

	public List<Goods> queryGoodsByUsername(String username) {
		String hql="from Goods where ownername=?";
		Object[] objects={username};
		List<Goods> list=this.executeQuery(hql, objects);
		return list.size()!=0?list:null;
	}

	public User getUserByName(String username) {
		String hql="from User where username=? ";
		Object[] objects={username};
		List<User> list=this.executeQuery(hql, objects);
		return list.size()==1?list.get(0):null;
	}

}
