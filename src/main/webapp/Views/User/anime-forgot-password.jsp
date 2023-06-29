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
<style>
/* body {
  background:#000;
}
 */
#load {
  position:absolute;
  width:600px;
  height:36px;
  left:50%;
  top:-30px;
  margin-left:-300px;
  overflow:visible;
  -webkit-user-select:none;
  -moz-user-select:none;
  -ms-user-select:none;
  user-select:none;
  cursor:default;
}

#load div {
  position:absolute;
  width:20px;
  height:56px;
  font-weight:bold;
  opacity:0;
  font-family:Helvetica, Arial, sans-serif;
  animation:move 2s linear infinite;
  -o-animation:move 2s linear infinite;
  -moz-animation:move 2s linear infinite;
  -webkit-animation:move 2s linear infinite;
  transform:rotate(180deg);
  -o-transform:rotate(180deg);
  -moz-transform:rotate(180deg);
  -webkit-transform:rotate(180deg);
  color:#fff;
}

#load div:nth-child(2) {
  animation-delay:0.2s;
  -o-animation-delay:0.2s;
  -moz-animation-delay:0.2s;
  -webkit-animation-delay:0.2s;
}
#load div:nth-child(3) {
  animation-delay:0.4s;
  -o-animation-delay:0.4s;
  -webkit-animation-delay:0.4s;
  -webkit-animation-delay:0.4s;
}
#load div:nth-child(4) {
  animation-delay:0.6s;
  -o-animation-delay:0.6s;
  -moz-animation-delay:0.6s;
  -webkit-animation-delay:0.6s;
}
#load div:nth-child(5) {
  animation-delay:0.8s;
  -o-animation-delay:0.8s;
  -moz-animation-delay:0.8s;
  -webkit-animation-delay:0.8s;
}
#load div:nth-child(6) {
  animation-delay:1s;
  -o-animation-delay:1s;
  -moz-animation-delay:1s;
  -webkit-animation-delay:1s;
}
#load div:nth-child(7) {
  animation-delay:1.2s;
  -o-animation-delay:1.2s;
  -moz-animation-delay:1.2s;
  -webkit-animation-delay:1.2s;
}

@keyframes move {
  0% {
    left:0;
    opacity:0;
  }
  35% {
    left: 41%; 
    -moz-transform:rotate(0deg);
    -webkit-transform:rotate(0deg);
    -o-transform:rotate(0deg);
    transform:rotate(0deg);
    opacity:1;
  }
  65% {
    left:59%; 
    -moz-transform:rotate(0deg); 
    -webkit-transform:rotate(0deg); 
    -o-transform:rotate(0deg);
    transform:rotate(0deg); 
    opacity:1;
  }
  100% {
    left:100%; 
    -moz-transform:rotate(-180deg); 
    -webkit-transform:rotate(-180deg); 
    -o-transform:rotate(-180deg); 
    transform:rotate(-180deg);
    opacity:0;
  }
}

@-moz-keyframes move {
  0% {
    left:0; 
    opacity:0;
  }
  35% {
    left:41%; 
    -moz-transform:rotate(0deg); 
    transform:rotate(0deg);
    opacity:1;
  }
  65% {
    left:59%; 
    -moz-transform:rotate(0deg); 
    transform:rotate(0deg);
    opacity:1;
 
</style>
</head>

<body>
	<%@include file="/Commons/User-header.jsp"%>


	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="${pageContext.request.contextPath}/Template/Users/img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Forgot Password</h2>
						<p>Welcome to the official Anime blog.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->
	<div style="position: absolute; top: 50; right: 0;">

		<!-- Then put toasts within -->
		<div class="toast" role="alert" aria-live="assertive"
			aria-atomic="true">
			<div class="toast-header">
				<img
					src="${pageContext.request.contextPath}/Template/Admins/assets/images/logo-icon.png"
					class="rounded mr-2" alt="..."> <strong class="mr-auto">Noti</strong>
				<small class="text-muted">just now</small>
				<button type="button" class="ml-2 mb-1 close" data-dismiss="toast"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="toast-body"></div>
		</div>
	</div>

	<!-- Forget Section Begin -->
	<section class="signup spad">
		<div
			class="container d-flex justify-content-center align-items-center">

			<div class="login__form">
				<h3>Forgot Password</h3>
				<form id="forgetForm1" style="position:relative">
				<div id="loading"></div>
					<div class="input__item">
						<input name="email" type="text" placeholder="Email address"
							required> <span class="icon_mail"></span>
					</div>
					<button type="submit" class="site-btn">Reset password</button>
				</form>
				<h5>
					<a href="anime-login">Back</a>
				</h5>
			</div>

		</div>
	</section>
	<!-- Signup Section End -->
	<%@include file="/Commons/User-footer.jsp"%>
	<%@include file="/Commons/User-scr.jsp"%>

	>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script type="text/javascript">
		function showToast() {
			$(".toast").attr('class', ' show');

		}

		$(document).ready(function() {
			$("#forgetForm1").on("submit", function(event) {
				event.preventDefault();
				var loading = `<div class="d-flex justify-content-center"  style="position:absolute; 
					height:80%; width:30%; z-index:100000; display: none;">
					<div style="padding:40%;">
									<div id="load">
										  <div>G</div>
										  <div>N</div>
										  <div>I</div>
										  <div>D</div>
										  <div>A</div>
										  <div>O</div>
										  <div>L</div>
										</div>
								</div>
				 </div>`;
				 $("#loading").html(loading);
				$.ajax({
					url : "anime-forget",
					type : "post",
					data : $(this).serialize(),
					success : function(data) {	
						$(".toast-body").html("Please check your email!");
						 $("#loading").html("");
						showToast();
					},
					error : function(error) {
						$(".toast-body").html("Email doesn't exist");
						 $("#loading").html("");
						showToast();
					}
				});

			});
		})
	</script>
</body>
</html>