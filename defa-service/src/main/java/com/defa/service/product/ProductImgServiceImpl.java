package com.defa.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.defa.data.center.ProductImgMapper;
import com.defa.iservice.product.IProductImg;
import com.defa.model.center.ProductImg;
import com.github.pagehelper.Page;

@Service
public class ProductImgServiceImpl implements IProductImg {

	@Autowired
	private ProductImgMapper productImgMapper;
	@Override
	public Page<ProductImg> findPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductImg findByProductImgId(Integer productImgId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductImg> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateProductImg(ProductImg productImg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addProductImg(ProductImg productImg) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductImg> findAllByProductId(Integer productId) {
		// TODO Auto-generated method stub
		return productImgMapper.selectByProductId(productId);
	}

}
