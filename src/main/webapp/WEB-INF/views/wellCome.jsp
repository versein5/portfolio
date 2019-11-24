<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
      <a class="navbar-brand" href="wellCome.do">BEST TEXT</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">   
        <li><a href="wellCome.do">Info</a></li>
        <li><a href="/BestText/board/list">board</a></li>
        <li><a href="customerService.do">Customer Service</a></li>
        <li class="social pull-right"><a href="/BestText/logOut.do"><span class="glyphicon glyphicon-user">LogOut</span></a></li>        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<body>
 <%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
//  if (session.getAttribute("signedUser") == null) {
//      response.sendRedirect("/BestText");
//  } 		
		session.setAttribute("signedUser", 1);  
 		 session.getAttribute("signedUser");
%>
<!-- carousel -->
<div class="container">
 <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <center><img src="${pageContext.request.contextPath}/resources/images/BT.png" alt="BEST TEXT" style="width:500px; height:500px;"></center>
      <div class="carousel-caption">
        <h3>BEST TEXT</h3>
        <p>We aim for the best work</p>        
      </div>
    </div>

    <div class="item">
      <center><img src="${pageContext.request.contextPath}/resources/images/excel.png" alt="EXCEL" style="width:500px; height:500px;"></center>
      <div class="carousel-caption">
        <h3>EXCEL</h3>
        <p>Easily organize complex data</p>
      </div>
    </div>

    <div class="item">
      <center><img src="${pageContext.request.contextPath}/resources/images/ppt.jpg" alt="PPT" style="width:500px; height:500px;"></center>
      <div class="carousel-caption">
        <h3>PPT</h3>
        <p>We also do PPT work</p>
      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
 </div>
</div>	  
	<footer class="footer">		
		<p class="text-center">Copyright (c) 2019</p>		
	</footer>
</body>
</html>