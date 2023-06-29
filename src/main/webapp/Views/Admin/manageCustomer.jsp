<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MANAGE CUSTOMER</title>
<%@include file="/Commons/Admin-head-css.jsp"%>
</head>
<body>
	<div id="main-wrapper">

		<%@include file="/Commons/Admin-header.jsp"%>
		<!-- ============================================================== -->
		<!-- End Topbar header -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<aside class="left-sidebar" data-sidebarbg="skin5">

			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="p-t-30">
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="${pageContext.request.contextPath}/AdminHome"
							aria-expanded="false"><i class="mdi mdi-view-dashboard"></i><span
								class="hide-menu">MANAGE</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link has-arrow waves-effect waves-dark"
							href="javascript:void(0)" aria-expanded="false"><i
								class="mdi mdi-receipt"></i><span class="hide-menu">Forms
							</span></a>
							<ul aria-expanded="false" class="collapse  first-level">
								<li class="sidebar-item"><a
									href="${pageContext.request.contextPath}/LoadingCustomer"
									class="sidebar-link"><i class="mdi mdi-note-outline"></i><span
										class="hide-menu">Manage Customer</span></a></li>
								<li class="sidebar-item"><a
									href="${pageContext.request.contextPath}/LoadingHistory"
									class="sidebar-link"><i class="mdi mdi-note-plus"></i><span
										class="hide-menu"> Manage History</span></a></li>
							</ul></li>
					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<!-- ============================================================== -->
		<!-- End Left Sidebar - style you can find in sidebar.scss  -->
		<!-- ============================================================== -->
		<!-- ============================================================== -->
		<!-- Page wrapper  -->
		<!-- ============================================================== -->
		<div class="page-wrapper">
			<!-- ============================================================== -->
			<!-- Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->

			<!-- ============================================================== -->
			<!-- End Bread crumb and right sidebar toggle -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- Container fluid  -->
			<!-- ============================================================== -->
			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-12">

						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Customers</h5>
								<div class="table-responsive">
									<table id="zero_config"
										class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>ID</th>
												<th>Name</th>
												<th>Email</th>
												<th>PassWord</th>
												<th>Role</th>
												<th>Active</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${listUser}" var="user">
												<tr>
													<td>${user.customer_id }</td>
													<td>${user.customer_name }</td>
													<td>${user.email}</td>
													<td>${user.passwords }</td>
													<td>${user.isAdmin }</td>
													<td>${user.isActive }</td>
												</tr>
											</c:forEach>
										</tbody>

									</table>
								</div>

							</div>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- End PAge Content -->
				<!-- ============================================================== -->
				<!-- ============================================================== -->
				<!-- Right sidebar -->
				<!-- ============================================================== -->
				<!-- .right-sidebar -->
				<!-- ============================================================== -->
				<!-- End Right sidebar -->
				<!-- ============================================================== -->
			</div>
			<!-- ============================================================== -->
			<!-- End Container fluid  -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<footer class="footer text-center">
				All Rights Reserved by Matrix-admin. Designed and Developed by <a
					href="https://wrappixel.com">WrapPixel</a>.
			</footer>
			<!-- ============================================================== -->
			<!-- End footer -->
			<!-- ============================================================== -->
		</div>
		<!-- ============================================================== -->
		<!-- End Page wrapper  -->
		<!-- ============================================================== -->
	</div>
	<%@include file="/Commons/Admin-scr.jsp"%>
	
	<script type="text/javascript">
	LoadingCustomer();

	function LoadingCustomer() {
		$.ajax({
			url : "LoadingCustomer",
			type : "get",
			success : function(data) {
			},
			error : function(error) {

			}
		});
	}
	</script>
</body>
</html>