<!DOCTYPE html>
<html lang="en">
<body>
<jsp:include page="include/head.jsp"/>

<main class="main">
    <section id="booking" class="booking section">
        <div class="container">
            <h2 class="section-title">Book Your Flight</h2>

            <form action="${pageContext.request.contextPath}/bookFlight" method="post">
                <div class="row">
                    <div class="col-md-6">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" required class="form-control" placeholder="Enter your full name">
                    </div>
                    <div class="col-md-6">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required class="form-control" placeholder="Enter your email address">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label for="departure">Departure City</label>
                        <input type="text" id="departure" name="departure" required class="form-control" placeholder="Enter departure city">
                    </div>
                    <div class="col-md-6">
                        <label for="destination">Destination City</label>
                        <input type="text" id="destination" name="destination" required class="form-control" placeholder="Enter destination city">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label for="departureDate">Departure Date</label>
                        <input type="date" id="departureDate" name="departureDate" required class="form-control">
                    </div>
                    <div class="col-md-6">
                        <label for="returnDate">Return Date</label>
                        <input type="date" id="returnDate" name="returnDate" class="form-control">
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <label for="passengers">Number of Passengers</label>
                        <input type="number" id="passengers" name="passengers" min="1" required class="form-control" placeholder="Enter number of passengers">
                    </div>
                    <div class="col-md-6">
                        <label for="paymentMethod">Payment Method</label>
                        <select id="paymentMethod" name="paymentMethod" required class="form-control">
                            <option value="">Select Payment Method</option>
                            <option value="creditCard">Credit Card</option>
                            <option value="paypal">PayPal</option>
                            <option value="bankTransfer">Bank Transfer</option>
                        </select>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <button type="submit" class="btn btn-primary">Book Flight</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
</main>

           <jsp:include page="include/footer.jsp"/>
       </body>

       </html>