package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}
	/**
	 * 
	 * */
	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",pageVo);
	}
	
	@Override
	public int selectBoardCnt() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardTotal");
	}
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}
	@Override
	public int delete(BoardVo boardVo){
		// TODO Auto-generated method stub
		
		return sqlSession.delete("board.delete", boardVo);
		
	}
	@Override
	public BoardVo getData(int boardNum) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int update(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.update",boardVo);
	}
	@Override
	public BoardVo getData(BoardVo boardVo) {
		// TODO Auto-generated method stub
		return boardVo;
	}
	
	@Override
	public List<ComCodeVo> selectCodeNameList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.codeNameList");
		
	}
	@Override
	public List<ComCodeVo> selectPhoneCodeNameList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.phoneCodeNameList");
	}
	
	
	
	
}
