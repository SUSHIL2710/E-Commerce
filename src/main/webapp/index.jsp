<%@page import="com.demo.mavenproject1.helper.Helper"%>
<%@page import="com.demo.mavenproject1.entities.Category"%>
<%@page import="com.demo.mavenproject1.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.demo.mavenproject1.entities.Product"%>
<%@page import="com.demo.mavenproject1.dao.ProductDao"%>
<%@page import="com.demo.mavenproject1.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Book | Home</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/carousel.jsp" %>
        <%@include file="components/choose.jsp" %>
        <div class="container">
        <div class="row mt-3 mx-2">
            <%                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list = dao.getAllProducts();
            %>
            
            <!---//show products--->
            <div class="col-md-12">
                <div class="container text-center mt-5" style="font-size: 35px;font-family: 'Akaya Telivigala', cursive">Featured Products</div>
                <hr noshade width="50%" align="center" class="mb-5">
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card-columns">
                            <!---//traversing products---->
                            <%
                                for (Product p : list) {
                            %>
                            <div class="card">
                                <div class="conatiner text-center p-2">
                                <img class="card-img-top" src="image/Products/<%= p.getpPhoto() %>" alt="Card image cap" style="max-height: 200px;max-width: 100%;width: auto">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= p.getpName() %></h5>
                                    <p class="card-text"><%= Helper.get10Words(p.getpDesc()) %></p>
                                </div>
                                <div class="card-footer text-center">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getPriceAfterApplyingDiscount()%> )">
                                        <i class="fas fa-cart-arrow-down"></i> Add to cart
                                    </button>
                                    <button class="btn btn-outline-success">&#8377; <%= p.getPriceAfterApplyingDiscount() %>/-   <span class="text-muted discount-label">&#8377; <%= p.getpPrice() %></span><span class="discount"> &nbsp;&nbsp;<%= p.getpDiscount() %>%off</span></button>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
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
