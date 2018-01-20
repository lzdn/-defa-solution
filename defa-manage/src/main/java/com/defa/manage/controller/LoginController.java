package com.defa.manage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.defa.iservice.user.IUser;
import com.defa.manage.auth.AuthHelper;
import com.defa.manage.auth.AuthMethod;
import com.defa.manage.auth.WebHelper;
import com.defa.manage.conf.WebProperties;
import com.defa.manage.web.BaseController;
import com.defa.model.core.User;
import com.defa.utils.common.Result;
import com.defa.utils.security.SecurityHelper;
 

@Controller
// @RequestMapping("v1")
public class LoginController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private IUser iUser;
	@Autowired
	private WebProperties webProperties;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	@AuthMethod(mustLogin = false)
	public String tologin(HttpServletRequest request, HttpServletResponse response, Model model) {
		if (WebHelper.getCookie(request, "rememberMe") != null) {
			model.addAttribute("account", SecurityHelper.desDecrypt(WebHelper.getCookie(request, "rememberMe"),
					webProperties.getSecurityKey()));
		}
		return "login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	@AuthMethod(mustLogin = false)
	@ResponseBody
	public Result login(HttpServletRequest request, HttpServletResponse response, User user)
			throws Exception {
		String account = user.getAccount();
		String password = user.getPassword();
		String passwordsc = SecurityHelper.desEncrypt(password, webProperties.getSecretKey());
		user.setAccount(account);
		user.setPassword(passwordsc);
		User loginUser = iUser.login(user);
		AuthHelper.rememberMe(request, response, account);
		if (loginUser != null) {
			AuthHelper.setLoginUser(request, response, loginUser);
			Result result = new Result(1, "登录成功");
			logger.debug("登录成功");
			return result;
		} else {
			Result result = new Result(-1, "登录失败");
			logger.debug("登录失败");
			return result;
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	@AuthMethod(mustLogin = false)
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		try {
			User user = AuthHelper.getLoginUser(request);
			if(user!=null)
				iUser.deleteUserCache(user.getUserId());
			AuthHelper.delLoginUser(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:login";
	}
	

	@RequestMapping(value = "register", method = RequestMethod.GET)
	@AuthMethod(mustLogin = false)
	public String toRegister(Model model) {
		return "register";
	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	@AuthMethod(mustLogin = false)
	@ResponseBody
	public Result register(HttpServletRequest request, HttpServletResponse response, User user) throws Exception {
		try {
			user.setSalt(webProperties.getSecretKey());// 可以设置成随机的密钥
			user.setPassword(SecurityHelper.desEncrypt(user.getPassword(), webProperties.getSecretKey()));
			user.setDeptId(3);
			iUser.addUser(user);
			logger.debug("register", "注册成功");
			return new Result(1, "注册成功");//new Result(1, "暂时不开放注册功能！");
		} catch (Exception e) {
			e.printStackTrace();
			logger.debug("register", e.fillInStackTrace());
			return new Result(-1, "注册失败");
		}
	}
}
