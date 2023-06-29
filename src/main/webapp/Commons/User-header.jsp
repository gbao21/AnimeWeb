<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header">
	<div class="container">
		<div class="row">
			<div class="col-lg-2">
				<div class="header__logo">
					<a href="Homess.php"> <img
						src="${pageContext.request.contextPath}/Template/Users/img/logo.png"
						alt="">
					</a>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="header__nav">


					<nav class="header__menu mobile-menu">
						<ul>
							<li class="${Home != null ? 'active':'' }"><a href="Homess.php">Homepage</a></li>
							<li class="${Categories != null ? 'active':'' }"><a href="anime-all-products">Categories <span
									class="arrow_carrot-down"></span></a>
								<ul class="dropdown">
									<li><a href="anime-all-products?status=movie">Movie</a></li>
									<li><a href="anime-all-products?status=series">Series</a></li>
								</ul>
								
							</li>
							<li><a href="#">Contacts</a></li>
							<li class="text-white fw-bolder ${Account != null ? 'active':'' }"><a><span class="icon_profile"></span>${sessionScope.user == 
                                null ? "Account":sessionScope.user.customer_name}
								<span class="arrow_carrot-down"></span></a>
								<ul class="dropdown">
									<c:if test="${sessionScope.user == null}">
										<li><a href="anime-sign-up">Sign Up</a></li>
										<li><a href="anime-login">Login</a></li>
									</c:if>
									<c:if test="${sessionScope.user != null}">
										<li><a href="anime-logout">LogOut</a></li>
										<li><a href="">Edit profile</a></li>
									</c:if>

								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="col-lg-2">
				<div class="header__right">
					<a href="#" class="search-switch"><span class="icon_search"></span></a>
					<script
						src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
					<script
						src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
					<script
						src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


				</div>
			</div>
		</div>
		<div id="mobile-menu-wrap"></div>
	</div>
</header>