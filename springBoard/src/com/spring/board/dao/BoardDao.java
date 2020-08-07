package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

public interface BoardDao {

	public String selectTest();

	public List<BoardVo> selectBoardList(PageVo pageVo);

	public BoardVo selectBoard(BoardVo boardVo);

	public int selectBoardCnt();

	public int boardInsert(BoardVo boardVo);
	
	public int delete(BoardVo boardVo);
	
	public BoardVo getData(int boardNum);
	
	public int update(BoardVo boardVo);
	
	public BoardVo getData(BoardVo boardVo) throws Exception;
	
	public List<ComCodeVo> selectCodeNameList() throws Exception;
 
}
