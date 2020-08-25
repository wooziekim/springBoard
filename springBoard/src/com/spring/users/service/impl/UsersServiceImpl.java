package com.spring.users.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.ws.ServiceMode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.users.dao.impl.UsersDao;
import com.spring.users.vo.UsersVo;


@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private UsersDao dao;
	//인자로 전달된 아이디가 존재하는지 여부를 Map 에 담아서 리턴하는 메소드 
	@Override
	public Map<String, Object> isExistId(String inputId) {
		boolean isExist=dao.isExist(inputId);
		Map<String, Object> map=new HashMap<>();
		map.put("isExist", isExist);
		return map;
	}
	@Override
	public void addUser(UsersVo usersVo) {
		/*
		 * //비밀번호를 암호화 한다. String encodedPwd=new
		 * BCryptPasswordEncoder().encode(usersVo.getPw()); //암호화된 비밀번호를 UsersVo 에 다시
		 * 넣어준다. usersVo.setPw(encodedPwd); //UsersVo 객체를 이용해서 DB 에 저장하기
		 */
		dao.insert(usersVo);
	}
	@Override
	public void validUser(UsersVo usersVo, HttpSession session, ModelAndView mView) {
		//아이디 비밀번호가 유효한지 여부 
		boolean isValid=false;
		//아이디를 이용해서 저장된 비밀 번호를 읽어온다. 
		String pwdHash=dao.getPwdHash(usersVo.getId());
		if(pwdHash != null) {//비밀번호가 존재하고 
			//입력한 비밀번호와 일치 하다면 로그인 성공
			isValid=true;
		}
		if(isValid) {
			//로그인 처리를 한다.
			session.setAttribute("id", usersVo.getId());
		}
	}
	

}
















