<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Student Management</title>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>

/* ===== Global ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:"Segoe UI", Tahoma, sans-serif;
}

/* ===== Page Layout ===== */
body{
    height:100vh;
    background:#f3f4f6;
    display:flex;
    justify-content:center;
    align-items:center;
}

/* ===== Container ===== */
.wrapper{
    display:flex;
    width:850px;
    background:white;
    border-radius:12px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.1);
}

/* ===== Left Greeting Panel ===== */
.left-panel{
    width:45%;
    background:#111827;
    color:white;
    padding:40px 30px;
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.left-panel h1{
    font-size:26px;
    margin-bottom:15px;
}

.left-panel p{
    font-size:14px;
    color:#d1d5db;
}

/* ===== Login Panel ===== */
.right-panel{
    width:55%;
    padding:40px 35px;
}

.right-panel h2{
    margin-bottom:25px;
    color:#111827;
}

/* ===== Inputs ===== */
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

/* ===== Password Wrapper ===== */
.password-wrapper{
    position:relative;
}

.password-wrapper input{
    padding-right:40px;
}

.eye{
    position:absolute;
    right:12px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
    font-size:16px;
    opacity:0.6;
    user-select:none;
}

.eye:hover{
    opacity:1;
}

/* ===== Button ===== */
button{
    width:100%;
    padding:12px;
    background:#2563eb;
    border:none;
    color:white;
    border-radius:6px;
    font-weight:600;
    cursor:pointer;
}

button:hover{
    background:#1e40af;
}

/* ===== Signup Link ===== */
.signup{
    text-align:center;
    margin-top:20px;
    font-size:13px;
}

.signup a{
    color:#2563eb;
    text-decoration:none;
    font-weight:600;
}

</style>
</head>

<body>

<div class="wrapper">

    <!-- Left Greeting -->
    <div class="left-panel">
        <h1>Student Management System</h1>
        <p>
            Administrative portal to manage student records,
            academic data, and institutional operations securely.
        </p>
    </div>

    <!-- Login Section -->
    <div class="right-panel">

        <h2>Admin Login</h2>
        
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
        

        <form action="Login" method="post">

            <div class="group">
                <label>Email</label>
                <input type="email" name="email" required>
            </div>

            <div class="group">
                <label>Password</label>

                <div class="password-wrapper">
                    <input type="password" id="password" name="password" required>
                    <span class="eye" onclick="togglePassword()">
                    	<i class="fa-solid fa-eye" id="eyeIcon"></i>
					</span>
                </div>
            </div>

            <button type="submit">Login</button>

        </form>

        <div class="signup">
            New Admin?
            <a href="SignUp.jsp">Register Here</a>
        </div>

    </div>

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
