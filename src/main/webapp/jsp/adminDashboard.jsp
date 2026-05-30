<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

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

.container{
    width:400px;
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
h1{
    color:white;
}
button{
    width:90%;
    padding:12px;
    margin:10px;
    border:none;
    border-radius:8px;
    background:#3498db;
    color:white;
    font-size:16px;
}
</style>

</head>
<body>

<div class="container">

<h1>Admin Dashboard</h1>

<a href="addPosition.jsp">
<button>Add Position</button>
</a>

<a href="addCandidate.jsp">
<button>Add Candidate</button>
</a>

<a href="result.jsp">
<button>View Results</button>
</a>

</div>

</body>
</html>