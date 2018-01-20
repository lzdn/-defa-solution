package com.defa.data.core;

import java.util.List;
import java.util.Map;

import com.defa.model.core.Right;
import com.github.pagehelper.Page;

public interface RightMapper {
	
    int deleteByPrimaryKey(Integer rightId);

    int insert(Right record);

    int insertSelective(Right record);

    Right selectByPrimaryKey(Integer rightId);

    int updateByPrimaryKeySelective(Right record);

    int updateByPrimaryKey(Right record);
    
    Page<Right> findPage();
	
	List<Right> findAll();
	//@Param("receiveUserid") int receiveUserid
	List<Right> findChildrenRights(Map<String,Object> map);
	
	Page<Right> findSplitPage(Map<String,Object> map);
	
}