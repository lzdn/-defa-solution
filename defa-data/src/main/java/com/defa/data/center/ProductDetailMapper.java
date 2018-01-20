package com.defa.data.center;

import com.defa.model.center.ProductDetail;

public interface ProductDetailMapper {
    int deleteByPrimaryKey(Integer productDetailId);

    int insert(ProductDetail record);

    int insertSelective(ProductDetail record);

    ProductDetail selectByPrimaryKey(Integer productDetailId);

    int updateByPrimaryKeySelective(ProductDetail record);

    int updateByPrimaryKey(ProductDetail record);
    
    ProductDetail selectByProductId(Integer productId);
}