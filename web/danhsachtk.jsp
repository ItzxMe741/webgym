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
    <body>
        <nav class="navbar navbar-expand-md navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="index.jsp"><img src="Images/icon.png" width=60px height=40px><i class="title">AntWake Library</i></a>

                <div class="collapse navbar-collapse justify-content-end" id="navbarsExampleDefault">
                    <ul class="navbar-nav m-auto">
                        <c:if test="${sessionScope.acc != null}">
                            <li class="nav-item m-auto">
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
                                <a class="nav-link" href="danhsachServlet">BookManage</a>
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
        <section class="jumbotron text-center">
            <div class="container">
                <h1 class="jumbotron-heading">Account Management</h1>
            </div>
        </section>

        <div class="container">
            <div class="row">
                <div class="span12">
                    <form id="custom-search-form" class="form-search form-horizontal pull-right" method="get" action="searchtk">
                        <div class="input-append span12">
                            <input type="text" class="search-query" placeholder="Search Username" name="txt">
                            <button type="submit" class="fa fa-search"><i class="icon-search"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <div class="container mb-4">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Username</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Password</th>
                                    <th scope="col" >Admin Manage</th>
                                    <th scope="col" >LibraryMan Manage</th>
                                    <th> </th>
                                    <th> </th>
                                </tr>
                            </thead>
                            <i class="text-danger">${messus}</i>
                            <tbody>
                                <c:forEach items="${listtk}" var="ltk" >
                                    <tr>
                                        <td>${ltk.username}</td>
                                        <td>${ltk.email}</td>
                                        <td>${ltk.password}</td>
                                        <td>${ltk.admin}</td>
                                        <td>${ltk.libMan}</td>
                                        <td> <a href="suaTK?username=${ltk.username}"> <button type="button" class="btn btn-sm btn-secondary"> <i class="fa fa-edit"></i> </button> </a> </td>
                                        <td> <a href="xoaTK?username=${ltk.username}"><button class="btn btn-sm btn-danger"><i class="fa fa-trash"></i> </button></a> </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col mb-2">
                    <button class="btn btn-secondary btn-lg btn-block" data-toggle="modal" data-target="#addtk">ADD ACCOUNT</button>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="addtk" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Add Account</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form method="POST" action="themTK" >
                        <div class="modal-body">

                            <table>
                                <tr>
                                    <td>Username</td>
                                    <td><input type="text" name="username" required/></td>
                                </tr>

                                <tr>
                                    <td>Email</td>
                                    <td><input type="email" name="email" required=""/></td>
                                </tr>
                                <tr>
                                    <td>Password</td>
                                    <td><input type="text" name="password" required/></td>
                                </tr>
                                <tr>
                                    <td>Admin Manage</td>
                                    <td class="radioa">
                                        <input type="radio" name="admin" value="1" checked/> Accept
                                        <input type="radio" name="admin" value="0"/> Deny
                                    </td>
                                </tr>

                                <tr>
                                    <td>LibraryMan Manage</td>
                                    <td class="radioa">
                                        <input type="radio" name="libMan" value="1" checked/> Accept
                                        <input type="radio" name="libMan"value="0"/> Deny
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="reset" class="btn btn-warning">Reset</button>
                            <button type="submit" class="btn btn-primary">Save changes</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>

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
        </footer>
    </body>
</html>