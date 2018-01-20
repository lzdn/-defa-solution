package com.defa.utils.sql;

import org.apache.ibatis.jdbc.SQL;

public class UserSqlProvide {

	public String getUserAll() {
		return new SQL() {
			{
				this.SELECT("*").FROM("user");
			}
		}.toString();
	}
}
