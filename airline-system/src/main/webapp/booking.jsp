<%@page import="com.tech.model.Booking"%>
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
        <section id="manage-booking" class="manage-booking section">
            <!-- Section Title -->
            <div class="container section-title" data-aos="fade-up">
                <p>Manage Booking</p>
            </div>

            <!-- Booking Management Form -->
            <div class="container d-flex justify-content-center">
                <form action="${pageContext.request.contextPath}/manage-booking" method="post" class="w-100">
                    <input type="hidden" name="action" value="${currentBooking == null ? 'add' :'update' }">
                    <input type="hidden" name="id" value="${currentBooking == null ? '' : currentBooking.id}">

                    <!-- Full Name -->
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" class="form-control form-control-sm" id="fullName" name="fullName" placeholder="Full Name" 
                        value="${currentBooking == null ? '' : currentBooking.fullName}"
                        required>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control form-control-sm" id="email" name="email" placeholder="Email" 
                         value="${currentBooking == null ? '' : currentBooking.email}"
                         required>
                    </div>

                    <!-- Departure City -->
                    <div class="form-group">
                        <label for="departureCity">Departure City</label>
                        <input type="text" class="form-control form-control-sm" id="departureCity" name="departureCity" placeholder="Departure City" 
                        value="${currentBooking == null ? '' : currentBooking.departureCity}"
                        required>
                    </div>

                    <!-- Destination City -->
                    <div class="form-group">
                        <label for="destinationCity">Destination City</label>
                        <input type="text" class="form-control form-control-sm" id="destinationCity" name="destinationCity" placeholder="Destination City" 
                        value="${currentBooking == null ? '' : currentBooking.destinationCity}"
                        required>
                    </div>

                    <!-- Departure Date -->
                    <div class="form-group">
                        <label for="departureDate">Departure Date</label>
                        <input type="date" class="form-control form-control-sm" id="departureDate" name="departureDate" 
                        value="${currentBooking == null ? '' : currentBooking.departureDate}"
                        required>
                    </div>

                    <!-- Return Date -->
                    <div class="form-group">
                        <label for="returnDate">Return Date</label>
                        <input type="date" class="form-control form-control-sm" id="returnDate" name="returnDate" 
                        value="${currentBooking == null ? '' : currentBooking.returnDate}"
                        required>
                    </div>

                    <!-- Number of Passengers -->
                    <div class="form-group">
                        <label for="numberOfPassengers">Number of Passengers</label>
                        <input type="number" class="form-control form-control-sm" id="numberOfPassengers" name="numberOfPassengers" placeholder="Number of Passengers" 
                        value="${currentBooking == null ? '' : currentBooking.numberOfPassengers}"
                        required>
                    </div>

                    <!-- Payment Method -->
                    <div class="form-group">
                        <label for="paymentMethod">Payment Method</label>
                        <select class="form-control form-control-sm" id="paymentMethod" name="paymentMethod" required>
                            <option value="">Select Payment Method</option>
                            <option value="Credit Card" ${currentBooking != null && currentBooking.paymentMethod == 'Credit Card' ? 'selected' : ''}>Credit Card</option>
                            <option value="Debit Card" ${currentBooking != null && currentBooking.paymentMethod == 'Debit Card' ? 'selected' : ''}>Debit Card</option>
                            <option value="PayPal" ${currentBooking != null && currentBooking.paymentMethod == 'PayPal' ? 'selected' : ''}>PayPal</option>
                        </select>
                    </div>

                    <% if(request.getAttribute("currentBooking") != null) { %>
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                    <% } else { %>
                        <button type="submit" class="btn btn-primary btn-sm">Submit</button>
                    <% } %>
                </form>
            </div>

            <!-- Booking Table -->
            <div class="container mt-5 table-responsive">
                <table class="table table-bordered table-hover text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Departure City</th>
                            <th>Destination City</th>
                            <th>Departure Date</th>
                            <th>Return Date</th>
                            <th>Number of Passengers</th>
                            <th>Payment Method</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:if test="${not empty bookings}">
                            <c:forEach var="booking" items="${bookings}">
                                <tr>
                                    <td>${booking.fullName}</td>
                                    <td>${booking.email}</td>
                                    <td>${booking.departureCity}</td>
                                    <td>${booking.destinationCity}</td>
                                    <td>${booking.departureDate}</td>
                                    <td>${booking.returnDate}</td>
                                    <td>${booking.numberOfPassengers}</td>
                                    <td>${booking.paymentMethod}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manage-booking?id=${booking.id}&action=edit" class="btn btn-warning btn-sm">Edit</a>
                                        <a href="${pageContext.request.contextPath}/manage-booking?id=${booking.id}&action=delete" class="btn btn-danger btn-sm">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty bookings}">
                            <tr>
                                <td colspan="9" class="text-center">No bookings available.</td>
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
