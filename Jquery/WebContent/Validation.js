jQuery(function($) {
	  var validator = $('#form').validate({
	    rules: {
	    	firstname : {required:true},
			lastname : {required:true},
			email : {
				required : true,
				email:true
			},
			mobile :{
				required : true,
				minlength: 10,
				maxlength: 10
			},
			city :{
				required : true
			},
			state :{
				required : true
			},
			password :{
				required : true,
				minlength: 5
			}
			
	    },
	    messages: {
	    	firstname:"Plese Enter Your firstname",
	    	lastname:"Plese Enter Your lastname",
	    	email:"Plese Enter valid EmailId",
	    	mobile:"Plese Enter 10 Digit mobile Number",
	    	city:"Plese Enter Your City",
	    	state:"Plese Enter Your State",
	    	password:"Plese enter 5 digit password"
	    },
	    errorPlacement: function(error, element) {
	      var placement = $(element).data('error');
	      if (placement) {
	        $(placement).append(error)
	      } else {
	        error.insertAfter(element);
	      }
	    }
	  });
	});