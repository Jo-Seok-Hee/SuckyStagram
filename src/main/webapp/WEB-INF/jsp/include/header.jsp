<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<header class="bg-warning text-center  font-italic mt-4 d-flex align-items-center justify-content-between">
		<label class="font-weight-bold ml-4">SuckyStaGram</label>
			<div style="font-size:20px;" class="justify-content-end">
				<c:choose>
					<c:when test="${not empty userId }">
						<div class="mr-3" >"${userName }"님 환영합니다 <a href="/user/signout">로그아웃</a></div>
					
					</c:when>
					
					<c:otherwise>
						<div class="mr-3"> <a href="/user/mainView">로그인</a></div>
					
					</c:otherwise>
				
				
				</c:choose>
			</div>
	</header>