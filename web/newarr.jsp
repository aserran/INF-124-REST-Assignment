<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

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
						<a href="index" class='label compname'>CoolFitted</a>
					</div>
					<div id='men' class='menu'>
						<a href="index" class='label home'>Home</a>
						<a href="newarr" class='label newarr active'>New Arrivals</a>
						<a href="snapbacks" class='label snap'>Snapbacks</a>
						<a href="strapbacks" class='label strap'>Strapbacks</a>
						<a href="aboutus.html" class='label aboutus'>About us</a>
                                                <a href="cart.jsp" class='label cart'>Cart</a>
					</div>
				</div>
				<div class='jumbo'>
					<img src='Media/newarrpic.jpg' height="200" width="70%" style='margin-top: 3%'>
				</div>
				<div class='featcombo'>
					<div class='combocontent'>
						New Arrivals
					</div>
				</div>
				<table class='gridedhats'>
                                    
                                    <c:forEach var="image" items="${imagelist}" >
                                        <fmt:parseNumber var="in" type="number" value="${inc}"/>
                                        <tr class = "row">
                                            <td>
                                                <a class ="cell" onclick="itemclicked('<c:out value="${image[0]}"/>')" href ="detailspage?param=${image[1]}">
                                                    <div class ="col-1">
                                                        <img src="<c:out value ="${image[0]}"/>" width = "160" height="120">
                                                            <p><c:out value="${image[2]}"/>"<span><br><c:out value="${image[3]}"/>"</span></p>
                                                    </div>
                                                </a>
                                            </td>
                                        
                                            <td>
                                                <a class ="cell" onclick="itemclicked('<c:out value="${image[4]}"/>')" href ="detailspage?param=${image[5]}">
                                                    <div class ="col-2">
                                                        <img src="<c:out value ="${image[4]}"/>" width ="160" height="120">
                                                        <p><c:out value="${image[6]}"/>"<span><br><c:out value="${image[7]}"/>"</span></p>
                                                    </div>
                                                </a>
                                            </td>
                                        
                                            <td>
                                                <a class ="cell" onclick="itemclicked('<c:out value="${image[8]}"/>')" href ="detailspage?param=${image[9]}">
                                                    <div class ="col-3">
                                                        <img src="<c:out value ="${image[8]}"/>" width ="160" height="120">
                                                        <p><c:out value="${image[10]}"/>"<span><br><c:out value="${image[11]}"/>"</span></p>
                                                    </div>
                                                </a>
                                            </td>
                                        
                                            <td>
                                                <a class ="cell" onclick="itemclicked('<c:out value="${image[12]}"/>')" href ="detailspage?param=${image[13]}">
                                                    <div class ="col-4">
                                                        <img src="<c:out value ="${image[12]}"/>" width ="160" height="120">
                                                        <p><c:out value="${image[14]}"/>"<span><br><c:out value="${image[15]}"/>"</span></p>
                                                    </div>
                                                </a>
                                            </td>
                                        </tr>
                                        
                                    </c:forEach>
				</table>
                                 <div class='featcombo'>
					<div class='combocontent'>
						Recently Viewed Items
					</div>
				</div>
                                <table class = 'gridedhats'>
                                    <c:if test="${empty hatqueue}">
                                        <p>
                                            You have not recently viewed any items!
                                        </p>
                                    </c:if>
                                    <c:if test="${not empty hatqueue}">
                                        <tr class ='row'>
                                        <c:forEach var="im" items="${hatqueue}">
                                            <td>
                                                <a class ="cell" onclick="itemclicked('<c:out value="${im}"/>')" href ="detailspage?param=${im}">
                                                    <div class ="col-1">
                                                        <img src="Media/<c:out value="${im}"/>.jpg" width ="160" height="120">
                                                    </div>
                                                </a>
                                            </td>
                                        </c:forEach>
                                        </tr>
                                    </c:if>
                                </table>
					<div class='footercombo'>
						<div class='combocontent' style="padding-top:1%; font-size: 20px">
							CoolFitted<span style='font-size: 13px'>&reg;</span> 2017 &#8209; All Rights Reserved
						</div>
					</div>
				<br/>
				<br/>
			</div>
		</div>
	</center>
</body>
<!--
<script>
	window.onload = function(){
		sessionStorage.setItem("47LAsnap1.jpg",["47 Brand Los Angeles Dodgers Snapback - Blue","29.99","- Royal Blue Crown & Visor","- Gray Undervisor","- Embroidered Dodgers Team Logo on the Front Panel","- 85% Acrylic & 15% Wool"]);
		sessionStorage.setItem("47SFgiantssnap1.jpg",["47 Brand SF Giants Snapback - Navy","29.99","- Black Crown & Visor","- Team Logo Embroidered on Front in Orange","- Snapback Adjustable","- 100% Cotton"]);
		sessionStorage.setItem("47Navystrap1.jpg",["47 Brand Cleanup Classic Dad Hat - Navy","20.99","- Navy Crown & Visor","- Brand Logo Embroidered on Front in White","- Strapback Adjustable","- 100% Cotton"]);
		sessionStorage.setItem("BMW90sm3strap1.jpg",["90's BMW M3 Embroidered Strapback - White","35.99","- BMW M3 Logo Embroidered on Front","- Strapback Adjustable","- 100% Cotton"]);
		sessionStorage.setItem("CaliBearwhitestrap1.jpg",["Cali Bear Dad Hat - White","23.99","- White Crown","- Embroidered Cali Bear Logo","- 100% Cotton"]);
		sessionStorage.setItem("HundredsGlobeSnap1.jpg",["The Hundreds Los Angeles Snapback - Royal & Red & Black","25.99","- Silk Like Black Crown & Visor","- Green Undervisor","- Embroidered Script Logo","- 100% Polyester"]);
		sessionStorage.setItem("HundredsPlayersnap1.jpg",["The Hundreds Los Angeles Snapback - Maroon & Teal","25.99","- Silk Like Teal Crown & Visor","- Green Undervisor","- Embroidered Script Logo","- 100% Polyester"]);
		sessionStorage.setItem("HUFHstrap1.jpg",["HUF Classic H 6-Panel Strapback - Navy & Stone","20.99","- Navy Crown","- Stone Visor","- Green Undervisor","- HUF Classic Logo","- 80% Acrylic & 20% Wool"]);
		sessionStorage.setItem("undef5strikesnap1.jpg",["Undefeated 5 Strike Snapback Hat - Camo","30.99","- Green Undervisor","- Embroidered 5 Strike Logo","- 80% Acrylic & 20% Wool"]);
		sessionStorage.setItem("RVCAsnap1.jpg",["RVCA Trucker Snapback - Black","34.99","- Black Front Panel, Visor, & Undervisor","- Black Mesh Backing","- Embroidered RVCA Script Logo","- 100% Polyester"]);
		sessionStorage.setItem("BulldogWhitestrap1.jpg",["Dog Limited English Bulldog Dad Hat - White","28.99","- White Crown & Visor","- Embroidered English Bulldog Logo","- 100% Cotton"]);
		sessionStorage.setItem("CigaretteNaikestrap1.jpg",["Cigarette Naike Strapback Hat - Pink","20.99","- Pink Crown & Visor","- Embroidered Naike Logo","- 100% Cotton"]);
		sessionStorage.setItem("CaliBearblackstrap1.jpg",["Cali Bear Dad Hat - Black","24.99","- Black Crown, Visor, & Undervisor","- Embroidered Cali Bear Logo","- 100% Cotton"]);
		sessionStorage.setItem("Hundredsbluesnap1.jpg",["The Hundreds Globe Los Angeles Snapback - Royal & Red & White","26.99","- Silk Like Royal Blue Crown & Visor","- Green Undervisor","- Embroidered Script Logo","- 100% Polyester"]);
		sessionStorage.setItem("LAblacksnap1.jpg",["47 Brand Los Angeles Dodgers Snapback - Black","29.99","- Royal Blue Crown & Visor","- Gray Undervisor","- Embroidered Dodgers Team Logo on the Front Panel","- 85% Acrylic & 15% Wool"]);
		sessionStorage.setItem("LARamssnap1.jpg",["New Era 9Fifty Los Angeles Rams Snapback - Black & Royal & Gold","28.99","- Black Crown & Visor","- Green Undervisor","- Embroidered Team Script Logo","- 100% Wool"]);
		sessionStorage.setItem("PinkDolphinsnap1.jpg",["Pink Dolphin Gradient Snapback - Black","29.99","- Black Visor with yellow and green gradient pattern","- Printed Pink Dolphin Flag in green & yellow","- 100% Polyester"]);
		sessionStorage.setItem("TravisMathewCauthensnap1.jpg",["Travis Mathew Cauthen Snapback Hat - Navy","30.99","- Navy Crown & Visor","- Brand Logo Embroidered on Front","- 60% Bamboo & 40% Cotton"]);
		sessionStorage.setItem("MLBstrap1.jpg",["New Era 9Twenty MLB Umpire Dad Hat - Denim","28.99","- Denim Undervisor","- Official MLB Logo Embroidered on Front","- 100% Cotton"]);
		sessionStorage.setItem("NBAstrap1.jpg",["New Era 9Twenty NBA Logo Dad Hat - Denim","28.99","- Navy Denim Crown & Visor","- Navy Denim Undervisor- Official NBA Logo Embroidered on Front","- 100% Cotton"]);
		sessionStorage.setItem("NikeCamostrap1.jpg",["Nike Army Dad Hat - Camo","28.99","- Camo Crown, Visor, & Undervisor","- Embroidered Naike Logo on Front","- 100% Cotton"]);
		sessionStorage.setItem("StussyMWstrap1.jpg",["Stussy Melton Wool Strapback - Burgundy","30.99","- Tan Visor & Undervisor","- Brand Logo Embroidered on Front","- 50% Wool & 30% Polyester & 10% Acrylic & 10% Nylon"]);
		sessionStorage.setItem("TupacBearstrap1.jpg",["By Any Meme Tupac Bear Dad Hat - White","29.99","- White Crown, Visor, & Undervisor","- Embroidered Tupac Bear Logo","- 100% Cotton"]);
	};
</script>
-->
</html>
