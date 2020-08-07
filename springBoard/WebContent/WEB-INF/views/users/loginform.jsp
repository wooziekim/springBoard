<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/loginform.jsp</title>
</head>
<body>
<form class="form-signin" action="login.do" method="post">
<input type="hidden" name="url" value="${url }" />
<table>
<thead>
  <tr>
    <th>
    id
    </th>
    <th>
    <input type="text" id="id" name="id" class="form-control" 
			value="${id }"/>
	</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>
    pw
    </td>
    <td>
    <input type="password" id="pwd" name="pwd" class="form-control" 
		value="${pwd }">
    </td>
  </tr>
  <tr>
  <a>join</a>
  </tr>
</tbody>
</table>
</form>
<div class="container">
	<form class="form-signin" action="login.do" method="post">
		<%-- 폼 제출할때 목적지 정보도 같이 보내준다. --%>
		<input type="hidden" name="url" value="${url }" />
		<h2 class="form-signin-heading">로그인 정보 입력</h2>
		<label for="id" class="sr-only">아이디</label>
		<input type="text" id="id" name="id" class="form-control" 
			placeholder="아이디" value="${savedId }"/>
		<label for="pwd" class="sr-only">비밀번호</label>
		<input type="password" id="pwd" name="pwd" class="form-control" 
			placeholder="비밀번호" value="${savedPwd }">
		<div class="checkbox">
			<label>
				<input type="checkbox" name="isSave" value="yes"/>아이디, 비밀번호 저장
			</label>
		</div>
		<button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
	</form>	
</div>
</body>
</html>







