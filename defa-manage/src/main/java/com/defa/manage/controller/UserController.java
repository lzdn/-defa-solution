package com.defa.manage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.defa.iservice.role.IRole;
import com.defa.iservice.user.IUser;
import com.defa.manage.web.BaseController;
import com.defa.model.core.Role;
import com.defa.model.core.User;
import com.defa.model.core.UserRoleRelationKey;
import com.defa.utils.common.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
 

@Controller
@RequestMapping("user")
public class UserController extends BaseController {
 
	@Autowired
	private IUser iUser;
	
	@Autowired
	private IRole iRole;
	
	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/user/main";
	}
	
	@RequestMapping("find")
	@ResponseBody
	public PageInfo<User> findRight(HttpServletRequest request, HttpServletResponse response, int pageNumber,
			int pageSize) {
		Page<User> users = iUser.findPage(pageNumber, pageSize);
		PageInfo<User> pageInfo = new PageInfo<>(users);
		return pageInfo;
	}
	
	@RequestMapping(value = "/{userId}", method = RequestMethod.GET)
	@ResponseBody
	public User get(HttpServletResponse response, @PathVariable Integer userId) {
		User user = iUser.findByUserId(userId);
		return user;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		User user = new User();
		model.addAttribute("user", user);
		return "admin/user/edit";
	}
	
	@RequestMapping(value = "/edit/{userId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String userId) {
		User user = iUser.findByUserId(new Integer(userId));
		model.addAttribute("user", user);
		return "admin/role/edit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response,User user) throws IOException {
		if (user.getUserId()!= null) {
			iUser.updateUser(user);
		} else {
			iUser.addUser(user);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
	
	@RequestMapping(value = "/role/{userId}", method = RequestMethod.GET)
	public String auth(HttpServletResponse response, Model model, @PathVariable String userId) {
		User user = iUser.findByUserId(new Integer(userId));
		model.addAttribute("user", user);
		List<Role> roles = iRole.findAll();
		model.addAttribute("roles", roles);
		return "admin/user/role";
	}
	
	
	@RequestMapping(value = "/saverole", method = RequestMethod.POST)
	public void saverole(HttpServletResponse response,User user) throws IOException {
		List<UserRoleRelationKey> list = new ArrayList<UserRoleRelationKey>();
		Integer[] roleIds  =user.getRoleId();
		if(roleIds != null) {
			for (Integer roleId : roleIds) {
				if(roleId!=null) {
					UserRoleRelationKey key = new UserRoleRelationKey();
					key.setRoleId(roleId);
					key.setUserId(user.getUserId());
					list.add(key);
				}
			}
		}
		iUser.insertBatch(list);
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}

