<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:choose>
	<c:when test="${listVideo != null}">
		<c:forEach items="${listVideo}" var="video">
			<div class="col-lg-4 col-md-6 col-sm-6">
			<a href = "anime-detail?videoID=${video.video_id}">
			
				<div class="product__item">
					<div class="product__item__pic set-bg"
						style="background-image: url('https://img.youtube.com/vi/${video.video_url}/maxresdefault.jpg');"
						data-setbg="">
						<div class="ep">1/1</div>
						<div class="comment">
							<i class="fa fa-comments"></i>${video.view_share}
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
						<span style="color:white; font-weight:800;">
							${video.video_title }
						</span>
					</div>
				</div>
			</a>
			</div>
		</c:forEach>
	</c:when>

	<c:when test="${listMovie != null}">
		<c:forEach items="${listMovie}" var="report">
			<div class="col-lg-4 col-md-6 col-sm-6">
				<a href="anime-detail?movieID=${report.movie.movie_id }">
					<div class="product__item">
						<div class="product__item__pic set-bg"
							style="background-image: url('https://img.youtube.com/vi/${report.img}/maxresdefault.jpg');"
							data-setbg="">
							<div class="ep">${report.episode}/${report.episode}</div>
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
							<span style="color:white; font-weight:800;">
							${report.group}
						</span>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
	</c:when>
</c:choose>


