package com.defa.service.product;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.defa.data.center.ProductDetailMapper;
import com.defa.data.center.ProductImgMapper;
import com.defa.data.center.ProductMapper;
import com.defa.iservice.product.IProduct;
import com.defa.model.center.Product;
import com.defa.model.center.ProductDetail;
import com.defa.model.center.ProductImg;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class ProductServiceImpl implements IProduct {

	@Autowired
	private ProductImgMapper productImgMapper;

	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private ProductDetailMapper productDetailMapper;

	@Override
	public Page<Product> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return productMapper.findPage();
	}

	@Override
	public Product findByProductId(Integer productId) {
		return productMapper.selectByPrimaryKey(productId);
	}

	@Override
	public List<Product> findAll() {
		return productMapper.findAll();
	}

	@Override
	@Transactional(value = "centerTransactionManager")
	public int updateProduct(Product product) {
		productDetailMapper.updateByPrimaryKey(product.getDetail());
		productImgMapper.deleteByProductId(product.getProductId());
		List<ProductImg> imgs = product.getImgs();
		if(imgs!=null) {
			for (ProductImg productImg : imgs) {
				productImg.setProductId(product.getProductId());	
				productImg.setStatus(1);
				productImgMapper.insertSelective(productImg);
			}
		}
		return productMapper.updateByPrimaryKeySelective(product);
	}

	@Override
	@Transactional(value = "centerTransactionManager")
	public int addProduct(Product product) {
		ProductDetail detail = product.getDetail();
		product.setCreateTime(new Date());
		product.setUpdateTime(new Date());
		product.setStatus(1);
		int i = productMapper.insertSelective(product);
		detail.setProductId(product.getProductId());
		productDetailMapper.insertSelective(detail);
		
		List<ProductImg> imgs = product.getImgs();
		if(imgs!=null) {
			for (ProductImg productImg : imgs) {
				productImg.setProductId(product.getProductId());	
				productImg.setStatus(1);
				productImgMapper.insertSelective(productImg);
			}
		}
		return i;
	}

	@Override
	public List<Product> findProductList(Product product) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(product.getPushType()!=null) {
			map.put("pushType", product.getPushType());
		}
		return productMapper.selectProductByMap(map);
	}

}
