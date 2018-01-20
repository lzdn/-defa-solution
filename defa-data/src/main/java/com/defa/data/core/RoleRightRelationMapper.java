package com.defa.data.core;

import java.util.List;

import com.defa.model.core.RoleRightRelationKey;

public interface RoleRightRelationMapper {
    int deleteByPrimaryKey(RoleRightRelationKey key);

    int insert(RoleRightRelationKey record);

    int insertSelective(RoleRightRelationKey record);
    
    int insertBatch(List<RoleRightRelationKey> list);
    
    int deleteByRoleId(Integer roleId);
}