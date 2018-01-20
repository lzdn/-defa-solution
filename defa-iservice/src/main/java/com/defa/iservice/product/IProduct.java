package com.defa.iservice.product;

import java.util.List;

import com.defa.model.center.Product;
import com.github.pagehelper.Page;

public interface IProduct {

	Page<Product> findPage(int pageNo, int pageSize);

	Product findByProductId(Integer productId);

	List<Product> findAll();

	int updateProduct(Product product);

	int addProduct(Product product);
	
	List<Product> findProductList(Product product);
	
}
