<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
        <title>Login Page</title>
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
        

    </head>
    
    <body>
        <div class="login-form">
            <form action="dangnhapServlet" method="post">
                <h2 class="text-center">Log In</h2>       
                
                <p class="text-danger">${mess}</p>
                <p class="text-success">${mess4}</p>
                
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Username" name="username" required="required">
                </div>
                
                <div class="form-group">
                    <input type="password" class="form-control" placeholder="Password" name="password" required="required" id="input">
                </div>

                <label class="pull-left checkbox-inline"><input type="checkbox" onclick="myFunction()">show Password</label>
                
                <script>
                    function myFunction() {
                      var x = document.getElementById("input");
                      if (x.type === "password") {
                        x.type = "text";
                      } else {
                        x.type = "password";
                      }
                    }
                </script>
                
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block" >Log in</button>
                </div>
                
                
            </form>
    <p class="text-center">Don't have a account yet?<a href="DangKi1.jsp"> Create a new account</a></p>
        </div>
    </body>
</html>
