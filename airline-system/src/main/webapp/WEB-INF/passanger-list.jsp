<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Passenger List</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Passenger List</h2>

        <!-- Passenger List Table -->
        <table class="table table-striped table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Gender</th>
                    <th>Passport ID</th>
                    <th>Contact Number</th>
                </tr>
            </thead>
            <tbody>
                <c:if test="${empty passengers}">
                    <tr>
                        <td colspan="6" class="text-center">No passengers found.</td>
                    </tr>
                </c:if>
                <c:forEach var="passenger" items="${passengers}">
                    <tr>
                        <td>${passenger.id}</td>
                        <td>${passenger.fullName}</td>
                        <td>${passenger.email}</td>
                        <td>${passenger.gender}</td>
                        <td>${passenger.passportId}</td>
                        <td>${passenger.contactNumber}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
