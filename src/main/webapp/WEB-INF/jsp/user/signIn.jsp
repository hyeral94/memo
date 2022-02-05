<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">

</head>
<body>
	<div id="wrap">
		<c:import url ="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="d-flex justify-content-center">
			<form id="loginForm">
			<div class="login-box my-5">
				<input type="text" class="form-control mt-3" placeholder="아이디" id="loginIdInput">
				<input type="password" class="form-control mt-3" placeholder="비밀번호" id="passwordInput">
				
				<button type="submit" class="btn btn-info form-control btn-block mt-3">로그인</button>
			
				<div class="text-center mt-3">
					<a href="/user/signup_view">회원가입</a>
				</div>
			</div>
			</form>
		</section>
		
		<c:import url ="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
		$(document).ready(function(){
			$("#loginForm").on("submit", function(e){
				e.preventDefault(); //or return false;
				
				var loginId = $("#loginIdInput").val();
				var password = $("#passwordInput").val();
				
				if(loginId == ""){
					alert("아이디를 입력하세요.");
					return;
				}
				
				if(password == "") {
					alert("비밀번호를입력하세요.");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/user/sign_in",
					data:{"loginId":loginId, "password":password},
					success:function(data) {
						if(data.result == "success") {
							location.href="/post/list_view";
						}else {
							alert("아이디/비밀번호가 일치하지 않습니다.");
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