<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>

        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Clean Login Form Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/style.css">
        <link href="//fonts.googleapis.com/css?family=Sirin+Stencil" rel="stylesheet">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resource/images/logomini2.png" />

    </head>
    <body>
        <div class="container demo-1">
            <div class="content">
                <div id="large-header" class="large-header">
                    <h1>Register</h1>
                    <div class="main-agileits">
                        <div class="form-w3-agile">
                            <h2>Register Now</h2>

                            <!-- error handle with user hit the cancel button or login google failed -->
                            <c:if test="${param.error == 'user_existed'}">
                                <div class="alert alert-danger">
                                    <c:out value="${user_existed_message}"/>
                                </div>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/authservlet" method="POST" onsubmit="return validateRegister()">
                                <input type="hidden" name="action" value="register"/>

                                <div class="form-sub-w3">
                                    <input type="text" name="fullname" placeholder="Full Name" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-user" aria-hidden="true"></i>
                                    </div>
                                </div>

                                <div class="form-sub-w3">
                                    <input type="email" name="email" id="email" placeholder="Email" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-envelope" aria-hidden="true"></i>
                                    </div>
                                    <span id="emailError" style="color: red;"></span>
                                </div>

                                <div class="form-sub-w3">
                                    <input type="text" name="phone" id="phone" placeholder="Phone Number" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-phone" aria-hidden="true"></i>
                                    </div>
                                    <span id="phoneError" style="color: red;"></span>
                                </div>

                                <div class="form-sub-w3">
                                    <input type="password" name="password" id="password" placeholder="Password" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </div>
                                    <span id="passwordError" style="color: red;"></span>
                                </div>

                                <div class="form-sub-w3">
                                    <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
                                    <div class="icon-w3">
                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                    </div>
                                    <span id="confirmPasswordError" style="color: red;"></span>
                                </div>
                                <div class="submit-w3l">
                                    <input type="submit" value="Register">
                                </div>
                                <p class="p-bottom-w3ls1">Already have an account? <a href="signIn.jsp">Login here</a></p>


                            </form>

                            <script>
                                function validateRegister() {
                                    var email = document.getElementById("email").value;
                                    var phone = document.getElementById("phone").value;
                                    var password = document.getElementById("password").value;
                                    var confirmPassword = document.getElementById("confirmPassword").value;

                                    var email_regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                                    var phone_regex = /^[0-9]{10,11}$/; // 10-11 số
                                    var password_regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/;

                                    var valid = true;

                                    // Kiểm tra email
                                    if (!email_regex.test(email)) {
                                        document.getElementById("emailError").textContent = "Invalid email format!";
                                        valid = false;
                                    } else {
                                        document.getElementById("emailError").textContent = "";
                                    }

                                    // Kiểm tra số điện thoại
                                    if (!phone_regex.test(phone)) {
                                        document.getElementById("phoneError").textContent = "Phone must be 10-11 digits!";
                                        valid = false;
                                    } else {
                                        document.getElementById("phoneError").textContent = "";
                                    }

                                    // Kiểm tra password
//                                    if (!password_regex.test(password)) {
//                                        document.getElementById("passwordError").textContent = "Password must have at least 8 characters, 1 uppercase, 1 number, and 1 special character.";
//                                        valid = false;
//                                    } else {
//                                        document.getElementById("passwordError").textContent = "";
//                                    }

                                    // Kiểm tra confirm password
                                    if (password !== confirmPassword) {
                                        document.getElementById("confirmPasswordError").textContent = "Passwords do not match!";
                                        valid = false;
                                    } else {
                                        document.getElementById("confirmPasswordError").textContent = "";
                                    }

                                    return valid;
                                }
                            </script>

                            <div class="social w3layouts">
                                <div class="heading">
                                    <h5>Or Register with</h5>
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
