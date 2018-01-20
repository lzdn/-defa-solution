package com.defa.iservice.product;

import java.util.List;

import com.defa.model.center.ProductDetail;
import com.github.pagehelper.Page;

public interface IProductDetail {

	Page<ProductDetail> findPage(int pageNo, int pageSize);

	ProductDetail findByProductDetailId(Integer productDetailId);

	List<ProductDetail> findAll();

	int updateProductDetail(ProductDetail productDetail);

	int addProductDetail(ProductDetail productDetail);
	
	ProductDetail findByProductId(Integer productId);
}
