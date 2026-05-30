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

@WebServlet("/StudentSignupServlet")
public class StudentSignupServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String year = request.getParameter("year");
        String password = request.getParameter("password");

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
                    "INSERT INTO student(name,email,department,year,password) VALUES(?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, department);
            ps.setString(4, year);
            ps.setString(5, password);

            int row = ps.executeUpdate();

            if (row > 0) {

                out.println("<script>");
                out.println("alert('Signup Successful!');");
                out.println("location='/jsp/studentLogin.jsp';");
                out.println("</script>");

            } else {

                out.println("<script>");
                out.println("alert('Signup Failed');");
                out.println("history.back();");
                out.println("</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
