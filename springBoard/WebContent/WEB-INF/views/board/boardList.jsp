<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
	});
	/* üũ ��ü ����, ���� */
	$j(document).ready(function(){
		$j("#allCheck").click(function(){
			if($j("#allCheck").prop("checked")){
				console.log("checked");
				$j(".typeCk").prop("checked", true);
			}else{
				console.log("unchecked");
				$j(".typeCk").prop('checked',false);
			}
		});
		
		var codeNameLength = ${fn:length(codeName)};
			
/* �Ѱ� üũ�ڽ� ���� �� ��ü üũ�ڽ� ���� */
		$j(".typeCk").click(function(){
			if($j("input[name='codeId']:checked").length == codeNameLength){
				$j("#checkAll").prop("checked", true);
			}else{
				$j("#checkAll").prop("checked", false);
			}
		});	
		
		
		$j("#btnSearch").click(function(){
			//	var $frm = $j('.selectType :input');
			//	var param = $frm.serialize();

			//	console.log(param);
				$j("#selectType").submit();
			});
	});
</script>
<body>
<table  align="center">
	<tr>
		<td align="left">
			<a  href ="${pageContext.request.contextPath }/board/users/loginform.do">login</a> 
			<a href ="${pageContext.request.contextPath }/board/users/signup_form.do">join</a>
		</td>
	</tr>
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.boardType}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">�۾���</a>
		</td>
	</tr>
	<tr>
	<td align="left">
				<form id="selectType" class="selectType" method="get" action="/board/boardList.do">
				<input type="checkbox" id="allCheck" value="all">��ü
	<c:forEach var="code" items="${codeName}" varStatus="status">
		<input type="checkbox" class="typeCk" name="codeId" value="${code.codeId}">${code.codeName}</>
	</c:forEach>
				<button type="button" id="btnSearch">��ȸ</button>
</form>

	</tr>
</table>	

</body>
</html>