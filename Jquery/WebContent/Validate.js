/**
 * 
 */
$(document)
		.ready(
				function() {

					$('#buttonValidate')
							.click(
									function() {

										if ($('#firstName').val() < 1) {
											$('#firstName')
													.after(
															'<span class="error" >Please Enter Your First Name</span>');
											$('#firstName').focus();
										} else if ($('#middleName').val() < 1) {
											$('#middleName')
													.after(
															'<span class="error">Please Enter Your Middle Name</span>');
											$('#middleName').focus();
										} else if ($('#lastName').val() < 1) {
											$('#lastName')
													.after(
															'<span class="error">Please Enter Your Last Name</span>');
											$('#lastName').focus();
										} else if ($('#emailid').val().indexOf(
												"@") < 1
												|| ($('#emailid').val()
														.indexOf("@") - $(
														'#emailid').val()
														.indexOf(".")) > 2) {
											$('#emailid')
													.after(
															'<span class="error">Please enter a valid Email Id</span>');
											$('#emailid').focus();
										} else if ($('#mobileNumber').val().length < 10) {
											$('#mobileNumber')
													.after(
															'<span class="error">Please enter a valid Mobile Number</span>');
											$('#mobileNumber').focus();
										} else if ($('#city').val() < 1) {
											$('#city')
													.after(
															'<span class="error">Please Enter Your City</span>');
											$('#city').focus();
										} else if ($('#state').val() < 1) {
											$('#state')
													.after(
															'<span class="error">Please Enter Your State</span>');
											$('#state').focus();
										}
									});
				});
