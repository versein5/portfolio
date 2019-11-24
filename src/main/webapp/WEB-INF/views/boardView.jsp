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
   			<table class="table-bordered" border="1" width="1200px" >
   				<tr>
   					<td colspan="2" align="right">
   						<input type="password" id="password" name="password" style="width:200px;" maxlength="10" placeholder="password"/>
   						<button class="btn btn-default" id="modify" name="Post modify">post Modify</button>
   						<button class="btn btn-default" id="delete" name="delete">post Delete</button>
   					</td>
   				</tr>
   				<tr>
   					<td width="900px" height="50px">
						Subject: ${boardView.subject}
					</td>
					<td>
						Writer: ${boardView.writer}
					</td>
   				</tr>
   				<tr height="500px">
   					<td colspan="2" valign="top">
   						${boardView.content}
   					</td>
   				</tr>
   			</table>
   			<table class="table-bordered" border="1" width="1200px" id="reply_area">
   				<tr reply_type="all"  style="display:none"><!-- 뒤에 댓글 붙이기 쉽게 선언 -->
   					<td colspan="4"></td>
   				</tr>
	   			<!-- 댓글이 들어갈 공간 -->
	   			<c:forEach var="replyList" items="${replyList}" varStatus="status">
					<tr reply_type="<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>"><!-- 댓글의 depth 표시 -->
			    		<td width="820px">
			    			<c:if test="${replyList.depth == '1'}"> → </c:if>${replyList.reply_content}
			    		</td>
			    		<td width="100px">
			    			${replyList.reply_writer}
			    		</td>
			    		<td width="100px">
			    			<input type="password" id="reply_password_${replyList.reply_id}" style="width:100px;" maxlength="10" placeholder="password"/>
			    		</td>
			    		<td align="center">
<%-- 			    			<c:if test="${replyList.depth != '1'}"> --%>
<%-- 			    				<button class="btn btn-default" name="reply_reply" parent_id = "${replyList.reply_id}" reply_id = "${replyList.reply_id}">reply</button><!-- 첫 댓글에만 댓글이 추가 대댓글 불가 --> --%>
<%-- 			    			</c:if> --%>
			    			<button class="btn btn-default" name="reply_modify" parent_id = "${replyList.parent_id}" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">modify</button>
			    			<button class="btn btn-default" name="reply_del" r_type = "<c:if test="${replyList.depth == '0'}">main</c:if><c:if test="${replyList.depth == '1'}">sub</c:if>" reply_id = "${replyList.reply_id}">delete</button>
			    		</td>
			    	</tr>
			    </c:forEach>
   			</table>
   			<table border="1" width="1200px" bordercolor="#46AA46">
   				<tr>
   					<td width="500px">
						user: <input type="text" id="reply_writer" name="reply_writer" style="width:170px;" maxlength="10" placeholder=""/>
						password: <input type="password" id="reply_password" name="reply_password" style="width:170px;" maxlength="10" placeholder=""/>
						<button class="btn btn-primary" id="reply_save" name="reply_save">Commenting</button>
					</td>
   				</tr>
   				<tr>
   					<td>
   						<textarea id="reply_content" name="reply_content" rows="4" cols="50" placeholder="Please enter comments."></textarea>
   					</td>
   				</tr>
   			</table>
   			<table width="1200px">
   				<tr>
   					<td align="right">
   						<button class="btn btn-default" id="list" name="list">게시판</button>
   					</td>
   				</tr>
   			</table>
    	</div>
    	<footer class="footer">		
		<p class="text-center">Copyright (c) 2019</p>		
	</footer>
    </body>
     <script type="text/javascript">
            $(document).ready(function(){
            	
            	var status = false; //수정과 대댓글을 동시에 적용 못하도록
            	
            	$("#list").click(function(){
            		location.href = "list";
            	});
            	
            	//댓글 저장
            	$("#reply_save").click(function(){
            		
            		//널 검사
                    if($("#reply_writer").val().trim() == ""){
                    	swal("이름을 입력하세요.");
                    	$("#reply_writer").focus();
                    	return false;
                    }
            		
                    if($("#reply_password").val().trim() == ""){
                    	swal("패스워드를 입력하세요.");
                    	$("#reply_password").focus();
                    	return false;
                    }
                    
                    if($("#reply_content").val().trim() == ""){
                    	swal("내용을 입력하세요.");
                    	$("#reply_content").focus();
                    	return false;
                    }
                    
                    var reply_content = $("#reply_content").val().replace("\n", "<br>"); //개행처리
            		
            		//값 셋팅
            		var objParams = {
            				board_id		: $("#board_id").val(),
            				parent_id		: "0",	
            				depth			: "0",
            				reply_writer	: $("#reply_writer").val(),
            				reply_password	: $("#reply_password").val(),
            				reply_content	: reply_content
    				};
            		
            		var reply_id;
            		
            		//ajax 호출
            		$.ajax({
            			url			:	"reply/save",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code != "OK") {
            					swal(retVal.message);
            					return false;
            				}else{
                				reply_id = retVal.reply_id;
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            				

            			}
            		});
            		
            		var reply_area = $("#reply_area");
            		
            		var reply = 
            			'<tr reply_type="main">'+
	            		'	<td width="820px">'+
	            		reply_content+
	            		'	</td>'+
	            		'	<td width="100px">'+
	            		$("#reply_writer").val()+
	            		'	</td>'+
	            		'	<td width="100px">'+
	            		'		<input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="password"/>'+
	            		'	</td>'+
	            		'	<td align="center">'+
// 	            		'       <button name="reply_reply" reply_id = "'+reply_id+'">reply</button>'+
                        '       <button class="btn btn-default" name="reply_modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'">modify</button>      '+
                        '       <button class="btn btn-default" name="reply_del" r_type = "main" reply_id = "'+reply_id+'">delete</button>      '+
	            		'	</td>'+
	            		'</tr>';
	            		
            		 if($('#reply_area').contents()==' '){
                         $('#reply_area').append(reply);
                     }else{
                         $('#reply_area tr:last').after(reply);
                     }

            		//댓글 초기화
            		$("#reply_writer").val("");
    				$("#reply_password").val("");
    				$("#reply_content").val("");
    				
            	});
            	
            	//댓글 삭제
            	$(document).on("click","button[name='reply_del']", function(){
            		
            		var check = false;
            		var reply_id = $(this).attr("reply_id");
            		var r_type = $(this).attr("r_type");
            		var reply_password = "reply_password_"+reply_id;
            		
            		if($("#"+reply_password).val().trim() == ""){
                    	swal("패스워드을 입력하세요.");
                    	$("#"+reply_password).focus();
                    	return false;
                    }
            		
            		//패스워드와 아이디를 넘겨 삭제를 한다.
            		//값 셋팅
            		var objParams = {
            				reply_password	: $("#"+reply_password).val(),
            				reply_id		: reply_id,
            				r_type			: r_type
    				};
            		
            		//ajax 호출
            		$.ajax({
            			url			:	"reply/del",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code != "OK") {
            					swal(retVal.message);
            				}else{
            					
            					check = true;
            					            					
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            		if(check){
            			
            			if(r_type=="main"){//depth가 0이면 하위 댓글 다 지움
            				//삭제하면서 하위 댓글도 삭제
        					var prevTr = $(this).parent().parent().next(); //댓글의 다음
                    		
                    		while(prevTr.attr("reply_type")=="sub"){//댓글의 다음이 sub면 계속 넘어감
                                prevTr.remove();
                                prevTr = $(this).parent().parent().next();
                            }
                    		                    		
                    		$(this).parent().parent().remove();	
            			}else{ //아니면 자기만 지움
            				$(this).parent().parent().remove();	
            			}
            			
            		}
            		
            	});
            	
            	//댓글 수정 입력
                $(document).on("click","button[name='reply_modify']", function(){
                    
                    var check = false;
                    var reply_id = $(this).attr("reply_id");
                    var parent_id = $(this).attr("parent_id");
                    var r_type = $(this).attr("r_type");
                    var reply_password = "reply_password_"+reply_id;
                     
                    if($("#"+reply_password).val().trim() == ""){
                    	swal("패스워드을 입력하세요.");
                        $("#"+reply_password).focus();
                        return false;
                    }
                     
                    //패스워드와 아이디를 넘겨 패스워드 확인
                    //값 셋팅
                    var objParams = {
                            reply_password  : $("#"+reply_password).val(),
                            reply_id        : reply_id
                    };
                     
                    //ajax 호출
                    $.ajax({
                        url         :   "reply/check",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                                check = false;//패스워드가 맞으면 체크값을 true로 변경
                                swal(retVal.message);
                            }else{
                                check = true;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    
                    
                    if(status){
                    	swal("수정과 대댓글은 동시에 불가합니다.");
                        return false;
                    }
                    
                    
                    if(check){
                    	status = true;
                        //자기 위에 댓글 수정창 입력하고 기존값을 채우고 자기 자신 삭제
                        var txt_reply_content = $(this).parent().prev().prev().prev().html().trim(); //댓글내용 가져오기
                        if(r_type=="sub"){
                            txt_reply_content = txt_reply_content.replace("→ ","");//대댓글의 뎁스표시(화살표) 없애기
                        }
                        
                        var txt_reply_writer = $(this).parent().prev().prev().html().trim(); //댓글작성자 가져오기
                        
                        //입력받는 창 등록
                        var replyEditor = 
                           '<tr id="reply_add" class="reply_modify">'+
                           '   <td width="820px">'+
                           '       <textarea name="reply_modify_content_'+reply_id+'" id="reply_modify_content_'+reply_id+'" rows="3" cols="50">'+txt_reply_content+'</textarea>'+ //기존 내용 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="text" name="reply_modify_writer_'+reply_id+'" id="reply_modify_writer_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="user" value="'+txt_reply_writer+'"/>'+ //기존 작성자 넣기
                           '   </td>'+
                           '   <td width="100px">'+
                           '       <input type="password" name="reply_modify_password_'+reply_id+'" id="reply_modify_password_'+reply_id+'" style="width:100%;" maxlength="10" placeholder="password"/>'+
                           '   </td>'+
                           '   <td align="center">'+
                           '       <button class="btn btn-default" name="reply_modify_save" r_type = "'+r_type+'" parent_id="'+parent_id+'" reply_id="'+reply_id+'">reply</button>'+
                           '       <button class="btn btn-default" name="reply_modify_cancel" r_type = "'+r_type+'" r_content = "'+txt_reply_content+'" r_writer = "'+txt_reply_writer+'" parent_id="'+parent_id+'"  reply_id="'+reply_id+'">delete</button>'+
                           '   </td>'+
                           '</tr>';
                        var prevTr = $(this).parent().parent();
                           //자기 위에 붙이기
                        prevTr.after(replyEditor);
                        
                        //자기 자신 삭제
                        $(this).parent().parent().remove(); 
                    }
                     
                });
            	
                //댓글 수정 취소
                $(document).on("click","button[name='reply_modify_cancel']", function(){
                    //원래 데이터를 가져온다.
                    var r_type = $(this).attr("r_type");
                    var r_content = $(this).attr("r_content");
                    var r_writer = $(this).attr("r_writer");
                    var reply_id = $(this).attr("reply_id");
                    var parent_id = $(this).attr("parent_id");
                    
                    var reply;
                    //자기 위에 기존 댓글 적고 
                    if(r_type=="main"){
                        reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="password"/>'+
                            '   </td>'+
                            '   <td align="center">'+
//                             '       <button name="reply_reply" reply_id = "'+reply_id+'">reply</button>'+
                            '       <button class="btn btn-default" name="reply_modify" r_type = "main" parent_id="0" reply_id = "'+reply_id+'">modify</button>      '+
                            '       <button class="btn btn-default" name="reply_del" reply_id = "'+reply_id+'">delete</button>      '+
                            '   </td>'+
                            '</tr>';
                    }else{
                        reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            r_content+
                            '   </td>'+
                            '   <td width="100px">'+
                            r_writer+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="password"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button class="btn btn-default" name="reply_modify" r_type = "sub" parent_id="'+parent_id+'" reply_id = "'+reply_id+'">modifiy</button>'+
                            '       <button class="btn btn-default" name="reply_del" reply_id = "'+reply_id+'">delete</button>'+
                            '   </td>'+
                            '</tr>';
                    }
                    
                    var prevTr = $(this).parent().parent();
                       //자기 위에 붙이기
                    prevTr.after(reply);
                       
                      //자기 자신 삭제
                    $(this).parent().parent().remove(); 
                      
                    status = false;
                    
                });
                
                  //댓글 수정 저장
                $(document).on("click","button[name='reply_modify_save']", function(){
                    
                    var reply_id = $(this).attr("reply_id");
                    
                    //널 체크
                    if($("#reply_modify_writer_"+reply_id).val().trim() == ""){
                    	swal("이름을 입력하세요.");
                        $("#reply_modify_writer_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_password_"+reply_id).val().trim() == ""){
                    	swal("패스워드를 입력하세요.");
                        $("#reply_modify_password_"+reply_id).focus();
                        return false;
                    }
                     
                    if($("#reply_modify_content_"+reply_id).val().trim() == ""){
                    	swal("내용을 입력하세요.");
                        $("#reply_modify_content_"+reply_id).focus();
                        return false;
                    }
                    //DB에 업데이트 하고
                    //ajax 호출 (여기에 댓글을 저장하는 로직을 개발)
                    var reply_content = $("#reply_modify_content_"+reply_id).val().replace("\n", "<br>"); //개행처리
                    
                    var r_type = $(this).attr("r_type");
                    
                    var parent_id;
                    var depth;
                    if(r_type=="main"){
                        parent_id = "0";
                        depth = "0";
                    }else{
                        parent_id = $(this).attr("parent_id");
                        depth = "1";
                    }
                    
                    //값 셋팅
                    var objParams = {
                            board_id        : $("#board_id").val(),
                            reply_id		: reply_id,
                            parent_id       : parent_id, 
                            depth           : depth,
                            reply_writer    : $("#reply_modify_writer_"+reply_id).val(),
                            reply_password  : $("#reply_modify_password_"+reply_id).val(),
                            reply_content   : reply_content
                    };

                    $.ajax({
                        url         :   "reply/update",
                        dataType    :   "json",
                        contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
                        type        :   "post",
                        async       :   false, //동기: false, 비동기: ture
                        data        :   objParams,
                        success     :   function(retVal){
 
                            if(retVal.code != "OK") {
                            	swal(retVal.message);
                                return false;
                            }else{
                                reply_id = retVal.reply_id;
                                parent_id = retVal.parent_id;
                            }
                             
                        },
                        error       :   function(request, status, error){
                            console.log("AJAX_ERROR");
                        }
                    });
                    
                    //수정된댓글 내용을 적고
                    if(r_type=="main"){
                        reply = 
                            '<tr reply_type="main">'+
                            '   <td width="820px">'+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="패스워드"/>'+
                            '   </td>'+
                            '   <td align="center">'+
//                             '       <button name="reply_reply" reply_id = "'+reply_id+'">reply</button>'+
                            '       <button class="btn btn-default" name="reply_modify" r_type = "main" parent_id = "0" reply_id = "'+reply_id+'">modifiy</button>      '+
                            '       <button class="btn btn-default" name="reply_del" r_type = "main" reply_id = "'+reply_id+'">delete</button>      '+
                            '   </td>'+
                            '</tr>';
                    }else{
                        reply = 
                            '<tr reply_type="sub">'+
                            '   <td width="820px"> → '+
                            $("#reply_modify_content_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            $("#reply_modify_writer_"+reply_id).val()+
                            '   </td>'+
                            '   <td width="100px">'+
                            '       <input type="password" id="reply_password_'+reply_id+'" style="width:100px;" maxlength="10" placeholder="password"/>'+
                            '   </td>'+
                            '   <td align="center">'+
                            '       <button class="btn btn-default" name="reply_modify" r_type = "sub" parent_id = "'+parent_id+'" reply_id = "'+reply_id+'">modify</button>'+
                            '       <button class="btn btn-default" name="reply_del" r_type = "sub" reply_id = "'+reply_id+'">delete</button>'+
                            '   </td>'+
                            '</tr>';
                    }
                    
                    var prevTr = $(this).parent().parent();
                    //자기 위에 붙이기
                    prevTr.after(reply);
                       
                    //자기 자신 삭제
                    $(this).parent().parent().remove(); 
                      
                    status = false;
                    
                });
                  
            	
            	//글수정
            	$("#modify").click(function(){
            		
            		var password = $("input[name='password']");
            		
            		if(password.val().trim() == ""){
            			swal("패스워드를 입력하세요.");
                    	password.focus();
                    	return false;
                    }
            		            		
            		//ajax로 패스워드 검수 후 수정 페이지로 포워딩
            		//값 셋팅
            		var objParams = {
            				id		 : $("#board_id").val(),	
            				password : $("#password").val()
    				};
            		            		
            		//ajax 호출
            		$.ajax({
            			url			:	"check",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code != "OK") {
            					swal(retVal.message);
            				}else{
                				location.href = "edit?id="+$("#board_id").val();
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            	});
            	
            	//글 삭제
				$("#delete").click(function(){
					
					var password = $("input[name='password']");
            		
            		if(password.val().trim() == ""){
            			swal("패스워드를 입력하세요.");
                    	password.focus();
                    	return false;
                    }
            		
            		//ajax로 패스워드 검수 후 수정 페이지로 포워딩
            		//값 셋팅
            		var objParams = {
            				id		 : $("#board_id").val(),	
            				password : $("#password").val()
    				};
            		            		
            		//ajax 호출
            		$.ajax({
            			url			:	"del",
            			dataType	:	"json",
            			contentType :	"application/x-www-form-urlencoded; charset=UTF-8",
            			type 		:	"post",
            			async		: 	false, //동기: false, 비동기: ture
            			data		:	objParams,
            			success 	:	function(retVal){

            				if(retVal.code != "OK") {
            					swal(retVal.message);
            				}else{
            					swal("삭제 되었습니다.");
                				location.href = "list";
            				}
            				
            			},
            			error		:	function(request, status, error){
            				console.log("AJAX_ERROR");
            			}
            		});
            		
            	});
            	
            });
        </script>
</html>