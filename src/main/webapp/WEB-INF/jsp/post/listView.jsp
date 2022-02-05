<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 게시판</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
	<div id="wrap">
	<c:import url ="/WEB-INF/jsp/include/header.jsp" />
	
	<section class="d-flex justify-content-center">
		<div class="w-75 my-5">
			<h1 class="text-center">메모게시판</h1>
			<table class="table">
				<thead>
					<tr>
						<th>No.</th>
						<th>제목</th>
						<th>시간</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${postList }">
					<tr>
						<td>${post.id }</td>
						<td><a href="/post/detail_view?postId=${post.id }">${post.subject }</a></td>
						<td><fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
					</tr>
					</c:forEach>
				</tbody>
				
			</table>
			<div class="d-flex justify-content-end mt-3">
			<a href="/post/create_view" class="btn btn-info">글쓰기</a>
			</div>
		</div>
		
	</section>
	
	<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	</div>
</head>
<body>

</body>
</html>