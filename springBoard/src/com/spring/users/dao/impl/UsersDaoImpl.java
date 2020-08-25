package com.spring.users.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.users.vo.UsersVo;

@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean isExist(String inputId) {
		//인자로 전달되는 아이디를 이용해서 select 를 한다.
		String id=sqlSession.selectOne("users.isExist", inputId);
		//만일 select 된 결과가 null 이면 존재하지 않는 아이디이다.
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insert(UsersVo usersVo) {
		sqlSession.insert("users.insert", usersVo);
	}

	@Override
	public String getPwdHash(String inputId) {
		//입력한 아이디를 이용해서 저장된 비밀번호를 select 한다.
		//만일 존재하지 않는 아이디 이면 null 이다.
		String savedPw=sqlSession.selectOne("users.getPwdHash", inputId);
		//select 된 비밀번호를 리턴해준다. 
		return savedPw;
	}

	@Override
	public UsersVo getData(String id) {
		
		return sqlSession.selectOne("users.getData", id);
	}


	

}








