<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Sign Up</title>

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
		display:flex;
		justify-content:center;
		align-items:center;
	}

.signup-box{
	    width: 300px;

	    background: rgba(255,255,255,0.15);

	    backdrop-filter: blur(15px);

	    margin: 50px auto;
	    padding: 30px;

	    border-radius: 12px;

	    box-shadow:
	    0px 0px 15px rgba(0,0,0,0.4);

	    text-align: center;

	    border:
	    1px solid rgba(255,255,255,0.3);
}

input, select{
    width: 90%;
    padding: 10px;
    margin: 8px;
    border-radius: 8px;
    border: 1px solid gray;
}

button{
    width: 95%;
    padding: 12px;
    border: none;
    border-radius: 8px;
    background: #27ae60;
    color: white;
    font-size: 16px;
    cursor: pointer;
}

h2{
    color:white;
}

button:hover{
    background: #219150;
}
</style>

</head>
<body>

<div class="signup-box">

<h2>🗳️ Student Sign Up</h2>

<form action="/StudentSignupServlet" method="post">

<input type="text"
name="name"
placeholder="Enter Full Name"
required>

<input type="email"
name="email"
placeholder="Enter Email"
required>

<select name="department" required>
    <option value="">Select Department</option>
    <option>CSE</option>
    <option>IT</option>
    <option>ECE</option>
    <option>EEE</option>
    <option>MECH</option>
</select>

<select name="year" required>
    <option value="">Select Year</option>
    <option>1st Year</option>
    <option>2nd Year</option>
    <option>3rd Year</option>
    <option>4th Year</option>
</select>

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