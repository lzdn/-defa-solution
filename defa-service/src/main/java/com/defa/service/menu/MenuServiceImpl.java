package com.defa.service.menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.defa.data.core.MenuMapper;
import com.defa.iservice.menu.IMenu;
import com.defa.model.core.Menu;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class MenuServiceImpl implements IMenu {

	@Autowired
	private MenuMapper menuMapper ;
	@Override
	public Page<Menu> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return menuMapper.findPage();
	}

	@Override
	public Menu findByMenuId(Integer menuId) {
		// TODO Auto-generated method stub
		return menuMapper.selectByPrimaryKey(menuId);
	}

	@Override
	public List<Menu> findAll() {
		// TODO Auto-generated method stub
		return menuMapper.findAll();
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int updateMenu(Menu menu) {
		// TODO Auto-generated method stub
		return menuMapper.updateByPrimaryKeySelective(menu);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int addMenu(Menu menu) {
		// TODO Auto-generated method stub
		return menuMapper.insertSelective(menu);
	}

}
