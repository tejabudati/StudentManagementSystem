<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.dao.StudentModel" %>
<!DOCTYPE html>
<html>
<head>
<title>Search Student</title>
<style>
* {
    box-sizing: border-box;
}
body { background:#f5f6f8; font-family:"Segoe UI"; padding:40px; }
.container {
    max-width:100%; margin:auto; background:#fff;
    padding:32px; border-radius:14px;
    box-shadow:0 20px 40px rgba(0,0,0,.08);
}
input, button {
    width:30%; padding:10px; margin-top:10px;
}
button {
    background:#2563eb; color:white;
    border:none; border-radius:6px;
}
table {
    width:100%; background:#fff; border-collapse:collapse;
    border-radius:12px; overflow:hidden;
    box-shadow:0 20px 40px rgba(0,0,0,.08);
}
th, td {
    padding:14px; border-bottom:1px solid #e5e7eb;
    text-align:left;
}
th { background:#2563eb; color:white; }
</style>
</head>
<body>



<div class="container">
<a href="DashBoard.jsp">← DashBoard</a>
<h2>Search Student</h2>

<% if (request.getAttribute("error") != null) { %>
    <div class="error-msg">
        <%= request.getAttribute("error") %>
    </div>
<% } %>

<form action="Student" method="post">
	<input type="hidden" name="action" value="search" >
    <label>Student ID</label>
    <input type="number" name="id" required>
    <button>Search</button><br>
    <table>
		<tr>
		<br>
			
    		<th>ID</th>
    		<th>Name</th>
    		<th>DOB</th>
    		<th>Gender</th>
    		<th>Contact</th>
    		<th>Email</th>
    		<th>Course</th>
    		<th>Department</th>
    		<th>Status</th>
    
    
		</tr>
		<%
    		StudentModel s = (StudentModel) request.getAttribute("student");

    		if (s != null) {
		%>
			<tr>
    			<td> <%= s.getId() %></td>
    			<td> <%= s.getName() %></td>
    			<td> <%= s.getDob() %></td>
    			<td> <%= s.getGender() %></td>
    			<td>+91 <%= s.getPhone() %></td>
    			<td> <%= s.getEmail() %></td>
    			<td> <%= s.getCourse() %></td>
    			<td> <%= s.getDepartment() %></td>
    			<td> <%= s.getStatus() %></td>
    			
			</tr>
		<%
    		}
		%>
	</table>
</form>
</div>

</body>
</html>
