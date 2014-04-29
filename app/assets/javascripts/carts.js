$(document).ready(function(){
	$('#promo-button').click(function(){
		if ($('#promo-code').val()=="REDDIT"){
			window.location = "?code=REDDIT";
		} else if ($('#promo-code').val()=="THANKYOU") {
			window.location = "?code=THANKYOU";
		} else {
			alert("Please enter a valid promo code");
		};
	});

	$('.action-button.love').click(function(event){
		$(this).toggleClass('clicked')
	});

});