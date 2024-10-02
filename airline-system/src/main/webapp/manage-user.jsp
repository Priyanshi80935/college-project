<%@page import="com.tech.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="include/head.jsp"/>
    <style>
        /* Custom Styles for better visual appeal */
        body {
            background-color: #f8f9fa;
        }

        .main {
            padding: 60px 0;
        }

        .section-title p {
            font-size: 24px;
            font-weight: bold;
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 700px;
            width: 100%;
        }

        .form-control-sm {
            margin-bottom: 15px;
        }

        .table {
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .table th, .table td {
            vertical-align: middle;
        }

        .btn-primary {
            width: 100%;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            form {
                width: 100%;
                padding: 15px;
            }

            .table-responsive {
                overflow-x: auto;
            }
        }
    </style>
</head>
<body>
    <main class="main">
        <section id="manage-user" class="manage-user section">
            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <p>Manage User</p>
            </div>

            <!-- User Management Form -->
            <div class="container d-flex justify-content-center">
                <form action="${pageContext.request.contextPath}/manage-user" method="post" class="w-100">
                    <input type="hidden" name="action" value="${currentUser == null ? 'add' :'update' }">
                    <input type="hidden" name="id" value="${currentUser == null ? '' : currentUser.id}">

                    <!-- Username -->
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control form-control-sm" id="username" name="username" placeholder="Username" 
                        value="${currentUser == null ? '' : currentUser.username}"
                        required>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control form-control-sm" id="email" name="email" placeholder="Email" 
                         value="${currentUser == null ? '' : currentUser.email}"
                         required>
                    </div>

                    <!-- Gender -->
					<div class="form-group">
					    <label for="gender">Gender</label>
					    <select class="form-control form-control-sm" id="gender" name="gender" required>
					        <option value="">Select Gender</option>
					        <option value="Male" ${currentUser != null && currentUser.gender == 'Male' ? 'selected' : ''}>Male</option>
					        <option value="Female" ${currentUser != null && currentUser.gender == 'Female' ? 'selected' : ''}>Female</option>
					        <option value="Other" ${currentUser != null && currentUser.gender == 'Other' ? 'selected' : ''}>Other</option>
					    </select>
					</div>


                    <!-- Passport ID -->
                    <div class="form-group">
                        <label for="passportId">Passport ID</label>
                        <input type="text" class="form-control form-control-sm" id="passportId" name="passportId" placeholder="Passport ID" 
                        value="${currentUser == null ? '' : currentUser.passportId}"
                        required>
                    </div>

                    <!-- Address -->
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" class="form-control form-control-sm" id="address" name="address" placeholder="Address" 
                        value="${currentUser == null ? '' : currentUser.address}"
                        required>
                    </div>

                    <!-- Date of Birth -->
                    <div class="form-group">
                        <label for="dateOfBirth">Date of Birth</label>
                        <input type="date" class="form-control form-control-sm" id="dateOfBirth" name="dateOfBirth" placeholder="Date of Birth" 
                        value="${currentUser == null ? '' : currentUser.dateOfBirth}"
                        required>
                    </div>

                    <!-- Contact -->
                    <div class="form-group">
                        <label for="contact">Contact Number</label>
                        <input type="text" class="form-control form-control-sm" id="contact" name="contact" placeholder="Contact Number" 
                        value="${currentUser == null ? '' : currentUser.contact}"
                        required>
                    </div>

					<%if(request.getAttribute("currentUser") != null) {%>
					 <button type="submit" class="btn btn-primary btn-sm">Update</button>
					<%} else{ %>
					 <button type="submit" class="btn btn-primary btn-sm">Submit</button>
					<%} %>
                </form>
            </div>

            <!-- User Table -->
            <div class="container mt-5 table-responsive">
                <table class="table table-bordered table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Gender</th>
                            <th>Passport ID</th>
                            <th>Address</th>
                            <th>Date of Birth</th>
                            <th>Contact</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty users}">
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.username}</td>
                                    <td>${user.email}</td>
                                    <td>${user.gender}</td>
                                    <td>${user.passportId}</td>
                                    <td>${user.address}</td>
                                    <td>${user.dateOfBirth}</td>
                                    <td>${user.contact}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manage-user?id=${user.id}&action=edit" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="${pageContext.request.contextPath}/manage-user?id=${user.id}&action=delete" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty users}">
                            <tr>
                                <td colspan="8" class="text-center">No users available.</td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </section>
    </main>
    <jsp:include page="include/footer.jsp"/>
</body>
</html>
