package com.defa.data.core;

import java.util.List;

import com.defa.model.core.Menu;
import com.github.pagehelper.Page;

public interface MenuMapper {
	int deleteByPrimaryKey(Integer menuId);

	int insert(Menu record);

	int insertSelective(Menu record);

	Menu selectByPrimaryKey(Integer menuId);

	int updateByPrimaryKeySelective(Menu record);

	int updateByPrimaryKey(Menu record);

	Page<Menu> findPage();

	List<Menu> findAll();
}