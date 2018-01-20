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

import com.defa.iservice.menu.IMenu;
import com.defa.iservice.right.IRight;
import com.defa.manage.web.BaseController;
import com.defa.model.core.Menu;
import com.defa.model.core.Right;
import com.defa.model.core.RightRequest;
import com.defa.model.core.RightResponse;
import com.defa.utils.common.Result;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("right")
public class RightController extends BaseController {

	@Autowired
	private IRight iRight;

	@Autowired
	private IMenu iMenu;
	
	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/right/main";
	}

	@RequestMapping("find")
	@ResponseBody
	public PageInfo<Right> findSplitPage(HttpServletRequest request, HttpServletResponse response, RightRequest rightRequest) {
		RightResponse<Right> rightResponse = iRight.findSplitPage(rightRequest);
		return rightResponse.getPageInfo();
	}

	@RequestMapping(value = "/{rightId}", method = RequestMethod.GET)
	@ResponseBody
	public Right get(HttpServletResponse response, @PathVariable Integer rightId) {
		Right right = iRight.findByRightId(rightId);
		return right;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model, Integer rightId) throws IOException {
		Right right = new Right();
		model.addAttribute("right", right);
		List<Right> rights = null;
		if (rightId != null) {
			rights = new ArrayList<Right>();
			Right peRight = iRight.findByRightId(rightId);
			rights.add(peRight);
			model.addAttribute("sub", true);
		} else {
			rights = iRight.findAll();
			model.addAttribute("sub", false);
		}
		model.addAttribute("rights", rights);
		List<Menu> menus = iMenu.findAll();
		model.addAttribute("menus", menus);
		return "admin/right/edit";
	}

	@RequestMapping(value = "/edit/{rightId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String rightId) {
		Right right = iRight.findByRightId(new Integer(rightId));
		model.addAttribute("right", right);
		List<Right> rights = iRight.findAll();
		model.addAttribute("rights", rights);
		List<Menu> menus = iMenu.findAll();
		model.addAttribute("menus", menus);
		model.addAttribute("sub", false);
		return "admin/right/edit";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response, Right right) throws IOException {
		if (right.getRightId() != null) {
			iRight.updateRight(right);

		} else {
			iRight.addRight(right);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
	// role
}
