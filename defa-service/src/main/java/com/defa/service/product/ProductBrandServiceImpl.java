package com.defa.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.defa.data.center.ProductBrandMapper;
import com.defa.iservice.product.IProductBrand;
import com.defa.model.center.ProductBrand;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class ProductBrandServiceImpl implements IProductBrand {

	@Autowired
	private ProductBrandMapper productBrandMapper ;
	
	@Override
	public Page<ProductBrand> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return productBrandMapper.findPage();
	}

	@Override
	public ProductBrand findByProductBrandId(Integer productBrandId) {
		return productBrandMapper.selectByPrimaryKey(productBrandId);
	}

	@Override
	public List<ProductBrand> findAll() {
		return productBrandMapper.findAll();
	}

	@Override
	public int updateProductBrand(ProductBrand productBrand) {
		return productBrandMapper.updateByPrimaryKeySelective(productBrand);
	}

	@Override
	public int addProductBrand(ProductBrand productBrand) {
		return productBrandMapper.insertSelective(productBrand);
	}

}
