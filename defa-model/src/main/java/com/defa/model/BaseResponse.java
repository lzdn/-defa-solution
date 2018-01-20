package com.defa.model;

import com.github.pagehelper.PageInfo;

public class BaseResponse<T> {

	private PageInfo<T> pageInfo;

	public PageInfo<T> getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo<T> pageInfo) {
		this.pageInfo = pageInfo;
	}
}
