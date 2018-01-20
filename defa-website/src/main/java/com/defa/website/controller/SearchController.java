package com.defa.website.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.defa.website.web.BaseController;

@Controller
@RequestMapping("search")
public class SearchController extends BaseController{

	@RequestMapping("index")
	public String index(HttpServletRequest request, HttpServletResponse response) {
		return "page/search";
	}
}
