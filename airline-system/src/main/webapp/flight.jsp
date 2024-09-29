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
        <section id="manage-flight" class="manage-flight section">
            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <p>Manage Flight</p>
            </div>

            <!-- Flight Management Form -->
            <div class="container d-flex justify-content-center">
                <form action="${pageContext.request.contextPath}/manage-flight" method="post" class="w-100">
                    <input type="hidden" name="action" value="${flight == null ? 'add' : 'update'}">
                    <input type="hidden" name="id" value="${flight == null ? '' : flight.id}">

                    <!-- Flight Number -->
                    <div class="form-group">
                        <label for="flightNumber">Flight Number</label>
                        <input type="text" class="form-control form-control-sm" id="flightNumber" name="flightNumber" value="${flight == null ? '' : flight.flightNumber}" placeholder="Flight Number" required>
                    </div>

                    <!-- Destination -->
                    <div class="form-group">
                        <label for="destination">Destination</label>
                        <input type="text" class="form-control form-control-sm" id="destination" name="destination" value="${flight == null ? '' : flight.destination}" placeholder="Destination" required>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-primary btn-sm">Submit</button>
                </form>
            </div>

            <!-- Flight Table -->
            <div class="container mt-5 table-responsive">
                <table class="table table-bordered table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Flight Number</th>
                            <th>Destination</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty flights}">
                            <c:forEach var="flight" items="${flights}">
                                <tr>
                                    <td>${flight.flightNumber}</td>
                                    <td>${flight.destination}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manage-flight?id=${flight.id}&action=edit" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="${pageContext.request.contextPath}/manage-flight?id=${flight.id}&action=delete" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty flights}">
                            <tr>
                                <td colspan="3" class="text-center">No flights available.</td>
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
