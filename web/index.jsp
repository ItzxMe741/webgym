<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <!-- Header -->
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp"><img src="Images/icon.png" width=60px height=40px><i class="title">AntWake Library</i></a>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav m-auto">
                            <l class="nav-link">Hi,${sessionScope.acc.username}</l>
                            </li>
                        </c:if>

                        <li class="nav-item m-auto">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <c:if test="${sessionScope.acc.admin == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="dsTKServlet">Account</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc.libMan == 1}">
                            <li class="nav-item">
                                <a class="nav-link" href="BMICalculator.jsp">BookManager</a>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.acc == null}">
                            <li class="nav-item">
                                <a class="nav-link" href="DangNhap1.jsp">LogIn</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="DangKi1.jsp">SignUp</a>
                            </li>
                        </c:if>

                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item">
                                <a class="nav-link" href="showBook">Books</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="dangxuatServlet">LogOut</a>
                            </li>
                        </c:if>
                    </ul>

                </div>
            </div>
        </nav>

        <!-- Body -->
        <section>
            <div id="indexback" class="carousel slide carousel-fade" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="Images/back1.jpg" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/background.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="Images/backgr.png" class="d-block w-100" alt="">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#indexback" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#indexback" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>


        <!-- Footer -->
        <footer class="text-light">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-lg-4 col-xl-3">
                        <h5>About</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <p class="mb-0">
                            Website library management
                        </p>
                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto">
                        <h5>Informations</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-facebook mr-2"></i><a href="https://www.facebook.com/iitzxme74/">Tài Phan Minh</a></li>
                            <li><i class="fa fa-instagram mr-2"></i><a href="https://www.instagram.com/itzxmee_74/">Itzmi74</a></li>
                            <li><i class="fa fa-twitter mr-2"></i><a href="https://twitter.com/Itzmi74">itzxmee_74</a></li>
                        </ul>
                    </div>

                    <div class="col-md-4 col-lg-3 col-xl-3">
                        <h5>Contact</h5>
                        <hr class="bg-white mb-2 mt-0 d-inline-block mx-auto w-25">
                        <ul class="list-unstyled">
                            <li><i class="fa fa-home mr-2"></i>AntWake Library</li>
                            <li><i class="fa fa-envelope mr-2"></i>pmtai74@gmail.com</li>
                            <li><i class="fa fa-phone mr-2"></i>(+84) 93 855 6701</li>
                            <li><i class="fa fa-print mr-2"></i>+84(8)3823 3318</li>
                        </ul>
                    </div>
                    <div class="col-12 copyright mt-3">
                        <p class="float-left">
                            <a href="#">Back to top</a>

                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>