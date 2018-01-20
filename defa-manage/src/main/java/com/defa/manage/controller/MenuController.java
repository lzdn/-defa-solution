package com.defa.manage.controller;

import java.io.IOException;
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

import com.defa.iservice.menu.IMenu;
import com.defa.iservice.menu.IMenuGroup;
import com.defa.manage.web.BaseController;
import com.defa.model.core.Menu;
import com.defa.model.core.MenuGroup;
import com.defa.utils.common.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("menu")
public class MenuController extends BaseController {

	@Autowired
	private IMenu iMenu;
	
	@Autowired
	private IMenuGroup iMenuGroup;
	
	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/menu/main";
	}

	@RequestMapping(value = "/{menuId}", method = RequestMethod.GET)
	@ResponseBody
	public Menu get(HttpServletResponse response, @PathVariable Integer menuId) {
		Menu menu = iMenu.findByMenuId(menuId);
		return menu;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		Menu menu = new Menu();
		model.addAttribute("menu", menu);
		List<MenuGroup> menuGroups = iMenuGroup.findAll();
		model.addAttribute("menuGroups", menuGroups);
		return "admin/menu/editmenu";
	}
	
	@RequestMapping("find")
	@ResponseBody
	public PageInfo<Menu> findMenuGroup(HttpServletRequest request, HttpServletResponse response,
			int pageNumber, int pageSize) {
		Page<Menu> menu = iMenu.findPage(pageNumber, pageSize);
		PageInfo<Menu> pageInfo = new PageInfo<>(menu);
		return pageInfo;
	}
	
	@RequestMapping("delete/{menuId}")
	public void deleteMenu(HttpServletRequest request, HttpServletResponse response) {

	}
	
	@RequestMapping(value = "/edit/{menuId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String menuId) {
		Menu menu = iMenu.findByMenuId(new Integer(menuId));
		model.addAttribute("menu", menu);
		List<MenuGroup> menuGroups = iMenuGroup.findAll();
		model.addAttribute("menuGroups", menuGroups);
		return "admin/menu/editmenu";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response, Menu menu ) throws IOException {
		if (menu.getMenuId() != null) {
			iMenu.updateMenu(menu);
		} else {
			iMenu.addMenu(menu);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}
