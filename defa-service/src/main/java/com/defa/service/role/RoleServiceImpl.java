package com.defa.service.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.defa.data.core.RoleMapper;
import com.defa.data.core.RoleRightRelationMapper;
import com.defa.iservice.role.IRole;
import com.defa.model.core.Role;
import com.defa.model.core.RoleRightRelationKey;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class RoleServiceImpl implements IRole {

	@Autowired
	private RoleMapper roleMapper;
	
	@Autowired
	private RoleRightRelationMapper roleRightRelationMapper;
	
	@Override
	public Page<Role> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return roleMapper.findPage();
	}
 
	@Override
	public Role findByRoleId(Integer roleId) {
		// TODO Auto-generated method stub
		return roleMapper.selectByPrimaryKey(roleId);
	}

	@Override
	public List<Role> findAll() {
		// TODO Auto-generated method stub
		return roleMapper.findAll();
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int updateRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.updateByPrimaryKeySelective(role);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int addRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.insertSelective(role);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int insertBatch(List<RoleRightRelationKey> list) {
		if(CollectionUtils.isEmpty(list)) {
			return 0;
		}
		roleRightRelationMapper.deleteByRoleId(list.get(0).getRoleId());
		return roleRightRelationMapper.insertBatch(list);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int deleteByRoleId(Integer roleId) {
		// TODO Auto-generated method stub
		return roleRightRelationMapper.deleteByRoleId(roleId);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int adminRoleAddRight(List<RoleRightRelationKey> list) {
		// TODO Auto-generated method stub
		return roleRightRelationMapper.insertBatch(list);
	}

}
