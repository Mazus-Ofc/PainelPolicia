function Notify(descricao, tempo, tipo) {

    if (tipo == "error") {
        $('.notify').addClass('error')
        $('.notify').removeClass('check')
        $('.notify .imagem').html(`<img src="./imagens/svg/close-notify.svg" alt="">`)
        $('#notify h1').html(descricao)

        $('#notify').fadeIn(200)
        setTimeout(() => {
            $('#notify').fadeOut(500)
        }, tempo);
    } else {
        $('.notify').addClass('check')
        $('.notify').removeClass('error')
        $('.notify .imagem').html(`<img src="./imagens/svg/check-notify.svg" alt="">`)
        $('#notify h1').html(descricao)

        $('#notify').fadeIn(200)
        setTimeout(() => {
            $('#notify').fadeOut(500)
        }, tempo);
    }
}