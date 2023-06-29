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
						<iframe id="frameVideo" allow="fullscreen;"
							class="containerVideo-iframe"
							src="https://www.youtube.com/embed/${listVideo.get(0).video_url}"></iframe>
					</div>
					<div class="anime__details__episodes">
						<div class="section-title">
							<h5>List Name</h5>
						</div>
						<c:forEach items="${listVideo}" var="item" varStatus="loop">
							<button onclick="LoadVideoByVideoID(${item.video_id})"
								class="btn btn-light">Ep ${loop.index+1}</button>
						</c:forEach>


					</div>
				</div>
			</div>

		</div>
		<div class="container">
			<div class="row ">
				<div class="col-lg-8 col-md-8">
					<div id="commentList" class="anime__details__review">
						<div class="section-title">
							<h5>Reviews</h5>
						</div>
<%-- 						<c:forEach items="${listComment}" var="comment" varStatus ="loop"> --%>
<%-- 						<div id ="${loop.index}" class="anime__review__item"> --%>
<!-- 							<div class="anime__review__item__pic"> -->
<!-- 								<img -->
<%-- 									src="${pageContext.request.contextPath}/Template/Users/img/anime/review-1.jpg" --%>
<!-- 									alt=""> -->
<!-- 							</div> -->
<!-- 							<div class="anime__review__item__text"> -->
<!-- 								<h6> -->
<%-- 									${comment.user.customer_name} - <span>1 Hour ago</span> --%>
<!-- 								</h6> -->
<%-- 								<p>${comment.content}</p> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 						</c:forEach> --%>
					</div>
					<div class="anime__details__form">
						<div class="section-title">
							<h5>Your Comment</h5>
						</div>
						<form id="commentForm">
							<textarea name="comment" placeholder="Your Comment" required></textarea>
							<c:if test="${video != null}">
								<input type="hidden" id="videoID" name="videoID"
									value="ss">
							</c:if>
<%-- 							<c:if test="${movie != null}"> --%>
<!-- 								<input type="hidden" id="movieID" name="movieID" -->
<!-- 									value=""> -->
<%-- 							</c:if> --%>
							<button type="submit">
								<i class="fa fa-location-arrow"></i> Review
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- Anime Section End -->
	<%@include file="/Commons/User-footer.jsp"%>
	<%@include file="/Commons/User-scr.jsp"%>

	<script type="text/javascript">
	
 function LoadVideoByVideoID(me){
	 console.log(me);
	 $.ajax({
			url : "LoadVideoSeriesByVideoID",
			type : "get",
			data :  {
				videoID: me
	        },
			success : function(data) {
				console.log(data);
				const obj = JSON.parse(data);
				$("#frameVideo").attr('src',"https://www.youtube.com/embed/" + obj.video_url); 
			},
			error: function(error){
				document.getElementById("loginMSGs").innerHTML = "Login failed";
			}
		});
 }
 
 //comment
 
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