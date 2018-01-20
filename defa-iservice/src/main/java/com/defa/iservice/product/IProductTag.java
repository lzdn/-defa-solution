package com.defa.iservice.product;

import java.util.List;

import com.defa.model.center.ProductTag;
import com.github.pagehelper.Page;

public interface IProductTag {

	Page<ProductTag> findPage(int pageNo, int pageSize);

	ProductTag findByTagId(Integer tagId);

	List<ProductTag> findAll();

	int updateProductTag(ProductTag productTag);

	int addProductTag(ProductTag productTag);
}
