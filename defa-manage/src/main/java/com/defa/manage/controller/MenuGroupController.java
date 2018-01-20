package com.defa.manage.controller;

import java.io.IOException;

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
import com.defa.manage.web.BaseController;
import com.defa.model.core.MenuGroup;
import com.defa.utils.common.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("group")
public class MenuGroupController extends BaseController {

	@Autowired
	private IMenuGroup iMenuGroup;

	@RequestMapping("/main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/menu/group";
	}

	@RequestMapping(value = "/{groupId}", method = RequestMethod.GET)
	@ResponseBody
	public MenuGroup get(HttpServletResponse response, @PathVariable Integer groupId) {
		MenuGroup menuGroup = iMenuGroup.findByGroupId(groupId);
		return menuGroup;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		MenuGroup menuGroup = new MenuGroup();
		model.addAttribute("menuGroup", menuGroup);
		return "admin/menu/editgroup";
	}

	@RequestMapping("/find")
	@ResponseBody
	public PageInfo<MenuGroup> findMenuGroup(HttpServletRequest request, HttpServletResponse response, int pageNumber,
			int pageSize) {
		Page<MenuGroup> menuGroups = iMenuGroup.findPage(pageNumber, pageSize);
		PageInfo<MenuGroup> pageInfo = new PageInfo<>(menuGroups);
		return pageInfo;
	}

	@RequestMapping("/delete/{groupId}")
	public void deleteMenuGroup(HttpServletRequest request, HttpServletResponse response) {

	}

	@RequestMapping(value = "/edit/{groupId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String groupId) {
		MenuGroup menuGroup = iMenuGroup.findByGroupId(new Integer(groupId));
		model.addAttribute("menuGroup", menuGroup);
		return "admin/menu/editgroup";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response, MenuGroup menuGroup, Model model) throws IOException {
		if (menuGroup.getGroupId() != null) {
			iMenuGroup.updateMenuGroup(menuGroup);
		} else {
			iMenuGroup.addMenuGroup(menuGroup);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}
