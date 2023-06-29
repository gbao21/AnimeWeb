<%@ page import="java.util.List" %>
<%@ page import=" com.teamJava4.Entity.User" %>
<%@ page import="java.util.ArrayList" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%List<User> lisst = (ArrayList<User>) request.getAttribute("users");%>
	<h1><%=lisst.size() %></h1>
	<table class="table">
	
	<%for(int i = 0 ; i < lisst.size() ; i++){ %>
	<tr>
		<td><%=lisst.get(i).getCustomer_name() %></td>
			</tr>
	<%} %>

</table>
</body>
</html>