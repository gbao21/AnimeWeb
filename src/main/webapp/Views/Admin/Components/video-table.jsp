<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table p-3 mt-2 w-100">
	<thead>
		<tr>
			<th scope="col">video_id</th>
			<th scope="col">video_title</th>
			<th scope="col">video_url</th>
			<th scope="col">descriptions</th>
			<th scope="col">createBy</th>
			<th scope="col">updateBy</th>
			<th scope="col">view_count</th>
			<th scope="col">view_share</th>
			<th scope="col">isActive</th>
			<th scope="col">movie_id</th>
			<th scope="col">action</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${listVideo != null }">
			<c:forEach items="${listVideo}" var="video">
				<tr>
					<td>${video.video_id }</td>
					<td>${video.video_title }</td>
					<td>${video.video_url }</td>
					<td>${video.descriptions }</td>
					<td>${video.createBy }</td>
					<td>${video.updateBy }</td>
					<td>${video.view_count }</td>
					<td>${video.view_share }</td>
					<td>${video.isActive }</td>
					<td>${video.movie.movie_id }</td>
					<td><button onclick="loadData(this)" type="button" class="btn btn-info">Edit</button><td>
				</tr>
			</c:forEach>
			
		</c:if>
		
	</tbody>
	
	
</table>
<script type="text/javascript">
// function loadData(btn) {
// 	  // Get the row containing the clicked button
// 	  var row = btn.parentNode.parentNode;
// 	  // Extract the data from the row
// 	  var video_title = row.cells[1].textContent;
// 	  var video_url = row.cells[2].textContent;
// 	  var descriptions = row.cells[3].textContent;
// 	  var category = row.cells[9].textContent;
// 	  // Populate the form fields with the data
// 	  document.getElementById("video_title").value = video_title;
// 	  document.getElementById("video_url").value = video_url;
// 	  document.getElementById("descriptions").value = descriptions;
// 	  document.getElementById("categories").value = category;
// 	  document.getElementById("isMovie1").checked = true;
// 	  document.getElementById("Episode").style.display = "none";
// 	  document.getElementById("home-tab").disabled =true;
// 	}
</script>