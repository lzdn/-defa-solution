package com.defa.model.center;

import java.util.Date;

public class Customer {
    private Integer customerId;

    private String customerName;

    private String customerPwd;

    private String customerPhone;

    private String customerEmail;

    private String customerAddress;

    private String customerZipCode;

    private String customerWebchat;

    private String customerQq;

    private Integer status;

    private Date createTime;

    private Date updateTime;

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName == null ? null : customerName.trim();
    }

    public String getCustomerPwd() {
        return customerPwd;
    }

    public void setCustomerPwd(String customerPwd) {
        this.customerPwd = customerPwd == null ? null : customerPwd.trim();
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone == null ? null : customerPhone.trim();
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail == null ? null : customerEmail.trim();
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress == null ? null : customerAddress.trim();
    }

    public String getCustomerZipCode() {
        return customerZipCode;
    }

    public void setCustomerZipCode(String customerZipCode) {
        this.customerZipCode = customerZipCode == null ? null : customerZipCode.trim();
    }

    public String getCustomerWebchat() {
        return customerWebchat;
    }

    public void setCustomerWebchat(String customerWebchat) {
        this.customerWebchat = customerWebchat == null ? null : customerWebchat.trim();
    }

    public String getCustomerQq() {
        return customerQq;
    }

    public void setCustomerQq(String customerQq) {
        this.customerQq = customerQq == null ? null : customerQq.trim();
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