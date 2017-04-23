package com.xiaoneihuan.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoneihuan.domain.Goods;
import com.xiaoneihuan.domain.Image;
import com.xiaoneihuan.domain.User;
import com.xiaoneihuan.service.interfaces.GoodsServiceInter;
import com.xiaoneihuan.service.interfaces.ImagesServiceInter;
import com.xiaoneihuan.service.interfaces.UserServiceInter;

@Controller
public class UserController {
	@Autowired
	private UserServiceInter userServiceInter;
	@Autowired
	private GoodsServiceInter goodsServiceInter;
	
	@RequestMapping(value = "goUserCenter")
	public String goUserCenter(HttpSession session){
		String username = (String)session.getAttribute("currentUser");
		Map<Goods,List<Image>> map = null;
		List<Image> imageList = null;
		List<Goods> goodsList = null;
		if(username == null){
			return "main";
		}else{
			User user = userServiceInter.getUserByName(username);
			session.setAttribute("user", user);
			goodsList =goodsServiceInter.getGoodsByPublisher(username);
			session.setAttribute("goodsList", goodsList);
			return "usercenter";
		}
	}
	@RequestMapping(value = "checkUsername")
	@ResponseBody
	public String checkUsername(String username){
		if(userServiceInter.getUserByName(username)==null){
			//可以注册
			return "1";
		}else{
			return "0";
		}	
	}
	@RequestMapping(value = "checkUserStuId")
	@ResponseBody
	public String checkUserStuId(String username,String school,String stuId,String realName){
		User user = userServiceInter.getUserByName(username);
		if(user != null){
			if(user.getSchool().equals(school)){
				user.setRealName(realName);
				user.setStuId(stuId);
				user.setIsChecked("y");
				userServiceInter.add(user);
				return "1";
			}else{
				return "0";
			}
		}else{
			return "0";
		}	
	}
}
