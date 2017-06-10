<%-- 
    Document   : cart
    Created on : May 30, 2017, 12:52:46 PM
    Author     : arca
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="script.js"></script>
<head>
	<title>CoolFitted hats</title>
</head>
<body>
	<center>
		<div class='main'>
			<div class='content'>
				<div class='menubar'>
				<div class='name'>
					<a href="index" class="label compname">CoolFitted</a>
				</div>
				<div class='menu'>
					<a href="index" class='label home'>Home</a>
					<a href="newarr" class='label snap'>New Arrivals</a>
					<a href="snapbacks" class='label snap'>Snapbacks</a>
					<a href="strapbacks" class='label strap'>Strapbacks</a>
					<a href="aboutus.html" class='label aboutus'>About Us</a>
                                        <a href="cart.jsp" class='label cart active'>Cart</a>
					</div>
				</div>
                                <div class="featcombo">
                                    <div class="combocontent">
                                            Confirmation
                                    </div>
                                    <div class="thank" style="margin-top:2%;color:#000;font-size: 16px">
                                        Thank you for your purchase, you will receive an email with details on your order.
                                    </div>
				</div>
                                <div class='footercombo' style="margin-top:20%;">
                                        <div class='combocontent' style="font-size: 20px">
                                                CoolFitted<span style='font-size: 13px'>&reg;</span> 2017 &#8209; All Rights Reserved
                                        </div>
                                </div>
				<br/>
				<br/>
			</div>
		</div>
	</center>
</body>
</html>
