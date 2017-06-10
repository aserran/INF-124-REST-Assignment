function addquantity(){
	var divprice = document.getElementById('detail').innerHTML.substring(document.getElementById('detail').innerHTML.indexOf('$')+1).trim();
	var divsubtotal = document.getElementById('subtotal');
	divsubtotal.innerHTML = "$"+parseFloat(divprice)*parseInt(document.getElementById('quantity').value);
	document.getElementById('shipmethod').selectedIndex = 0;
	var divtotal = document.getElementById('total');
	divtotal.innerHTML = "$"+(parseFloat((document.getElementById('subtotal').innerHTML).substring(1))+parseFloat((document.getElementById('tax').innerHTML).substring(2))).toFixed(2);
}

function select(value){
	var divprice = document.getElementById('detail').innerHTML.substring(document.getElementById('detail').innerHTML.indexOf('$')+1).trim();
	if(value == 'overnight'){
		var divtotal = document.getElementById('subtotal');
		divtotal.innerHTML = "$"+((parseFloat(divprice)*parseInt(document.getElementById('quantity').value))+24.00).toFixed(2);
	}
	else if(value == 'onetothree'){
		var divtotal = document.getElementById('subtotal');
		divtotal.innerHTML = "$"+((parseFloat(divprice)*parseInt(document.getElementById('quantity').value))+10.00).toFixed(2);
	}
	else if(value == 'standard'){
		var divtotal = document.getElementById('subtotal');
		divtotal.innerHTML = "$"+parseFloat(divprice)*parseInt(document.getElementById('quantity').value);
	}
	var divtotal = document.getElementById('total');
	divtotal.innerHTML = "$"+(parseFloat((document.getElementById('subtotal').innerHTML).substring(1))+parseFloat((document.getElementById('tax').innerHTML).substring(2))).toFixed(2);
}
