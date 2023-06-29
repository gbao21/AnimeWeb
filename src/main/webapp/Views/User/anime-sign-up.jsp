<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Anime Template">
<meta name="keywords" content="Anime, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Anime-detail</title>
<%@include file="/Commons/User-head-css.jsp"%>
</head>
<body>
	<%@include file="/Commons/User-header.jsp"%>
	
		<div style="position: absolute; top: 50; right: 0;">

			<!-- Then put toasts within -->
			<div class="toast" role="alert" aria-live="assertive"
				aria-atomic="true">
				<div class="toast-header">
					<img src="..." class="rounded mr-2" alt="..."> <strong
						class="mr-auto">Bootstrap</strong> <small class="text-muted">just
						now</small>
					<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="toast-body">See? Just like this.</div>
			</div>
		</div>
	
	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="${pageContext.request.contextPath}/Template/Users/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Sign Up</h2>
						<p>Welcome to the official Anime blog.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Signup Section Begin -->
	<section class="signup spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login__form">
						<h3>Sign Up</h3>
						<form id="signUpForm1">
							<div class="input__item">
								<input name="email" type="text" placeholder="Email address"
									required> <span class="icon_mail"></span>
							</div>
							<div class="input__item">
								<input name="customer_name" type="text" placeholder="Your Name"
									required> <span class="icon_profile"></span>
							</div>
							<div class="input__item">
								<input name="passwords" type="password" placeholder="Password"
									required> <span class="icon_lock"></span>
							</div>
							<button type="submit" class="site-btn">Sign Up Now</button>
						</form>
						<h5>
							Already have an account? <a href="anime-login">Log In!</a>
						</h5>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login__social__links">
						<h3>Login With:</h3>
						<ul>
							<li><a href="#" class="facebook"><i
									class="fa fa-facebook"></i> Sign in With Facebook</a></li>
							<li><a href="#" class="google"><i class="fa fa-google"></i>
									Sign in With Google</a></li>
							<li><a href="#" class="twitter"><i class="fa fa-twitter"></i>
									Sign in With Twitter</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Signup Section End -->
	<%@include file="/Commons/User-footer.jsp"%>
	<%@include file="/Commons/User-scr.jsp"%>


	

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
// 		showToast();
		function showToast(){
			$(".toast").attr('class', ' show'); 
			
		}
	
		


		$(document).ready(function() {
			$("#signUpForm1").on("submit", function(event) {

				event.preventDefault();
				$.ajax({
					url : "anime-sign-up",
					type : "post",
					data : $(this).serialize(),
					success : function(data) {
						window.location.href = "anime-login";
					},
					error : function(error) {
						showToast();
					}
				});

			});
		})
	</script>
</body>
</html>