<%@ page import="java.sql.*" %>
<%@ page import="com.college.StudentVotingSystem.db.DBConnection" %>

<%@ page contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

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
    padding:20px;
}

.container{

    width:92%;

    max-height:90vh;

    margin:auto;

    background:
    rgba(255,255,255,0.12);

    backdrop-filter: blur(15px);

    border-radius:25px;

    padding:25px;

    color:white;

    overflow-y:auto;

    padding-right:10px;
}

h1{
    text-align:center;
    margin-bottom:20px;
    font-size:42px;
}

.position-box{
    margin-bottom:20px;
}

.position-title{
    font-size:32px;
    font-weight:bold;
    margin-bottom:15px;
}

.candidate-container{
    display:flex;
    gap:20px;
    flex-wrap:wrap;
}

.candidate-card{

    width:190px;

    background:
    rgba(255,255,255,0.15);

    border-radius:20px;

    padding:15px;

    text-align:center;

    border:
    1px solid rgba(255,255,255,0.25);

    box-shadow:
    0px 5px 20px rgba(0,0,0,0.3);
}

.candidate-name{
    font-size:22px;
    font-weight:bold;
    margin-bottom:8px;
}

.department{
    font-size:16px;
    margin-bottom:15px;
}

.vote-btn{

    width:100%;

    padding:10px;

    border:none;

    border-radius:12px;

    background:#6c5ce7;

    color:white;

    font-size:18px;

    cursor:pointer;
}

.vote-btn:hover{
    background:#5848c2;
}

</style>

</head>

<body>

<div class="container">

<h1>🗳️ Vote for Your Candidates</h1>

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

%>

<div class="position-box">

<div class="position-title">
🏆 <%= positionName %>
</div>

<div class="candidate-container">

<%

String candidateQuery =
"SELECT * FROM candidate WHERE position_id=?";

PreparedStatement ps2 =
con.prepareStatement(candidateQuery);

ps2.setInt(1, positionId);

ResultSet rs2 =
ps2.executeQuery();

while(rs2.next()){

%>

<div class="candidate-card">

<div class="candidate-name">
👤 <%= rs2.getString("candidate_name") %>
</div>

<div class="department">
🎓 <%= rs2.getString("department") %>
</div>

<form action="/VoteServlet"
method="post">

<input type="hidden"
name="candidateId"
value="<%= rs2.getInt("candidate_id") %>">

<input type="hidden"
name="positionId"
value="<%= positionId %>">

<button class="vote-btn"
type="submit">

🗳️ Vote

</button>

</form>

</div>

<%
}
%>

</div>

</div>

<%
}
%>

</div>

</body>
</html>