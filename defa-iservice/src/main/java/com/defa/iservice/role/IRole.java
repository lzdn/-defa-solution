package com.defa.iservice.role;

import java.util.List;
 
import com.defa.model.core.Role;
import com.defa.model.core.RoleRightRelationKey;
import com.github.pagehelper.Page;

public interface IRole {

	Page<Role> findPage(int pageNo, int pageSize);
	
	Role findByRoleId(Integer roleId);

	List<Role> findAll();
	
	int updateRole(Role role);
	
	int addRole(Role role);
	
	int insertBatch(List<RoleRightRelationKey> list);
	
	int deleteByRoleId(Integer roleId);
	
	int adminRoleAddRight(List<RoleRightRelationKey> list);
	
}
