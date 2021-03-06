
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
			var $frm = $j('.boardWrite :input');
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/board/boardWriteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    {
					alert("작성완료");
					
					alert("메세지:"+data.success);
					
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
	});
	

</script>
<body>
<form class="boardWrite">
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
			<input id="submit" type="button" value="작성">
			<input id="submit" type="button" value="행 추가">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
					<tr>
						<td width="120" align="center">
						Type
						</td>
						<td width="400">
						<c:if test="${!empty codeName}" >
						<select id="codeNameList" name="boardType" class="select_box">
							<c:forEach var="codeName" items="${codeName}">
							<option value="${codeName.codeId}">${codeName.codeName}</option>			
							</c:forEach>
						</select> 
							</c:if>
						</td>
					</tr>
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
						<label for="creator">Writer</label>
						</td>
						<td>
						<input name="creator" type="text" value="${id }" disabled/>
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