<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  	
  	
  	<link rel="stylesheet" href="/css/style.css">
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<title>타임라인</title>
</head>
<body>
	<div id="wrap">
		<div class="container">
			<c:import url="/WEB-INF/jsp/include/header.jsp" />
			<%--타임라인 박스 --%>
			<section class="d-flex justify-content-center">
			
				<div id="timeline" >
					
					<div class="pt-3">
						<%--텍스트 에어리어 --%>
						<div>
							<textarea id="contentInput" class="w-100 form-control" rows="5" placeholder="지금당장 당신의 소식을 친구들에게 전해보세요."></textarea>
						</div>
						
						<%--파일첨부 업로드 버튼 --%>
						<div class="d-flex justify-content-between">
							<span class="img-icon"> <i class="bi bi-image" id="imgBtn"></i></span>
							<input type="file" class="form-control d-none" id="fileInput">
							<button class="btn btn-primary text-white" id="uploadBtn">업로드</button>
						</div>
					
					</div>
					
					<%--게시글 1 --%>
					<c:forEach var="postDetail" items="${postList }">
					<div class="mt-4">
						<%--게시글 헤더 --%>
						<div id="postHeader" class="bg-warning d-flex align-items-center justify-content-between">
							<label class="ml-3 font-weight-bold">${postDetail.post.userName }
									<%--세션에서 얻어온 유저아이디 --%>
									<c:set var="sessionUserId" value="${userId }"/>
									<%--포스트에서 얻어온 유저아이디 --%>
									<c:set var="postUserId" value="${postDetail.post.userId}"/>
	
										
									<c:choose>
										<c:when test="${sessionUserId eq postUserId }">
											<button type="button" class="btn btn-warning moreBtn"  data-post-id="${postDetail.post.id }" data-toggle="modal" data-target="#postModal">
											...
											</button>
										</c:when>
										<c:otherwise>
										
										</c:otherwise>
									
									</c:choose>
								
							</label>							
							
							<div>
								<label class="mr-3">좋아요 ${postDetail.likeCount }개</label>
								
								<a href="#" class="likeBtn" data-post-id="${postDetail.post.id }" >
									<c:choose>
										<c:when test="${postDetail.like }">
												<i class="bi bi-heart-fill heart-icon text-danger"></i>
										</c:when>
										<c:otherwise>
												<i class="bi bi-heart heart-icon text-dark"></i>	
										</c:otherwise>
									</c:choose>
								</a>
								
							</div>
						</div>
						
						<%--게시글 사진 --%>
						<div class="container">
							<img class="w-100 mt-2" src="${postDetail.post.imagePath }">
						</div>
						<div class="d-flex justify-content-center">
							<label class="font-weight-bold">${postDetail.post.content }</label>
						</div>
						<%--게시글 좋아요, 댓글, 댓글추가 --%>
						
						<div>
							<%--댓글 반복문 --%>
							<c:forEach var="comment" items="${postDetail.commentList }">
								<div class="d-flex mt-2">
									<label class="ml-3 font-weight-bold col-2">${comment.userName }</label>
									<label class="ml-3 col-8">${comment.content }</label>
									<button class="btn btn-danger deleteCommentBtn" data-post-id="${postDetail.post.id }">삭제</button>
								</div>
							</c:forEach>
							<%--댓글 추가 --%>
							<div class="input-group mt-2 mb-4">
								<span class="mt-1 ml-2">${userName }</span>
								<input type="text" class="form-control ml-3" placeholder="댓글을 입력해주세요." id="commentInput${postDetail.post.id }">
								<div >
									<button  class="btn btn-primary commentBtn" data-post-id="${postDetail.post.id }">게시</button>
								</div>
							</div>
						</div>
					</div>
					

					</c:forEach>
					
				</div>
				
			
			</section>
			
			
			
			<c:import url="/WEB-INF/jsp/include/footer.jsp" />
		
		</div>
		
					<!-- Modal -->
		<div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
			
			     <div class="modal-body text-center">
		        <button type="button" class="btn btn-danger " id="deleteBtn"  >삭제하기</button>
			     </div>
		      <div class="modal-footer">
			       <button type="button" class="btn btn-secondary" data-dismiss="modal">뒤로가기</button>
			        
		      </div>
		    </div>
		  </div>
		</div>
		

	
	
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#imgBtn").on("click",function(){
				
				//다른 버튼 클릭기능
				$("#fileInput").click();
			});
			
			
			$("#uploadBtn").on("click",function(){
				
				
				let content = $("#contentInput").val().trim();
				
				
				if(content == "") {
					alert("내용을 입력하세요");
					return ;
				}
				
				if($("#fileInput")[0].files.length == 0) {
					alert("파일을 선택해주세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("content",content);
				formData.append("file",$("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post",
					url:"/post/uploadPost",
					data:formData,
					enctype:"multipart/form-data",
					processData:false,
					contentType:false,
					success:function(data){
						
						if(data.result == "success"){
							alert("글쓰기 성공");
							location.reload();
						} else {
							alert("글쓰기 실패");
						}
					},
					error:function(){
						alert("글쓰기 에러");
					}
				});
			});
			
			$(".commentBtn").on("click", function(e) {
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				let content = $("#commentInput" + postId).val();
				
				if(content == ""){
					alert("댓글을 입력하세요");
					return ;
				}
				
				
				$.ajax({
					type:"post",
					url:"/post/uploadComment",
					data:{"postId":postId, "content":content},
					success:function(data) {
						if(data.result == "success") {
							alert("댓글 성공");
							location.reload();
						} else {
							alert("댓글 실패");
						}
						
					}, error:function() {
						alert("댓글쓰기 에러");
					}
					
				});
				
			});
			
			$(".likeBtn").on("click",function(e){
				
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/like",
					data:{"postId":postId},
					success:function(data){
						location.reload();
					}, error:function(){
						alert("좋아요 에러 발생");
					}
					
				});
			});
			
			<%--
			$(".unlikeBtn").on("click",function(e){
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/unlike",
					data:{"postId":postId},
					success:function(data){
						if(data.result == "success"){
							alert("좋아요취소 성공!!");
							location.reload();
						} else{
							alert("실패");
						}
					}, error:function(){
						alert("에러");
					}
						
					
					
				});
			});
			--%>
			
			$(".moreBtn").on("click",function(e){
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$("#deleteBtn").data("post-id",postId);
				
			});
			
			$("#deleteBtn").on("click",function(){
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					//tudse
					type:"get",
					url:"/post/deletePost",
					data:{"postId":postId},
					success:function(data){
						
						if(data.result == "success"){
							alert("글 삭제 성공!");
							location.reload();
						} else {
							alert("삭제할 수 있는 권한이 없습니다.");
						}
						
					}, error:function(){
						alert("에러 발생!");
					}
						
		
					
				});
			});
			
			$(".deleteCommentBtn").on("click",function(e){
				e.preventDefault();
				
				let postId = $(this).data("post-id");
				//2022-02-18 종료
			});
			<%-- 만들어본 삭제야작스
			$(".deletePostBtn").on("click",function(e){
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$.ajax({
					//tudse
					type:"post",
					url:"/post/deletePost",
					data:{"postId":postId},
					success:function(data){
						
						if(data.result == "success"){
							alert("글 삭제 성공!");
						} else {
							alert("삭제할 수 있는 권한이 없습니다.");
						}
						
					}, error(){
						alert("에러 발생!");
					}
						
		
					
				});
			});
			--%>
		});
	
	</script>
</body>
</html>