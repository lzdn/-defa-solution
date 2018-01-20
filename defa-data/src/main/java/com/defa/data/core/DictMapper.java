package com.defa.data.core;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.defa.model.core.Dict;
import com.github.pagehelper.Page;

public interface DictMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Dict record);

    int insertSelective(Dict record);

    Dict selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Dict record);

    int updateByPrimaryKey(Dict record);
    
    Page<Dict> findPage();

	List<Dict> findAll();
	
	List<Dict> findDictByCode(@Param("dictCode") String dictCode);
}