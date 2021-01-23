<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	
	<title>회원 리스트</title>
	
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
		$(function(){
			
			$('.member').on('click', function() {
				var id = $(this).data("userid");
				$('#userid').val(id);
				$('#ff').submit();
			})
			$("#searchBtn").on("click", function(){
				var perPageNum = $("#perPageNum").val();
				var searchType = $("#searchType").val();
				var kw = $("#kw").val();
				$('#pN').val(perPageNum);
				$('#sT').val(searchType);
				$('#kW').val(kw);
				$('#sh').submit();
			}) 
		})
	</script>

</head>
<body class="hold-transition sidebar-mini">
	<form id="ff" action="${pageContext.request.contextPath }/member">
		<input type="hidden" id="userid" name="id" value=""/>
	</form>
	<form id="sh" action="/searchMember">
		<input type="hidden" id="pN" name="pageSize" value=""/>
		<input type="hidden" id="sT" name="sT" value=""/>
		<input type="hidden" id="kW" name="kW" value=""/>
	</form>
	<div class="wrapper">

		<nav class="main-header navbar navbar-expand navbar-white navbar-light">
			<%@ include file="/common/header.jsp" %>
		</nav>

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<%@ include file="/common/left.jsp" %>
		</aside>

		<div id="if_list_div" style="position: relative; padding: 0; overflow: hidden; height: 750px;">
			<div class="content-wrapper" style="min-height: 584px;">
				<!-- Content Header (Page header) -->
				<section class="content-header">
					<div class="container-fluid">
						<div class="row md-2">
							<div class="col-sm-6">
								<h1>회원리스트</h1>
							</div>
							<div class="col-sm-6">
								<ol class="breadcrumb float-sm-right">
									<li class="breadcrumb-item">회원리스트</li>
									<li class="breadcrumb-item">목록</li>
								</ol>
							</div>
						</div>
					</div>
				</section>
				<!-- Main content -->
				<section class="content">
					<div class="card">
						<div class="card-header with-border">
							<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath }/memberRegist'">회원등록</button>
							
							<div id="keyword" class="card-tools" style="width: 550px;">
								<div class="input-group row">
										<!-- sort num -->
										<select class="form-control col-md-3" name="perPageNum" id="perPageNum">
											<option value="">정렬개수</option>
											<option value="3">3개씩</option>
											<option value="5">5개씩</option>
											<option value="7">7개씩</option>
										</select>
										<!-- search bar -->
										<select class="form-control col-md-3" name="searchType" id="searchType">
											<option value="">검색구분</option>
											<option value="i">아이디</option>
											<option value="n">이름</option>
											<option value="a">별명</option>
										</select> 
										<input class="form-control" type="text" id="kw" name="keyword" placeholder="검색어를 입력하세요." value=""> 
										<span class="input-group-append">
											<button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search">
												<i class="fa fa-fw fa-search"></i>
											</button>
										</span>
									<!-- end : search bar -->
								</div>
							</div>
							
						</div>
						<div class="card-body" style="text-align: center;">
							<div class="row">
								<div class="col-sm-12">
									<table class="table table-bordered">
										<tbody>
											<tr>
												<th>아이디</th>
												<th>이름</th>
												<th>별명</th>
												<th>도로주소</th>
												<th>등록날짜</th>
											</tr>
											<c:forEach items="${memberList }" var="member">
												<tr>
													<td class="member" data-userid="${member.userid }">${member.userid }</td>
													<td>${member.usernm }</td>
													<td>${member.alias }</td>
													<td>${member.addr1 }</td>
													<td><fmt:formatDate value="${member.reg_dt }" pattern="yyyy-MM-dd"/> </td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- card-body -->
						<div class="card-footer">
							<nav aria-label="member list Navigation">
								<ul class="pagination justify-content-center m-0">
									<li class="page-item"><a class="page-link" href="/searchMember?page=1&pageSize=${pageVo.pageSize}&sT=${param.sT}&kW=${param.kW}"><i class="fas fa-angle-double-left"></i></a></li>
									<%-- <li class="page-item"><a class="page-link" href="/login?page=1&pageSize=${pageVo.pageSize}"><i class="fas fa-angle-double-left"></i></a></li> --%>
									<c:choose>
										<c:when test="${pageVo.page > 1 }">
											<%-- <li class="page-item"><a class="page-link" href="/login?page=${pageVo.page-1 }&pageSize=${pageVo.pageSize}"><i class="fas fa-angle-left"></i></a></li> --%>
											<li class="page-item"><a class="page-link" href="/searchMember?page=${pageVo.page-1 }&pageSize=${pageVo.pageSize}&sT=${param.sT}&kW=${param.kW}"><i class="fas fa-angle-left"></i></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="#"><i class="fas fa-angle-left"></i></a></li>
										</c:otherwise>
									</c:choose>
									
									<c:forEach begin="1" end="${pagination }" var="i">
										<c:choose>
											<c:when test="${ pageVo.page == i }">
												<li class="page-item active"><span class="page-link">${i }</span></li>
											</c:when>
											<c:otherwise>
												<%-- <li><a class="page-link" href="/login?page=${i}&pageSize=${pageVo.pageSize}">${i }</a></li> --%>
												<li><a class="page-link" href="/searchMember?page=${i}&pageSize=${pageVo.pageSize}&sT=${param.sT}&kW=${param.kW}">${i }</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pagination > pageVo.page }">
											<%-- <li class="page-item"><a class="page-link" href="/login?page=${pageVo.page+1 }&pageSize=${pageVo.pageSize}"><i class="fas fa-angle-right"></i></a></li> --%>
											<li class="page-item"><a class="page-link" href="/searchMember?page=${pageVo.page+1 }&pageSize=${pageVo.pageSize}&sT=${param.sT}&kW=${param.kW}"><i class="fas fa-angle-right"></i></a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="#"><i class="fas fa-angle-right"></i></a></li>
										</c:otherwise>
									</c:choose>
									<%-- <li class="page-item"><a class="page-link" href="/login?page=${pagination }&pageSize=${pageVo.pageSize}"><i class="fas fa-angle-double-right"></i></a></li> --%>
									<li class="page-item"><a class="page-link" href="/searchMember?page=${pagination }&pageSize=${pageVo.pageSize}&sT=${param.sT}&kW=${param.kW}"><i class="fas fa-angle-double-right"></i></a></li>
								</ul>
							</nav>
						</div>
						<!-- card-footer -->
					</div>
					<!-- card  -->
				</section>
			</div>
		</div>
	</div>

	<%@include file="/common/bottom.jsp"%>
	

</body>
</html>

