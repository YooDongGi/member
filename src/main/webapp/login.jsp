<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<link rel="stylesheet" href="./resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<link rel="stylesheet" href="./resources/bootstrap/dist/css/adminlte.min.css">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/js-cookie@rc/dist/js.cookie.min.js"></script>
	<script src="/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
	<script	src="/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="/resources/bootstrap/dist/js/adminlte.min.js"></script>
	<style>
		body.login-page {
			/* background-image: url('/resources/images/intro.jpg'); */
			background-position: center;
			background-size: cover;
			background-repeat: no-repeat;
		}
	</style>
	<script>
		function getCookieValue(cookieStr, cookieName) {
			
			var cookies = cookieStr.split("; ");
			for(var i in cookies) {
				var cookie = cookies[i].split("=");
				if (cookieName == cookie[0]) {
					return cookie[1];
				}
			}
			return "";
		}	
		
		function addCookie(cookieName, cookieValue, expires) {
			var dt = new Date(); 	// 현재 날짜 ==> expires 만큼 미래날짜로 변경
			dt.setDate( dt.getDate() + parseInt(expires));
			console.log(dt);
			document.cookie = cookieName + "=" + cookieValue + "; " +
								"path=/; expires=" + dt.toGMTString();
		}
		
		function deleteCookie(cookieName) {
			addCookie(cookieName, "", -1);
		}
		
		$(function(){
			
			if (Cookies.get("rememberme") != undefined) {
				$("#rememberme").prop("checked", true);	
				$("#userid").val(Cookies.get("userid"));
			}
			
			//signin 아이디를 select
			$('#signin').on("click", function(){
				// rememberme 체크박스의 체크 여부 확인
				// 체크되어있을 경우
				if($("#rememberme").is(":checked") == true){
					// userid input에 있는 값을 userid쿠키로 저장
					Cookies.set("userid" , $('#userid').val());								
					// rememberme 쿠키로 Y 값을 저장
					Cookies.set("rememberme" , "Y");
					
				} 
				// 체크되어있지 않은 경우 : userid, rememberme 쿠키 삭제
				else {
					Cookies.remove("userid");
					Cookies.remove("rememberme");
				}
				
				// form태그를 이용하여 signin 요청
				$('#frm').submit();
				
			});
		});
	</script>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="#"><b>관리자 로그인</b></a>
		</div>
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>
				<form action="${pageContext.request.contextPath }/login" method="post" id="frm">
					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="userid" name="id" placeholder="아이디를 입력하세요." value="${param.id }">
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="password" class="form-control" name="pass" placeholder="패스워드를 입력하세요." value="">
						<span class="glyphicon glyphicon-lock form-control-feedback"></span>
					</div>
					<div class="row">
						<div class="col-sm-8">
							<div class="checkbox icheck">
								<label> 
									<input id="rememberme" type="checkbox" name="rememberMe"> Remember Me
								</label>
							</div>
						</div>
						<div class="col-sm-4">
							<button type="button" class="btn btn-primary btn-block btn-flat" id="signin">로그인</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>