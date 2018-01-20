package com.defa.service.right;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.defa.data.core.RightMapper;
import com.defa.iservice.right.IRight;
import com.defa.iservice.role.IRole;
import com.defa.model.core.Right;
import com.defa.model.core.RightRequest;
import com.defa.model.core.RightResponse;
import com.defa.model.core.RoleRightRelationKey;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class RightServiceImpl implements IRight {

	@Autowired
	private RightMapper rightMapper;

	@Autowired
	private IRole iRole;

	@Override
	public Page<Right> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return rightMapper.findPage();
	}

	@Override
	public RightResponse<Right> findSplitPage(RightRequest rightRequest) {
		RightResponse<Right> response = new RightResponse<Right>();
		Map<String,Object> map = new HashMap<String,Object>();
		
		PageHelper.startPage(rightRequest.getPageNumber(), rightRequest.getPageSize());
		String searchText = rightRequest.getSearchText();
		
		if(StringUtils.isNotEmpty(searchText)) {
			map.put("rightName", searchText);
		}
		
		Page<Right> pages = rightMapper.findSplitPage(map);
		
		PageInfo<Right> pageInfo = new PageInfo<>(pages);
		response.setPageInfo(pageInfo);
		
		return response;
	}

	@Override
	public Right findByRightId(Integer rightId) {
		return rightMapper.selectByPrimaryKey(rightId);
	}

	@Override
	public List<Right> findAll() {
		return rightMapper.findAll();
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int updateRight(Right right) {
		return rightMapper.updateByPrimaryKeySelective(right);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int addRight(Right right) {
		int i = rightMapper.insertSelective(right);
		List<RoleRightRelationKey> list = new ArrayList<RoleRightRelationKey>();
		RoleRightRelationKey key = new RoleRightRelationKey();
		key.setRightId(right.getRightId());
		key.setRoleId(1);
		list.add(key);
		iRole.adminRoleAddRight(list);// 新增权限时默认给超级管理员增加权限
		return i;
	}

	@Override
	public List<Right> findChildrenRights(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return rightMapper.findChildrenRights(map);
	}

}
