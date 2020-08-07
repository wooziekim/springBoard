package com.spring.board.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

public interface boardService {

	public String selectTest() throws Exception;

	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;

	public int deleteContent(BoardVo boardVo) throws Exception;
		
	public int updateContent(BoardVo boardVo) throws Exception;
	
	public void getUpdateData(ModelAndView mView, String boardType, int boardNum) throws Exception;
	
	public List<ComCodeVo> selectCodeNameList() throws Exception;
	
	

}
