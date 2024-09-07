let Multamasporcetagem = 0
let multa = 0

$.post('http://PainelPolicia/GerarMultas', JSON.stringify({}), (data) => {
    const nameList = data.multas.sort((a, b) => (a.name2 > b.name2) ? -1 : 1);
    $(".scroll-multas").html(`
    <div class="search-multa">
            <input type="text" placeholder="Pesquisa pela multa..." class="">
            <div class="multa">
            <h1>Multa acumulada <img src="./imagens/svg/icon-multa.svg" alt=""> <span>R$0 Multa</span></h1>
        </div>
    </div>
    <div class="space"></div>
${nameList.map((item) => (`
    <div class="multinha">
        <input type="checkbox" id="${item.nome}" value="${item.multa}" class="multacheckbox">
            <label for="${item.nome}"></label>
            <div class="titulo">
            <h1>${item.titulo ? item.titulo : 'Titulo Idefinido.'} <img src="./imagens/svg/icon-multa.svg" alt=""><span>R$${item.multa} Multa</span></h1>
            <h2>${item.descricao ? item.descricao : 'Descrição Idefinida.'}</h2>
        </div>
    </div>
`)).join("")}
`);

    function SomarCheckbox() {
        var result = $(".multacheckbox:checked");
        var total = 0;

        for (var i = 0; i < result.length; i++) {
            total = total + parseFloat(result[i].value);
        }
        $(".result").val(total.toFixed(0));
        multa = total
        $.post('http://PainelPolicia/GerarConfigMulta', JSON.stringify({}), (data) => {
            if (multa >= data.multamaxima) {
                $('.multa span').html(`R$${data.multamaxima} Multa`)
                Notify(`Você antigou o limite de R$${data.multamaxima} Multa.`, 1500, 'error')
                multa = data.multamaxima
            } else {
                $('.multa span').html(`R$${multa} Multa`)
            }
        })
    }

    $(".multacheckbox").click(SomarCheckbox);

    $(document).on("click", ".multacheckbox", () => {
        if (multa != 0) {
            $('.buttonmultar').removeAttr('disabled')
        } else {
            $('.buttonmultar').attr('disabled', 'disabled')
        }
    })

    var elem = document.querySelector('.rangemultar');

    var rangeValue = function () {
        var newValue = elem.value;
        var target = document.querySelector('#wrapper-multar h2');
        $(target).html(`${newValue}%`)
        $.post('http://PainelPolicia/GerarConfigMulta', JSON.stringify({}), (data) => {
            if (parseInt(multa) + parseInt(newValue) >= data.multamaxima + 1) {

            } else {
                $('.multa-wrapper span').html(`R$${parseInt(multa) + parseInt(newValue)}`)
                $('.multa span').html(`R$${parseInt(multa) + parseInt(newValue)}`)
                Multamasporcetagem = newValue
            }
        })
    }

    elem.addEventListener("input", rangeValue);

    let searchInput = document.querySelector('.search-multa input');
    searchInput.addEventListener('keyup', search);

    let titles = document.querySelectorAll('.multinha');
    let searchTerm = '';
    let tit = '';
    function search(e) {
        searchTerm = e.target.value.toLowerCase();

        titles.forEach((title) => {
            tit = title.textContent.toLowerCase();
            tit.includes(searchTerm) ? $(title).show() : $(title).hide()
        });
    }



    $(document).on("click", ".buttonmultar", () => {

        if ($('.multar-s').val() == "") {
            Notify('Você não adicionou um passaporte!', 1500, 'error')
        } else {
            let user = $('.multar-s').val()
            let valor = parseInt(Multamasporcetagem) + parseInt(multa)
            let desc = $('.textareaamultar').val()
            $.post('http://PainelPolicia/Multar', JSON.stringify({ user, valor, desc }), (data) => {
                if (data.multar === "invalido") {
                    Notify('Esse passaporte é invalido!', 1500, 'error')
                } else if (data.multar == "off") {
                    Notify('Esse passaporte está de viagem!', 1500, 'error')
                } else {
                    Notify('Esse passaporte foi multado.', 1500, 'check')
                    $(".multacheckbox").prop('checked', false);
                    $('.multa span').html(`R$${0} Multa`)
                    $('.crimes .buttonmultar').attr('disabled', 'disabled')
                    $('.multar-s').val('')
                    $('.rangemultar').val(0)
                    $('#wrapper-multar h2').html('0%')
                    $('.textareaamultar').val('')
                    multa = 0
                    Multamasporcetagem = 0
                }
            })
        }
    })
})

$(document).on("click", ".opcoesdemulta", () => {
    if ($("#wrapper-multar").is(":visible")) {
        $('#wrapper-multar').hide()
        $('.opcoesdemulta').removeClass('open')
        $('.opcoesdemulta').html(`Opções de prisão <img src="./imagens/svg/arrow-opcoes.svg" alt="">`)
    } else {
        $('#wrapper-multar').fadeIn(200)
        $('.opcoesdemulta').addClass('open')
        $('.opcoesdemulta').html(`Fechar <img src="./imagens/svg/close-opcoes.svg" alt="">`)
    }
})