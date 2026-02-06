<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Student</title>
<style>
* {
    box-sizing: border-box;
}
body { background:#f5f6f8; font-family:"Segoe UI"; padding:40px; }
.container {
    max-width:500px; margin:auto; background:#fff;
    padding:32px; border-radius:14px;
    box-shadow:0 20px 40px rgba(0,0,0,.08);
}
label { font-size:13px; color:#374151; }
input {
    width:100%; padding:10px; margin:6px 0 14px;
    border:1px solid #d1d5db; border-radius:6px;
}
button {
    width:100%; padding:12px; background:#2563eb;
    color:white; border:none; border-radius:6px;
}
.gender-box{
    display:flex;
    gap:20px;
    margin-top:8px;
}

.radio-option{
    display:flex;
    align-items:center;
    gap:6px;
    font-size:14px;
    padding-bottom: 20px;
    cursor:pointer;
}

.radio-option input[type="radio"]{
    accent-color:#2563eb;
    transform:scale(1.1);
    cursor:pointer;
}

</style>
</head>
<body>

<div class="container">
<a href="DashBoard.jsp">← DashBoard</a>
<h2>Add Student</h2>
	<%
			String error = (String) request.getAttribute("error");
			if(error != null){
		%>

			<p style="color:red; font-weight:600; margin-bottom:15px;">
    			<%= error %>
			</p>

		<%
			}
		%>
		
		<%
			String success = (String) request.getAttribute("success");
			if(success != null){
		%>

			<p style="color:green; font-weight:600; margin-bottom:15px;">
    			<%= success %>
			</p>

		<%
			}
		%>
<form action="Student" method="post">
	
	<input type="hidden" name="action" value ="create" >

    <label>Full Name</label>
    <input type="text" name="Full_Name" required>
    
    <label>Date of Birth</label>
    <input type="Date" name="DOB" required placeholder="DD/MM/YYYY">

    <label>Email</label>
    <input type="email" name="Email" required>
    
    <label>Contact (+91)</label>
    <input type="text" name="Phone_Number" maxlength="10" pattern="[0-9]{10}" required>
    
    <label>Address</label>
    <input type="text" name="Address" required>

    <label>Course</label>
    <input type="text" name="course" required placeholder="B.Tech/MCA/MBA">
    
    <label>Department</label>
    <input type="text" name="Department" required>
    
    <label>Blood Group</label>
    <input type="text" name="blood_group" required>
    
    <div class="group">
    <label>Gender</label>

    <div class="gender-box">
        	<label class="radio-option">
            	<input type="radio" name="gender" value="Male" required>
            	<span>Male</span>
        	</label>

        	<label class="radio-option">
            	<input type="radio" name="gender" value="Female">
            	<span>Female</span>
        	</label>

        	<label class="radio-option">
            	<input type="radio" name="gender" value="Other">
            	<span>Other</span>
        	</label>
    	</div>
	</div>

    
    


    <button>Add Student</button>
</form>
</div>

</body>
</html>
