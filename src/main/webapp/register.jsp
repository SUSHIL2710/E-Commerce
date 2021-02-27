<%-- 
    Document   : register
    Created on : 21-Feb-2021, 9:34:53 pm
    Author     : dipus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page | E-book</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid mb-5">
            <div class="row mt-5">

                <div class="col-md-4 offset-md-4">
                    
                    <div class="card px-2">
                        <%@include file="components/message.jsp" %>
                        <div class="card-body">
                            <img src="image/register.png" class="img-responsive ml-5" height="70%" width="70%">
                            <h3 class="text-center my-3">Sign Up Here !!</h3>
                            <form action="RegistrationServlets" method="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter Name">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter Email Id">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter Password">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input name="user_phone" type="phone" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter Phone Number">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Address</label>
                                    <textarea name="user_address" style="height: 150px" class="form-control" placeholder="Enter Your Address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Register</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.jsp" %>
    </body>
</html>
