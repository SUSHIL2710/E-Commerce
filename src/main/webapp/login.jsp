<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login | E-Book</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container mb-5 mt-5">
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white    ">
                            <h3>Login Here</h3>
                        </div>
                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="container text-center">
                                    <a href="register.jsp mb-3 text-center d-block">If not registered register here</a> 
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
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
