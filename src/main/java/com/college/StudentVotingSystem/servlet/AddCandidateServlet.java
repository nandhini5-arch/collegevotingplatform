package com.college.StudentVotingSystem.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.college.StudentVotingSystem.db.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddCandidateServlet")
public class AddCandidateServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out =
                response.getWriter();

        String candidateName =
                request.getParameter(
                        "candidateName");

        String department =
                request.getParameter(
                        "department");

        String positionId =
                request.getParameter(
                        "positionId");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "INSERT INTO candidate(candidate_name, position_id, department) VALUES(?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, candidateName);
            ps.setString(2, positionId);
            ps.setString(3, department);

            int row =
                    ps.executeUpdate();

            if(row > 0){

                out.println("<script>");
                out.println("alert('Candidate Added Successfully');");
                out.println("location='/jsp/adminDashboard.jsp';");
                out.println("</script>");
            }

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
