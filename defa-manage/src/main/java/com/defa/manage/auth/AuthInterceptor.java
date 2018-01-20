package com.defa.manage.auth;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.CollectionUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.defa.manage.base.SpringUtil;
import com.defa.manage.conf.WebProperties;
import com.defa.model.core.Right;
import com.defa.model.core.Role;
import com.defa.model.core.User;
import com.defa.utils.common.Result;
import com.defa.utils.exception.PermissionException;
import com.defa.utils.security.SecurityHelper;
 

/**
 * 权限拦截
 * 
 * @author lzdn
 */
public class AuthInterceptor extends HandlerInterceptorAdapter {

	final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	WebProperties webProperties = null;
	static Map<String,String> excludeAuth = new HashMap<String,String>();;
	
	static {
		excludeAuth.put("/home", "/home");
		excludeAuth.put("/index", "/index");
		excludeAuth.put("/login", "/login");
		excludeAuth.put("/logout", "/logout");
		excludeAuth.put("/register", "/register");
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		AuthMethod authMethod = null;// 方法的注解
		HandlerMethod handlerMethod = (HandlerMethod) handler;// 获取方法上的注解
		authMethod = handlerMethod.getMethodAnnotation(AuthMethod.class);
		webProperties = webProperties == null ? SpringUtil.getBean("webProperties"):webProperties;
		String path = request.getServletPath();
		if ("/error".equals(path)) {
			return true;
		}
		if (authMethod != null && !authMethod.mustLogin()) {
			// 不需要校验权限
			return true;
		} else {
			boolean ipChange = false;
			boolean browserChange = false;
			Result result = null;
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute(webProperties.getSessionName());
			if (user == null) {
				String cookie = WebHelper.getCookie(request, webProperties.getCookieName());
				if (cookie != null && !cookie.equals("")) {
					cookie = SecurityHelper.desDecrypt(cookie, webProperties.getSecurityKey());
					if (cookie != null && !cookie.equals("")) {
						String[] cookies = cookie.split("\\|");
						// 根据IP和UserAgent判断是否为伪造的Cookie
						if (cookies.length == 3) {
							if (!WebHelper.getIp(request).equals(cookies[1])) {
								// ip有变化
								ipChange = true;
							} else if (!request.getHeader("user-agent").equals(cookies[2])) {
								// 浏览器或浏览器版本有变化
								browserChange = true;
							} else {
								user = AuthHelper.getLoginUser(request);
								AuthHelper.setLoginUser(request, response, user);
							}
						}
					}
				}
			}
			if (user == null) {
				// 跳转到登录页面
				response.sendRedirect("/login");
				return true;
			}
			/*
			 * 校验用户当前状态 略
			 */
			if (ipChange) {
				result = new Result(-1, "系统检测到您的网络环境发生变化,请重新登录");
			}
			if (browserChange) {
				result = new Result(-1, "系统检测到您的浏览器或版本发生变化,请重新登录");
			}
			if (result!=null && isAjax(request, response)) {
				writeJSON(response, result);
				return true;
			}  
			/* 校验权限 */
			if(!excludeAuth.containsKey(path)) {
				List<Role> roles = user.getRoles();
				if(CollectionUtils.isEmpty(roles)) {
					//throw new PermissionException("对不起，您无权访问！权限路径为："+path);
					throw new PermissionException("对不起，您无权访问！请联系管理员。");
				}
				boolean isAuth = false;
				for (Role role : roles) {
					List<Right> rights = role.getRights();
					if(CollectionUtils.isEmpty(rights)) {
						throw new PermissionException("对不起，您无权访问！请联系管理员。");
					}
					for (Right right : rights) {
						if(path.equals(right.getRightUrl())) {
							isAuth = true;
							break;
						}else {
							String regEx= "^"+right.getRightUrl()+"/[1-9]\\d{0,11}$";
							boolean flat=Pattern.compile(regEx).matcher(path).find();
							if(flat) {
								isAuth = true;
								break;
							}
						}
					}
				}
				if(!isAuth) {
					throw new PermissionException("对不起，您无权访问！请联系管理员。"+path);
				}
			}
			
		}
		return true;

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {//在视图渲染之前
		request.setAttribute("basePath", webProperties.getBasePath());
	}

	protected boolean isAjax(HttpServletRequest request, HttpServletResponse response) {
		if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
			return true;
		} else {
			return false;
		}
	}

	protected void writeJSON(HttpServletResponse response, Object obj) throws IOException {
		response.reset();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().write(JSON.toJSONString(obj, SerializerFeature.WriteMapNullValue));
	}

}
