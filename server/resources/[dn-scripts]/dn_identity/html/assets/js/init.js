$(document).ready(function(){
  window.addEventListener('message', function( event ) {
		if (event.data.action == 'show') {
				console.log(event.data)
				console.log(event.data.array)
				console.log(event.data.array.user.age);
				var name				= event.data.array.user.firstname + " " +  event.data.array.user.name;
				var home        = event.data.array.user.home;
				var age 		    = event.data.array.user.age;
				var number		  = event.data.array.user.number;
				var cpr 		  	= event.data.array.user.registration;
				var license   	= event.data.array.licenses.license;
				var job 				= event.data.array.user.job;
				if(home == undefined) {
					home = "Ukendt"
				}
				if(number == undefined) {
					number = "00"
				}

			if ( license == "Nej") {
				$('.name').text(name);
				$('.licensenr').text(home + ", " + number + ", 2900, Danmark");
				$('.socialcpr').text(cpr);
				$('#id-card').css('background', 'url(assets/images/idcard.png)');
				$('#id-card').show();
			}
		} else if (event.data.action == 'hide') {
			$('#id-card').hide();
			$('#license').hide();
		}
	})
});
