package com.defa.iservice.dict;

import java.util.List;

import com.defa.model.core.Dict;
import com.github.pagehelper.Page;

public interface IDict {

	Page<Dict> findPage(int pageNo, int pageSize);

	Dict findById(Integer id);

	List<Dict> findAll();

	int updateDict(Dict dict);

	int addDict(Dict dict);
	
	List<Dict> findDictByCode(String code);
}
