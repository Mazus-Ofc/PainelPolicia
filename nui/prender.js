let Mesesmasporcetagem = 0
let meses = 0

$('#inputmeses').val('0 meses')

$.post('http://PainelPolicia/GerarCrimes', JSON.stringify({}), (data) => {
    const nameList = data.crimes.sort((a, b) => (a.name2 > b.name2) ? -1 : 1);
    $(".scroll-crimes").html(`
    <div class="search-crime">
            <input type="text" placeholder="Pesquisa pelo crime..." class="">
            <div class="meses">
            <h1>Pena acumulada <img src="./imagens/svg/icon-meses.svg" alt=""> <span>0 Meses</span></h1>
        </div>
    </div>
    <div class="space"></div>
${nameList.map((item) => (`
    <div class="crime">
        <input type="checkbox" id="${item.nome}" value="${item.meses}" class="mesescheckbox">
            <label for="${item.nome}"></label>
            <div class="titulo">
            <h1>${item.titulo ? item.titulo : 'Titulo Idefinido.'} <img src="./imagens/svg/icon-meses.svg" alt=""><span>${item.meses} Meses</span></h1>
            <h2>${item.descricao ? item.descricao : 'Descrição Idefinida.'}</h2>
        </div>
    </div>
`)).join("")}
`);

    function SomarCheckbox() {
        var result = $(".mesescheckbox:checked");
        var total = 0;

        for (var i = 0; i < result.length; i++) {
            total = total + parseFloat(result[i].value);
        }
        $(".result").val(total.toFixed(0));
        meses = total
        $.post('http://PainelPolicia/GerarConfig', JSON.stringify({}), (data) => {
            if (meses >= data.tempomaximo) {
                $('.meses span').html(`${data.tempomaximo} Meses`)
                Notify(`Você antigou o limite de ${data.tempomaximo} meses.`, 1500, 'error')
                meses = data.tempomaximo
            } else {
                $('.meses span').html(`${meses} Meses`)
            }
        })
    }

    $(".mesescheckbox").click(SomarCheckbox);

    $(document).on("click", ".mesescheckbox", () => {
        if (meses != 0) {
            $('.buttonprender').removeAttr('disabled')
        } else {
            $('.buttonprender').attr('disabled', 'disabled')
        }
    })

    var elem = document.querySelector('.rangeprender');

    var rangeValue = function () {
        var newValue = elem.value;
        var target = document.querySelector('.container h2');
        $(target).html(`${newValue}%`)
        $.post('http://PainelPolicia/GerarConfig', JSON.stringify({}), (data) => {
            if (parseInt(meses) + parseInt(newValue) >= data.tempomaximo + 1) {

            } else {
                $('.meses span').html(`${parseInt(meses) + parseInt(newValue)} Meses`)
                Mesesmasporcetagem = newValue
            }
        })
    }

    elem.addEventListener("input", rangeValue);

    let searchInput = document.querySelector('.search-crime input');
    searchInput.addEventListener('keyup', search);

    let titles = document.querySelectorAll('.crime');
    let searchTerm = '';
    let tit = '';
    function search(e) {
        searchTerm = e.target.value.toLowerCase();

        titles.forEach((title) => {
            tit = title.textContent.toLowerCase();
            tit.includes(searchTerm) ? $(title).show() : $(title).hide()
        });
    }



            $(document).on("click", ".buttonprender", () => {

                if ($('.prender-s').val() == "") {
                    Notify('Você não adicionou um passaporte!', 1500, 'error')
                } else {
                    let user = $('.prender-s').val()
                    let servicos = parseInt(Mesesmasporcetagem) + parseInt(meses)
                    let desc = $('textarea').val()
                    $.post('http://PainelPolicia/Prender', JSON.stringify({ user, servicos, desc }), (data) => {
                        if (data.prender === "invalido") {
                            Notify('Esse passaporte é invalido!', 1500, 'error')
                        } else if (data.prender == "off") {
                            Notify('Esse passaporte está de viagem!', 1500, 'error')
                        } else {
                            $('.crimes .buttonprender').attr('disabled', 'disabled')
                            Notify('Esse passaporte foi aprendido.', 1500, 'check')
                            $(".mesescheckbox").prop('checked', false);
                            $('.meses span').html(`${0} Meses`)
                            $('.prender-s').val('')
                            $('.rangeprender').val(0)
                            $('.container h2').html('0%')
                            $('.textarea').val('')
                            meses = 0
                            Mesesmasporcetagem = 0
                        }
                    })
                }
            })
})

$(document).on("click", ".opcoes", () => {
    if ($("#wrapper-prender").is(":visible")) {
        $('#wrapper-prender').hide()
        $('.opcoes').removeClass('open')
        $('.opcoes').html(`Opções de prisão <img src="./imagens/svg/arrow-opcoes.svg" alt="">`)
    } else {
        $('#wrapper-prender').fadeIn(200)
        $('.opcoes').addClass('open')
        $('.opcoes').html(`Fechar <img src="./imagens/svg/close-opcoes.svg" alt="">`)
    }
})