<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Index -Airline-System</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/css/login.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Main CSS File -->
    <link href="assets/css/main.css" rel="stylesheet">
</head>

<body class="index-page">

<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

        <a href="index.jsp" class="logo d-flex align-items-center me-auto">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <img src="assets/img/logo.png" alt="">
            <h1 class="sitename">SkyJet</h1>
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="${pageContext.request.contextPath}/index.jsp" class="active">Home</a></li>
                <%
                    if(session.getAttribute("username") != null) {
                %>
                    <li><a href="${pageContext.request.contextPath}/manage-flight">Flight</a></li>
                    <li><a href="${pageContext.request.contextPath}/manage-user">Manage User</a></li>
                    <li><a href="${pageContext.request.contextPath}/logout">
                                        <i class="fa fa-sign-out" title="Logout"></i></a></li>
                <%} %>

                <%
                    if(session.getAttribute("username") == null) {
                %>
                    <li><a href="${pageContext.request.contextPath}/booking.jsp">Booking</a></li>
                    <li><a href="${pageContext.request.contextPath}/about.jsp">About</a></li>
                    <li><a href="${pageContext.request.contextPath}/contact.jsp">Contact</a></li>
                    <li><a href="${pageContext.request.contextPath}/index.jsp?admin=true"><i class="fa fa-sign-in" title="Login"></i>
                    </a></li>
                <%} %>

            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>

       <!--  <a class="btn-getstarted flex-md-shrink-0" href="${pageContext.request.contextPath}/about.jsp"">Get Started</a> -->

    </div>
</header>