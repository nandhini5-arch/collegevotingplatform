<%@ page import="java.sql.*" %>
<%@ page import="com.college.StudentVotingSystem.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Candidate</title>

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

input, select{
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
    background:#3498db;
    color:white;
    font-size:16px;
}
h2{
    color:white;
}
</style>

</head>
<body>

<div class="box">

<h2>Add Candidate</h2>

<form action="/AddCandidateServlet" method="post">

<input type="text"
name="candidateName"
placeholder="Enter Candidate Name"
required>

<input type="text"
name="department"
placeholder="Enter Department"
required>

<select name="positionId" required>

<option value="">
Select Position
</option>

<%
Connection con =
DBConnection.getConnection();

String query =
"SELECT * FROM positions";

PreparedStatement ps =
con.prepareStatement(query);

ResultSet rs =
ps.executeQuery();

while(rs.next()){
%>

<option value="<%= rs.getInt("position_id") %>">

<%= rs.getString("position_name") %>

</option>

<%
}
%>

</select>

<button type="submit">
Add Candidate
</button>

</form>

</div>

</body>
</html>