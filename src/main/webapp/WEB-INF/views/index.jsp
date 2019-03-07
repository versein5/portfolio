<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>정보시스템</title>
<link rel="stylesheet" href="/hello-web/resources/styles/style.css">


</head>

<body>
<h1>Spring index page</h1>
<img alt="스프링 이미지" src="/hello-web/resources/images/spring.png">
<form id="my_form">
	<table>
		<tr>
			<td>이름 : </td>
			<td><input type="text" name="name" id="name" /></td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td><input type="password" name="password" id="password" /></td>
		</tr>
	</table>
	<input type="submit" value="제출" />
</form>
</body>
</html>