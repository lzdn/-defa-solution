package com.defa.service.user;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.defa.data.core.DeptMapper;
import com.defa.data.core.MenuGroupMapper;
import com.defa.data.core.UserMapper;
import com.defa.data.core.UserRoleRelationMapper;
import com.defa.iservice.cache.IRedis;
import com.defa.iservice.user.IUser;
import com.defa.model.core.Dept;
import com.defa.model.core.MenuGroup;
import com.defa.model.core.User;
import com.defa.model.core.UserRoleRelationKey;
import com.defa.utils.exception.BusinessException;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class UserServiceImpl implements IUser {

	@Autowired
	private UserMapper userMapper;

	@Autowired
	private DeptMapper deptMapper;

	@Autowired
	private MenuGroupMapper menuGroupMapper;
	
	@Autowired
	private UserRoleRelationMapper userRoleRelationMapper;

	@Autowired
	private IRedis iRedis;
	
	

	private static final String cache_prefix = "Current[user]-";

	@Override
	public List<User> findAll() {
		return userMapper.findAll();
	}

	// 事物测试 如果不指定事物名称 则默认对@Primary 数据库进行事物管理 所以一般最好都指定一下事物名称
	@Override
	@Transactional(value = "coreTransactionManager")
	public int addUser(User user) {
		user.setCreateTime(new Date());
		user.setStatus(1);
		return userMapper.insert(user);
	}

	@Override
	public User login(User user) throws Exception {

		if (StringUtils.isEmpty(user.getAccount())) {
			throw new BusinessException("帐号不能为空");
		}
		if (StringUtils.isEmpty(user.getPassword())) {
			throw new BusinessException("密码不能为空");
		}
		user = userMapper.login(user);
		if (user != null) {
			String key = cache_prefix + user.getUserId();
			if (!iRedis.exists(key)) {
				user = userMapper.getUserRightByUserId(user.getUserId());
				Dept dept = deptMapper.selectByPrimaryKey(user.getDeptId());
				user.setDept(dept);
				List<MenuGroup> menuGroups = menuGroupMapper.getMenuGroupByUserId(user.getUserId());
				user.setMenuGroups(menuGroups);
				iRedis.set(key, user, new Long(60 * 60));
			} else {
				user = (User) iRedis.get(key);
			}
		}
		return user;
	}

	@Override
	public User userRightByUserId(Integer userId) {
		User user = userMapper.selectByPrimaryKey(userId);
		if (user != null) {
			String key = cache_prefix + user.getUserId();
			if (!iRedis.exists(key)) {
				user = userMapper.getUserRightByUserId(user.getUserId());
				Dept dept = deptMapper.selectByPrimaryKey(user.getDeptId());
				user.setDept(dept);
				List<MenuGroup> menuGroups = menuGroupMapper.getMenuGroupByUserId(user.getUserId());
				user.setMenuGroups(menuGroups);
				iRedis.set(key, user, new Long(60 * 60));
			} else {
				user = (User) iRedis.get(key);
			}
		}
		return user;
	}

	@Override
	public void deleteUserCache(Integer userId) {
		String key = cache_prefix + userId;
		if (iRedis.exists(key)) {
			iRedis.remove(key);
		}
	}

	@Override
	public Page<User> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return userMapper.findPage();
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public User findByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int insertBatch(List<UserRoleRelationKey> list) {
		if(CollectionUtils.isEmpty(list)) {
			return 0;
		}
		userRoleRelationMapper.deleteByUserId(list.get(0).getUserId());
		return userRoleRelationMapper.insertBatch(list);
	}

}
