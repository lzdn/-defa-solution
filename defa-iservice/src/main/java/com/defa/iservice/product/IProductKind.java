package com.defa.iservice.product;

import java.util.List;

import com.defa.model.center.ProductKind;
import com.github.pagehelper.Page;

public interface IProductKind {

	Page<ProductKind> findPage(int pageNo, int pageSize);

	ProductKind findByProductKindId(Integer productKindId);

	List<ProductKind> findAll();

	int updateProductKind(ProductKind productKind);

	int addProductKind(ProductKind productKind);
}
