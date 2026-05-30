package com.college.StudentVotingSystem.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.college.StudentVotingSystem.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/VoteServlet")
public class VoteServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out =
                response.getWriter();

        String candidateId =
                request.getParameter("candidateId");

        String positionId =
                request.getParameter("positionId");

        HttpSession session =
                request.getSession();

        String studentEmail =
                (String) session.getAttribute(
                        "studentEmail");

        try {

            Connection con =
                    DBConnection.getConnection();

            // Check if already voted for this position
            String checkQuery =
                    "SELECT * FROM vote WHERE student_email=? AND position_id=?";

            PreparedStatement checkPs =
                    con.prepareStatement(checkQuery);

            checkPs.setString(1, studentEmail);
            checkPs.setString(2, positionId);

            ResultSet rs =
                    checkPs.executeQuery();

            if (rs.next()) {

                out.println("<script>");
                out.println("alert('You already voted for this position!');");
                out.println("location='/jsp/studentDashboard.jsp';");
                out.println("</script>");

            } else {

                // Insert vote
                String insertQuery =
                        "INSERT INTO vote(student_email, candidate_id, position_id) VALUES(?,?,?)";

                PreparedStatement ps =
                        con.prepareStatement(insertQuery);

                ps.setString(1, studentEmail);
                ps.setString(2, candidateId);
                ps.setString(3, positionId);

                int row =
                        ps.executeUpdate();

                if (row > 0) {

                    out.println("<script>");
                    out.println("alert('Vote Submitted Successfully!');");
                    out.println("location='/jsp/studentDashboard.jsp';");
                    out.println("</script>");

                } else {

                    out.println("<script>");
                    out.println("alert('Vote Failed');");
                    out.println("history.back();");
                    out.println("</script>");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
