<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    if (session.getAttribute("email") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);

	if (session.getAttribute("email") == null) {
    	response.sendRedirect("index.jsp");
    	return;
	}
	
%>
<%
//	System.out.println("DASHBOARD PAGE HIT");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard | Student Management System</title>

<style>
/* ===== Reset ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Tahoma, sans-serif;
}

/* ===== Layout ===== */
body {
    height: 100vh;
    display: flex;
    background: #f3f4f6;
}

/* ===== Sidebar ===== */
.sidebar {
    width: 240px;
    background: #111827;
    color: #ffffff;
    padding: 25px 20px;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 30px;
    font-size: 18px;
}

.nav a {
    display: block;
    text-decoration: none;
    color: #d1d5db;
    padding: 12px 14px;
    border-radius: 6px;
    margin-bottom: 8px;
    font-size: 14px;
    transition: background 0.3s, color 0.3s;
}

.nav a:hover {
    background: #1f2937;
    color: #ffffff;
}

/* ===== Main Content ===== */
.main {
    flex: 1;
    padding: 30px;
}

/* ===== Header ===== */
.header {
    margin-bottom: 25px;
}

.header h1 {
    font-size: 22px;
    color: #111827;
}

.header p {
    font-size: 14px;
    color: #6b7280;
}

/* ===== Cards ===== */
.cards {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 20px;
}

.card {
    background: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

.card h3 {
    font-size: 16px;
    margin-bottom: 8px;
    color: #111827;
}

.card p {
    font-size: 13px;
    color: #6b7280;
    margin-bottom: 15px;
}

.card a {
    display: inline-block;
    text-decoration: none;
    font-size: 13px;
    font-weight: 600;
    color: #2563eb;
}

.card a:hover {
    text-decoration: underline;
}

/* ===== Footer ===== */
.footer {
    padding-top: 25%;
    font-size: 12px;
    color: #9ca3af;
}
</style>
</head>

<body>

<!-- ===== Sidebar ===== -->
<div class="sidebar">
    <h2>Admin Panel</h2>

    <div class="nav">
        <a href="adminCreate.jsp">Admin Creation</a>
        <a href="student-create.jsp">Student Creation</a>
        <a href="Student?action=viewAll">Display All Students</a>
        <a href="display-by-id.jsp">Display Student by ID</a>
        <a href="edit-student.jsp">Edit Student</a>
        <a href="delete-student.jsp">Delete Student</a>
        <a href="logout" onclick="return confirm('Are you sure you want to log out?');"
   			style="color:#f87171;">
   			Logout
		</a>

    </div>
    
    
</div>

<!-- ===== Main Content ===== -->
<div class="main">
    
    <div class="header">
        <h1>Welcome Admin</h1>
    </div>
    
    <div class="header">
        <h1>DashBoard</h1>
        <p>Overview of student management actions</p>
    </div>

    <div class="cards">
        <div class="card">
            <h3>Admin Creation</h3>
            <p>Create and manage admin accounts.</p>
            <a href="adminCreate.jsp">Go →</a>
        </div>

        <div class="card">
            <h3>Student Creation</h3>
            <p>Add new students to the system.</p>
            <a href="student-create.jsp">Go →</a>
        </div>

        <div class="card">
            <h3>View Students</h3>
            <p>Display all registered students.</p>
            <a href="Student?action=viewAll">Go →</a>
        </div>

        <div class="card">
            <h3>Search Student</h3>
            <p>Find a student using ID.</p>
            <a href="display-by-id.jsp">Go →</a>
        </div>

        <div class="card">
            <h3>Edit Student</h3>
            <p>Update existing student details.</p>
            <a href="edit-student.jsp">Go →</a>
        </div>

        <div class="card">
            <h3>Delete Student</h3>
            <p>Remove a student by ID.</p>
            <a href="delete-student.jsp">Go →</a>
        </div>
    </div>
    
    <div class="footer">
        © 2026 Student Management System
    </div>
	
    

</div>

</body>
</html>
