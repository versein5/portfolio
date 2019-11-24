<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>

<html>
    <head>
            <title>BEST TEXT에 오신걸 환영합니다</title>            					
<!-- Bootstrap이랑  Font CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userCSS/navbar.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.js"></script>
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
      <a class="navbar-brand" href="/BestText/index">BEST TEXT</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">   
        <li><a href="/BestText/wellCome">Info</a></li>
        <li><a href="/BestText/board/list">board</a></li>
        <li><a href="/BestText/customerService">Customer Service</a></li>
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
    	<input type="hidden" id="board_id" name="board_id" value="${boardView.id}" />
    	<div align="center">
    		</br>
    		</br>
   			<table width="1200px">
   				<tr>
   					<td>
   						Subject: <input type="text" id="subject" name="subject" style="width:500px;" placeholder="" value="${boardView.subject}"/>&nbsp&nbsp&nbsp&nbsp
   						Writer: <input type="text" id="writer" name="writer" style="width:170px;" maxlength="10" placeholder="" value="${boardView.writer}"/>&nbsp&nbsp&nbsp&nbsp
   						Password: <input type="password" id="password" name="password" style="width:170px;" maxlength="10" placeholder=""/>
   						&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button class="btn btn-default" id="save" name="save">Save</button>   						
   					</td>
   				</tr>
   				<tr>
   					<td>
   						<textarea name="content" id="content" rows="10" cols="80">${boardView.content}</textarea>
   					</td>
   				</tr>
   				<tr>
   					<td align="right">
   						<button class="btn btn-default" id="list" name="list">Board</button>
   					</td>
   				</tr>
   			</table>
    	</div>
    	<footer class="footer">		
		<p class="text-center">Copyright (c) 2019</p>		
	</footer>
    </body>
      <script src="//cdn.ckeditor.com/4.7.1/standard/ckeditor.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
            	
            	CKEDITOR.replace( 'content' );
            	CKEDITOR.config.height = 500;
            	
            	$("#list").click(function(){
            		location.href = "list";
            	});
            	
            	$("#save").click(function(){
            		
            		//에디터 내용 가져옴
            		var content = CKEDITOR.instances.content.getData();
            		
            		//널 검사
                    if($("#subject").val().trim() == ""){
                    	swal("제목을 입력하세요.");
                    	$("#subject").focus();
                    	return false;
                    }
            		
                    if($("#writer").val().trim() == ""){
                    	swal("작성자를 입력하세요.");
                    	$("#writer").focus();
                    	return false;
                    }
                    
                    if($("#password").val().trim() == ""){
                    	swal("비밀번호를 입력하세요.");
                    	$("#password").focus();
                    	return false;
                    }
            		
            		//값 셋팅
            		 var objParams = {
            				 <c:if test="${boardView.id != null}"> //있으면 수정 없으면 등록
                             id          : $("#board_id").val(),
                             </c:if>                    
                            subject     : $("#subject").val(),
                            writer      : $("#writer").val(),
                            password    : $("#password").val(),
                            content     : content
                    };

            		
            		//ajax 호출
            		$.ajax({
            			url			:	"save",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded",
            			type 		:	"POST",
            			data		:	objParams,
            			success 	:	function(retVal){  
            				console.log(retVal);
            				if(retVal.code == "OK") {
            					swal(retVal.message);
            					location.href = "list";	
            				} else {
            					swal(retVal.message);
            				}
            				
            			},
            			error		:	function(request, status, error){            				
            				console.log(objParams);
            				console.log("AJAX_ERROR");
            				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

            				
            			}
            		});
            		
            		
            	});
            	
            });
        </script>
</html>