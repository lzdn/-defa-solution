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

import com.defa.iservice.dict.IDict;
import com.defa.iservice.product.IProduct;
import com.defa.iservice.product.IProductBrand;
import com.defa.iservice.product.IProductDetail;
import com.defa.iservice.product.IProductImg;
import com.defa.iservice.product.IProductKind;
import com.defa.manage.web.BaseController;
import com.defa.model.center.Product;
import com.defa.model.center.ProductBrand;
import com.defa.model.center.ProductDetail;
import com.defa.model.center.ProductImg;
import com.defa.model.center.ProductKind;
import com.defa.model.core.Dict;
import com.defa.utils.common.Result;
import com.defa.utils.common.StringExtention;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("product")
public class ProductController extends BaseController {

	@Autowired
	private IProduct iProduct;
	
	@Autowired
	private IProductBrand iProductBrand;

	@Autowired
	private IProductKind iProductKind;
	
	@Autowired
	private IProductDetail iProductDetail;
	
	@Autowired
	private IProductImg iProductImg;
	
	@Autowired
	private IDict iDict;
	
	@RequestMapping("main")
	public String main(HttpServletRequest request, HttpServletResponse response) {
		return "admin/product/main";
	}

	@RequestMapping("find")
	@ResponseBody
	public PageInfo<Product> findProduct(HttpServletRequest request, HttpServletResponse response, int pageNumber,
			int pageSize) {
		Page<Product> products = iProduct.findPage(pageNumber, pageSize);
		PageInfo<Product> pageInfo = new PageInfo<>(products);
		return pageInfo;
	}

	@RequestMapping(value = "/{productId}", method = RequestMethod.GET)
	@ResponseBody
	public Product get(HttpServletResponse response, @PathVariable Integer productId) {
		Product product = iProduct.findByProductId(productId);
		return product;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(HttpServletResponse response, Model model) throws IOException {
		Product product = new Product();
		model.addAttribute("product", product);
		ProductDetail detail =  product.getDetail()==null?new ProductDetail():product.getDetail();
		model.addAttribute("detail", detail);
		List<ProductBrand> list = iProductBrand.findAll();
		model.addAttribute("brands", list);
		List<ProductKind> kinds = iProductKind.findAll();
		model.addAttribute("kinds", kinds);
		List<Dict> periods =  iDict.findDictByCode("period_type");
		List<Dict> sellingModes =  iDict.findDictByCode("selling_mode");
		List<Dict> units =  iDict.findDictByCode("unit_code");
		model.addAttribute("periods", periods);
		model.addAttribute("sellingModes", sellingModes);
		model.addAttribute("units", units);
		return "admin/product/edit";
	}

	@RequestMapping(value = "/edit/{productId}", method = RequestMethod.GET)
	public String edit(HttpServletResponse response, Model model, @PathVariable String productId) {
		Product product = iProduct.findByProductId(new Integer(productId));
		model.addAttribute("product", product);
		ProductDetail detail = iProductDetail.findByProductId(product.getProductId());
		detail =  detail==null?new ProductDetail():detail;
		model.addAttribute("detail", detail);
		List<ProductImg> images = iProductImg.findAllByProductId(product.getProductId());
		model.addAttribute("images", images);
		List<ProductBrand> list = iProductBrand.findAll();
		model.addAttribute("brands", list);
		List<ProductKind> kinds = iProductKind.findAll();
		model.addAttribute("kinds", kinds);
		List<Dict> periods =  iDict.findDictByCode("period_type");
		List<Dict> sellingModes =  iDict.findDictByCode("selling_mode");
		List<Dict> units =  iDict.findDictByCode("unit_code");
		
		model.addAttribute("periods", periods);
		model.addAttribute("sellingModes", sellingModes);
		model.addAttribute("units", units);
		return "admin/product/edit";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public void save(HttpServletResponse response, Product product,ProductDetail detail
			,String isCover,String imgUrl,String imageName) throws IOException {
		
		product.setDetail(detail);
		
		if(StringExtention.isNotEmpty(isCover)) {
			product.setImageUrl(isCover);
		}
		
		if(StringExtention.isNotEmpty(imgUrl)) {
			List<ProductImg> imgs = new ArrayList<ProductImg>();
			String []array = imgUrl.split(",");
			String []names = imageName.split(",");
			int i = 0;
			for (String img : array) {
				ProductImg pimg = new ProductImg();
				pimg.setImageUrl(img);
				pimg.setOrderBy((i+1));
				pimg.setImageName(names[i]);
				imgs.add(pimg);
				i++;
			}
			product.setImgs(imgs);
		}
		
		if (product.getProductId() != null) {
			iProduct.updateProduct(product);
		} else {
			iProduct.addProduct(product);
		}
		Result result = new Result(1, "保存成功，请刷新后再查看");
		writeJSON(response, result);
	}
}
