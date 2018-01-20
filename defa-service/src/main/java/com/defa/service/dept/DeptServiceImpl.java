package com.defa.service.dept;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.defa.data.core.DeptMapper;
import com.defa.iservice.dept.IDept;
import com.defa.model.core.Dept;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class DeptServiceImpl implements IDept {
	@Autowired
	private DeptMapper deptMapper;

	@Override
	public Page<Dept> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return deptMapper.findPage();
	}

	@Override
	public Dept findByDeptId(Integer deptId) {
		// TODO Auto-generated method stub
		return deptMapper.selectByPrimaryKey(deptId);
	}

	@Override
	public List<Dept> findAll() {
		// TODO Auto-generated method stub
		return deptMapper.findAll();
	}

	@Override
	public int updateDept(Dept dept) {
		// TODO Auto-generated method stub
		return deptMapper.updateByPrimaryKeySelective(dept);
	}

	@Override
	public int addDept(Dept dept) {
		// TODO Auto-generated method stub
		return deptMapper.insertSelective(dept);
	}
}
