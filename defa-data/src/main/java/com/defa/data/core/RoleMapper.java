package com.defa.data.core;

import java.util.List;

import com.defa.model.core.Role;
import com.github.pagehelper.Page;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    Page<Role> findPage();
    
   /* Page<Role> findSplitPage(Map<String,Object> map);*/
	
	List<Role> findAll();
}