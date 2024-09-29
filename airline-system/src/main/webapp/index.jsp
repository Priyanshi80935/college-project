<!DOCTYPE html>
<html lang="en">
<body>
<jsp:include page="include/head.jsp"/>

<main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section">

        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
                    <h1 data-aos="fade-up">To most people, the sky is limit to those who love aviation, the sky is home</h1>
                    <p data-aos="fade-up" data-aos-delay="100">Aviation is not just about the destination; it's about the journey and the experiences along the way</p>
                    <div class="d-flex flex-column flex-md-row" data-aos="fade-up" data-aos-delay="200">
                        <a href="#about" class="btn-get-started">Get Started <i class="bi bi-arrow-right"></i></a>
                        <a href="https://youtu.be/al51WZcN2_U?si=KWdH4K5c1sn3GyIP"
                           class="glightbox btn-watch-video d-flex align-items-center justify-content-center ms-0 ms-md-4 mt-4 mt-md-0"><i
                                class="bi bi-play-circle"></i><span>Watch Video</span></a>
                    </div>
                </div>
                <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-out">
                    <%if(request.getParameter("admin") != null && request.getParameter("admin").equals("true")) {%>
                    <div class="login-container offset-2 col-8">
                        <!-- Login Title -->
                        <div class="login-header">
                            <h2>Login</h2>
                        </div>
                        <%
                            if (request.getParameter("login-failed") != null && request.getParameter("login-failed").equals("true")) {
                        %>
                        <div class="alert alert-danger" role="alert" >
                              <strong>Error!</strong> Your credentials are incorrect. Please try again.
                        </div>
                        <% } %>
                        <!-- Login Form -->
                        <form action="<%= request.getContextPath() %>/login" method="post" autocomplete="off">
                            <!-- Email Input -->
                            <div class="mb-3">
                                <label for="username" class="form-label">Email username</label>
                                <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required autocomplete="off">
                            </div>

                            <!-- Password Input -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required autocomplete="off">
                            </div>

                            <!-- Submit Button -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-login btn-block">Login</button>
                            </div>

                            <!-- Optional Footer Links -->
                            <div class="form-footer">
                                <p class="mt-3">Don't have an account? <a href="register.jsp">Sign Up</a></p>
                            </div>
                        </form>
                    </div>
                    <%}else{%>
                    <img src="assets/img/airlineimg.jpg" class="img-fluid" alt="">
                    <%}%>
                </div>
            </div>
        </div>

    </section><!-- /Hero Section -->

    <!-- Pricing Section -->
    <section id="pricing" class="pricing section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <h2>Pricing</h2>
            <p>Check Our Affordable Pricing<br></p>
        </div><!-- End Section Title -->

        <div class="container">

            <div class="row gy-4">

                <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="100">
                    <div class="pricing-tem">
                        <h3 style="color: #20c997;">Free Plan</h3>
                        <div class="price"><sup>$</sup>0<span> / mo</span></div>
                        <div class="icon">
                            <i class="bi bi-box" style="color: #20c997;"></i>
                        </div>
                        <ul>
                            <li>Aida dere</li>
                            <li>Nec feugiat nisl</li>
                            <li>Nulla at volutpat dola</li>
                            <li class="na">Pharetra massa</li>
                            <li class="na">Massa ultricies mi</li>
                        </ul>
                        <a href="#" class="btn-buy">Buy Now</a>
                    </div>
                </div><!-- End Pricing Item -->

                <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="200">
                    <div class="pricing-tem">
                        <span class="featured">Featured</span>
                        <h3 style="color: #0dcaf0;">Starter Plan</h3>
                        <div class="price"><sup>$</sup>19<span> / mo</span></div>
                        <div class="icon">
                            <i class="bi bi-send" style="color: #0dcaf0;"></i>
                        </div>
                        <ul>
                            <li>Aida dere</li>
                            <li>Nec feugiat nisl</li>
                            <li>Nulla at volutpat dola</li>
                            <li>Pharetra massa</li>
                            <li class="na">Massa ultricies mi</li>
                        </ul>
                        <a href="#" class="btn-buy">Buy Now</a>
                    </div>
                </div><!-- End Pricing Item -->

                <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="300">
                    <div class="pricing-tem">
                        <h3 style="color: #fd7e14;">Business Plan</h3>
                        <div class="price"><sup>$</sup>29<span> / mo</span></div>
                        <div class="icon">
                            <i class="bi bi-airplane" style="color: #fd7e14;"></i>
                        </div>
                        <ul>
                            <li>Aida dere</li>
                            <li>Nec feugiat nisl</li>
                            <li>Nulla at volutpat dola</li>
                            <li>Pharetra massa</li>
                            <li>Massa ultricies mi</li>
                        </ul>
                        <a href="#" class="btn-buy">Buy Now</a>
                    </div>
                </div><!-- End Pricing Item -->

                <div class="col-lg-3 col-md-6" data-aos="zoom-in" data-aos-delay="400">
                    <div class="pricing-tem">
                        <h3 style="color: #0d6efd;">Ultimate Plan</h3>
                        <div class="price"><sup>$</sup>49<span> / mo</span></div>
                        <div class="icon">
                            <i class="bi bi-rocket" style="color: #0d6efd;"></i>
                        </div>
                        <ul>
                            <li>Aida dere</li>
                            <li>Nec feugiat nisl</li>
                            <li>Nulla at volutpat dola</li>
                            <li>Pharetra massa</li>
                            <li>Massa ultricies mi</li>
                        </ul>
                        <a href="#" class="btn-buy">Buy Now</a>
                    </div>
                </div><!-- End Pricing Item -->

            </div><!-- End pricing row -->

        </div>

    </section><!-- /Pricing Section -->


    <!-- Testimonials Section -->
    <section id="testimonials" class="testimonials section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <h2>Testimonials</h2>
            <p>What they are saying about us<br></p>
        </div><!-- End Section Title -->

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="swiper init-swiper">
                <script type="application/json" class="swiper-config">
                    {
                        "loop": true,
                        "speed": 600,
                        "autoplay": {
                            "delay": 5000
                        },
                        "slidesPerView": "auto",
                        "pagination": {
                            "el": ".swiper-pagination",
                            "type": "bullets",
                            "clickable": true
                        },
                        "breakpoints": {
                            "320": {
                                "slidesPerView": 1,
                                "spaceBetween": 40
                            },
                            "1200": {
                                "slidesPerView": 3,
                                "spaceBetween": 1
                            }
                        }
                    }
                </script>
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="stars">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i>
                            </div>
                            <p>
                                Excellent in flight service and very helpful cabin crew.
                            I would like to praise the cabin crew staff on the above mentioned flight.
                            </p>
                            <div class="profile mt-auto">
                                <img src="assets/img/testimonials/bisnu.enc" class="testimonial-img" alt="">
                                <h3>Bisnupriya Das</h3>
                                <h4>Ceo &amp; Founder</h4>
                            </div>
                        </div>
                    </div><!-- End testimonial item -->

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="stars">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i>
                            </div>
                            <p>
                                Service is still good
                            I have been flying Singapore airlines for work since 2005. 
                             Their service is still one of the best.
                                I have tried other airlines and some of them leave you feeling as 
                               if the cabin crew are the paying customers.
                            </p>
                            <div class="profile mt-auto">
                                <img src="assets/img/testimonials/lulumamu.enc" class="testimonial-img" alt="">
                                <h3>Sanatana Pradhan</h3>
                                <h4>Designer</h4>
                            </div>
                        </div>
                    </div><!-- End testimonial item -->

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="stars">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i>
                            </div>
                            <p>
                                Strengths: Exceptional in-flight service, spacious seating, and extensive entertainment options. The food quality is consistently good, and the staff is friendly and attentive.
                            </p>
                            <div class="profile mt-auto">
                                <img src="assets/img/testimonials/rahulbhai.enc" class="testimonial-img" alt="">
                                <h3>Shaswat Pratik Nayak </h3>
                                <h4>Store Owner</h4>
                            </div>
                        </div>
                    </div><!-- End testimonial item -->

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="stars">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i>
                            </div>
                            <p>
                                Strengths: Comfortable seats with excellent legroom and one of the best business class experiences. Qatar Airways has great food and entertainment services.
                            </p>
                            <div class="profile mt-auto">
                                <img src="assets/img/testimonials/queen mam.enc" class="testimonial-img" alt="">
                                <h3>Queen Swain</h3>
                                <h4>Freelancer</h4>
                            </div>
                        </div>
                    </div><!-- End testimonial item -->

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <div class="stars">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i
                                    class="bi bi-star-fill"></i>
                            </div>
                            <p>
                                Strengths: Extensive flight routes across the U.S. and internationally, with competitive ticket prices. In-flight Wi-Fi is generally available, and the AAdvantage program offers great benefits.
                            </p>
                            <div class="profile mt-auto">
                                <img src="assets/img/testimonials/skillsir.enc" class="testimonial-img" alt="">
                                <h3>Sanu Tripathy</h3>
                                <h4>Entrepreneur</h4>
                            </div>
                        </div>
                    </div><!-- End testimonial item -->

                </div>
                <div class="swiper-pagination"></div>
            </div>

        </div>

    </section><!-- /Testimonials Section -->

    <!-- Clients Section -->
    <section id="clients" class="clients section">

        <!-- Section Title -->
        <div class="container section-title" data-aos="fade-up">
            <h2>Clients</h2>
            <p>We work with best Airlines<br></p>
        </div><!-- End Section Title -->

        <div class="container" data-aos="fade-up" data-aos-delay="100">

            <div class="swiper init-swiper">
                <script type="application/json" class="swiper-config">
                    {
                        "loop": true,
                        "speed": 600,
                        "autoplay": {
                            "delay": 5000
                        },
                        "slidesPerView": "auto",
                        "pagination": {
                            "el": ".swiper-pagination",
                            "type": "bullets",
                            "clickable": true
                        },
                        "breakpoints": {
                            "320": {
                                "slidesPerView": 2,
                                "spaceBetween": 40
                            },
                            "480": {
                                "slidesPerView": 3,
                                "spaceBetween": 60
                            },
                            "640": {
                                "slidesPerView": 4,
                                "spaceBetween": 80
                            },
                            "992": {
                                "slidesPerView": 6,
                                "spaceBetween": 120
                            }
                        }
                    }
                </script>
                <div class="swiper-wrapper align-items-center">
                    <div class="swiper-slide"><img src="assets/img/clients/img1.png" class="img-fluid" alt=""></div>
                    <div class="swiper-slide"><img src="assets/img/clients/img2.png" class="img-fluid" alt=""></div>
                    <div class="swiper-slide"><img src="assets/img/clients/img3.png" class="img-fluid" alt=""></div>
                    <div class="swiper-slide"><img src="assets/img/clients/img4.png" class="img-fluid" alt=""></div>
                    <div class="swiper-slide"><img src="assets/img/clients/img5.png" class="img-fluid" alt=""></div>
                    <div class="swiper-slide"><img src="assets/img/clients/img6.png" class="img-fluid" alt=""></div>
                    <div class="swiper-slide"><img src="assets/img/clients/img7.png" class="img-fluid" alt=""></div>
                    <div class="swiper-slide"><img src="assets/img/clients/img8.png" class="img-fluid" alt=""></div>
                </div>
                <div class="swiper-pagination"></div>
            </div>

        </div>

    </section><!-- /Clients Section -->

</main>

<jsp:include page="include/footer.jsp"/>

</body>

</html>