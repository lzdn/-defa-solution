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

import com.defa.iservice.dept.IDept;
import com.defa.manage.web.BaseController;
import com.defa.model.core.Dept;
import com.defa.utils.common.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
 

@Controller
@RequestMapping("dept")
public class DeptController extends BaseController {

	@Autowired
	private IDept iDept;

	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/dept/main";
	}

	@RequestMapping(value = "/{deptId}", method = RequestMethod.GET)
	@ResponseBody
	public Dept get(HttpServletResponse response, @PathVariable Integer deptId) {
		Dept department = iDept.findByDeptId(deptId);
		return department;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		List<Dept> depts = iDept.findAll();
		Dept department = new Dept();
		model.addAttribute("department", department);
		model.addAttribute("depts", depts);
		return "admin/dept/edit";
	}

	@RequestMapping("find")
	@ResponseBody
	public PageInfo<Dept> findDept(HttpServletRequest request, HttpServletResponse response, int pageNumber,
			int pageSize) {
		String searchText = request.getParameter("searchText");
		System.out.println(searchText);
		Page<Dept> depts = iDept.findPage(pageNumber, pageSize);
		PageInfo<Dept> pageInfo = new PageInfo<>(depts);
		return pageInfo;
	}

	@RequestMapping("delete")
	public void deleteDept(HttpServletRequest request, HttpServletResponse response) {

	}

	@RequestMapping(value = "/edit/{deptId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String deptId) {
		Dept department = iDept.findByDeptId(new Integer(deptId));
		model.addAttribute("department", department);
		List<Dept> depts = iDept.findAll();
		model.addAttribute("depts", depts);
		return "admin/dept/edit";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response,Dept department) throws IOException {
		if (department.getDeptId()!= null) {
			iDept.updateDept(department);
			
		} else {
			iDept.addDept(department);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}
