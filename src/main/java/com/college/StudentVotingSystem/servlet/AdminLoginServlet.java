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

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out =
                response.getWriter();

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "SELECT * FROM admin WHERE username=? AND password=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()){

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "admin",
                        username
                );

                out.println("<script>");
                out.println("alert('Admin Login Successful');");
                out.println("location='/jsp/adminDashboard.jsp';");
                out.println("</script>");

            } else {

                out.println("<script>");
                out.println("alert('Invalid Username or Password');");
                out.println("history.back();");
                out.println("</script>");
            }

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}