package com.defa.iservice.product;

import java.util.List;

import com.defa.model.center.ProductImg;
import com.github.pagehelper.Page;

public interface IProductImg {

	Page<ProductImg> findPage(int pageNo, int pageSize);

	ProductImg findByProductImgId(Integer productImgId);

	List<ProductImg> findAll();

	int updateProductImg(ProductImg productImg);

	int addProductImg(ProductImg productImg);
	
	List<ProductImg> findAllByProductId(Integer productId);
}
