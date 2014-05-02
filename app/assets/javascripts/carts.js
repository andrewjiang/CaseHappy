$(document).ready(function(){
	$('#promo-button').click(function(){
		if ($('#promo-code').val()=="REDDIT"){
			window.location = "?code=REDDIT";
    	mixpanel.track("Entered REDDIT Code");
		} else if ($('#promo-code').val()=="THANKYOU") {
			window.location = "?code=THANKYOU";
			mixpanel.track("Entered THANKYOU Code");
		} else {
			alert("Please enter a valid promo code");
			mixpanel.track("Entered Incorrect Code");
		};
	});

	$('.action-button.love').click(function(event){
		$(this).toggleClass('clicked');
		mixpanel.track("Clicked Love on a Case");
	});

});