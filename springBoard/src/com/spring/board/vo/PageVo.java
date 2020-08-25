package com.spring.board.vo;

public class PageVo{
	
	private int pageNo = 0;
	private int startRowNum;
	private int endRowNum;
	private int prevNum; //이전글의 글번호를 담을 필드
	private int nextNum; //다음글의 글번호를 담을 필드
	private String[] codeId;
	private String[] codeName;
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public String[] getCodeId() {
		return codeId;
	}
	public void setCodeId(String[] codeId) {
		this.codeId = codeId;
	}
	public String[] getCodeName() {
		return codeName;
	}
	public void setCodeName(String[] codeName) {
		this.codeName = codeName;
	}
	public int getStartRowNum() {
		return startRowNum;
	}
	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}
	public int getEndRowNum() {
		return endRowNum;
	}
	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}
	public int getPrevNum() {
		return prevNum;
	}
	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}
	public int getNextNum() {
		return nextNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	
}
	
	