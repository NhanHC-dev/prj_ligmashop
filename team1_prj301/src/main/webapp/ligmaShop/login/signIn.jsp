<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Đăng Nhập</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Clean Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
        <link href="//fonts.googleapis.com/css?family=Sirin+Stencil" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link href="${pageContext.request.contextPath}/resource/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css">-->
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />



    <body>
        <div class="container demo-1">
            <div class="content">
                <div id="large-header" class="large-header">
                    <h1>Login</h1>
                    <div class="main-agileits">

                        <div class="form-w3-agile">
                            <h2>Login Now</h2>
                            <c:if test="${param.error == 'wrong_login'}">
                                <div class="alert alert-danger">
                                    <c:out value="${wrong_login_message}"/>
                                </div>
                            </c:if>
                            <c:if test="${param.success == 'registered'}">
                                <div class="alert alert-success">
                                    <c:out value="${registered}"/>
                                </div>
                            </c:if>
                            <form action="${pageContext.request.contextPath}/authservlet" method="POST">
                                <input type="hidden" name="action" value="login"/>
                                <div class="form-sub-w3">
                                    <input type="text" name="email" placeholder="Email" value="${cookie.email.value}" required />
                                    <div class="icon-w3">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="password" name="password" placeholder="Password" value="${cookie.password.value}" required />
                                    <div class="icon-w3">
                                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    </div>
                                </div>
                                <div class="form-sub-w3">
                                    <input type="checkbox" name="rememberMe" value="true" ${cookie.rememberMe.value}/> Remember Me 
                                </div>
                                <p class="p-bottom-w3ls">Forgot Password? <a href="#">Click here</a></p>
                                <p class="p-bottom-w3ls1">New User? <a href="${pageContext.request.contextPath}/ligmaShop/login/register.jsp">Register here</a></p>
                                <div class="clear"></div>
                                <div class="submit-w3l">
                                    <input type="submit" value="Login">
                                </div>
                            </form>


                            <div class="social w3layouts">
                                <div class="heading">
                                    <h5>Or Login with</h5>
                                    <div class="clear"></div>
                                </div>
                                <div class="icons">
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/LigmaBallsOfficial/logingg&response_type=code&client_id=104499240705-951rk6sn3o4g8cbj0kmf8toc06i934ln.apps.googleusercontent.com&approval_prompt=force">
                                        <i class="fa-brands fa-google"></i>
                                    </a>
                                    <div class="clear"></div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>

                    </div>
                    <div class="copyright w3-agile">
                        <p> © Design by <a href="#" target="_blank">Những Vì Tinh Tú</a></p>
                    </div>

                </div>
            </div>
        </div>	
    </body>
</html>