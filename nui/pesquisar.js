$(document).on("click", ".img", () => {
    $('#wrapper-foto').fadeIn(500)
})

$(document).on("click", "#wrapper-foto", () => {
    $('#wrapper-foto').fadeOut(500)
})

$(document).on("click", "#menu img:nth-child(3)", function () {
    if ($('#menu').hasClass('close')) {
        $('#menu').removeClass('close')
        $('.logo h1').show()
        $('.menu h1').show()
        $('#wrapper-foto img').removeClass('wrapper-margin')
    } else {
        $('#wrapper-foto img').addClass('wrapper-margin')
        $('#menu').addClass('close')
        $('.logo h1').hide()
        $('.menu h1').hide()
    }
});

function VerificarIcone(penalidade) {
    if (penalidade === "Prisão") {
        return '<h2><img src="./imagens/svg/lock.svg" alt=""> <br> Prisão</h2>'
    } else {
        return '<h2><img src="./imagens/svg/money.svg" alt=""> <br> Multa</h2>'
    }
}

function VerificarIdentificacao() {
    var user = $('.passporte-s').val()
    $.post('http://PainelPolicia/VerificarIdentificacao', JSON.stringify({ user }), (data) => {
        if (data.name != false) {
            $('#pesquisa').hide()
            $('#pesquisado').fadeIn(500)

            $('.profile-name').html(`
                <h1>${data.name} ${data.sobrenome} <span>#${user}</span> <button><img src="./imagens/svg/check.svg" alt=""></button></h1>
                <div class="infos">
                    <div><h2>Numero de telefone <br> <p>${data.phone}</p></h2></div>
                    <div><h2>Renda Mensal <br> <p>$12000,00</p></h2></div>
                    <div><h2>Nome da mãe <br> <p>N/A</p></h2></div>
                    <div><h2>Identidade (RG)<br> <p>${data.identidade}</p></h2></div>
                    <div><h2>Idade (Anos) <br> <p>${data.idade} Anos</p></h2></div>
                    <div><h2>Nome do Pai <br> <p>N/A</p></h2></div>
                </div>
            `)
            const nameList = data.fixa.sort((a, b) => (a.name2 > b.name2) ? -1 : 1);
            if (data.fixa[0]) {
                $("#criminal").html(`
                    <div class="top">
                        <h1>Penalidade</h1>
                        <h1>Descrição</h1>
                        <h1>Oficial</h1>
                        <h1>Valor da penalidade</h1>
                        <h1>Data</h1>
                    </div>

                <div class="infos">
                </div>
				${nameList.map((item) => (`
				<div class="infos" data-id="${item.data}">
                    <h2 class="penalidade">${VerificarIcone(item.penalidade)}</h2>
                    <h2 class="descricao">${item.descricao ? item.descricao : 'Descrição Idefinida.'}</h2>
                    <h2>${item.oficial}</h2>
                    <h2>${item.valordapenalidade}</h2>
                    <h2>${item.data}</h2>
                    <section><img src="./imagens/svg/delete.svg" alt=""></section>
                </div>
				`)).join("")}
			    `);
                $('#criminal').removeClass('semdados')
            } else {
                $('#criminal').html(`<img src="./imagens/svg/no-storage.svg" alt="">`)
                $('#criminal').addClass('semdados')
            }

            $('.profile').html(`
                ${(data.imagem ? "<div class='img' style='background-image: url(" + data.imagem + ")'></div>" : "<div class='img' style='background-image: url(./imagens/perfil.png')'></div>")}
                <img src="./imagens/svg/addfoto.svg" alt="" class="addfoto">
            `)
            if (data.imagem) {
                $('#container').append(`
                <div id="wrapper-foto">
                    <img src="${data.imagem}" alt="">
                </div>
                `)

                $('#wrapper-foto').html(`
                    <img src="${data.imagem}" alt="">
                `)
            }
        } else {
            $('#pesquisa').show()
            $('#pesquisado').hide()
            $('.close-search').fadeIn(500)
            $('.no-search').hide()
        }
    })
}

$(document).on("click", ".pesquisa-s", () => {
    VerificarIdentificacao()
})

$('.passporte-s').keypress(function (e) {
    if (e.key === 'Enter') {
        VerificarIdentificacao()
    }
});

$(document).on("click", ".profile img:nth-child(2)", () => {
    var user = $('.passporte-s').val()
    $("body").fadeOut(500)
    $.post('http://PainelPolicia/PostNewImage', JSON.stringify({}),
        function (url) {
            $("body").fadeIn(500)
            $.post('http://PainelPolicia/VerificarIdentificacao', JSON.stringify({ user }), (data) => {
                $('.profile').html(` ${(data.imagem ? "<div class='img' style='background-image: url(" + data.imagem + ")'></div>" : "<div class='img' style='background-image: url(./imagens/perfil.png')'></div>")} <img src="./imagens/svg/addfoto.svg" alt="" class="addfoto">`)
                if (data.imagem) {
                    $('#wrapper-foto').html(`<img src="${data.imagem}" alt="">`)
                }
            })
            $.post('http://PainelPolicia/AlterarImagem', JSON.stringify({ user, url }), (data) => {
            })
        })
})

$(document).on('click','#criminal .infos section',function(){
    let data = $(this).parent().data('id')
    var user = $('.passporte-s').val()  
    $.post('http://PainelPolicia/DeleteFixa', JSON.stringify({ data }), (result) => {
        if (result.permissao) {
                $.post('http://PainelPolicia/VerificarIdentificacao', JSON.stringify({ user }), (data) => {const nameList = data.fixa.sort((a, b) => (a.name2 > b.name2) ? -1 : 1);if (data.fixa[0]) {$("#criminal").html(`<div class="top"><h1>Penalidade</h1><h1>Descrição</h1><h1>Oficial</h1><h1>Valor da penalidade</h1><h1>Data</h1></div><div class="infos"></div>${nameList.map((item) => (`<div class="infos" data-id="${item.data}"><h2 class="penalidade">${VerificarIcone(item.penalidade)}</h2><h2 class="descricao">${item.descricao ? item.descricao : 'Descrição Idefinida.'}</h2><h2>${item.oficial}</h2><h2>${item.valordapenalidade}</h2><h2>${item.data}</h2><section><img src="./imagens/svg/delete.svg" alt=""></section></div>`)).join("")}`);$('#criminal').removeClass('semdados')} else {$('#criminal').html(`<img src="./imagens/svg/no-storage.svg" alt="">`)
    $('#criminal').addClass('semdados') } })
            Notify('Deletado com sucesso', 1500, 'check')
        } else {
            Notify('Você não tem permissao para excluir!', 1500, 'error')
        }
    })
});