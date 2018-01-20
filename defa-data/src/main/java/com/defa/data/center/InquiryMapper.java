package com.defa.data.center;

import com.defa.model.center.Inquiry;

public interface InquiryMapper {
    int deleteByPrimaryKey(Integer inquiryId);

    int insert(Inquiry record);

    int insertSelective(Inquiry record);

    Inquiry selectByPrimaryKey(Integer inquiryId);

    int updateByPrimaryKeySelective(Inquiry record);

    int updateByPrimaryKey(Inquiry record);
}