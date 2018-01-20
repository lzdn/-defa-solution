package com.defa.data.core;

import com.defa.model.core.RightSub;

public interface RightSubMapper {
    int deleteByPrimaryKey(Integer subId);

    int insert(RightSub record);

    int insertSelective(RightSub record);

    RightSub selectByPrimaryKey(Integer subId);

    int updateByPrimaryKeySelective(RightSub record);

    int updateByPrimaryKey(RightSub record);
    
    int deleteBySub(RightSub record);
    
    int updateBySub(RightSub record);
}