// -- [CiviliansNetwork]
// -- informationer


console.log('[SCRIPT ACTIVATED]');

window.addEventListener('message', function(e) {
	$("#container").stop(false, true);
    if (e.data.displayWindow == 'true') {
        $("#container").css('display', 'flex');
  		
        $("#container").animate({
        	bottom: "15%",
        	opacity: "1.0"
            
        	},
        	700, function() {
        	console.log('[Animate Start]');
        });

    } else {
    	$("#container").animate({
        	bottom: "-50%",
        	opacity: "0.0"
        	},
        	700, function() {
        		console.log('[Animate End]');
        		$("#container").css('display', 'none');
	         	
        });
    }
});

