<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Matrix Template - The Ultimate Multipurpose admin
	template</title>
<%@include file="/Commons/Admin-head-css.jsp"%>
</head>
<body>
	<div id="main-wrapper">
		<%@include file="/Commons/Admin-header.jsp"%>

		<aside class="left-sidebar" data-sidebarbg="skin5">

			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="p-t-30">
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="${pageContext.request.contextPath}/AdminHome" aria-expanded="false"><i
								class="mdi mdi-view-dashboard"></i><span class="hide-menu">MANAGE</span></a></li>
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
										class="hide-menu"> Form Wizard </span></a></li>
							</ul></li>
					</ul>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>



		<div class="page-wrapper">
			<div class="page-breadcrumb">
				<div class="row">
					<div class="col-12 d-flex no-block align-items-center">
						<h4 class="page-title">Manager Video</h4>
						<div class="ml-auto text-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">Home</a></li>
									<li class="breadcrumb-item active" aria-current="page">Library</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid">
				<!-- ============================================================== -->
				<!-- Start Page Content -->
				<!-- ============================================================== -->
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<form class="form-horizontal" id="FormVideo1">
								<div class="card-body">
									<h4 class="card-title">Video info</h4>
									<div class="form-group row">
										<label for="video_title"
											class="col-sm-3 text-right control-label col-form-label">Title</label>
										<div class="col-sm-9">
											<input name="video_title" type="text" class="form-control"
												id="video_title" placeholder="Title" required="required">
										</div>
										
										<div class="col-sm-9" style="display : none">
											<input name="video_id" type="text" class="form-control"
												id="video_id" placeholder="Title" required="required">
										</div>
									</div>
									<div class="form-group row">
										<label for="video_url"
											class="col-sm-3 text-right control-label col-form-label">URL</label>
										<div class="col-sm-9">
											<input name="video_url" type="text" class="form-control"
												id="video_url" placeholder="URL" required="required">
										</div>
									</div>
									<div class="form-group row">
										<label for="descriptions"
											class="col-sm-3 text-right control-label col-form-label">Description</label>
										<div class="col-sm-9">
											<textarea name="descriptions" rows="5" cols="20"
												 class="form-control" id="descriptions"
												placeholder="Description" required="required"></textarea>
										</div>
									</div>
									<div class="form-group row">
										<label for="categories"
											class="col-sm-3 text-right control-label col-form-label">Category</label>
										<div class="col-md-9">
											<select name="categories"
												class="select2 form-control custom-select"
												style="width: 100%; height: 36px;" id="categories">
												<option value="1">Action</option>
												<option value="2">Romance</option>
												<option value="3">Thriller</option>
												<option value="4">Animation</option>
												<option value="5">Family</option>
												<option value="6">Horror</option>
											</select>
										</div>
									</div>

									<div class="form-group row">
										<label
											class="col-sm-3 text-right control-label col-form-label">Classification</label>
										<div class="col-md-9">

											<div class="row ml-3 mt-2">
												<div class="custom-control custom-radio mr-2">
													<input type="radio" class="custom-control-input"
														id="isMovie1" name="radio-stacked"
														onchange="handleChange(this);" value="0" checked>
													<label class="custom-control-label" for="isMovie1">Video</label>
												</div>
												<div class="custom-control custom-radio ">
													<input type="radio" class="custom-control-input"
														id="isMovie2" name="radio-stacked"
														onchange="handleChange(this);" value="1"> <label
														class="custom-control-label" for="isMovie2">Episode</label>
												</div>
											</div>
										</div>
									</div>




									<div id="Episode" style="display: none">
										<h4 class="card-title">Episode info</h4>
										<div class="form-group row">
											<label for="Episode"
												class="col-sm-3 text-right control-label col-form-label">Choose
												a movie</label>
											<div class="col-md-9">
												<select name="movieType" id="selectTagid"
													class="select2 form-control custom-select"
													style="width: 70%; height: 36px;"
													onchange="changeCategoryForVideo(this)">

													<c:forEach var="item" items="${listMovie1}">
														<option value="${item.movie_id }">${item.name_movie }</option>
													</c:forEach>
													
												</select>
												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#episode"
													id="ButtonOfSelectTag" onclick="createNewMovie()">New
													Movie</button>
											</div>

										</div>

									</div>
									<!-- Modal -->
									<div class="modal fade" id="episode" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalCenterTitle"
										aria-hidden="true">
										<div class="modal-dialog modal-dialog-centered"
											role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLongTitle">ManageMovie</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body" id ="modal-movie">
													<form id="formOfMoviecc">

														<div class="form-group">
															<label for="Name" class="col-form-label">Name:</label> <input
																type="text" class="form-control" id="Movie_Name" name="name_movie">
														</div>

														<select class="form-control" id="Movie_Cate" name="category">
															<option value="0" selected="selected">Choose category</option>
															<option value="1" >Action</option>
															<option value="2">Romance</option>
															<option value="3">Thriller</option>
															<option value="4">Animation</option>
															<option value="5">Family</option>
															<option value="6">Horror</option>
														</select>
														
														



														<div class="form-group">
															<label for="Image" class="col-form-label">Image
																link</label> <input type="text" class="form-control"
																id="Movie_Image" name="Movie_img">
														</div>



														<div class="form-group">
															<label for="Name" class="col-form-label">Description:</label>
															<textarea class="form-control" id="Movie_Description"
																rows="3" name="movie_desc"></textarea>
														</div>


													</form>
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-secondary"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary" onclick="create()">Save
														changes</button>
												</div>
											</div>
										</div>
									</div>




								</div>

								<div class="border-top">
									<div class="card-body">
										<button id="btnSave" type="button" onclick="create()"
											class="btn btn-success">Save</button>
										<button type="button" class="btn btn-primary" onclick="reset()">Reset</button>
										<button id="btnUpdate" type="button" class="btn btn-info" onclick="update()">Update</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-12">
						<div class="card">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="videoTab" data-toggle="tab" href="#VideoPage" role="tab"
									aria-controls="home" aria-selected="true"
									onclick="LoadingVideo()">Video</a></li>
								<li class="nav-item"><a class="nav-link" id="movieTab"
									data-toggle="tab" href="#MoviePage" role="tab"
									aria-controls="profile" aria-selected="false"
									onclick="LoadingMovie()">Movie</a></li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="VideoPage"
									role="tabpanel" aria-labelledby="videoTab">
									<jsp:include page="Components/video-table.jsp"></jsp:include>
								</div>
								<div class="tab-pane fade" id="MoviePage" role="tabpanel"
									aria-labelledby="movieTab">
									<jsp:include page="Components/movie-table.jsp"></jsp:include>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- editor -->

			</div>
		</div>



	</div>
	<%@include file="/Commons/Admin-scr.jsp"%>

	<script type="text/javascript">
	document.getElementById("btnUpdate").disabled = true;
		let statusButonEpisode = "add";
		function createNewMovie() {
			$("#Movie_Name").val("");
			$("#Movie_Image").val("");
			$("#Movie_Cate").val("");
			$("#Movie_Description").val("");
		}
		// 		function addDataToModal(idData) {

		// 			$.get("get-movie-info?q=return&id=" + idData,
		// 					function(data, status) {
		// 						$("#Movie_Name").val(data.name);
		// 						$("#Movie_Image").val(data.image);
		// 						$("#Movie_Cate").val(data.category);
		// 						$("#Movie_Description").val(data.description);
		// 					});
		// 		}
		function changeCategoryForVideo(tagSelect) {
			if (tagSelect.value == "0") {

				document.getElementById("ButtonOfSelectTag").textContent = "New Movie";
			} else {
				let indexOfCate = tagSelect.value.indexOf("-");
				let categoryId = tagSelect.value.substring(indexOfCate + 1,
						tagSelect.value.length);
				document.getElementById("categoryIdOfVideo").value = categoryId;
				document.getElementById("ButtonOfSelectTag").textContent = "Edit";

			}
		}
		function handleChange(me) {
			if (me.value == 1) {
				document.getElementById("Episode").style.display = "block";
			} else {
				document.getElementById("Episode").style.display = "none";
			}
		}

		//Edit loadData
		function loadData(btn) {
			// Get the row containing the clicked button
				var row = btn.parentNode.parentNode;
			// Extract the data from the row
			var video_id = row.cells[0].textContent;
			var video_title = row.cells[1].textContent;
			var video_url = row.cells[2].textContent;
			var descriptions = row.cells[3].textContent;
			var category = row.cells[9].textContent;
			// Populate the form fields with the data
			document.getElementById("video_id").value = video_id;
			document.getElementById("video_title").value = video_title;
			document.getElementById("video_url").value = video_url;
			document.getElementById("descriptions").value = descriptions;
			document.getElementById("categories").value = category;
			document.getElementById("isMovie1").checked = true;
			document.getElementById("Episode").style.display = "none";
			document.getElementById("btnSave").disabled = true;
			document.getElementById("btnUpdate").disabled = false;
		}

		function reset() {
			document.getElementById("video_id").value="";
			document.getElementById("video_title").value="";
			document.getElementById("video_url").value="";
			document.getElementById("descriptions").value="";
			document.getElementById("categories").value=0;
			document.getElementById("isMovie1").checked = true;
			document.getElementById("btnSave").disabled = false;
			document.getElementById("btnUpdate").disabled = true;
		}
	</script>
	<script type="text/javascript">
		LoadingVideo();

		function LoadingVideo() {
			$.ajax({
				url : "LoadingVideo",
				type : "get",
				success : function(data) {
					document.getElementById("VideoPage").innerHTML = data;
				},
				error : function(error) {

				}
			});
		}
		function LoadingMovie() {
			$.ajax({
				url : "LoadingMovie",
				type : "get",
				success : function(data) {
					document.getElementById("MoviePage").innerHTML = data;
				},
				error : function(error) {
				}
			});
		}

		//CREATE Video
		function create() {
			let url1 = "manageCreate?action=create&isMovie=false";
			if (document.getElementById("isMovie2").checked) {
				url1 = "manageCreate?action=create&isMovie=true";
			}
			$.ajax({
				url : url1,
				type : "Post",
				data : $('#FormVideo1').serialize(),
				success : function(data) {
					console.log(data)
					document.getElementById("VideoPage").innerHTML = data;
					createNewMovie();
				},
				error : function(error) {
					alert("er");
				}
			});
		}
		//UPDATE Video
		function update() {
			let url1 = "manageUpdate?action=update&isMovie=false";
			if (document.getElementById("isMovie2").checked) {
				url1 = "manageUpdate?action=update&isMovie=true";
			}
			$.ajax({
				url : url1,
				type : "Post",
				data : $('#FormVideo1').serialize(),
				success : function(data) {
					console.log(data);
					document.getElementById("VideoPage").innerHTML = data;
				},
				error : function(error) {
					alert("er");
				}
			});
		}

		//CREATE MOVIE
		
	</script>
</body>
</html>