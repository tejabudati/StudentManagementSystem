<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Student</title>
<style>
* {
    box-sizing: border-box;
}
body { background:#fef2f2; font-family:"Segoe UI"; padding:40px; }
.container {
    max-width:360px; margin:auto; background:#fff;
    padding:32px; border-radius:14px;
    border:1px solid #fecaca;
}
h2 { color:#dc2626; }
button {
    width:100%; padding:12px;
    background:#dc2626; color:white;
    border:none; border-radius:6px; font-weight:600;
}
input { width:100%; padding:10px; margin:14px 0; }
</style>
</head>
<body>

<div class="container">
<a href="DashBoard.jsp">← DashBoard</a>
<h2>Delete Student</h2>
<p>This action cannot be undone.</p>
<% if(request.getAttribute("success") != null){ %>
    <div class="success-msg"><%= request.getAttribute("success") %></div>
<% } %>

<% if(request.getAttribute("error") != null){ %>
    <div class="error-msg"><%= request.getAttribute("error") %></div>
<% } %>

<form action="Student" method="post">
    <input type="number" name="id" placeholder="Student ID" required>
    <input type="hidden" name="action" value="delete">
    <button>Delete Permanently</button>
</form>
</div>

</body>
</html>
