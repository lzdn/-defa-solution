package com.defa.data.center;

import com.defa.model.center.ProductTag;

public interface ProductTagMapper {
    int deleteByPrimaryKey(Integer tagId);

    int insert(ProductTag record);

    int insertSelective(ProductTag record);

    ProductTag selectByPrimaryKey(Integer tagId);

    int updateByPrimaryKeySelective(ProductTag record);

    int updateByPrimaryKey(ProductTag record);
}