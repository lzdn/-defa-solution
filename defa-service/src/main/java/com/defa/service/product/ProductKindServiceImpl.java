package com.defa.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.defa.data.center.ProductKindMapper;
import com.defa.iservice.product.IProductKind;
import com.defa.model.center.ProductKind;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class ProductKindServiceImpl implements IProductKind {

	@Autowired
	private ProductKindMapper productKindMapper;
	
	@Override
	public Page<ProductKind> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return productKindMapper.findPage();
	}

	@Override
	public ProductKind findByProductKindId(Integer productKindId) {
		return productKindMapper.selectByPrimaryKey(productKindId);
	}

	@Override
	public List<ProductKind> findAll() {
		return productKindMapper.findAll();
	}

	@Override
	public int updateProductKind(ProductKind productKind) {
		return productKindMapper.updateByPrimaryKeySelective(productKind);
	}

	@Override
	public int addProductKind(ProductKind productKind) {
		return productKindMapper.insertSelective(productKind);
	}

}
