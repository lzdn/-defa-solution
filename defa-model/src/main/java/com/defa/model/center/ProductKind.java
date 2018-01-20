package com.defa.model.center;

public class ProductKind {
    private Integer productKindId;

    private String productKindName;

    private String description;

    private Integer status;

    public Integer getProductKindId() {
        return productKindId;
    }

    public void setProductKindId(Integer productKindId) {
        this.productKindId = productKindId;
    }

    public String getProductKindName() {
        return productKindName;
    }

    public void setProductKindName(String productKindName) {
        this.productKindName = productKindName == null ? null : productKindName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}