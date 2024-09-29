package com.tech.servlet;

import com.tech.dao.UserDao;
import com.tech.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manage-user")
public class ManageUserServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserDao userDao;

    @Override
    public void init() throws ServletException {
        userDao = new UserDao(); // Initialize DAO for database interactions
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        
        if (action == null || action.isEmpty()) {
            viewUsers(req, resp);
        } else {
            handleActions(req, resp, action);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action != null) {
            try {
                handleActions(req, resp, action);
            } catch (Exception e) {
                e.printStackTrace();
                resp.sendRedirect("error.jsp");
            }
        }
    }

    private void handleActions(HttpServletRequest req, HttpServletResponse resp, String action) throws IOException, ServletException {
        switch (action) {
            case "add":
                addUser(req, resp);
                break;
            case "edit":
                updateUser(req, resp);
                break;
            case "delete":
                deleteUser(req, resp);
                break;
            case "view":
            default:
                viewUsers(req, resp);
                break;
        }
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // Collect user data from request
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String gender = req.getParameter("gender");
        String passportId = req.getParameter("passportId");
        String address = req.getParameter("address");
        String dateOfBirth = req.getParameter("dateOfBirth");
        String contact = req.getParameter("contact");

        // Create a new User object
        User user = new User();
        user.setUsername(username);
        user.setEmail(email);
        user.setGender(gender);
        user.setPassportId(passportId);
        user.setAddress(address);
        user.setDateOfBirth(dateOfBirth);
        user.setContact(contact);

        // Add user to the database
        userDao.addUser(user);

        // Redirect back to the user list
        viewUsers(req, resp);
    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // Collect updated user data
        int id = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String gender = req.getParameter("gender");
        String passportId = req.getParameter("passportId");
        String address = req.getParameter("address");
        String dateOfBirth = req.getParameter("dateOfBirth");
        String contact = req.getParameter("contact");

        // Update the user object
        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setEmail(email);
        user.setGender(gender);
        user.setPassportId(passportId);
        user.setAddress(address);
        user.setDateOfBirth(dateOfBirth);
        user.setContact(contact);

        // Update user in the database
        userDao.updateUser(user);

        // Refresh the user list
        viewUsers(req, resp);
        resp.sendRedirect(req.getContextPath() + "/manage-user");
    }

    private void deleteUser(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        int id = Integer.parseInt(req.getParameter("id"));

        // Delete the user from the database
        userDao.deleteUser(id);

        // Refresh the user list
        viewUsers(req, resp);
        resp.sendRedirect(req.getContextPath() + "/manage-user");
    }

    private void viewUsers(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // Retrieve the list of users from the database
        List<User> users = userDao.viewUsers();

        // Set the list of users as an attribute to the request
        req.setAttribute("users", users);

        // Forward to the user.jsp page to display users
        req.getRequestDispatcher("manage-user.jsp").forward(req, resp);
    }
}
