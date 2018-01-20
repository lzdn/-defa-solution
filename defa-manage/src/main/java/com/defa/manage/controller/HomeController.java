package com.defa.manage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.defa.manage.web.BaseController;

@Controller
public class HomeController extends BaseController {

	@RequestMapping("index")
	public String toIndex(HttpServletRequest request, HttpServletResponse response){
		return "admin/index";
	}
	
	@RequestMapping("home")
	public String toHome(HttpServletRequest request, HttpServletResponse response){
		return "admin/home";
	}
	
	@RequestMapping("test")
	public String test(HttpServletRequest request, HttpServletResponse response){
		return "admin/test";
	}
}
