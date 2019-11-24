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
      <a class="navbar-brand" href="index.do">BEST TEXT</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">   
        <li><a href="index.do">Info</a></li>
        <li><a href="/BestText">Board</a></li>
        <li><a href="/BestText">Customer Service</a></li>
        <li class="social pull-right"><a href="/BestText"><span class="glyphicon glyphicon-user"></span></a></li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


<body>
	<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
          <h1 class="text-center">Welcome</h1>
        </div>
         <div class="modal-body">
             <div class="form-group">
                 <input type="text" id="id" name="id" class="form-control input-lg" placeholder="id"/>
             </div>

             <div class="form-group">
                 <input type="password" id="pw" name="pw" class="form-control input-lg" placeholder="Password"/>
             </div>

             <div class="form-group">
                 <input type="submit" id="Login" class="btn btn-block btn-lg btn-primary" value="Login"/>
                 <span class="pull-right"><a href="resistration.do">Register</a></span>
             </div>
         </div>
    </div>
 </div>

	<footer class="footer">		
		<p class="text-center">Copyright (c) 2019</p>		
	</footer>
</body>
<!-- bootstrapvalidator.min.js -->
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	$('#Login').click(function(){
		var userid=$("#id").val();
		var userpw=$("#pw").val();
		var user ={
				id : userid,
				pw : userpw
		};
		
		$.ajax({
		    method :"get",
		    dataType :"json",
		    url :"join.do",
		    data :user,
		    success :function(data){		    	
		    	console.log(data);
		    	if(data.loginFlag ==1){		    		
		    		swal({
		    			title: "성공",
		    			text: "로그인 성공",
		    			timer: 5000
		    		}, function() {
		    			window.location.replace("wellCome.do");
		    		});
		    	}else{
		    		swal({
		    			title: "실패",
		    			text: "로그인 실패",
		    			timer: 5000
		    		});
		    	}
		    },
		    error :function(data) {
		    	console.log(data);
		    	swal({
	    			title: "실패",
	    			text: "로그인 실패",
	    			timer: 5000
	    		});
		    }
		});		    	
	 });
  });

</script>
</html>