package com.spring.users.controller;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.service.boardService;
import com.spring.board.vo.ComCodeVo;
import com.spring.users.service.impl.UsersService;
import com.spring.users.vo.UsersVo;


@Controller
public class UsersController {
	@Autowired
	private UsersService usersService;
	@Autowired 
	private boardService boardService;
	
	//회원가입 폼 요청 처리 
	@RequestMapping(value="/users/signup_form.do", method = RequestMethod.GET)
	public String signup_form(Locale locale, Model model) throws Exception {
		
		
		  List<ComCodeVo> phoneCodeNameList = new ArrayList<ComCodeVo>();
		
		  phoneCodeNameList = boardService.selectPhoneCodeNameList();
		  
		  model.addAttribute("phoneCodeName", phoneCodeNameList);
		  
		  
		return "users/signup_form";
	}
	
	@RequestMapping("/users/checkid")
	@ResponseBody
	public Map<String, Object> checkid(@RequestParam String inputId){
		Map<String, Object> map=usersService.isExistId(inputId);
		return map;
	}
	// POST 방식 /users/signup.do 요청 처리 
	@RequestMapping(value = "/users/signup", method = RequestMethod.POST)
	public ModelAndView signup(@ModelAttribute("usersVo") UsersVo usersVo,
			ModelAndView mView) {
		usersService.addUser(usersVo);
		mView.setViewName("users/insert");
		return mView;
	}
	
	//로그인 폼 요청 처리
	@RequestMapping("/users/loginform")
	public String loginform(HttpServletRequest request) {
		
		
		  
		  
		// "url" 이라는 파라미터가 넘어오는지 읽어와 본다.  
		String url=request.getParameter("url");
		if(url==null){//만일 없으면 
			//로그인 성공후에 index 페이지로 보낼수 있도록 구성한다. 
			url=request.getContextPath()+"/board/boardList.do";
		}
		
		
		//view page 에서 필요한 정보 넘겨주기 
		
		request.setAttribute("url", url);
		
		return "users/loginform";
	}
	//로그인 요청 처리 
	@RequestMapping(value = "/users/login", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute UsersVo usersVo,
			ModelAndView mView, 
			HttpServletRequest request,
			HttpServletResponse response) {
		//목적지 정보
		String url=request.getParameter("url");
		if(url==null){
			url=request.getContextPath()+"/board/boardList.do";
		}
		//목적지 정보를 미리 인코딩 해 놓는다.
		String encodedUrl=URLEncoder.encode(url);
		// view page 에 전달하기 
		mView.addObject("url", url);
		mView.addObject("encodedUrl", encodedUrl);
		
		usersService.validUser(usersVo, request.getSession(), mView);
		
		mView.setViewName("users/login");
		return mView;
	}
	
	//로그아웃 처리
	@RequestMapping("/users/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/board/boardList.do";
	}
	
	
	
	
	
}












