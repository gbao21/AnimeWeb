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
<title>Home page</title>
<%@include file="/Commons/User-head-css.jsp"%>
</head>
<body>
	<%@include file="/Commons/User-header.jsp"%>

	<!-- Hero Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="hero__slider owl-carousel">
				<div class="hero__items set-bg"
					data-setbg="https://img.youtube.com/vi/QlOOtlVw1kc/maxresdefault.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">Adventure</div>
								<h2>Fate / Stay Night: Unlimited Blade Works</h2>
								<p>After 30 days of travel across the world...</p>
								<a href="#"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero__items set-bg"
					data-setbg="${pageContext.request.contextPath}/Template/Users/img/hero/hero-1.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">Adventure</div>
								<h2>Fate / Stay Night: Unlimited Blade Works</h2>
								<p>After 30 days of travel across the world...</p>
								<a href="#"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="hero__items set-bg"
					data-setbg="${pageContext.request.contextPath}/Template/Users/img/hero/hero-1.jpg">
					<div class="row">
						<div class="col-lg-6">
							<div class="hero__text">
								<div class="label">Adventure</div>
								<h2>Fate / Stay Night: Unlimited Blade Works</h2>
								<p>After 30 days of travel across the world...</p>
								<a href="#"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Hero Section End -->

	<!-- Product Section Begin -->
	<section class="product spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="trending__product">
						<div class="row">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<div class="section-title">
									<h4>Movie</h4>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="btn__all">
									<a href="#" class="primary-btn">View All <span
										class="arrow_right"></span></a>
								</div>
							</div>
						</div>
						<div class="row">
							<c:forEach items="${listVideo}" var="video" begin="0" end="6">
								<div class="col-lg-4 col-md-6 col-sm-6">
									<a href="anime-detail?videoID=${video.video_id}">
										<div class="product__item">
ư											<div class="product__item__pic set-bg"
												style="background-image: url('https://img.youtube.com/vi/${video.video_url}/maxresdefault.jpg');"
												data-setbg="https://img.youtube.com/vi/${video.video_url}/maxresdefault.jpg">
												<div class="ep">1/1</div>
												<div class="comment">
													<i class="fa fa-comments"></i> ${video.view_share}
												</div>
												<div class="view">
													<i class="fa fa-eye"></i> ${video.view_count}
												</div>
											</div>
											<div class="product__item__text">
												<ul>
													<li>Active</li>
													<li>Movie</li>
												</ul>
												<h5 class="text-white fw-bolder">${video.video_title }</h5>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="col-lg-4 col-md-6 col-sm-8">
					<div class="product__sidebar">
						<div class="product__sidebar__view">
							<div class="section-title">
								<h5>Top Views</h5>
							</div>
							<ul class="filter__controls">
								<li class="active" data-filter="*">Day</li>
								<li data-filter=".week">Week</li>
								<li data-filter=".month">Month</li>
								<li data-filter=".years">Years</li>
							</ul>
							<div class="filter__gallery">
								<div class="product__sidebar__view__item set-bg mix years month"
									data-setbg="${pageContext.request.contextPath}/Template/Users/img/sidebar/tv-4.jpg">
									<div class="ep">18 / ?</div>
									<div class="view">
										<i class="fa fa-eye"></i> 9141
									</div>
									<h5>
										<a href="#">Fate/stay night: Heaven's Feel I. presage
											flower</a>
									</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 			Series -->
			<div class="col-lg-8">
				<div class="trending__product">
					<div class="row">
						<div class="col-lg-8 col-md-8 col-sm-8">
							<div class="section-title">
								<h4>Series</h4>
							</div>
						</div>

					</div>
					<div class="row">
						<c:forEach items="${listMovie}" var="movie" begin="0" end="6">
							<div class="col-lg-4 col-md-6 col-sm-6">
							<a href="anime-detail?movieID=${movie.movie.movie_id}">
							
								<div class="product__item">
									<div class="product__item__pic set-bg"
										style="background-image: url('https://img.youtube.com/vi/${movie.movie.movie_img}/maxresdefault.jpg');"
										data-setbg="background-image: url('https://img.youtube.com/vi/${movie.img}/maxresdefault.jpg">
										<div class="ep">${movie.episode}/${movie.episode}</div>
										<div class="comment">
											<i class="fa fa-comments"></i> 11
										</div>
										<div class="view">
											<i class="fa fa-eye"></i> 9141
										</div>
									</div>
									<div class="product__item__text">
										<ul>
											<li>Active</li>
											<li>Movie</li>
										</ul>
										<h5 class="text-white fw-bolder">
											${movie.group}
										</h5>
									</div>
								</div>
							</a>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Product Section End -->
	<!-- Product Section End -->
	<%@include file="/Commons/User-footer.jsp"%>
	<%@include file="/Commons/User-scr.jsp"%>
</body>
</html>