package com.defa.model.center;

import java.util.Date;

public class ProductDetail {
    private Integer productDetailId;

    private Integer productId;

    private String productPlace;

    private Date produceDate;

    private Integer productPeriod;

    private Integer sellingMode;

    private Integer storageMode;

    private String rawMaterial;

    private Integer enterPort;

    private Integer isSpecialty;

    private String licenceNo;

    private String hygieneNo;

    private String criterionNo;

    private String barCode;

    private Double unitWeight;

    private Double unitNetWeight;

    private Integer unitCode;

    private Integer unitNum;

    private Double totalWeight;

    private Double totalNetWeight;

    private Integer totalNum;

    public Integer getProductDetailId() {
        return productDetailId;
    }

    public void setProductDetailId(Integer productDetailId) {
        this.productDetailId = productDetailId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductPlace() {
        return productPlace;
    }

    public void setProductPlace(String productPlace) {
        this.productPlace = productPlace == null ? null : productPlace.trim();
    }

    public Date getProduceDate() {
        return produceDate;
    }

    public void setProduceDate(Date produceDate) {
        this.produceDate = produceDate;
    }

    public Integer getProductPeriod() {
        return productPeriod;
    }

    public void setProductPeriod(Integer productPeriod) {
        this.productPeriod = productPeriod;
    }

    public Integer getSellingMode() {
        return sellingMode;
    }

    public void setSellingMode(Integer sellingMode) {
        this.sellingMode = sellingMode;
    }

    public Integer getStorageMode() {
        return storageMode;
    }

    public void setStorageMode(Integer storageMode) {
        this.storageMode = storageMode;
    }

    public String getRawMaterial() {
        return rawMaterial;
    }

    public void setRawMaterial(String rawMaterial) {
        this.rawMaterial = rawMaterial == null ? null : rawMaterial.trim();
    }

    public Integer getEnterPort() {
        return enterPort;
    }

    public void setEnterPort(Integer enterPort) {
        this.enterPort = enterPort;
    }

    public Integer getIsSpecialty() {
        return isSpecialty;
    }

    public void setIsSpecialty(Integer isSpecialty) {
        this.isSpecialty = isSpecialty;
    }

    public String getLicenceNo() {
        return licenceNo;
    }

    public void setLicenceNo(String licenceNo) {
        this.licenceNo = licenceNo == null ? null : licenceNo.trim();
    }

    public String getHygieneNo() {
        return hygieneNo;
    }

    public void setHygieneNo(String hygieneNo) {
        this.hygieneNo = hygieneNo == null ? null : hygieneNo.trim();
    }

    public String getCriterionNo() {
        return criterionNo;
    }

    public void setCriterionNo(String criterionNo) {
        this.criterionNo = criterionNo == null ? null : criterionNo.trim();
    }

    public String getBarCode() {
        return barCode;
    }

    public void setBarCode(String barCode) {
        this.barCode = barCode == null ? null : barCode.trim();
    }

    public Double getUnitWeight() {
        return unitWeight;
    }

    public void setUnitWeight(Double unitWeight) {
        this.unitWeight = unitWeight;
    }

    public Double getUnitNetWeight() {
        return unitNetWeight;
    }

    public void setUnitNetWeight(Double unitNetWeight) {
        this.unitNetWeight = unitNetWeight;
    }

    public Integer getUnitCode() {
        return unitCode;
    }

    public void setUnitCode(Integer unitCode) {
        this.unitCode = unitCode;
    }

    public Integer getUnitNum() {
        return unitNum;
    }

    public void setUnitNum(Integer unitNum) {
        this.unitNum = unitNum;
    }

    public Double getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(Double totalWeight) {
        this.totalWeight = totalWeight;
    }

    public Double getTotalNetWeight() {
        return totalNetWeight;
    }

    public void setTotalNetWeight(Double totalNetWeight) {
        this.totalNetWeight = totalNetWeight;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }
}