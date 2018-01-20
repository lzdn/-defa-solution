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

import com.defa.iservice.product.IProductBrand;
import com.defa.manage.web.BaseController;
import com.defa.model.center.ProductBrand;
import com.defa.utils.common.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("brand")
public class ProductBrandController extends BaseController {

	@Autowired
	private IProductBrand iProductBrand;

	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/product/brand";
	}

	@RequestMapping("find")
	@ResponseBody
	public PageInfo<ProductBrand> findProductBrand(HttpServletRequest request, HttpServletResponse response,
			int pageNumber, int pageSize) {
		Page<ProductBrand> brands = iProductBrand.findPage(pageNumber, pageSize);
		PageInfo<ProductBrand> pageInfo = new PageInfo<>(brands);
		return pageInfo;
	}

	@RequestMapping(value = "/{productBrandId}", method = RequestMethod.GET)
	@ResponseBody
	public ProductBrand get(HttpServletResponse response, @PathVariable Integer productBrandId) {
		ProductBrand brand = iProductBrand.findByProductBrandId(productBrandId);
		return brand;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		ProductBrand brand = new ProductBrand();
		model.addAttribute("brand", brand);
		return "admin/product/editbrand";
	}

	@RequestMapping(value = "/edit/{productBrandId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String productBrandId) {
		ProductBrand brand = iProductBrand.findByProductBrandId(new Integer(productBrandId));
		model.addAttribute("brand", brand);
		return "admin/product/editbrand";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response, ProductBrand brand) throws IOException {
		if (brand.getProductBrandId() != null) {
			iProductBrand.updateProductBrand(brand);
		} else {
			iProductBrand.addProductBrand(brand);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}
