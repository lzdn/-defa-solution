package com.defa.model.center;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Product {
	private Integer productId;

	private Integer productKindId;

	private Integer productBrandId;

	private String productName;

	private Integer channelId;

	private String imageUrl;

	private BigDecimal price;

	private Integer stock;

	private String description;

	private Integer score;

	private Integer pushType;

	private Integer isPutaway;

	private Integer status;

	private Date createTime;

	private Date updateTime;

	private ProductDetail detail;
	private List<ProductImg> imgs;

	public List<ProductImg> getImgs() {
		return imgs;
	}

	public void setImgs(List<ProductImg> imgs) {
		this.imgs = imgs;
	}

	public ProductDetail getDetail() {
		return detail;
	}

	public void setDetail(ProductDetail detail) {
		this.detail = detail;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getProductKindId() {
		return productKindId;
	}

	public void setProductKindId(Integer productKindId) {
		this.productKindId = productKindId;
	}

	public Integer getProductBrandId() {
		return productBrandId;
	}

	public void setProductBrandId(Integer productBrandId) {
		this.productBrandId = productBrandId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName == null ? null : productName.trim();
	}

	public Integer getChannelId() {
		return channelId;
	}

	public void setChannelId(Integer channelId) {
		this.channelId = channelId;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl == null ? null : imageUrl.trim();
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description == null ? null : description.trim();
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public Integer getPushType() {
		return pushType;
	}

	public void setPushType(Integer pushType) {
		this.pushType = pushType;
	}

	public Integer getIsPutaway() {
		return isPutaway;
	}

	public void setIsPutaway(Integer isPutaway) {
		this.isPutaway = isPutaway;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}