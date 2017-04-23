package com.xiaoneihuan.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaoneihuan.domain.User;
import com.xiaoneihuan.service.interfaces.UserServiceInter;

@Controller
public class LoginController {
	@Autowired
	private UserServiceInter userServiceInter;

	@RequestMapping(value = "login")
	@ResponseBody  // 指明要有返回值返回给前台  
	//这里的username是自动注入的参数，相当于request.getAttribute("username")后的值;
	public String login(HttpSession httpSession, String username,
			String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user = userServiceInter.checkUser(user);
		if (user != null) {
			httpSession.setAttribute("currentUser", username);
			httpSession.setAttribute("logged", "y");
			return "1";
		} else {
			return "0";
		}
	}

	@RequestMapping(value = "logout")
	@ResponseBody
	public String logout(HttpSession httpSession) {
		httpSession.setAttribute("currentUser", null);
		httpSession.setAttribute("logged", "n");
		return "1";
	}

	@RequestMapping(value = "loginCheck")
	@ResponseBody
	public String loginCheck(HttpSession httpSession) {
		String logined = (String)httpSession.getAttribute("logged");
		if (logined != null && logined.equals("y")) {
			String u = (String) httpSession.getAttribute("currentUser");
			if (u != null) {
				return "1";
			} else {
				return "0";
			}
		} else {
			return "0";
		}
	}

	@RequestMapping(value = "registerUser")
	@ResponseBody
	public String registerUser(HttpSession httpSession, String username,
			String password, String school,String sex) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setSchool(school);
		user.setSex(sex);
		user.setRegisterDate(new java.util.Date());
		try {
			userServiceInter.add(user);
			httpSession.setAttribute("currentUser",username);
			httpSession.setAttribute("logged", "y");
			return "1";

		} catch (Exception e) {
			return "0";
		}
	}

}
