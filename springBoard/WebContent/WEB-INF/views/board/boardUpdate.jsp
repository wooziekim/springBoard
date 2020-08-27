<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardWrite</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.boardUpdate :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/board/boardUpdateAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("게시글 수정 완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("글 수정 실패");
			    }
			});
		});
	});
	

</script>
<body>
<form class="boardUpdate">
	<input type="hidden" name="boardType" value="${boardType}">
	<input type="hidden" name="boardNum" value="${boardNum}">
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
			<td align="right">
			<input id="submit" type="button" value="수정완료">
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
						<input name="boardTitle" type="text" size="50" value="${board.boardTitle}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  rows="20" cols="55">${board.boardComment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer 
						</td>
						<td>
						${board.creator }
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/board/boardList.do">List</a>
			</td>
		</tr>
	</table>
</form>	
</body>
</html>