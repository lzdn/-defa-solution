package com.defa.iservice.product;

import java.util.List;

import com.defa.model.center.ProductBrand;
import com.github.pagehelper.Page;

public interface IProductBrand {

	Page<ProductBrand> findPage(int pageNo, int pageSize);

	ProductBrand findByProductBrandId(Integer productBrandId);

	List<ProductBrand> findAll();

	int updateProductBrand(ProductBrand productBrand);

	int addProductBrand(ProductBrand productBrand);
}
