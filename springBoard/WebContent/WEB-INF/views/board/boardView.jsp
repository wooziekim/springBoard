<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardView</title>
</head>
<body>
<table align="center">
	<tr>
		<td align="left">
		<c:choose>
		<c:when test="${not empty sessionScope.id }">
		<label>${id}님 로그인중</label>
		<a href ="/users/logout.do">로그아웃</a>
		</c:when>
		<c:otherwise>
		<a  href ="/users/loginform.do">login</a> 
			<a href ="/users/signup_form.do">join</a>
		</c:otherwise>
		</c:choose>
			
		</td>
	</tr>
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					${board.creator} 
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href="/board/boardList.do">List</a>
			<a href="/board/${boardType }/${boardNum }/boardUpdate.do">Update</a>
			
			<form action="/board/deleteBoard.do" id="delete_form" name="boardForm" method="post">				
				<input type="hidden" id="boardType"	name="boardType" value="${board.boardType}"/>
				<input type="hidden" id="boardNum"	name="boardNum" value="${board.boardNum}"/> 
				<button type="submit">Delete</button>
			</form>
			
		</td>
	</tr>
</table>	
<script>
$j("#delete_form").on("submit",
	function(){
		
			var boardNum = $j("#boardNum").val();
			var boardType = $j("#boardType").val();
			var url=$j(this).attr("action");
			var data=$j(this).serialize();
			
			$j.ajax({									
					url: url,
					method: "POST",
					data: data,
					success:function(responseData){
						if(responseData.cnt > 0){
							console.log(responseData.result)
							 alert("삭제를 성공적으로 완료했습니다.")
						}else{				
							 alert("이미 삭제된 게시물 입니다.")
				}
						location.href="/board/boardList.do"
					}
					
		});
			//폼 제출 막기
			return false;
}
);
</script>
</body>
</html>