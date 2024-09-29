package com.tech.servlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.util.ConnectionUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) {
        String username = req.getParameter("username");
        String password = req.getParameter("password");


        try (PreparedStatement userSelectStatement = ConnectionUtil.getConnection()
                .prepareStatement("SELECT *FROM application_user WHERE username=? and password = ?")) {
            userSelectStatement.setString(1, username);
            userSelectStatement.setString(2, password);

            if (userSelectStatement.executeQuery().next()) {
                HttpSession session = req.getSession();
                session.setAttribute("username", username);
                session.setAttribute("login", true);
                resp.sendRedirect(req.getContextPath() + "/admin.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/index.jsp?login-failed=true");
            }

        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }
}
