package com.defa.iservice.menu;

import java.util.List;
import java.util.Map;

import com.defa.model.core.MenuGroup;
import com.github.pagehelper.Page;

public interface IMenuGroup {

	Page<MenuGroup> findPage(int pageNo, int pageSize);

	MenuGroup findByGroupId(Integer groupId);

	List<MenuGroup> findAll();
	
	int updateMenuGroup(MenuGroup menuGroup);
	
	int addMenuGroup(MenuGroup menuGroup);
	
	List<MenuGroup> findMenuGroupRights(Map<String,Object> map);
}
