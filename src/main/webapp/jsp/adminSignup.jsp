<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Sign Up</title>

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

	    min-height:100vh;
}

.box{
    width:350px;
    background:white;
    margin:80px auto;
    padding:30px;
    border-radius:12px;
    box-shadow:0px 0px 10px gray;
    text-align:center;
}

input{
    width:90%;
    padding:10px;
    margin:10px;
    border-radius:8px;
    border:1px solid gray;
}

button{
    width:95%;
    padding:12px;
    border:none;
    border-radius:8px;
    background:#27ae60;
    color:white;
    font-size:16px;
}
</style>

</head>
<body>

<div class="box">

<h2>Admin Sign Up</h2>

<form action="/AdminSignupServlet" method="post">

<input type="text"
name="username"
placeholder="Create Username"
required>

<input type="password"
name="password"
placeholder="Create Password"
required>

<button type="submit">
Sign Up
</button>

</form>

</div>

</body>
</html>