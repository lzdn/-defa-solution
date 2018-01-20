package com.defa.data.center;

import java.util.List;
import java.util.Map;

import com.defa.model.center.Product;
import com.github.pagehelper.Page;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer productId);

    int insert(Product record);

    int insertSelective(Product record);

    Product selectByPrimaryKey(Integer productId);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKey(Product record);
    
	Page<Product> findPage();

	List<Product> findAll();
	
	List<Product> selectProductByMap(Map<String,Object> map);
}