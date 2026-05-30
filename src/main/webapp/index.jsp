<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Voting System</title>

<style>
	body{
	    font-family: Arial, sans-serif;

	    background-image:
	    linear-gradient(
	    rgba(0,0,0,0.35),
	    rgba(0,0,0,0.35)
	    ),
	    url('/images/voting-bg.jpg.jpg');

	    background-size: cover;
	    background-position: center;
	    background-repeat: no-repeat;

	    text-align: center;
	    margin: 0;
	    padding: 0;

	    min-height:100vh;
	}

.container{
	    width: 400px;

	    background: rgba(255,255,255,0.15);

	    backdrop-filter: blur(15px);

	    margin: 80px auto;
	    padding: 30px;
	    border-radius: 15px;

	    box-shadow: 0px 0px 10px rgba(0,0,0,0.4);
	}

h1{
    color: white;
}

button{
    width: 90%;
    padding: 12px;
    margin: 10px;
    border: none;
    border-radius: 8px;
    background: #3498db;
    color: white;
    font-size: 16px;
    cursor: pointer;
}

button:hover{
    background: #2980b9;
}
</style>

</head>
<body>

<div class="container">
    <h1>College Student Voting System</h1>

    <a href="jsp/studentLogin.jsp">
        <button>Student Login</button>
    </a>

    <a href="jsp/studentSignup.jsp">
        <button>Student Sign Up</button>
    </a>

    <a href="jsp/adminLogin.jsp">
        <button>Admin Login</button>
    </a>

    <a href="jsp/adminSignup.jsp">
        <button>Admin Sign Up</button>
    </a>

</div>

</body>
</html>