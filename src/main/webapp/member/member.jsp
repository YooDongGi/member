<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	
	<title>회원 조회</title>
	
	<!-- Font Awesome Icons -->
	<link rel="stylesheet" href="../resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
	<!-- Theme style -->
	<link rel="stylesheet" href="../resources/bootstrap/dist/css/adminlte.min.css">
	<!-- jQuery -->
	<script src="../resources/bootstrap/plugins/jquery/jquery.min.js"></script>

	<!-- Bootstrap 4 -->
	<script src="../resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script src="../resources/bootstrap/dist/js/adminlte.min.js"></script>
	<script>
		
		$(function() {
			// 수정버튼을 눌렀을 경우
			$('#modifyBtn').on('click',function() {
				$('#frm').attr("method", "GET");
				$('#frm').attr("action", "${pageContext.request.contextPath }/memberModify")
				$('#frm').submit();
			});
			// 삭제버튼을 눌렀을 경우
			$('#deleteBtn').on('click',function() {
				$('#frm').attr("method", "POST");
				$('#frm').attr("action", "${pageContext.request.contextPath }/memberDelete")
				$('#frm').submit();
			});
		});			 
	</script>
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<%@ include file="/common/header.jsp" %>
		</nav>
		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<%@ include file="/common/left.jsp" %>
		</aside>
		<div id="if_list_div" style="position: relative; padding: 0; overflow: hidden;">
			<!-- Content Wrapper. Contains page content -->
			<div class="content-wrapper">
				<!-- Main content -->
				<section class="content register-page" style="height:100%;">
					<div class="container-fluid">
						<div class="login-logo">
							<b>회원 정보</b>
						</div>
						<!-- form start -->
						<div class="card">
							<div class="register-card-body">
							
								<form id="frm" role="form" class="form-horizontal" >
								
									<input type="hidden" name="userid" value="${member.userid }">
									<div class="input-group mb-3">
										<div class="mailbox-attachments clearfix" style="text-align: center; width:100%;">
											<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;">
												<img id="pictureViewImg" src="/profile?userid=${member.userid }" style="width:100%; height:100%;"/>
											</div>
										</div>
										<br>
									</div>
									<div class="form-group row">
										<label class="col-sm-3" style="font-size: 0.9em;">아이디</label>
										<div class="col-sm-9 input-group input-group-sm">
											<span class="input-group-append-sm">${member.userid }</span>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">패스워드</label>
										<div class="col-sm-9 input-group-sm">
											<span class="input-group-append-sm">***********</span>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="name" class="col-sm-3" style="font-size: 0.9em;">이 름</label>
										<div class="col-sm-9 input-group-sm">
											<span class="input-group-append-sm">${member.usernm }</span>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="alias" class="col-sm-3" style="font-size: 0.9em;">별명</label>
										<div class="col-sm-9 input-group-sm">
											<span class="input-group-append-sm">${member.alias }</span>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="addr1" class="col-sm-3 control-label">도로주소</label>
										<div class="col-sm-9 input-group-sm">
											<span class="input-group-append-sm">${member.addr1 }</span>
										</div>
									</div>
									<div class="form-group row">
										<label for="addr2" class="col-sm-3 control-label">상세주소</label>
										<div class="col-sm-9 input-group-sm">
											<span class="input-group-append-sm">${member.addr2 }</span>	
										</div>
									</div>
									<div class="form-group row">
										<label for="addr1" class="col-sm-3 control-label">우편번호</label>
										<div class="col-sm-9 input-group-sm">
											<span class="input-group-append-sm">${member.zipcode }</span>
										</div>
									</div>
									
									<div class="card-footer">
										<div class="row">
											<div class="col-sm-8">
											</div>
											<div class="col-sm-4">
												<button type="button" id="modifyBtn" class="btn btn-info">수정</button>
												<button type="button" id="deleteBtn" class="btn btn-info">삭제</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>

	<%@include file="/common/bottom.jsp"%>

</body>
</html>

