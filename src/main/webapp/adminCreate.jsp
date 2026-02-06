<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Create Admin</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
* {
    box-sizing: border-box;
}
body { background:#f5f6f8; font-family:"Segoe UI"; padding:40px; }
.container {
    max-width:420px; margin:auto; background:#fff;
    padding:32px; border-radius:14px;
    box-shadow:0 20px 40px rgba(0,0,0,.08);
}
h2 { margin-bottom:6px; }
p { color:#6b7280; font-size:14px; margin-bottom:20px; }
label { font-size:13px; color:#374151; }
input {
    width:100%; padding:10px; margin:6px 0 14px;
    border:1px solid #d1d5db; border-radius:6px;
}
button {
    width:100%; padding:12px; background:#2563eb;
    color:white; border:none; border-radius:6px; font-weight:600;
}
.wrapper{
    display:flex;
    width:850px;
    background:white;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
}
.group{
    margin-bottom:18px;
}

.group label{
    font-size:13px;
    font-weight:600;
    color:#374151;
}

.group input{
    width:100%;
    padding:11px;
    border:1px solid #d1d5db;
    border-radius:6px;
}

/* Password Wrapper */
.password-wrapper{
    position:relative;
}

.password-wrapper input{
    padding-right:40px;
}

.eye{
    position:absolute;
    right:12px;
    top:45%;
    transform:translateY(-50%);
    cursor:pointer;
    color:#6b7280;
}

.eye:hover{
    color:#2563eb;
}

</style>
</head>
<body>

<div class="container">
<a href="DashBoard.jsp">← DashBoard</a>
<h2>Create Admin</h2>
<p>Grant system access to a new administrator.</p>

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

<form action="Signup" method="post">

    
    <label>Full Name</label>
    <input type="text" name="full_name" required>

    <label>Admin Email</label>
    <input type="email" name="email" required>

    <div class="group">
                <label>Password</label>

                <div class="password-wrapper">
                    <input type="password" id="password" name="password" required>

                    <span class="eye" onclick="togglePassword()">
                        <i class="fa-solid fa-eye" id="eyeIcon"></i>
                    </span>
                </div>
    </div>
    
    <input type="hidden" name="source" value="adminCreate">
    
    

    <button>Create Admin</button>
</form>
</div>

<script>
function togglePassword(){

    const pwd = document.getElementById("password");
    const icon = document.getElementById("eyeIcon");

    if(pwd.type === "password"){
        pwd.type = "text";
        icon.classList.replace("fa-eye","fa-eye-slash");
    }else{
        pwd.type = "password";
        icon.classList.replace("fa-eye-slash","fa-eye");
    }
}
</script>

</body>
</html>
