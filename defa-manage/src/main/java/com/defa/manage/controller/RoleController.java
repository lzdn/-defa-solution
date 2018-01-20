package com.defa.manage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.defa.iservice.menu.IMenuGroup;
//import com.defa.iservice.right.IRight;
import com.defa.iservice.role.IRole;
import com.defa.manage.web.BaseController;
import com.defa.model.core.MenuGroup;
import com.defa.model.core.Role;
import com.defa.model.core.RoleRightRelationKey;
import com.defa.utils.common.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("role")
public class RoleController extends BaseController {

	/*@Autowired
	private IRight iRight;*/

	@Autowired
	private IRole iRole;
	
	@Autowired
	private IMenuGroup iMenuGroup;

	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/role/main";
	}

	@RequestMapping("find")
	@ResponseBody
	public PageInfo<Role> findRole(HttpServletRequest request, HttpServletResponse response, int pageNumber, int pageSize) {
		Page<Role> roles = iRole.findPage(pageNumber, pageSize);
		PageInfo<Role> pageInfo = new PageInfo<>(roles);
		return pageInfo;
	}

	@RequestMapping(value = "/{roleId}", method = RequestMethod.GET)
	@ResponseBody
	public Role get(HttpServletResponse response, @PathVariable Integer roleId) {
		Role role = iRole.findByRoleId(roleId);
		return role;
	}
	

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		Role role = new Role();
		model.addAttribute("role", role);
		return "admin/role/edit";
	}
	
	@RequestMapping(value = "/edit/{roleId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String roleId) {
		Role role  = iRole.findByRoleId(new Integer(roleId));
		model.addAttribute("role", role);
		return "admin/role/edit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response,Role role) throws IOException {
		if (role.getRoleId()!= null) {
			iRole.updateRole(role);
		} else {
			iRole.addRole(role);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
	
	@RequestMapping(value = "/auth/{roleId}", method = RequestMethod.GET)
	public String auth(HttpServletResponse response, Model model, @PathVariable String roleId) {
		Role role  = iRole.findByRoleId(new Integer(roleId));
		model.addAttribute("role", role);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("roleId", role.getRoleId());
		List<MenuGroup>  menuGroups = iMenuGroup.findMenuGroupRights(map);
		model.addAttribute("groups", menuGroups);
		return "admin/role/auth";
	}
	
	
	@RequestMapping(value = "/saveauth", method = RequestMethod.POST)
	public void saveauth(HttpServletResponse response,Role role) throws IOException {
		List<RoleRightRelationKey> list = new ArrayList<RoleRightRelationKey>();
		Integer[] rightId  = role.getRightId();
		if(rightId != null) {
			for (Integer integer : rightId) {
				if(integer!=null) {
					RoleRightRelationKey key = new RoleRightRelationKey();
					key.setRightId(integer);
					key.setRoleId(role.getRoleId());
					list.add(key);
				}
			}
		}
		iRole.insertBatch(list);
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}
