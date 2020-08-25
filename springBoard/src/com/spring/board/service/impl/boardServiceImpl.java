package com.spring.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}
	
	@Override
	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.selectBoardList(pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCnt();
	}
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.boardInsert(boardVo);
	}

	@Override
	public int deleteContent(BoardVo boardVo){
		
		return boardDao.delete(boardVo);
		
		
	}

	

	@Override
	public void getUpdateData(ModelAndView mView,String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		//수정할 글번호를 이용해서 수정할 글정보를 얻어와서
				BoardVo vo = boardDao.getData(boardNum);
				//ModelAndView 객체에 담는다.
				mView.addObject("boardVo", vo);
		
	}

	@Override
	public int updateContent(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.update(boardVo);
		

	}

	@Override
	public List<ComCodeVo> selectCodeNameList() throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.selectCodeNameList();
	}

	@Override
	public List<ComCodeVo> selectPhoneCodeNameList() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectPhoneCodeNameList();
	}

	
}
