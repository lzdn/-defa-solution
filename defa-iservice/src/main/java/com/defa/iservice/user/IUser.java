package com.defa.iservice.user;

import java.util.List;

import com.defa.model.core.User;
import com.defa.model.core.UserRoleRelationKey;
import com.github.pagehelper.Page;

public interface IUser {

	List<User> findAll();

	int addUser(User user);

	User login(User user) throws Exception;

	User userRightByUserId(Integer userId);

	void deleteUserCache(Integer userId);
	
	Page<User> findPage(int pageNo, int pageSize);
	
	int updateUser(User user);
	
	User findByUserId(Integer userId);
	
	int insertBatch(List<UserRoleRelationKey> list);
	
}
