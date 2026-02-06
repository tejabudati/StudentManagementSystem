<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Student</title>
<style>
* {
    box-sizing: border-box;
}
body { background:#f5f6f8; font-family:"Segoe UI"; padding:40px; }
.container {
    max-width:480px; margin:auto; background:#fff;
    padding:32px; border-radius:14px;
    box-shadow:0 20px 40px rgba(0,0,0,.08);
}
input, button {
    width:100%; padding:10px; margin-top:10px;
}
button {
    background:#2563eb; color:white;
    border:none; border-radius:6px;
}
.gender-box{
    display:flex;
    gap:10px;
    margin-top:8px;
}

.radio-option{
    display:flex;
    align-items:center;
    gap:10px;
    font-size:14px;
    padding-bottom: 20px;
    cursor:pointer;
}

.radio-option input[type="radio"]{
    accent-color:#2563eb;
    transform:scale(1.1);
    cursor:pointer;
}
.success-msg{
    background:#ecfdf5;
    color:#065f46;
    padding:12px;
    border-radius:6px;
    font-size:14px;
    margin-bottom:15px;
    border:1px solid #6ee7b7;
}

.error-msg{
    background:#fef2f2;
    color:#991b1b;
    padding:12px;
    border-radius:6px;
    font-size:14px;
    margin-bottom:15px;
    border:1px solid #fca5a5;
}

</style>
</head>
<body>

<div class="container">
<a href="DashBoard.jsp">← DashBoard</a>
<h2>Edit Student</h2>
<p>Edit Student details.</p>

<% if (request.getAttribute("success") != null) { %>
    <div class="success-msg">
        <%= request.getAttribute("success") %>
    </div>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <div class="error-msg">
        <%= request.getAttribute("error") %>
    </div>
<% } %>


<form action="Student" method="post">
	<input type="hidden" name="action" value="edit">
    <input type="number" name="id" placeholder="Student ID" required>
    <input type="text" name="name" placeholder="Updated Name">
    <input type="email" name="email" placeholder="Updated Email">
    <input type="text" name="address" placeholder="Updated Address">
    <div class="gender-box">
        	<label class="radio-option">
            	<input type="radio" name="status" value="Active" required>
            	<span>Active</span>
        	</label>

        	<label class="radio-option">
            	<input type="radio" name="status" value="In-Active">
            	<span>InActive</span>
        	</label>
    </div>
    <button>Update Student</button>
</form>
</div>

</body>
</html>
