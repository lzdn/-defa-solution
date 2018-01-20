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

import com.defa.iservice.dict.IDict;
import com.defa.manage.web.BaseController;
import com.defa.model.core.Dict;
import com.defa.utils.common.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("dict")
public class DictController extends BaseController {

	@Autowired
	private IDict iDict;

	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/dict/main";
	}

	@RequestMapping("find")
	@ResponseBody
	public PageInfo<Dict> findDict(HttpServletRequest request, HttpServletResponse response, int pageNumber,
			int pageSize) {
		Page<Dict> dicts = iDict.findPage(pageNumber, pageSize);
		PageInfo<Dict> pageInfo = new PageInfo<>(dicts);
		return pageInfo;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Dict get(HttpServletResponse response, @PathVariable Integer id) {
		Dict dict = iDict.findById(id);
		return dict;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		Dict dict = new Dict();
		model.addAttribute("dict", dict);
		return "admin/dict/edit";
	}

	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String id) {
		Dict dict = iDict.findById(new Integer(id));
		model.addAttribute("dict", dict);
		return "admin/dict/edit";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response, Dict dict) throws IOException {
		if (dict.getId() != null) {
			iDict.updateDict(dict);
		} else {
			iDict.addDict(dict);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}
