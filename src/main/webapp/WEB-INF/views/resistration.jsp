<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="org.json.JSONException" %> 
<%@ page import="org.json.JSONObject" %>  
<%@ page import="javax.servlet.http.HttpServletResponse" %> 
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="java.io.PrintWriter" %>
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


<div class="container">

<form class="well form-horizontal" action="resistration.do"  method="POST"  id="contact_form"  data-bv-remote="true"  >
<fieldset>

<!-- Form Name -->
<legend><center><h2><b>Registration Form</b></h2></center></legend><br>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="name" id="name" placeholder="Name" class="form-control"  type="text">
    </div>
  </div>
</div>

  <div class="form-group"> 
  <label class="col-md-4 control-label">Department / Office</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="department" id="department" class="form-control selectpicker">
      <option value="">Select your Department/Office</option>
      <option value="IT">IT</option>
      <option value="Department of Agriculture">Department of Agriculture</option>
      <option value="Accounting Office">Accounting Office</option>
      <option value="Tresurer's Office">Tresurer's Office</option>
      <option value="MPDC">MPDC</option>
      <option value="MCTC">MCTC</option>
      <option value="MCR">MCR</option>
      <option value="Mayor's Office">Mayor's Office</option>
      <option value="Tourism Office">Tourism Office</option>
    </select>
  </div>
</div>
</div>
  
<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">id</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="id" id="id" placeholder="id" class="form-control"  type="text">
    </div>
  </div>
<!--    <button type="button" id="check" name="check"  class="btn btn-warning" >Check <span class="glyphicon glyphicon-check"></span></button>   -->
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="pw" id="pw" placeholder="Password" class="form-control"  type="password">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Confirm Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="confirm_pw" id="confirm_pw" placeholder="Confirm Password" class="form-control"  type="password">
    </div>
  </div>
</div>

<!-- Text input-->
       <div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
  <input name="email" id="email" placeholder="E-Mail Address" class="form-control"  type="text">
    </div>
  </div>
</div>


<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">Contact No.</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input name="contactNo" id="contactNo" placeholder="Phone or home" class="form-control" type="text">
    </div>
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit"  class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT <span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>
</fieldset>
</form>
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-warning" type="button" onclick="location.href='/BestText/'">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspBack <span class="glyphicon glyphicon-arrow-left"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>
</div>
					
	<footer class="footer">		
		<p class="text-center">Copyright (c) 2019</p>		
	</footer>
<%
String name=request.getParameter("name");
String department=request.getParameter("department");
String id=request.getParameter("id");
String pw=request.getParameter("pw");
String email=request.getParameter("email");
String contactNo=request.getParameter("contactNo");

    		try{
    			Class.forName("com.mysql.jdbc.Driver");
    			String url = "jdbc:mysql://localhost:3306/spring"
    					+ "?serverTimezone=Asia/Seoul&useSSL=true";
    				String user= "spring";
    				String pass= "spring";
    				Connection conn =DriverManager.getConnection(url, user, pass);
    				Statement st=conn.createStatement();
    				int i=st.executeUpdate("insert into user(name,department,id,pw,email,contactNo)values('"+name+"','"+department+"','"+id+"','"+pw+"','"+email+"','"+contactNo+"')");
    					
    		}
    		catch(Exception e)
    		{
    		System.out.print(e);
    		e.printStackTrace();
    		}
    		
    		

    		
%>
</body>
<!-- bootstrapvalidator.min.js -->
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.js"></script>
<script type="text/javascript">

$(document).ready(function() {		
	$('#contact_form').bootstrapValidator({   		
    	  submitHandler: function(form) {  //submitHandler: form이 submit될때 마지막으로 뭔가 할 수 있도록 핸들을 넘겨준다
    	      $.ajax({
    	          type: form.method,
     	          url: form.action,
    	          data: //val값 DB에 저장
    	          {	
    			name:$('#name').val(),
    			department:$('#department').val(),
    			id:$('#id').val(),
    			pw:$('#pw').val(),
    			email:$('#email').val(),
    			contactNo:$('#contactNo').val(),
    	          success: function() {
    	        	  swal("Congrats!", " Your account is created!", "success"); 
    	        	  console.log($('#id').val());
    	          }
    	         }    	     
    	      });
    	   },   	      
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
  	},
	fields : {
				name : {
					validators : {
						stringLength : {
							min : 2,
						},
						notEmpty : {
							message : 'Please enter your Name'
						}
					}
				},		id : {
					validators : {
						stringLength : {
							min : 2,
						},
						notEmpty : {
							message : 'Please enter your id'
 						},
 						remote: {	
 							 type:'POST',
 							 url: '/BestText/check', 							 
 							 delay: 1000,
 							 data:function(validator) {
 	                            return {
 	                                id: validator.getFieldElements('id').val()
 	                                };                          
 								},
 							 message: 'ID is already available'

 							   }
					 	   }
				},			
				pw : {
					validators : {
						stringLength : {
							min : 4,
						},						 
						notEmpty : {
							message : 'Please enter your Password'
						}						
					}
				},
				confirm_pw : {
					validators : {
						stringLength : {
							min : 4,
						},
						notEmpty : {
							message : 'Please confirm your Password'
						},
						identical: {
	                        field: 'pw',
	                        message: 'The password and its confirm are not the same'
	                    }
					}
				},
				email : {
					validators : {
						notEmpty : {
							message : 'Please enter your Email Address'
						},
						emailAddress : {
							message : 'Please enter a valid Email Address'
						}
					}
				},
				contactNo : {
					validators : {
						stringLength : {
							min : 10,
							max : 15,
							notEmpty : {
								message : 'Please enter your Contact No.'
							}
						}
					}
				},
				department : {
					validators : {
						notEmpty : {
							message : 'Please select your Department/Office'
						}
					}
				}
	}
  	})
	  });	  




	
	
</script>
</html>