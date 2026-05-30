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

@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT * FROM student WHERE email=? AND password=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
            	
            	HttpSession session =
            	        request.getSession();

            	session.setAttribute(
            	        "studentEmail",
            	        email
            	);

                out.println("<script>");
                out.println("alert('Login Successful');");
                out.println("location='/jsp/studentDashboard.jsp';");
                out.println("</script>");

            } else {

                out.println("<script>");
                out.println("alert('Invalid Email or Password');");
                out.println("history.back();");
                out.println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
