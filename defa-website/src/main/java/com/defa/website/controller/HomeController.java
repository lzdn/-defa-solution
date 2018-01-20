package com.defa.website.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.defa.iservice.product.IProduct;
import com.defa.iservice.product.IProductKind;
import com.defa.model.center.Product;
import com.defa.model.center.ProductKind;
import com.defa.website.web.BaseController;

@Controller
@RequestMapping("home")
public class HomeController extends BaseController{

	@Autowired
	private IProduct iProduct;
	
	@Autowired
	private IProductKind iProductKind;
	
	@RequestMapping("index")
	public String index(HttpServletRequest request, HttpServletResponse response, Model model) {
		//查询新菜
		Product product = new Product();
		product.setPushType(1);
		List<Product> newProductList= iProduct.findProductList(product);
		product.setPushType(2);
		List<Product> dzProductList= iProduct.findProductList(product);
		product.setPushType(3);
		List<Product> oldProductList= iProduct.findProductList(product);
		product.setPushType(4);
		List<Product> hotProductList= iProduct.findProductList(product);
		model.addAttribute("hotProductList", hotProductList);
		model.addAttribute("newProductList", newProductList);
		model.addAttribute("dzProductList", dzProductList);
		model.addAttribute("oldProductList", oldProductList);
		
		List<ProductKind> kindList = iProductKind.findAll();
		model.addAttribute("kindList", kindList);
		return "page/index";
	}
}
