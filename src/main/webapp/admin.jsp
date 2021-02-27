<%@page import="java.util.List"%>
<%@page import="com.demo.mavenproject1.entities.Category"%>
<%@page import="com.demo.mavenproject1.dao.CategoryDao"%>
<%@page import="com.demo.mavenproject1.helper.FactoryProvider"%>
<%@page import="com.demo.mavenproject1.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin !! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page | E-Book</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>

            <div class="row mt-3">

                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img src="image/icons/users.png" class="img-fluid rounded-circle" style="max-width: 125px">
                            </div>
                            <h1>10</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img src="image/icons/category.png" class="img-fluid rounded-circle" style="max-width: 125px">
                            </div>
                            <h1>8</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <div class="card-body">
                            <div class="container">
                                <img src="image/icons/products.png" class="img-fluid rounded-circle" style="max-width: 125px">
                            </div>
                            <h1>16</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body">
                            <div class="container">
                                <img src="image/icons/add category.png" class="img-fluid rounded-circle" style="max-width: 125px">
                            </div>
                            <p class="mt-2">Click Here to add categories</p>
                            <h1 class="text-uppercase text-muted">Add Categories</h1>
                        </div>
                    </div> 
                </div>
                <div class="col-md-6">
                    <div class="card text-center" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body">
                            <div class="container">
                                <img src="image/icons/add products.png" class="img-fluid rounded-circle" style="max-width: 125px">
                            </div>
                            <p class="mt-2">Click Here to add products</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!---Category Modal --->

        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">

                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required>
                            </div> 
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter Category Description" name="catDescription" required style="height: 300px"></textarea>
                            </div> 
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end Category modal---->

        <!---Product Modal--->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!---Form--->
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            <!---Product title--->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter Title Of Product" name="pName" required>
                            </div>
                            <!--Product Description--->
                            <div class="form-group">
                                <textarea class="form-control" placeholder="Enter Product Description" name="pDesc" required style="height: 150px"></textarea>
                            </div>
                            <!---Product Price--->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Price Of Product" name="pPrice" required>
                            </div>
                            <!---Product Discount-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Discount" name="pDiscount" required>
                            </div>
                            <!---Product Quantity-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Product Quantity" name="pQuantity" required>
                            </div>
                            <!---Product Categories--->
                            <%
                               CategoryDao cdoa = new CategoryDao(FactoryProvider.getFactory()); 
                               List<Category> list = cdoa.getCategories();
                             %>   
                            
                            <div class="form-group">
                                <select name="catId" id="" class="form-control">
                                    <%
                                        for(Category c:list){
                                     %>
                                     <option value="<%= c.getCategoryId() %>"><%= c.getCategoryTitle() %></option>
                                     <% } %>
                                </select>
                            </div>
                            <!---Product Photo--->
                            <div class="form-group">
                                <label for="pPic">Upload The Product Image</label><br>
                                <input type="file" id="pPic" name="pPic" required>
                            </div>
                            <!---Submit Buttons--->
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                        <!---End From--->
                    </div>
                    
                </div>
            </div>
        </div>
        <!---End Product Modal--->
        <%@include file="components/cart_modal.jsp" %>
    </body>
</html>
