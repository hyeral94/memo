<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
			<h1 class="text-center">메모 입력</h1>
			<div class="d-flex">
				<label class="mr-2">제목 : </label>
				<input type="text" class="form-control col-11" id="titleInput">
			</div>
			<textarea class="form-control mt-3" rows="5" id="contentInput"></textarea>
			<input type="file" class="mt-3" id="fileInput">
			<div class="d-flex justify-content-between mt-3">
				<a href="/post/list_view" class="btn btn-info">목록으로</a>
				<button type="button" class="btn btn-success" id="saveBtn">저장</button>
			</div>
		</div>
	</section>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	
		$(document).ready(function(){
			$("#saveBtn").on("click", function(){
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();
				//trim : 무의미한 공백 없애줌
				
				if(title == "") {
					alert("제목을 입력하세요.");
					return;
				}
				
				if(content == "") {
					alert("내용을 입력하세요.");
					return;
				}
				
				var formData = new FormData();
				formData.append("subject", title);
				formData.append("content", content);
				formData.append("file"), $("#fileInput")[0].files[0]);
			
				$.ajax({
					type:"post",
					url:"/post/create",
					data:formData,
					enctype:"multipart/form-data", // 파일 업로드 필수
					processData:false, // 파일 업로드 필수
					contentType:false, // 파일 업로드 필수
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/list_view";
						}else {
							alert("글쓰기 실패");
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