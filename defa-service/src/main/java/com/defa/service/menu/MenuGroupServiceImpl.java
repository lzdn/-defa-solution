package com.defa.service.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.defa.data.core.MenuGroupMapper;
import com.defa.iservice.menu.IMenuGroup;
import com.defa.iservice.right.IRight;
import com.defa.model.core.Menu;
import com.defa.model.core.MenuGroup;
import com.defa.model.core.Right;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class MenuGroupServiceImpl implements IMenuGroup {

	
	@Autowired
	private MenuGroupMapper menuGroupMapper;
	
	@Autowired
	IRight iRight;

	@Override
	public Page<MenuGroup> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return menuGroupMapper.findPage();
	}

	@Override
	public MenuGroup findByGroupId(Integer groupId) {
		return menuGroupMapper.selectByPrimaryKey(groupId);
	}

	@Override
	public List<MenuGroup> findAll() {
		return menuGroupMapper.findAll();
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int updateMenuGroup(MenuGroup menuGroup) {
		return menuGroupMapper.updateByPrimaryKeySelective(menuGroup);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int addMenuGroup(MenuGroup menuGroup) {
		return menuGroupMapper.insertSelective(menuGroup);
	}

	@Override
	public List<MenuGroup> findMenuGroupRights(Map<String, Object> map) {
		List<MenuGroup>  menuGroups = menuGroupMapper.findMenuGroupRights(map);
		if(!CollectionUtils.isEmpty(menuGroups)) {
			for (MenuGroup menuGroup : menuGroups) {
				List<Menu> menus = menuGroup.getMenus();
				if(!CollectionUtils.isEmpty(menus)) {
					for (Menu menu : menus) {
						Right right = menu.getRight();
						if(right!=null) {
							Map<String, Object> temp = new HashMap<String, Object>();
							temp.put("roleId", map.get("roleId"));
							temp.put("rightId", right.getRightId());
							List<Right> subRights = iRight.findChildrenRights(temp);
							right.setSubRights(subRights);
						}
					}
				}
			}
		}
		return menuGroups;
	}
 

}
