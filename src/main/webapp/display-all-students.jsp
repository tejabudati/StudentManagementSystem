<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.dao.StudentModel" %>
<!DOCTYPE html>
<html>
<head>
<title>All Students</title>
<style>
* {
    box-sizing: border-box;
}
body { background:#f5f6f8; font-family:"Segoe UI"; padding:40px; }
h2 { margin-bottom:20px; }
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
<a href="DashBoard.jsp">← DashBoard</a>
<h2>Registered Students</h2>
<form action="Student" method="get"> <input type="hidden" name="action" value="showall" > 
<table>
	<tr>
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
    		List<StudentModel> students =
        	(List<StudentModel>) request.getAttribute("students");

    		if (students != null && !students.isEmpty()) {
        	for (StudentModel s : students) {
	%>
			<tr>
    			<td><%= s.getId() %></td>
    			<td><%= s.getName() %></td>
    			<td><%= s.getDob() %></td>
    			<td><%= s.getGender() %></td>
    			<td><%= s.getPhone() %></td>
    			<td><%= s.getEmail() %></td>
    			<td><%= s.getCourse() %></td>
    			<td><%= s.getDepartment() %></td>
    			<td><%= s.getStatus() %></td>
			</tr>
	<%
        	}
    	} else {
	%>
			<tr>
    			<td colspan="9" style="text-align:center;">
        		No students found
    		</td>
			</tr>
	<%
    	}
	%>
</tbody>
</table>
</form>

</body>
</html>
