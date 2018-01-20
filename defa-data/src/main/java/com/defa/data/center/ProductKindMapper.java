package com.defa.data.center;

import java.util.List;

import com.defa.model.center.ProductKind;
import com.github.pagehelper.Page;

public interface ProductKindMapper {
	int deleteByPrimaryKey(Integer productKindId);

	int insert(ProductKind record);

	int insertSelective(ProductKind record);

	ProductKind selectByPrimaryKey(Integer productKindId);

	int updateByPrimaryKeySelective(ProductKind record);

	int updateByPrimaryKey(ProductKind record);

	Page<ProductKind> findPage();

	List<ProductKind> findAll();
}