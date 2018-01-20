package com.defa.data.core;

import java.util.List;
import java.util.Map;

import com.defa.model.core.MenuGroup;
import com.github.pagehelper.Page;

public interface MenuGroupMapper {
    int deleteByPrimaryKey(Integer groupId);

    int insert(MenuGroup record);

    int insertSelective(MenuGroup record);

    MenuGroup selectByPrimaryKey(Integer groupId);

    int updateByPrimaryKeySelective(MenuGroup record);

    int updateByPrimaryKey(MenuGroup record);
    
    List<MenuGroup> getMenuGroupByUserId(Integer userId);
    
	Page<MenuGroup> findPage();

	List<MenuGroup> findAll();
	
	List<MenuGroup> findMenuGroupRights(Map<String,Object> map);
}