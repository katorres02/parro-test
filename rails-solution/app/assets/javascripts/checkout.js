var Checkout = new Object();

Checkout.calculate = function(){
  var vouchers = $("#VOUCHER").val();
  var tshirts  = $("#TSHIRT").val();
  var mugs     = $("#MUG").val();

  var request = $.ajax({
    url: "parrolabs/calculate.js",
    method: "GET",
    data: { 
      vouchers: Checkout.preventNegatives(vouchers),
      tshirts: Checkout.preventNegatives(tshirts),
      mugs: Checkout.preventNegatives(mugs)
    }
  });
   
  request.done(function( msg ) {

  });
   
  request.fail(function( jqXHR, textStatus ) {
    alert( "Request failed: " + textStatus );
  });
}

Checkout.preventNegatives = function(value){
  var intValue = parseInt(value);
  if(intValue < 0 ){
    return 0;
  }else{
    return intValue;
  }
}