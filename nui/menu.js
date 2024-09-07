StartPage = 'pesquisar'
Atualpage = 'pesquisar'

$(document).ready(function () {

    window.addEventListener("message", function (event) {
        switch (event.data.action) {
            case "openSystem":
                $("body").fadeIn(300);
                break;

            case "closeSystem":
                $("body").fadeOut(300);
                break;
        };
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post("http://PainelPolicia/closeSystem");
        };
    };
});

$(document).on("click", ".pesquisar", () => {
    Atualpage = 'pesquisar'

    $('.pesquisar').addClass('open')
    $('.prender').removeClass('open')
    $('.multar').removeClass('open')

    $('#search').fadeIn(500)
    $('#prender').hide()
    $('#multar').hide()
})

$(document).on("click", ".prender", () => {
    Atualpage = 'prender'

    $('.pesquisar').removeClass('open')
    $('.prender').addClass('open')
    $('.multar').removeClass('open')

    $('#search').hide()
    $('#multar').hide()
    $('#prender').fadeIn(500)
})

$(document).on("click", ".multar", () => {
    Atualpage = 'multar'

    $('.pesquisar').removeClass('open')
    $('.prender').removeClass('open')
    $('.multar').addClass('open')

    $('#search').hide()
    $('#prender').hide()
    $('#multar').fadeIn(500)
})

window.addEventListener("message", function (event) {
    $('.fake-input h2').html(`${event.data.horario}`)
});