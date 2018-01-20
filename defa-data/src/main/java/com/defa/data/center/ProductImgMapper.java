package com.defa.data.center;

import java.util.List;

import com.defa.model.center.ProductImg;

public interface ProductImgMapper {
	int deleteByPrimaryKey(Integer productImgId);

	int insert(ProductImg record);

	int insertSelective(ProductImg record);

	ProductImg selectByPrimaryKey(Integer productImgId);

	int updateByPrimaryKeySelective(ProductImg record);

	int updateByPrimaryKey(ProductImg record);

	List<ProductImg> selectByProductId(Integer productId);

	int deleteByProductId(Integer productId);
}