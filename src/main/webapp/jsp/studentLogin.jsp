<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Student Login</title>

<link rel="stylesheet"
href="/css/studentLogin.css">

</head>

<body>
	
	<img src="../images/voting-bg.jpg.jpg"
	style="
	position:fixed;
	top:0;
	left:0;
	width:100%;
	height:100%;
	object-fit:cover;
	z-index:-1;">
	
<div class="login-box">

<h2>🗳️ Student Login</h2>

<form action="/StudentLoginServlet"
method="post">

<input type="email"
name="email"
placeholder="Enter Email"
required>

<input type="password"
name="password"
placeholder="Enter Password"
required>

<button type="submit">
Login
</button>

</form>

</div>

</body>
</html>