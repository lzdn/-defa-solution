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

import com.defa.iservice.product.IProductKind;
import com.defa.manage.web.BaseController;
import com.defa.model.center.ProductKind;
import com.defa.utils.common.Result;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("kind")
public class ProductKindController extends BaseController {

	@Autowired
	private IProductKind iProductKind;

	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/product/kind";
	}

	@RequestMapping("find")
	@ResponseBody
	public PageInfo<ProductKind> findProductKind(HttpServletRequest request, HttpServletResponse response,
			int pageNumber, int pageSize) {
		Page<ProductKind> kinds = iProductKind.findPage(pageNumber, pageSize);
		PageInfo<ProductKind> pageInfo = new PageInfo<>(kinds);
		return pageInfo;
	}

	@RequestMapping(value = "/{productKindId}", method = RequestMethod.GET)
	@ResponseBody
	public ProductKind get(HttpServletResponse response, @PathVariable Integer productKindId) {
		ProductKind kind = iProductKind.findByProductKindId(productKindId);
		return kind;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		ProductKind kind = new ProductKind();
		model.addAttribute("kind", kind);
		return "admin/product/editkind";
	}

	@RequestMapping(value = "/edit/{productKindId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String productKindId) {
		ProductKind kind = iProductKind.findByProductKindId(new Integer(productKindId));
		model.addAttribute("kind", kind);
		return "admin/product/editkind";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response, ProductKind kind) throws IOException {
		if (kind.getProductKindId() != null) {
			iProductKind.updateProductKind(kind);
		} else {
			iProductKind.addProductKind(kind);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}
