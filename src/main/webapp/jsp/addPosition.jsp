<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Position</title>

<style>
body{
    font-family:Arial;
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

.box{
    width:350px;
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

input{
    width:90%;
    padding:10px;
    margin:10px;
    border-radius:8px;
    border:1px solid gray;
}
h2{
    color:white;
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

<h2>Add Position</h2>

<form action="/AddPositionServlet" method="post">

<input type="text"
name="positionName"
placeholder="Enter Position Name"
required>

<button type="submit">
Add Position
</button>

</form>

</div>

</body>
</html>