package com.defa.iservice.right;

import java.util.List;
import java.util.Map;

import com.defa.model.core.Right;
import com.defa.model.core.RightRequest;
import com.defa.model.core.RightResponse;
import com.github.pagehelper.Page;

 

public interface IRight {

	RightResponse<Right> findSplitPage(RightRequest rightRequest);
	
	Page<Right> findPage(int pageNo, int pageSize);

	Right findByRightId(Integer rightId);

	List<Right> findAll();
	
	int updateRight(Right right);
	
	int addRight(Right right);
	
	List<Right> findChildrenRights(Map<String,Object> map);
	
}
