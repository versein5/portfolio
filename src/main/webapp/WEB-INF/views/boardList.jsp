<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	
.mouseOverHighlight {
				   cursor: pointer !important;
				   color: black;
				   pointer-events: auto;
}
 #text { text-align: center; }

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
    	<form class="form-inline" id="frmSearch" action="list">
	    	<input type="hidden" id="startPage" name="startPage" value=""><!-- 페이징을 위한 hidden타입 추가 -->
	        <input type="hidden" id="visiblePages" name="visiblePages" value=""><!-- 페이징을 위한 hidden타입 추가 -->
	    	<div align="center" >
	    		<table  width="1200px">
	    			<tr>
	    				<td align="right">
	    					<button class="btn btn-default" type="button" id="write" name="write">Write</button>
	    				</td>
	    			</tr>
	    		</table>
	    		<table class="table-bordered"  width="1200px">
	    			<tr>
	    				<th  id="text" width="50px" >
	    					No
	    				</th>
	    				<th id="text" width="850px">
	    					Title
	    				</th>
	    				<th id="text" width="100px">
	    					Writer
	    				</th>
	    				<th id="text" width="200px">
	    					date
	    				</th>
	    			</tr>
	    			<c:choose>
			        	<c:when test="${fn:length(boardList) == 0}">
			            	<tr>
			            		<td colspan="4" align="center">
			            			There is no inquiry result.
			            		</td>
			            	</tr>
			           	</c:when>
			           	<c:otherwise>
			            	<c:forEach var="boardList" items="${boardList}" varStatus="status">
								<tr>
						    		<td align="center">${boardList.id}</td>
						    		<td>
						    			<a name="subject" class="mouseOverHighlight" content_id="${boardList.id}">${boardList.subject}</a>
						    		</td>
						    		<td align="center">${boardList.writer}</td>
						    		<td align="center">${boardList.register_datetime}</td>
						    	</tr>
						    </c:forEach>
			           	</c:otherwise> 
			    	</c:choose>
	    		</table>
	    		<br>
	    		<div id="pagination"></div>
	    	</div>
    	</form>
    	<footer class="footer">		
		<p class="text-center">Copyright (c) 2019</p>		
	</footer>
    </body>
        <script type="text/javascript">
            $(document).ready(function(){
            	
            	//--페이지 셋팅
            	var totalPage = ${totalPage}; //전체 페이지
            	var startPage = ${startPage}; //현재 페이지
            	
            	var pagination = "";
            	
            	//--페이지네이션에 항상 10개가 보이도록 조절
            	var forStart = 0;
            	var forEnd = 0;
            	
            	if((startPage-5) < 1){
            		forStart = 1;
            	}else{
            		forStart = startPage-5;
            	}
            	
            	if(forStart == 1){
            		
            		if(totalPage>9){
            			forEnd = 10;
            		}else{
            			forEnd = totalPage;
            		}
            		
            	}else{
            		
            		if((startPage+4) > totalPage){
                		
            			forEnd = totalPage;
                		
                		if(forEnd>9){
                			forStart = forEnd-9
                		}
                		
                	}else{
                		forEnd = startPage+4;
                	}
            	}
            	//--페이지네이션에 항상 10개가 보이도록 조절
            	
            	//전체 페이지 수를 받아 돌린다.
            	for(var i = forStart ; i<= forEnd ; i++){
            		if(startPage == i){
            			pagination += ' <button  name="page_move" start_page="'+i+'" disabled>'+i+'</button>';
            		}else{
            			pagination += ' <button  name="page_move" start_page="'+i+'" style="cursor:pointer;" >'+i+'</button>';
            		}
            	}
            	
            	//하단 페이지 부분에 붙인다.
            	$("#pagination").append(pagination);
            	//--페이지 셋팅
            	
            	
            	$("a[name='subject']").click(function(){
            		
            		location.href = "/BestText/board/view?id="+$(this).attr("content_id");
            		
            	});
            	
            	$("#write").click(function(){
            		location.href = "/BestText/board/edit";
            	});
            	            	
            	$(document).on("click","button[name='page_move']",function(){
            		
                    var visiblePages = 10;//리스트 보여줄 페이지
                    
                    $('#startPage').val($(this).attr("start_page"));//보고 싶은 페이지
                    $('#visiblePages').val(visiblePages);
                    
                    $("#frmSearch").submit();
                    
            	});
            	
            });
        </script>
</html>