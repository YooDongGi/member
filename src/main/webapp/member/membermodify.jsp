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
	
	<title>회원 수정</title>
	
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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
			  
				reader.onload = function (e) {
					$('#pictureViewImg').attr('src', e.target.result);  
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		$(function(){
			// picture input의 파일 변경시 이벤트 
			$("#picture").change(function(){
			   readURL(this);
			});
			$('#addrBtn').on('click',function(){
				
			    new daum.Postcode({
			        oncomplete: function(data) {
	
			            $('#addr1').val(data.roadAddress);	// 도로주소
			            $('#zipcode').val(data.zonecode);		// 우편번호
			            
			            $('#addr2').focus();
			        }
			    }).open();
			})
			// 수정버튼을 눌렀을 경우
			$('#modifyBtn').on('click',function() {
				$('#frm').attr("method", "POST");
				$('#frm').attr("action", "${pageContext.request.contextPath }/memberModify");
				$('#frm').attr("enctype", "multipart/form-data");
				$('#frm').submit();
			});
			// 취소버튼을 눌렀을 경우
			$('#cancelBtn').on('click',function() {
				$('#frm').attr("method", "GET");
				$('#frm').attr("action", "${pageContext.request.contextPath }/member")
				$('#frm').submit();
			});
			
		})
			 
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
							<b>회원 정보 수정</b>
						</div>
						<!-- form start -->
						<div class="card">
							<div class="register-card-body">
								<form id="frm" role="form" class="form-horizontal" action="${pageContext.request.contextPath }/memberModify" method="POST" enctype="multipart/form-data">
									
									<input type="hidden" name="id" value="${member.userid }"/>
									<input type="hidden" name="filename" value="${member.filename }"/>
									<input type="hidden" name="realfilename" value="${member.realfilename }"/>
								
									<div class="input-group mb-3">
										<div class="mailbox-attachments clearfix" style="text-align: center; width:100%;">
											<div class="mailbox-attachment-icon has-img" id="pictureView" style="border: 1px solid green; height: 200px; width: 140px; margin: 0 auto;">
												<img id="pictureViewImg" src="/profile?userid=${member.userid }" style="width:100%; height:100%;"/>
											</div>
											<div class="mailbox-attachment-info">
												<div class="input-group input-group-sm">
													<input id="picture" class="form-control" type="file" name="picture" accept=".gif, .jpg, .png" style="height:37px;"/>
												</div>
											</div>
										</div>
										<br>
									</div>
									
									<div class="form-group row">
										<label for="id" class="col-sm-3" style="font-size: 0.9em;">
											<span style="color: red; font-weight: bold;">*</span>아이디
										</label>
										<div class="col-sm-9 input-group-sm">
											<span class="input-group-append-sm">${member.userid }</span>
										</div>
									</div>
									
									
									
									<div class="form-group row">
										<label for="pwd" class="col-sm-3" style="font-size: 0.9em;">
											<span style="color: red; font-weight: bold;">*</span>패스워드</label>
										<div class="col-sm-9 input-group-sm">
											<input class="form-control" name="pass" type="password" class="form-control" id="pass" placeholder="비밀번호" value="${member.pass }" required/>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="name" class="col-sm-3" style="font-size: 0.9em;">
											<span style="color: red; font-weight: bold;">*</span>이 름
										</label>
										<div class="col-sm-9 input-group-sm">
											<input class="form-control" name="name" type="text" id="name" placeholder="이름" value="${member.usernm }" required/>
										</div>
									</div>
									
									<div class="form-group row">
										<label for="alias" class="col-sm-3" style="font-size: 0.9em;">별명</label>
										<div class="col-sm-9 input-group-sm">
											<input class="form-control" name="alias" type="text" id="alias" placeholder="별명" value="${member.alias }">
										</div>
									</div>
									
									<div class="form-group row">
										<label for="addr1" class="col-sm-3 control-label">주소</label>
										<div class="col-sm-3 input-group-sm">
											<input name="addr1" type="text" class="form-control" id="addr1" placeholder="주소" value="${member.addr1 }"readonly >
										</div>
										<div class="col-sm-3 input-group-sm">
											<input name="addr2" type="text" class="form-control" id="addr2" value="${member.addr2 }"placeholder="상세주소">	
										</div>
										
										<div class="col-sm-2 input-group-sm">
											<input name="zipcode" type="text" class="form-control" id="zipcode" placeholder="우편번호" value="${member.zipcode }"readonly>
										</div>
										<div class="col-sm-1 input-group-sm">
											<span class="input-group-append-sm">
												<button id="addrBtn" type="button" class="btn btn-info btn-sm btn-append">주소검색</button>
											</span>
										</div>
									</div>
									
									<div class="card-footer">
										<div class="row">
											<div class="col-sm-6">
												<button type="button" id="modifyBtn" class="btn btn-info">수정</button>
											</div>
											<div class="col-sm-6">
												<button type="button" id="cancelBtn" class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;취 &nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
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

