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
<title>메인화면 (로그인)</title>
</head>
<body>
	<div id="wrap">
		<div class="container">
		
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			
			<section class="d-flex justify-content-center align-items-center">
				<div id="loginBox" class="mt-3 mb-3" >
					<div class="container">
						<div class="input-group form-group mt-5">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" placeholder="아이디" id="idInput">
							
						</div>
						<div class="input-group form-group mt-3">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" placeholder="비밀번호" id="passwordInput">
						</div>
						
						<button class="btn btn-warning text-primary form-control mt-4" id="loginBtn">로그인</button>
						
						<br><br><br>
						<div class="text-center">
							<label ><a href="/user/signUpView">회원가입하기</a></label>
						</div>
					</div>
				</div>
				
			</section>
			
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
			
			
			
		</div>
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			$("#loginBtn").on("click", function() {
				
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/signIn",
					data:{"loginId":id, "password":password },
					success:function(data) {
						if(data.result == "success") {
							// 로그인 화면으로 이동
							location.href = "/post/timeline";
							
						} else {
							alert("아이디와 비밀번호가 잘못되었씁니다.");
						}
					}, 
					error:function() {
						alert("에러 발생");
					}
				});
			});
		});
	
	</script>
	
	
	<%-- 로그인화면 마무리
	앞으로 할거 
	 --%>
</body>
</html>