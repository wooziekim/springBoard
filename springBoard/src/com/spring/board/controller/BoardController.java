package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model,PageVo pageVo, HttpServletRequest request) throws Exception{
		
		
		  String[] codeId = request.getParameterValues("codeId"); 
		  if (codeId != null) {
		  for(int i=0; i<codeId.length; i++) { 
		System.out.println("String[] codeId : "
		  + codeId[i].toString()); } }
		  
		  
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		List<ComCodeVo> codeNameList = new ArrayList<ComCodeVo>();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		pageVo.setCodeId(codeId);
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		codeNameList = boardService.selectCodeNameList();
		
		model.addAttribute("codeName", codeNameList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception{
		
		List<ComCodeVo> codeNameList = new ArrayList<ComCodeVo>();
		codeNameList = boardService.selectCodeNameList();
		
		model.addAttribute("codeName", codeNameList);
		
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo,PageVo pageVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardInsert(boardVo);
		int page=1;
		if(pageVo.getPageNo() == 0) {
			pageVo.setPageNo(page);
		}
		String pageNo = Integer.toString(pageVo.getPageNo());
		
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		result.put("pageNo", pageNo);
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		return "board/boardUpdate";
	}
	
	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdateAction(Locale locale,BoardVo boardVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.updateContent(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	/*
	 * //원글 삭제 요청 처리
	 * 
	 * @RequestMapping("/board/{boardType}/{boardNum}/delete") public ModelAndView
	 * delete(HttpServletRequest request,
	 * 
	 * @PathVariable("boardType")String boardType,
	 * 
	 * @PathVariable("boardNum")int boardNum) throws Exception{ //서비스를 이용해서 글을 삭제하기
	 * boardService.deleteContent(boardType, boardNum); //글 목록 보기로 리다일렉트 이동 return
	 * new ModelAndView("redirect:/board/boardList.do"); }
	 */
		
		@RequestMapping("/board/{boardType}/{boardNum}/update")
		public ModelAndView 
			updateform(HttpServletRequest request, 
				@RequestParam int boardNum,
				@RequestParam String boardType,
				ModelAndView mView) throws Exception{
			//서비스를 이용해서 수정할 글정보를 ModelAndView
			//객체에 담고
			boardService.getUpdateData(mView, boardType, boardNum);
			//view page 로 forward 이동해서 수정폼 출력
			mView.setViewName("board/${boardType}/${boardNum}/update");
			return mView;
		}
		
		
		//원글 수정 반영 요청 처리
		@RequestMapping(value="/board/{boardType}/{boardNum}/update",
				method=RequestMethod.POST)
		public ModelAndView 
			update(HttpServletRequest request,
					BoardVo boardVo,
					@PathVariable("boardType")String boardType,
					@PathVariable("boardNum")int boardNum) throws Exception{
			//서비스를 이용해서 수정 반영한다.
			boardService.updateContent(boardVo);
			
			//글 자세히 보기로 리다일렉트 이동 
			return new ModelAndView
				("redirect:/board/${boardType}/${boardNum}/boardView.do");
		}
		
		
		@RequestMapping(value = "/board/deleteBoard", 
				method = RequestMethod.POST)
		@ResponseBody 
		public HashMap <String, Object> deleteBoard(
				
				BoardVo boardVo) throws Exception {
			HashMap<String, Object> result = new HashMap <String,Object>();
		    
			int count=0;
			
			count= boardService.deleteContent(boardVo);
			result.put("cnt", count);
			
			return result;
			}
			
			
			
}		
		

