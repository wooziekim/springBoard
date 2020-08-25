package com.spring.users.service.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.spring.users.vo.UsersVo;

public interface UsersService {
	public Map<String, Object> isExistId(String inputId);
	public void addUser(UsersVo usersVo);
	public void validUser(UsersVo usersVo, HttpSession session, 
			ModelAndView mView);
}








