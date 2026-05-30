<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.college.StudentVotingSystem.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Election Winners</title>

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
    width:300px;
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

.card{
    background:white;
    padding:20px;
    margin:20px 0;
    border-radius:12px;
    box-shadow:0px 0px 10px lightgray;
}

h1{
	color:white;
    text-align:center;
}

.winner{
    color:green;
    font-size:22px;
}
</style>

</head>
<body>

<div class="container">

<h1>Election Winners 🏆</h1>

<%
Connection con =
DBConnection.getConnection();

String positionQuery =
"SELECT * FROM positions";

PreparedStatement ps1 =
con.prepareStatement(positionQuery);

ResultSet rs1 =
ps1.executeQuery();

while(rs1.next()){

int positionId =
rs1.getInt("position_id");

String positionName =
rs1.getString("position_name");

String winnerQuery =
"SELECT c.candidate_name, COUNT(v.vote_id) AS total_votes " +
"FROM candidate c " +
"LEFT JOIN vote v ON c.candidate_id=v.candidate_id " +
"WHERE c.position_id=? " +
"GROUP BY c.candidate_id " +
"ORDER BY total_votes DESC " +
"LIMIT 1";

PreparedStatement ps2 =
con.prepareStatement(winnerQuery);

ps2.setInt(1, positionId);

ResultSet rs2 =
ps2.executeQuery();

if(rs2.next()){
%>

<div class="card">

<h2>
<%= positionName %>
</h2>

<p class="winner">
🏆 Winner:
<b>
<%= rs2.getString("candidate_name") %>
</b>
</p>

<p>
Total Votes:
<b>
<%= rs2.getInt("total_votes") %>
</b>
</p>

</div>

<%
}
}
%>

</div>

</body>
</html>