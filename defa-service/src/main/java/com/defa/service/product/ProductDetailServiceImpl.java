package com.defa.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.defa.data.center.ProductDetailMapper;
import com.defa.iservice.product.IProductDetail;
import com.defa.model.center.ProductDetail;
import com.github.pagehelper.Page;

@Service
public class ProductDetailServiceImpl implements IProductDetail {

	@Autowired
	private ProductDetailMapper productDetailMapper;
	@Override
	public Page<ProductDetail> findPage(int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductDetail findByProductDetailId(Integer productDetailId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDetail> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateProductDetail(ProductDetail productDetail) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addProductDetail(ProductDetail productDetail) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ProductDetail findByProductId(Integer productId) {
		// TODO Auto-generated method stub
		return productDetailMapper.selectByProductId(productId);
	}

}
