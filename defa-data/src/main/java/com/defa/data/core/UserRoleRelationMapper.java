package com.defa.data.core;

import java.util.List;

import com.defa.model.core.UserRoleRelationKey;

public interface UserRoleRelationMapper {
    int deleteByPrimaryKey(UserRoleRelationKey key);

    int insert(UserRoleRelationKey record);

    int insertSelective(UserRoleRelationKey record);
    
    int insertBatch(List<UserRoleRelationKey> list);
    
    int deleteByUserId(Integer userId);
}