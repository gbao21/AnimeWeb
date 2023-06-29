<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="Homess.php"><i class="fa fa-home"></i> Home</a>
						<c:if test="${video != null}">
							<span>Movies Details</span>
						</c:if>
						<c:if test="${movie != null}">
							<span>Series Detail</span>
						</c:if>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- Anime Section Begin -->
	<section class="anime-details spad">
		<div class="container">
			<div class="anime__details__content">
				<c:if test="${video != null}">

					<div class="row">
						<div class="col-lg-3">
							<div class="anime__details__pic set-bg"
								data-setbg="https://img.youtube.com/vi/${video.video_url}/maxresdefault.jpg">
								<div class="comment">
									<i class="fa fa-comments"></i> ${video.view_share}
								</div>
								<div class="view">
									<i class="fa fa-eye"></i>${video.view_count }</div>
							</div>
						</div>
						<div class="col-lg-9">
							<div class="anime__details__text">
								<div class="anime__details__title">
									<h3>${video.video_title }</h3>
								</div>
								<div class="anime__details__rating">
									<div class="rating">
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
											class="fa fa-star-half-o"></i></a>
									</div>
									<span>1.029 Votes</span>
								</div>
								<p>Descriptions</p>
								<div class="anime__details__widget">
									<div class="row">
										<div class="col-lg-6 col-md-6">
											<ul>
												<li><span>Type:</span> TV Movie</li>
												<li class="dateVideoFormat"><span>Date added:</span></li>
												<li><span>Genre:</span>
													${video.movie.category.category_name }</li>
											</ul>
										</div>
										<div class="col-lg-6 col-md-6">
											<ul>
												<li><span>Scores:</span> 9/ 10</li>
												<li><span>Rating:</span> 8.5 / 161 times</li>
												<li><span>Quality:</span> HD</li>
												<li><span>Views:</span> 1.000.000</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="anime__details__btn">
									<a href="#" class="follow-btn"><i class="fa fa-heart-o"></i>
										Like</a> <a href="anime-watching?videoID=${video.video_id}"
										class="watch-btn"><span>Watch Now</span> <i
										class="fa fa-angle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
			</div>
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<div class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>
						<c:forEach items="${listComment}" var="comment" varStatus ="loop">
							<div id ="${loop.index}" class="anime__review__item" >
								<div class="anime__review__item__pic">
									<img
										src="${pageContext.request.contextPath}/Template/Users/img/anime/review-1.jpg"
										alt="">
								</div>


								<div class="anime__review__item__text">
									<h6>
										${comment.user.customer_name} - <span>1 Hour ago</span>
									</h6>
									<p>${comment.content }</p>
									<c:if test="${comment.user.customer_id.equals(sessionScope.user.customer_id)}">
										<div class="commentTools float-right">
											<button style="cursor: pointer; " class="bg-dark">
												<i class="fa-solid fa-pen text-primary p-2"
													></i>
											</button>
											<button class="bg-dark" style="cursor: pointer" onclick="deleteComment(${comment.comment_id}, this)">
												<i class="fa-solid fa-trash text-warning p-2"
													></i>
											</button>
										</div>
									</c:if>


								</div>
							</div>
						</c:forEach>
					</div>
					<div class="anime__details__form">
						<div class="section-title">
							<h5>Your Comment</h5>
						</div>
						<form id="commentForm">
							<textarea id="commentText" name="comment"
								placeholder="Your Comment" required></textarea>
							<c:if test="${video != null}">
								<input type="hidden" id="videoID" name="videoID"
									value="${video.video_id}">
							</c:if>
							<c:if test="${movie != null}">
								<input type="hidden" id="movieID" name="movieID"
									value="${movie.movie_id }">
							</c:if>

							<button type="submit">
								<i class="fa fa-location-arrow"></i> Review
							</button>
						</form>
					</div>
				</div>
				<div class="col-lg-4 col-md-4">
					<div class="anime__details__sidebar">
						<div class="section-title">
							<h5>you might like...</h5>
						</div>
						<div class="product__sidebar__view__item set-bg"
							data-setbg="${pageContext.request.contextPath}/Template/Users/img/sidebar/tv-1.jpg">
							<div class="ep">18 / ?</div>
							<div class="view">
								<i class="fa fa-eye"></i> 9141
							</div>
							<h5>
								<a href="#">Boruto: Naruto next generations</a>
							</h5>
						</div>
						<div class="product__sidebar__view__item set-bg"
							data-setbg="${pageContext.request.contextPath}/Template/Users/img/sidebar/tv-2.jpg">
							<div class="ep">18 / ?</div>
							<div class="view">
								<i class="fa fa-eye"></i> 9141
							</div>
							<h5>
								<a href="#">The Seven Deadly Sins: Wrath of the Gods</a>
							</h5>
						</div>
					</div>
				</div>
			</div>
			</c:if>
<!-- 			Moview -->
			<c:if test="${movie != null}">
				<div class="row">
					<div class="col-lg-3">
						<div class="anime__details__pic set-bg"
							data-setbg="https://img.youtube.com/vi/${movie.movie_img}/maxresdefault.jpg">
						</div>
					</div>
					<div class="col-lg-9">
						<div class="anime__details__text">
							<div class="anime__details__title">
								<h3>${movie.name_movie}</h3>
							</div>
							<div class="anime__details__rating">
								<div class="rating">
									<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
										class="fa fa-star"></i></a> <a href="#"><i class="fa fa-star"></i></a>
									<a href="#"><i class="fa fa-star"></i></a> <a href="#"><i
										class="fa fa-star-half-o"></i></a>
								</div>
								<span>1.029 Votes</span>
							</div>
							<p>${movie.movie_desc}</p>
							<div class="anime__details__widget">
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<ul>
											<li><span>Type:</span> TV Series</li>
											<li class="dateMovieFormat"><span>Date added:</span></li>
											<li><span>Genre:</span> ${movie.category.category_name }</li>
										</ul>
									</div>
									<div class="col-lg-6 col-md-6">
										<ul>
											<li><span>Scores:</span> 9/ 10</li>
											<li><span>Rating:</span> 8.5 / 161 times</li>
											<li><span>Quality:</span> HD</li>
											<li><span>Views:</span> 1.000.000</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="anime__details__btn">
								<a href="#" class="follow-btn"><i class="fa fa-heart-o"></i>
									Follow</a> <a href="anime-watching?movieID=${movie.movie_id}"
									class="watch-btn"><span>Watch Now</span> <i
									class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
		</div>
		</c:if>

	</section>
	<!-- Anime Section End -->
	<%@include file="/Commons/User-footer.jsp"%>
	<%@include file="/Commons/User-scr.jsp"%>
	<script type="text/javascript">
		const dateVideoString = "${video.createBy}";
		const dateMovieString = "${movie.createBy}";
		const dateVideoString1 = dateVideoString.slice(0, 10);
		const dateMovieString2 = dateMovieString.slice(0, 10);
		const spanElementVideo = $('.dateVideoFormat span');
		const spanElementMovie = $('.dateMovieFormat span');
		spanElementVideo.after(dateVideoString1);
		spanElementMovie.after(dateMovieString2);

		
		$(document).ready(function() {
			$("#commentForm").on("submit", function(event) {
				event.preventDefault();
				$.ajax({
					url : "anime-comment",
					type : "post",
					data : $(this).serialize(),
					success : function(data) {
						const obj = JSON.parse(data);
						addComment(obj);
						document.getElementById("commentText").value = "";
					},
					error : function(error) {
						alert("Please Login");
					}
				});
			});
		})

		function addComment(obj) {
			console.log(obj);
			console.log(obj.comment_user);
			const reviewBoard = document
					.querySelector(".anime__details__review");
			const newComment = document.createElement("div");	
			newComment.classList.add("anime__review__item");
			const template = '<div class="anime__review__item__pic">'
					+ '<img src="${pageContext.request.contextPath}/Template/Users/img/anime/review-1.jpg" alt="">'
					+ '</div> <div class="anime__review__item__text"><h6>'
					+ obj.comment_user + ' <span>1s ago</span>' + '</h6><p>'
					+ obj.content + '</p>'+
					'<div class="commentTools float-right">' +
					'<button style="cursor: pointer; " class="bg-dark"><i class="fa-solid fa-pen text-primary p-2"></i></button>'
						+'<button style="cursor: pointer; " class="bg-dark" onclick="deleteComment(${comment.comment_id}, this)">'
						+'<i class="fa-solid fa-trash text-warning p-2"></i></button>'	
					+'</div>'
					+'</div>';
			newComment.innerHTML = template;
			reviewBoard.appendChild(newComment);

		}
		
		function deleteComment(cmID, me){
			event.preventDefault();
			let parent = me.parentElement.parentElement.parentElement.parentElement;
			let child = me.parentElement.parentElement.parentElement;

			$.ajax({
				url : "anime-deleteComment",
				type : "get",
				data :{
					commentID: cmID
				} ,
				success : function(data) {
					parent.removeChild(child);
				},
				error : function(error) {
					console.log(error)
				}
			});
		}
		
	</script>
</body>
</html>