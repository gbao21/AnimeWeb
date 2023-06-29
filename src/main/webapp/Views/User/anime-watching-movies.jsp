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
<style type="text/css">
.containerVideo {
	position: relative;
	width: 100%;
	overflow: hidden;
	padding-top: 56.25%; /* 16:9 Aspect Ratio */
}

.containerVideo-iframe {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	width: 100%;
	height: 100%;
	border: none;
	padding: 3%;
}
</style>
</style>
</head>
<body>
	<%@include file="/Commons/User-header.jsp"%>

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="Homess.php"><i class="fa fa-home"></i> Home</a> <span>Watching
							- ${video.video_title }</span>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="containerVideo">
						<iframe class="containerVideo-iframe"
							src="https://www.youtube.com/embed/${video.video_url }" allow="fullscreen;"></iframe>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Anime Section End -->
	<%@include file="/Commons/User-footer.jsp"%>
	<%@include file="/Commons/User-scr.jsp"%>
</body>
</html>