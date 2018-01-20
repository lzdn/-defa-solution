package com.defa.iservice.dept;

import java.util.List;

import com.defa.model.core.Dept;
import com.github.pagehelper.Page;

public interface IDept {

	Page<Dept> findPage(int pageNo, int pageSize);

	Dept findByDeptId(Integer deptId);

	List<Dept> findAll();
	
	int updateDept(Dept dept);
	
	int addDept(Dept dept);
}
