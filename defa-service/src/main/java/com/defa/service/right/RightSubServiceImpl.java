package com.defa.service.right;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.defa.data.core.RightSubMapper;
import com.defa.iservice.right.IRightSub;
import com.defa.model.core.RightSub;

@Service
public class RightSubServiceImpl implements IRightSub {
	
	@Autowired
	RightSubMapper rightSubMapper;

	@Override
	@Transactional(value = "coreTransactionManager")
	public int addRightSub(RightSub record) {
		// TODO Auto-generated method stub
		return rightSubMapper.insertSelective(record);
	}

	@Override
	@Transactional(value = "coreTransactionManager")
	public int updateRightSub(RightSub record) {
		// TODO Auto-generated method stub
		return rightSubMapper.updateBySub(record);
	}

}
