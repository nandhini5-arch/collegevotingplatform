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

@WebServlet("/AdminSignupServlet")
public class AdminSignupServlet extends HttpServlet {

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
                    "INSERT INTO admin(username,password) VALUES(?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, username);
            ps.setString(2, password);

            int row =
                    ps.executeUpdate();

            if(row > 0){

                out.println("<script>");
                out.println("alert('Admin Signup Successful');");
                out.println("location='/jsp/adminLogin.jsp';");
                out.println("</script>");

            }

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
