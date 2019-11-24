<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=divice-width, initial-scale=1">

<title>BEST TEXT에 오신걸 환영합니다</title>
<!-- Bootstrap이랑  Font CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userCSS/navbar.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<!-- Add icon library -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<style type="text/css">
html {

    position: relative;

    min-height: 100%;

    margin: 0;

 
}

body {

    min-height: 100%;

}
.footer { 


 	min-height: 100px; 
 	margin-top: 100px; 
 	padding-top: 35px; 
	background-color: #28364f; 
	color: #FFFFFF; 
} 
.center {
  display: block;
  margin-left: auto;
  margin-right: auto;
  width: 50%;
}
.fa-instagram {
  display: inline-block;
  text-align: center;
  color: #fff;
  font-size: 60px;
  background: #d6249f;
  background: radial-gradient(circle at 30% 107%, #fdf497 0%, #fdf497 5%, #fd5949 45%,#d6249f 60%,#285AEB 90%);
  box-shadow: 0px 3px 10px rgba(0,0,0,.25);
}
a {
    text-decoration: none;
}


 
</style>

<!-- 네비게이션바  -->
<nav class="navbar navbar-default" role="navigation">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.do">BEST TEXT</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">   
        <li><a href="wellCome.do">Info</a></li>
        <li><a href="/BestText/board/list">Board</a></li>
        <li><a href="CustomerService.do">Customer Service</a></li>
        <li class="social pull-right"><a href="/BestText/logOut.do"><span class="glyphicon glyphicon-user">LogOut</span></a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<body>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
    if (session.getAttribute("signedUser") == null) {
        response.sendRedirect("/BestText");
    }
%>
<img class="center" alt="under construction" src="${pageContext.request.contextPath}/resources/images/under-construction-dark-.jpg">
<div align="center">
<a href="https://www.facebook.com" target="_blank">	
<i class="fa fa-facebook-official" aria-hidden="true" style="font-size:60px; color:#3b5998"></i>
</a>
<a href="https://www.youtube.com" target="_blank">
<i class="fa fa-youtube" aria-hidden="true" style="font-size:60px; color:#c4302b;'"></i>
</a>
<a href="https://www.instagram.com" target="_blank">
<i class="fa fa-instagram" aria-hidden="true"></i>
</a>
<a href="https://www.twitter.com" target="_blank">
<i class="fa fa-twitter" aria-hidden="true" style="font-size:60px; color:#2953E1; background-color:#00acee; color:white;"></i>
</a>
</div>
<footer class="footer">		
		<p class="text-center">Copyright (c) 2019</p>		
	</footer>
	
</body>
</html>