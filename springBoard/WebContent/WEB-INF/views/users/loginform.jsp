<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/user/signup_form.jsp</title>
</head>
<body>
	<form class="form-signin" action="/users/login.do" method="post">
		<table align="center">
			<tr>
				<td align="left"><a href="/board/boardList.do">List</a></td>
			</tr>
			<tr>
				<td>
					<table border="1">
						<tr>
							<td width="80" align="center">id</td>
							<td width="30"><label for="id" class="sr-only"></label> <input
								type="text" id="id" name="id" class="form-control"
								placeholder="" value="${savedId }" />
								</td>
						</tr>
						<tr>
							<td width="80" align="center">pw</td>
							<td width="30"><label for="pw" class="sr-only"></label> <input
								type="password" autocomplete="password" id="pw" name="pw" class="form-control"
								placeholder="" value="${savedPw }"></td>
						</tr>
					</table> <span style="float: right"> 
					<button class="btn btn-lg btn-primary btn-block"
						type="submit">login</button>
				</span>
					</td></tr></table>
					<input type="hidden" name="url" value="${url }" />
					</form>
					
</body>
</html>







