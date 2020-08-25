<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<script type="text/javascript">

	$j(document).ready(function(){
	});
	/* 체크 전체 선택, 해제 */
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
		
		var codeNameLength = "${fn:length(codeName)}";
			
/* 한개 체크박스 해제 시 전체 체크박스 해제 */
		$j(".typeCk").click(function(){
			if($j("input[name='codeId']:checked").length == codeNameLength){
				$j("#allCheck").prop("checked", true);
			}else{
				$j("#allCheck").prop("checked", false);
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
							${list.codeName }							
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
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
	<tr>
	<td align="left">
				<form id="selectType" class="selectType" method="get" action="/board/boardList.do">
				<input type="checkbox" id="allCheck" value="all">전체
	<c:forEach var="code" items="${codeName}" varStatus="status">
		<input type="checkbox" class="typeCk" name="codeId" value="${code.codeId}">${code.codeName}</>
	</c:forEach>
				<button type="button" id="btnSearch">조회</button>
</form>

	</tr>
</table>	
<%-- <div class="page-display">
		<ul class="pagination">
		<c:choose>
			<c:when test="${board.startPageNum ne 1 }">
				<li>
					<a href="list.do?pageNum=${board.startPageNum-1 }">
						&laquo;
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&laquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="i" begin="${board.startPageNum }" 
			end="${endPageNum }" step="1">
			<c:choose>
				<c:when test="${i eq pageNum }">
					<li class="active"><a href="boardlist.do?pageNo=${i }">${i }</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="boardlist.do?pageNo=${i }">${i }</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
		<c:choose>
			<c:when test="${endPageNum lt totalPageCount }">
				<li>
					<a href="boardlist.do?pageNo=${endPageNum+1 }">
						&raquo;
					</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="disabled">
					<a href="javascript:">&raquo;</a>
				</li>
			</c:otherwise>
		</c:choose>
		</ul>		
	</div>
	
	</form>
</div> --%>
</body>
</html>