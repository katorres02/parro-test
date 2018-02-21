// js object, easy to encapsulate methods of each namespace
var Checkout = new Object();

// ajax call to /api/v1/checkout/calculate.js
// return the final price after applying promotion rules
Checkout.calculate = function(){
  // current orders of each product
  var vouchers = $("#VOUCHER").val();
  var tshirts  = $("#TSHIRT").val();
  var mugs     = $("#MUG").val();

  var request = $.ajax({
    url: "/api/v1/checkout/calculate.json",
    method: "POST",
    data: { 
      vouchers: Checkout.preventNegatives(vouchers),
      tshirts: Checkout.preventNegatives(tshirts),
      mugs: Checkout.preventNegatives(mugs)
    }
  });
  
  // request ok
  request.done(function( data ) {
    $("#result").text(data.price);
  });
   
  // request fail
  request.fail(function( jqXHR, textStatus ) {
    alert( "Request failed: " + textStatus );
  });
}

// validate in case a negative number is present
Checkout.preventNegatives = function(value){
  var intValue = parseInt(value);
  if(intValue < 0 ){
    return 0;
  }else{
    return intValue;
  }
}