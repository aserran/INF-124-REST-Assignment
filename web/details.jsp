<%-- 
    Document   : details
    Created on : May 30, 2017, 2:41:06 AM
    Author     : arca
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="script.js?v=5"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script>
    function itemAdded(){
        alert("Item has been added to cart.")
    }
</script>
<head>
	<title>CoolFitted hats</title>
</head>
<body>
	<div class='main'>
		<div class='content'>
			<center>
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
                                        <a href="cart.jsp" class='label cart'>Cart</a>
				</div>
			</div>
			<div class='itemtitle'>
				<div id='title' class='titlecontent'>
                                        ${title} - ${price}
				</div>
			</div>
			<br/>
			<div class = "detailimg">
                            <a class = "cell">
                                    <div class = "col-1">
                                            <img src = "${image1}" width = "140" height = "140">
                                    </div>
                            </a>
                            <a class = "cell">
                                    <div class = "col-2">
                                            <img src = "${image2}" width = "140" height = "140">
                                    </div>
                            </a>
                            <a class = "cell">
                                    <div class = "col-3">
                                            <img src = "${image3}" width = "140" height = "140">
                                    </div>
                            </a>
			</div>
			<br/>
			<div class='itemdetail'>
				<div id ='detail' class='detailcontent'>
					The Details:
					<br/>
                                        <ul>
					<c:set var="detailslist" value="${fn:split(details, '-')}" />
                                        <c:forEach var="element" items="${detailslist}">
                                            <li>${element}</li>
                                        </c:forEach>
                                        </ul>
				</div>
			</div>
			<br/>
			</center>
			<div class="additembox">
                            <form name="additem" class="orderdetails" action="cart" method="POST" onclick="itemAdded()">
                                <table>
                                    <tr>
                                        <td><label for="quantity">Quantity: </label></td>
                                        <td><input hidden="true" name="model" value="${title}"/>
                                            <td><input hidden="true" name="price" value="${price}"/>
					<td><input id='quantity' style='width:35px;' name='quant' type='number' min='1' maxlength='2' value='1' required></td>
                                        <td><input type='submit' id='submit' name='submit' value='Add to Cart'></td>
                                    </tr>
                                </table>
                            </form>
				<!---<form name="additem" class="orderdetails" id='checkout' action="validate.php" method="post">
					<table 	cellspacing="10px">
						<tr>
							<th><label style='font-size: 18px;'>Checkout Form:</label></th>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label for="quantity">Quantity: </label></td>
							<td><input id='quantity' style='width:35px;' name='quant' type='number' min='1' maxlength='2' value='1' required onchange="addquantity()"></td>
						</tr>
						<tr>
							<td><label for="fname">First Name: </label></td>
							<td><input id ='fname' style='width:170px;' name='fname' type='text' required></td>
						</tr>
						<tr>
							<td><label for="lname">Last Name: </label></td>
							<td><input id ='lname' style='width:170px;' name='lname' type='text' required></td>
						</tr>
						<tr>
							<td><label for="phone">Phone number: </label></td>
							<td><input id ='phone' style='width:170px;' name='phone' type='phone' placeholder='XXX-XXX-XXXX' required></td>
						</tr>
						<tr>
							<td><label for="email">Email: </label></td>
							<td><input id ='email' style='width:170px;' name='email' type='email' required></td>
						</tr>
						<tr style="margin-top:8%;margin-bottom:8%;font-size: 17px;">
							<th>Shipping Info:</th>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td><label for="street">Shipping Adress: </label></td>
							<td><input id ='street' style='width:170px;' name='street' type='text' placeholder='eg. 123 First Street' required></td>
						</tr>
						<tr>
							<td><label for="city">City: </label></td>
							<td><input id ='city' style='width:170px;' name='city' type='text' required></td>
						</tr>
						<tr>
							<td><label for="state">State: </label></td>
							<td><input id ='state' style='width:35px;' name='state' type='text' maxlength='2' required></td>
						</tr>
						<tr>
							<td><label for="zip">Zip Code: </label></td>
							<td><input id ='zip' style='width:70px;' name='zip' maxlength='5' type='number' onchange='calculate(this.value)' required></td>
						</tr>
						<tr>
							<td><label for="shipmethod">Shipping Method: </label></td>
							<td>
							<select name='shipmethod' id = 'shipmethod' style='width:170px;' onchange="select(this.value)">
								<option disabled="true" selected="true" value='Choose'>Choose shipping method</option>
		  						<option value="overnight">USPS Priority Mail Express (Overnight +$24)</option>
		  						<option value="onetothree">USPS Priority Mail (1-3 Business days +$10)</option>
		  						<option value="standard">USPS Retail Ground (2-8 Business days +$0)</option>
							</select>
							</td>
						</tr>
						<tr style="margin-top:8%;margin-bottom:8%;font-size: 17px;">
							<th>Credit Card info:</th><td>&nbsp;</td>
						</tr>
						<tr>
							<td><label for="owner">Name: </label></td>
	                		<td><input  id='owner' type="text" style='width:170px;' name='owner' required></td>
						</tr>
						<tr>
							<td><label for="cardNumber">Card Number</label></td>
	                		<td><input type="text"  id="cardNumber" style='width:170px;' name='card' required></td>
						</tr>
						<tr style='margin-top:5%'>
							<td><label for="cvv">CVV:</label></td>
							<td><input type="text" id ='cvv' style='width:50px;' maxlength='4' name='cvv' required></td>
						</tr>
						<tr>
							<td><label name='expdate' id='expdate'>Expiration Date:</label></td>
			                <td><select id='expmonth'>
			                    <option value="01">01</option>
			                    <option value="02">02</option>
			                    <option value="03">03</option>
			                    <option value="04">04</option>
			                    <option value="05">05</option>
			                    <option value="06">06</option>
			                    <option value="07">07</option>
			                    <option value="08">08</option>
			                    <option value="09">09</option>
			                    <option value="10">10</option>
			                    <option value="11">11</option>
			                    <option value="12">12</option>
			                </select>
			                <select id='expyear'>
			                    <option value="16"> 2016</option>
			                    <option value="17"> 2017</option>
			                    <option value="18"> 2018</option>
			                    <option value="19"> 2019</option>
			                    <option value="20"> 2020</option>
			                    <option value="21"> 2021</option>
			                </select></td>
						</tr>
						<tr>
							<td><label for="subtotal">Subtotal: </label></td>
							<td><label id ='subtotal' style='width:auto;' name='subtotal' value='0' disabled></label></td>
						</tr>
						<tr>
							<td><label for="tax">Taxes: </label></td>
							<td><label id ='tax' style='width:auto;' name='tax'>+$0.00</label></td>
						</tr>
						<tr>
							<td><label for="total"><b>Total: </b></label></td>
							<td><label id ='total' style='width:auto;' name='total'></label></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td width='100px'><span id="error" style="color:red;font-size: 14px;"></span></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type='submit' id='submit' name='submit' value='Place Order'></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td width='100px' style='font-size: 10px;'>By clicking 'Place Order' you acknowledge that you are aware of the total price and the item(s) desired to purchase and that you are ready to make this purchase</td>
						</tr>
					</table>
				</form>
    --->
			</div>
			<center>
			<div class='footercombo' style="margin-top:100px;">
				<div class='combocontent' style="padding-top:1%; font-size: 20px;margin-left: 125px;">
					CoolFitted&reg; 2017 &#8209; All Rights Reserved
				</div>
			</div>
			</center>
			<br/>
			<br/>
		</div>
	</div>
</body>
<script>
	$( window ).load(function() {
		var details = $('#detail').html();
		$('#subtotal').html("$"+details.substring(details.indexOf('$')+1).trim());
		$('#total').html("$"+details.substring(details.indexOf('$')+1).trim());
	});
	//AJAX to validate check out and calculate taxes based on zipcode
	$("#checkout").submit(function(event) {
      event.preventDefault();
      $('#error').html("");
      var $form = $( this ), url = $form.attr( 'action' );
      var posting = $.post( url, { quantity: $('#quantity').val(),
      							fname: $('#fname').val(),
      							lname: $('#lname').val(),
      							phone: $('#phone').val(),
      							email: $('#email').val(),
      							street: $('#street').val(),
      							city: $('#city').val(),
      							state: $('#state').val(),
      							creditzip: $('#zip').val(),
      							shipmethod: $('#shipmethod :selected').text(),
      							creditname: $('#owner').val(),
      							cardNumber: $('#cardNumber').val(),
      							cvv: $('#cvv').val(),
      							expdate: $('#expdate :selected').text(),
      							total: $('#total').html(),
      							expMonth: $('#expmonth :selected').text(),
      							expYear: $('#expyear :selected').text(),
      							item: $('#title').text()
      							});
      posting.done(function( data ) {
      	if(data.substring(0,1) == '*'){
      		$('#error').html(data);
      	}
      	else{
			window.location.href = "confirmation.html?orderid="+data;
      	}

      });
    });
    function calculate(id) {
    	if(id.length==5){
    		var posting = $.post("validate.php",{zip:id});
    		posting.done(function(result) {
	            $('#tax').html("+$"+(parseFloat($('#subtotal').html().substring(1))*result).toFixed(2));
	            $('#total').html("$"+(parseFloat($('#subtotal').html().substring(1))+parseFloat($('#tax').html().substring(2))).toFixed(2));
	        });
    	}
	};
</script>
</html>