package com.spring.users.dao.impl;

import com.spring.users.vo.UsersVo;

public interface UsersDao {
	public boolean isExist(String inputId);
	public void insert(UsersVo usersVo);
	public String getPwdHash(String inputId);
	public UsersVo getData(String id);
	
}
