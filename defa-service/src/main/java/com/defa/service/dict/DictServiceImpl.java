package com.defa.service.dict;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.defa.data.core.DictMapper;
import com.defa.iservice.dict.IDict;
import com.defa.model.core.Dict;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Service
public class DictServiceImpl implements IDict {
	
	@Autowired
	private DictMapper dictMapper;

	@Override
	public Page<Dict> findPage(int pageNo, int pageSize) {
		PageHelper.startPage(pageNo, pageSize);
		return dictMapper.findPage();
	}

	@Override
	public Dict findById(Integer id) {
		return dictMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Dict> findAll() {
		return dictMapper.findAll();
	}

	@Override
	public int updateDict(Dict dict) {
		return dictMapper.updateByPrimaryKeySelective(dict);
	}

	@Override
	public int addDict(Dict dict) {
		return dictMapper.insertSelective(dict);
	}

	@Override
	public List<Dict> findDictByCode(String code) {
		return dictMapper.findDictByCode(code);
	}

}
