<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table p-3 mt-2 w-100">
	<thead>
		<tr>
			<th scope="col">movie_id</th>

			<th scope="col">name_movie</th>
			<th scope="col">category_id</th>
			<th scope="col">Movie_img</th>
			<th scope="col">createBy</th>
			<th scope="col">movie_desc</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${listMovie != null }">
			<c:forEach items="${listMovie}" var="movie">
				<tr>
					<td>${movie.movie_id }</td>
					<td>${movie.name_movie }</td>
					<td>${movie.category.category_id }</td>
					<td>${movie.movie_img }</td>
					<td>${movie.createBy }</td>
					<td>${movie.movie_desc }</td>
					<td><button type="button" class="btn btn-danger"
							data-toggle="modal" data-target="#episode" id="ButtonOfSelectTag"
							onclick="loadDataMovie(this)">Edit</button>
					<td>
				</tr>
			</c:forEach>

		</c:if>

	</tbody>
</table>

<script type="text/javascript">
function loadDataMovie(btn) {
	  // Get the row containing the clicked button
	  var row = btn.parentNode.parentNode;
	  // Extract the data from the row
	  var movie_name = row.cells[1].textContent;
	  var category_id = row.cells[2].textContent;
	  var movie_img = row.cells[3].textContent;
	  var des = row.cells[5].textContent;
	  // Populate the form fields with the data
	  document.getElementById("Movie_Name").value = movie_name;
	  document.getElementById("Movie_Cate").value = category_id;
	  document.getElementById("Movie_Image").value = movie_img;
	  document.getElementById("Movie_Description").value = des;

	}
</script>