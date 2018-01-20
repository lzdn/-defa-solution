package com.defa.iservice.menu;

import java.util.List;

import com.defa.model.core.Menu;
import com.github.pagehelper.Page;

public interface IMenu {

	Page<Menu> findPage(int pageNo, int pageSize);

	Menu findByMenuId(Integer menuId);

	List<Menu> findAll();
	
	int updateMenu(Menu menu);
	
	int addMenu(Menu menu);
}
