<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<body>
<table align="center">
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
					${creator }
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
							 alert("������ ���������� �Ϸ��߽��ϴ�.")
						}else{				
							 alert("�̹� ������ �Խù� �Դϴ�.")
				}
						location.href="/board/boardList.do"
					}
					
		});
			//�� ���� ����
			return false;
}
);
</script>
</body>
</html>