window.addEventListener('message', function(event) {

    let wallet = event.data.wallet;
    let bank = event.data.bank;

    $("#bank").text(bank);
    $("#wallet").text(wallet);


    let display = false;


    if (event.data.control === 'm' && display === false) {

        display = true;
        $('#wrapperHUD').animate({
                marginLeft: "-8px",
                opacity: "1.0"
            },
            300,
            function() {

            });
        window.setTimeout(function() {
            $('#bank, #wallet').fadeIn(500);
        }, 300);

        window.setTimeout(function() {
            display = false;
            $('#wrapperHUD').animate({
                    marginLeft: "-20vw",
                    opacity: "0"
                },
                200,
                function() {

                });
            window.setTimeout(function() {
                $('#bank, #wallet').fadeOut(300);
            }, 300);

        }, 3000)
    }

});