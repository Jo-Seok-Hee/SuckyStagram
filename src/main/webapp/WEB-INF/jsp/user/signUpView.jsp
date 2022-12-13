<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	
	
	<link rel="stylesheet" href="/css/style.css" type="text/css">
<title>SuckyStaGram 회원가입</title>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
			<section class="d-flex justify-content-center align-items-center">
			
				<div id="signUpBox" class="container w-50 p-2" style="400px;" >
				
					
					<h3 class="text-center mt-2">회원가입</h3><br>
					<div class="input-group mb-3 d-flex">
					    <div class="input-group-prepend col-4">
					        <span class="input-group-text" >아이디</span>
					    </div>
					    <input type="text" class="form-control col-8" id="loginIdInput" >
					</div>
					
					<div class="input-group mb-3 d-flex">
					    <div class="input-group-prepend col-4">
					        <span class="input-group-text" >비밀번호</span>
					    </div>
					    <input type="password" class="form-control col-8" id="passwordInput"  >
					</div>
					
					<div class="input-group mb-3 d-flex">
					    <div class="input-group-prepend col-4">
					        <span class="input-group-text" >이름</span>
					    </div>
					    <input type="text" class="form-control col-8" id="nameInput">
					</div>
					
					<div class="input-group mb-3 d-flex">
					    <div class="input-group-prepend col-4">
					        <span class="input-group-text" >닉네임</span>
					    </div>
					    <input type="text" class="form-control col-8" id="nicknameInput" >
					</div>
					
					<div class="input-group mb-3 d-flex">
					    <div class="input-group-prepend col-4">
					        <span class="input-group-text" >이메일</span>
					    </div>
					    <input type="text" class="form-control col-8" id="emailInput">
					</div>
					<div class="d-flex justify-content-center">			
						<button type="button" class="btn btn-warning text-primary " id="signUpBtn">회원가입</button>
					</div>		
				</div>
			
			</section>
			
		
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		</div>
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			$("#signUpBtn").on("click",function(){
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let name = $("#nameInput").val();
				let nickname = $("#nicknameInput").val();
				let email = $("#emailInput").val();
				
				
				if(loginId == ""){
					alert("아이디를 입력하세요");
					return ;
				}
				
				if(password == ""){
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if(name == ""){
					alert("이름을 입력하세요.");
					return ;
				}
				
				if(nickname == ""){
					alert("닉네임을 입력하세요.");
					return ;
				}
				
				if(email == ""){
					alert("이메일을 입력하세요.");
					return ;
				}
				
			
				$.ajax({
					type:"post",
					url:"/user/signUp",
					data:{"loginId":loginId, "password":password, "name":name, "nickname":nickname ,"email":email},
					success:function(data) {
						if(data.result == "success") {
							// 로그인 화면으로 이동
							location.href = "/user/mainView";
							
						} else {
							alert("회원가입 실패");
						}
					}, 
					error:function() {
						alert("에러 발생");
					}
				});
				
				
			});
			
		});
	
	
	
	</script>
</body>
</html>