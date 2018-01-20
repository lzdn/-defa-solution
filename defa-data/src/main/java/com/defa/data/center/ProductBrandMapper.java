package com.defa.data.center;

import java.util.List;

import com.defa.model.center.ProductBrand;
import com.github.pagehelper.Page;

public interface ProductBrandMapper {
	int deleteByPrimaryKey(Integer productBrandId);

	int insert(ProductBrand record);

	int insertSelective(ProductBrand record);

	ProductBrand selectByPrimaryKey(Integer productBrandId);

	int updateByPrimaryKeySelective(ProductBrand record);

	int updateByPrimaryKey(ProductBrand record);

	Page<ProductBrand> findPage();

	List<ProductBrand> findAll();
}