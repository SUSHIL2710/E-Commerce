<%-- 
    Document   : about
    Created on : 21-Feb-2021, 9:13:26 pm
    Author     : dipus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us | E-Book</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <!---About Us--->
        <div class="about-section paddingTB60 gray-bg mt-5 mb-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-7 col-sm-6">
                        <div class="about-title clearfix">
                            <h1>About <span>E-Book</span></h1>
                            <h3>We offer all best books. </h3>
                            <p class="about-paddingB">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec aliquet dolor libero, eget venenatis mauris finibus dictum. Vestibulum quis elit eget neque porttitor congue non sit amet dolor. Proin pretium purus a lorem ornare </p>
                            <p>sed lobortis pulvinar. Integer laoreet mi id eros porta euismod. Suspendisse potenti. Nulla eros mauris, convallis et sem tempus, viverra hendrerit sapien</p>
                            <div class="about-icons"> 
                                <ul >
                                    <li><a href="#"><i id="social-fb" class="fab fa-facebook-square fa-3x social"></i></a> </li>
                                    <li><a href="#"><i id="social-tw" class="fab fa-twitter-square fa-3x social"></i></a> </li>
                                    <li> <a href="#"><i id="social-gp" class="fab fa-google-plus fa-3x social"></i></a> </li>
                                    <li> <a href="#"><i id="social-em" class="fa fa-envelope-square fa-3x social"></i></a> </li>
                                </ul>       
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-6">
                        <div class="about-img">
                            <img src="image/about.jpg" alt="" style="max-height: 70vh; max-width: auto">
                        </div>
                    </div>	
                </div>
            </div>
        </div>
        <!---End About Us---->
        <%@include file="components/footer.jsp" %>
    </body>
</html>
