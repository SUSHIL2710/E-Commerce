<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    }else
    {
        
    }



%>







<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout | E-Book</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <!---Checkout Body---->
        <div class="container text-center mt-4 mb-4 font-weight-bold" style="font-size: 35px;">Checkout</div>
        <div class="container mb-5">
            <div class="row">
                <div class="col-md-6 mb-5">
                    <div class="card">
                        <h3 class="text-center mb-5 mt-4">Your selected items</h3>
                        <div class="cart-body"></div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="text-center mb-5 mt-4">Fill your details for order confirmation</h3>
                        
                        <div class="container">
                        <form action="">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input vale="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Your Name</label>
                                <input vale="<%= user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your name">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Your Contact</label>
                                <input vale="<%= user.getUserPhone () %>" type="number" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your contact number">
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                <textarea vale="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address"></textarea>
                            </div>
                            <div class="container text-center mb-3">
                                <button class="btn btn-outline-success">Order Now</button>
                                <button class="btn btn-outline-primary">Continue Shopping</button>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/cart_modal.jsp" %>
        <!---Footer-->
        <%@include file="components/footer.jsp" %>
    </body>
</html>
