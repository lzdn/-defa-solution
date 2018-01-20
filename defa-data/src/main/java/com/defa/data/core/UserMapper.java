package com.defa.data.core;

import java.util.List;

import org.apache.ibatis.annotations.SelectProvider;

import com.defa.model.core.User;
import com.defa.utils.sql.UserSqlProvide;
import com.github.pagehelper.Page;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
	@SelectProvider(type = UserSqlProvide.class, method = "getUserAll")
	List<User> findAll();

	User login(User record);
	
	User getUserRightByUserId(Integer userId);
	
	Page<User> findPage();
}