<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 게시판(글 작성)</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
	<c:import url ="/WEB-INF/jsp/include/header.jsp" />
	
	<section class="d-flex justify-content-center">
		<div class="w-75">
			<h1 class="text-center mt-5">메모 보기</h1>
			<div class="d-flex">
				<label class="mr-2">제목 : </label>
				<input type="text" class="form-control" id="titleInput" value="${post.subject }">
			</div>
			<textarea class="form-control mt-3" rows="5" id="contentInput">${post.content }</textarea>
		<div class="d-flex justify-content-between mt-3">
			<div>
				<a href="/post/list_view" class="btn btn-info">목록으로</a>
				<button type="button" class="btn btn-danger" id="deleteBtn" data-post-id="${post.id }">삭제</button>
			</div>	
				<button type="button" class="btn btn-success" id="saveBtn">수정</button>
			
		</div>
	</section>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			$("#deleteBtn").on("click", function(){
				
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get",
					url:"/post/delete",
					data:{"postId":postId},
					success:function(data) {
						if(data.result == "success"){
							location.href="/post/list_view";
						}else {
							alert("삭제 실패");
						}
					},
					error:function() {
						alert("에러발생");
					}
				});
				
			});
			
		});
	
	</script>

</body>
</html>