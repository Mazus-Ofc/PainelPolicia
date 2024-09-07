local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")


configtablet = {}
Proxy.addInterface("PainelPolicia", configtablet)

local webhookmultar = "LINK DO WEBHOOK"
local webhookprender = "LINK DO WEBHOOK"

function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
 
 


--## Configurações basicas ##--

configtablet.comando = "mdt" -- Comando que ira abrir o tablet policial.
configtablet.abrirportecla = false -- Abrir tablet por tecla? true | false.
configtablet.tecla = "f9" -- sé "configtablet.abrirportecla" for true, qual tecla vc vai usar? ex: "f9"
configtablet.permissao = "perm.policia" -- Permissão no qual podera abrir o tablet.
configtablet.excluirfixa = "perm.liderpolicia" -- Permissão no qual podera excluir a fixa do cidadão.
configtablet.tabletcreative = false -- Sua base é creative? true | false.
configtablet.creativedatabasemodificada = false -- Sua base é creative com a database modificada "ex: summerz_acconts"? true | false
configtablet.tempomaximo = 120 -- Quantidade maxima de meses, que poderá ser aplicada. (caso queira que seja ilimitada, deixe em 'nil').
configtablet.multamaxima = 1000000 -- Quantidade maxima de multa, que poderá ser aplicada. (caso queira que seja ilimitada, deixe em 'nil').
configtablet.fianca = true -- Sua tablet terá a função de fiança (o cidadão podera pagar fiança para sair da prisão)? true | false.
configtablet.fiancavalor = 1000 -- Valor de fiança por pena/meses, *obrigatorio*, ex: 100 meses = 100 mil para fiança.
configtablet.penapersonaliza = true --[[ Sua tablet terá a função de pena personalizada (o policial podera alterar o meses personalizadamente,
excerto caso tenha o 'configtablet.multamaxima' ativado)? true | false. --]]

--## Configurar todos crimes ##-- 

configtablet.crimes = {
    [1] = {
        nome = "Homocidio", -- Não pode ter o mesmo nome
        titulo = "Homocidio",
        meses = "50",
        descricao = "Diante da inteligência dos artigos 121 e 129 do Código Penal, temos que a tentativa dehomicídio reside na vontade do agente de retirar a vida de outrem, bem como a lesão corporal é constituída pela ofensa à integridade corporal do indivíduo."
    },
    [2] = {
        nome = "Roubo", -- Não pode ter o mesmo nome
        titulo = "Roubo",
        meses = "50",
        descricao = ""
    },
    [3] = {
        nome = "Formaçao de Quadrilha", -- Não pode ter o mesmo nome
        titulo = "Formaçao de Quadrilha",
        meses = "50",
        descricao = ""
    },
    [4] = {
        nome = "Assalto a Loja de Departamento", -- Não pode ter o mesmo nome
        titulo = "Assalto a Loja de Departamento",
        meses = "50",
        descricao = ""
    },
    [5] = {
        nome = "Assalto a caixa eletronico", -- Não pode ter o mesmo nome
        titulo = "Assalto a caixa eletronico",
        meses = "50",
        descricao = ""
    },
    [6] = {
        nome = "Plantar Provas", -- Não pode ter o mesmo nome
        titulo = "Plantar Provas",
        meses = "50",
        descricao = ""
    },
    [7] = {
        nome = "Furto", -- Não pode ter o mesmo nome
        titulo = "Furto",
        meses = "40",
        descricao = ""
    },
    [8] = {
        nome = "Porte de Arma Baixo Calibre", -- Não pode ter o mesmo nome
        titulo = "Porte de Arma Baixo Calibre",
        meses = "40",
        descricao = ""
    },
    [9] = {
        nome = "Corrida Ilegal", -- Não pode ter o mesmo nome
        titulo = "Corrida Ilegal",
        meses = "40",
        descricao = ""
    },
    [10] = {
        nome = "Lesão Corporal", -- Não pode ter o mesmo nome
        titulo = "Lesão Corporal",
        meses = "40",
        descricao = ""
    },
    [11] = {
        nome = "Suborno", -- Não pode ter o mesmo nome
        titulo = "Suborno",
        meses = "40",
        descricao = ""
    },
	[12] = {
        nome = "Estorção", -- Não pode ter o mesmo nome
        titulo = "Estorção",
        meses = "40",
        descricao = ""
    },
	[13] = {
        nome = "Ameaça", -- Não pode ter o mesmo nome
        titulo = "Ameaça",
        meses = "40",
        descricao = ""
    },
	[14] = {
        nome = "Calunia", -- Não pode ter o mesmo nome
        titulo = "Calunia",
        meses = "40",
        descricao = ""
    },
	[15] = {
        nome = "Vandalismo", -- Não pode ter o mesmo nome
        titulo = "Vandalismo",
        meses = "30",
        descricao = ""
    },
	[16] = {
        nome = "Falsidade Ideologica", -- Não pode ter o mesmo nome
        titulo = "Falsidade Ideologica",
        meses = "30",
        descricao = ""
    },
	[17] = {
        nome = "Calunia", -- Não pode ter o mesmo nome
        titulo = "Calunia",
        meses = "40",
        descricao = ""
    },
	[18] = {
        nome = "Difamação", -- Não pode ter o mesmo nome
        titulo = "Difamação",
        meses = "30",
        descricao = ""
    },
	[19] = {
        nome = "Tentativa de Fuga", -- Não pode ter o mesmo nome
        titulo = "Tentativa de Fuga",
        meses = "30",
        descricao = ""
    },
	[20] = {
        nome = "Perjúrio", -- Não pode ter o mesmo nome
        titulo = "Perjúrio",
        meses = "30",
        descricao = ""
    },
	[21] = {
        nome = "Tentativa de roubo ou furto", -- Não pode ter o mesmo nome
        titulo = "Tentativa de roubo ou furto",
        meses = "30",
        descricao = ""
    },
	[22] = {
        nome = "Extorsão", -- Não pode ter o mesmo nome
        titulo = "Extorsão",
        meses = "30",
        descricao = ""
    },
	[23] = {
        nome = "Portar armas de alto calibre", -- Não pode ter o mesmo nome
        titulo = "Portar armas de alto calibre",
        meses = "80",
        descricao = ""
    },
	[24] = {
        nome = "Tráfico de armas", -- Não pode ter o mesmo nome
        titulo = "Tráfico de armas",
        meses = "80",
        descricao = ""
    },
	[25] = {
        nome = "Trafico de munições", -- Não pode ter o mesmo nome
        titulo = "Trafico de munições",
        meses = "80",
        descricao = ""
    },
	[26] = {
        nome = "Desacato ao servidor público", -- Não pode ter o mesmo nome
        titulo = "Desacato ao servidor público",
        meses = "120",
        descricao = ""
    },
	[27] = {
        nome = "Abuso de poder", -- Não pode ter o mesmo nome
        titulo = "Abuso de poder",
        meses = "120",
        descricao = ""
    },
	[28] = {
        nome = "Assalto a Banco/Joalheria", -- Não pode ter o mesmo nome
        titulo = "Assalto a Banco/Joalheria",
        meses = "120",
        descricao = ""
    },
	[29] = {
        nome = "Corrupção passiva", -- Não pode ter o mesmo nome
        titulo = "Corrupção passiva",
        meses = "120",
        descricao = ""
    },
	[30] = {
        nome = "Portar Traje de Mascara", -- Não pode ter o mesmo nome
        titulo = "Portar Traje de Mascara",
        meses = "0",
        descricao = ""
    },
	[31] = {
        nome = "Drogas para uso proprio", -- Não pode ter o mesmo nome
        titulo = "Drogas para uso proprio",
        meses = "0",
        descricao = ""
    },
	[32] = {
        nome = "Dinheiro Sujo abaixo de 50,000", -- Não pode ter o mesmo nome
        titulo = "Dinheiro Sujo abaixo de 50,000",
        meses = "30",
        descricao = ""
    },
	[33] = {
        nome = "Porte de algemas/capuz/Keycard", -- Não pode ter o mesmo nome
        titulo = "Porte de algemas/capuz/Keycard",
        meses = "20",
        descricao = ""
    },
	[34] = {
        nome = "Porte de masterpick/lockpick", -- Não pode ter o mesmo nome
        titulo = "Porte de masterpick/lockpick",
        meses = "20",
        descricao = ""
    },
	[35] = {
        nome = "Portar possuir colete balistico acima de duas (2) unidades", -- Não pode ter o mesmo nome
        titulo = "Portar possuir colete balistico acima de duas (2) unidades",
        meses = "30",
        descricao = ""
    },
	[36] = {
        nome = "Veiculo clonado", -- Não pode ter o mesmo nome
        titulo = "Veiculo clonado",
        meses = "30",
        descricao = ""
    },
	[37] = {
        nome = "itens de fabricação armas/drogas/munições/dinheiro", -- Não pode ter o mesmo nome
        titulo = "itens de fabricação armas/drogas/munições/dinheiro",
        meses = "30",
        descricao = ""
    },
	[38] = {
        nome = "Portar possuir munição ilegal", -- Não pode ter o mesmo nome
        titulo = "Portar possuir munição ilegal",
        meses = "30",
        descricao = ""
    },
	[39] = {
        nome = "Direçao Perigosa", -- Não pode ter o mesmo nome
        titulo = "Direçao Perigosa",
        meses = "20",
        descricao = ""
    },
	[40] = {
        nome = "Latrocinio", -- Não pode ter o mesmo nome
        titulo = "Latrocinio",
        meses = "120",
        descricao = ""
    },
}

--## Configurar todas multas ##--

configtablet.multas = {
    [1] = {
        nome = "MultaHomocidio", -- Não pode ter o mesmo nome
        titulo = "homicidio",
        multa = "50000",
        descricao = ""
    },
    [2] = {
        nome = "MultaRoubo", -- Não pode ter o mesmo nome
        titulo = "Roubo",
        multa = "50000",
        descricao = ""
    },
    [3] = {
        nome = "MultaFormaçao de Quadrilha", -- Não pode ter o mesmo nome
        titulo = "Formaçao de Quadrilha",
        multa = "50000",
        descricao = ""
    },
    [4] = {
        nome = "MultasAssalto a Loja de Departamento", -- Não pode ter o mesmo nome
        titulo = "Assalto a Loja de Departamento",
        multa = "50000",
        descricao = ""
    },
    [5] = {
        nome = "MultasAssalto a caixa eletronico", -- Não pode ter o mesmo nome
        titulo = "Assalto a caixa eletronico",
        multa = "50000",
        descricao = ""
    },
    [6] = {
        nome = "MultasPlantar Provas", -- Não pode ter o mesmo nome
        titulo = "Plantar Provas",
        multa = "50000",
        descricao = ""
    },
    [7] = {
        nome = "MultasFurto", -- Não pode ter o mesmo nome
        titulo = "Furto",
        multa = "40000",
        descricao = ""
    },
    [8] = {
        nome = "MultasPorte de Arma Baixo Calibre", -- Não pode ter o mesmo nome
        titulo = "Porte de Arma Baixo Calibre",
        multa = "40000",
        descricao = ""
    },
    [9] = {
        nome = "MultasCorrida Ilegal", -- Não pode ter o mesmo nome
        titulo = "Corrida Ilegal",
        multa = "40000",
        descricao = ""
    },
    [10] = {
        nome = "MultasLesão Corporal", -- Não pode ter o mesmo nome
        titulo = "Lesão Corporal",
        multa = "40000",
        descricao = ""
    },
    [11] = {
        nome = "MultasSuborno", -- Não pode ter o mesmo nome
        titulo = "Suborno",
        multa = "40000",
        descricao = ""
    },
	[12] = {
        nome = "MultasEstorção", -- Não pode ter o mesmo nome
        titulo = "Estorção",
        multa = "40000",
        descricao = ""
    },
	[13] = {
        nome = "MultasAmeaça", -- Não pode ter o mesmo nome
        titulo = "Ameaça",
        multa = "40000",
        descricao = ""
    },
	[14] = {
        nome = "MultasCalunia", -- Não pode ter o mesmo nome
        titulo = "Calunia",
        multa = "40000",
        descricao = ""
    },
	[15] = {
        nome = "MultasVandalismo", -- Não pode ter o mesmo nome
        titulo = "Vandalismo",
        multa = "30000",
        descricao = ""
    },
	[16] = {
        nome = "MultasFalsidade Ideologica", -- Não pode ter o mesmo nome
        titulo = "Falsidade Ideologica",
        multa = "30000",
        descricao = ""
    },
	[17] = {
        nome = "MultasCalunia", -- Não pode ter o mesmo nome
        titulo = "Calunia",
        multa = "40000",
        descricao = ""
    },
	[18] = {
        nome = "MultasDifamação", -- Não pode ter o mesmo nome
        titulo = "Difamação",
        multa = "30000",
        descricao = ""
    },
	[19] = {
        nome = "MultasTentativa de Fuga", -- Não pode ter o mesmo nome
        titulo = "Tentativa de Fuga",
        multa = "30000",
        descricao = ""
    },
	[20] = {
        nome = "MultasPerjúrio", -- Não pode ter o mesmo nome
        titulo = "Perjúrio",
        multa = "30000",
        descricao = ""
    },
	[21] = {
        nome = "MultasTentativa de roubo ou furto", -- Não pode ter o mesmo nome
        titulo = "Tentativa de roubo ou furto",
        multa = "30000",
        descricao = ""
    },
	[22] = {
        nome = "MultasExtorsão", -- Não pode ter o mesmo nome
        titulo = "Extorsão",
        multa = "30000",
        descricao = ""
    },
	[23] = {
        nome = "MultasPortar armas de alto calibre", -- Não pode ter o mesmo nome
        titulo = "Portar armas de alto calibre",
        multa = "80000",
        descricao = ""
    },
	[24] = {
        nome = "MultasTráfico de armas", -- Não pode ter o mesmo nome
        titulo = "Tráfico de armas",
        multa = "80000",
        descricao = ""
    },
	[25] = {
        nome = "MultasTrafico de munições", -- Não pode ter o mesmo nome
        titulo = "Trafico de munições",
        multa = "80000",
        descricao = ""
    },
	[26] = {
        nome = "MultasDesacato ao servidor público", -- Não pode ter o mesmo nome
        titulo = "Desacato ao servidor público",
        multa = "120000",
        descricao = ""
    },
	[27] = {
        nome = "MultasAbuso de poder", -- Não pode ter o mesmo nome
        titulo = "Abuso de poder",
        multa = "120000",
        descricao = ""
    },
	[28] = {
        nome = "MultasAssalto a Banco/Joalheria", -- Não pode ter o mesmo nome
        titulo = "Assalto a Banco/Joalheria",
        multa = "120000",
        descricao = ""
    },
	[29] = {
        nome = "MultasCorrupção passiva", -- Não pode ter o mesmo nome
        titulo = "Corrupção passiva",
        multa = "120000",
        descricao = ""
    },
	[30] = {
        nome = "MultasPortar Traje de Mascara", -- Não pode ter o mesmo nome
        titulo = "Portar Traje de Mascara",
        multa = "10000",
        descricao = ""
    },
	[31] = {
        nome = "MultasDrogas para uso proprio", -- Não pode ter o mesmo nome
        titulo = "Drogas para uso proprio",
        multa = "10000",
        descricao = ""
    },
	[32] = {
        nome = "MultasDinheiro Sujo abaixo de 50,000", -- Não pode ter o mesmo nome
        titulo = "Dinheiro Sujo abaixo de 50,000",
        multa = "30000",
        descricao = ""
    },
	[33] = {
        nome = "MultasPorte de algemas/capuz/Keycard", -- Não pode ter o mesmo nome
        titulo = "Porte de algemas/capuz/Keycard",
        multa = "20000",
        descricao = ""
    },
	[34] = {
        nome = "MultasPorte de masterpick/lockpick", -- Não pode ter o mesmo nome
        titulo = "Porte de masterpick/lockpick",
        multa = "20000",
        descricao = ""
    },
	[35] = {
        nome = "MultasPortar possuir colete balistico acima de duas (2) unidades", -- Não pode ter o mesmo nome
        titulo = "Portar possuir colete balistico acima de duas (2) unidades",
        multa = "30000",
        descricao = ""
    },
	[36] = {
        nome = "MultasVeiculo clonado", -- Não pode ter o mesmo nome
        titulo = "Veiculo clonado",
        multa = "30000",
        descricao = ""
    },
	[37] = {
        nome = "Multasitens de fabricação armas/drogas/munições/dinheiro", -- Não pode ter o mesmo nome
        titulo = "itens de fabricação armas/drogas/munições/dinheiro",
        multa = "30000",
        descricao = ""
    },
	[38] = {
        nome = "MultasPortar possuir munição ilegal", -- Não pode ter o mesmo nome
        titulo = "Portar possuir munição ilegal",
        multa = "30000",
        descricao = ""
    },
	[39] = {
        nome = "MultasDireçao Perigosa", -- Não pode ter o mesmo nome
        titulo = "Direçao Perigosa",
        multa = "20000",
        descricao = ""
    },
	[40] = {
        nome = "MultasLatrocinio", -- Não pode ter o mesmo nome
        titulo = "Latrocinio",
        multa = "120000",
        descricao = ""
    },
}

--## Configurações creative ##--

configtablet.prison = "prison" --alterar para a pastar do prison ela pode estar: "vrp_prison" ou "prison"

configtablet.player = "player" --alterar para a pastar do player ela pode estar: "vrp_player" ou "player"

--## Configurações avançadas ##--

-- #Setar Multar vrpex

function configtablet.SetarMulta(user,valor,desc)
    local source = source
    local user_id = vRP.getUserId(source)
   
    if user then
        local value = vRP.getUData(parseInt(user),"vRP:multas")
        local multas = json.decode(value) or 0
        local oficialid = vRP.getUserIdentity(user_id)
        local identity = vRP.getUserIdentity(parseInt(user))
        local nplayer = vRP.getUserSource(parseInt(user))
       
        vRP.setUData(parseInt(user),"vRP:multas",json.encode(parseInt(multas)+parseInt(valor)))
        vRP.updateMultas(parseInt(user),parseInt(multas)+parseInt(valor))
       
        TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.",8000)
        TriggerClientEvent("Notify",nplayer,"importante","Você recebeu <b>R$"..vRP.format(parseInt(valor)).."</b> de multa.",8000)

        SendWebhookMessage(webhookmultar,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.sobrenome.." \n[==============MULTOU==============] \n[PASSAPORTE]: "..(user).." "..identity.name.." "..identity.sobrenome.." \n[VALOR]: "..vRP.format(parseInt(valor)).." \n[DESCRIÇAO]: "..desc.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")

		--SendWebhookMessage(webhookmultar, "value "..value.."")
		--SendWebhookMessage(webhookmultar, "multas "..multas.."")
		--SendWebhookMessage(webhookmultar, "oficialid "..oficialid.."")
		--SendWebhookMessage(webhookmultar, "identity "..identity.."")
		--SendWebhookMessage(webhookmultar, "nplayer "..nplayer.."")

        vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
      
        local identidade = vRP.getUserIdentity(parseInt(user_id)) or 0
        vRP.execute('mdtPolicia/insert_fixa', {user_id = user, penalidade = "Multa", descricao = desc, oficial = ""..identidade.name.." "..identidade.firstname.." #"..user_id.."", valordapenalidade = "R$"..value.." Multa", data = os.date("%d/%m/%Y,<br> %X %p") })
    end
end


-- #Setar Multar creative

function configtablet.SetarMultaCreative(user,value,desc)
	local source = source
	local user_id = vRP.getUserId(source)
	local oficialid = vRP.getUserIdentity(user_id)
	local identity = vRP.getUserIdentity(parseInt(user))
	if user then
		vRP.setUData(parseInt(user),"vRP:multas",json.encode(parseInt(multas)+parseInt(value)))
		local valor = vRP.getUData(parseInt(user),"vRP:multas")
		local multas = json.decode(valor) or 0

		vRP.setFines(parseInt(user),parseInt(value),parseInt( vRP.getUserId(source)),tostring(info))
		TriggerClientEvent("Notify",source,"verde","Multa aplicada com sucesso.",8000)
		TriggerClientEvent("Notify",user,"verde","Você foi multado em R$"..value..",00",8000)
		
		local identidade = vRP.getUserIdentity(parseInt(user_id)) or 0
        vRP.execute('mdtPolicia/insert_fixa', {user_id = user, penalidade = "Multa", descricao = desc, oficial = ""..identidade.name.." "..identidade.name2.." #"..user_id.."", valordapenalidade = "R$"..value.." Multa", data = os.date("%d/%m/%Y,<br> %X %p") })
	end
end

function configtablet.SetarMultaCreativeOficial(nuser_id,fines,text)
	local source = source
	local user_id = vRP.getUserId(source)

	TriggerClientEvent("Notify",source,"verde","Multa aplicada.",5000)
	vRP.addFines(nuser_id,fines)

	local identidade = vRP.userIdentity(parseInt(user_id)) or 0
    vRP.execute('mdtPolicia/insert_fixa', {user_id = nuser_id, penalidade = "Multa", descricao = text, oficial = ""..identidade.name.." "..identidade.name2.." #"..user_id.."", valordapenalidade = "R$"..fines.." Multa", data = os.date("%d/%m/%Y,<br> %X %p") })
end

-- #Prisão creative

function configtablet.SetarPrisaoCreative(user,value,desc)
	local source = source
	local user_id = vRP.getUserId(source)
	if user then
		local player = vRP.getUserSource(parseInt(user))
		if player then
			local nuser_id = user
			--[[ local nplayer = vRP.getUserSource(parseInt(nuser_id)) ]]

			local nplayer
			if configtablet.creativedatabasemodificada then
				nplayer = vRP.userSource(parseInt(nuser_id))
			else
				nplayer = vRP.getUserSource(parseInt(nuser_id))
			end
			local locate = 2
			if nplayer then
				vCLIENT.startPrison(nplayer,1)

				if parseInt(locate) == 2 then
					TriggerClientEvent('removealgemas',nplayer)
					TriggerClientEvent("vrp_sound:source",nplayer,"uncuff",0.5)
					vRPclient.teleport(nplayer,1677.72,2509.68,45.57)
				end
			end

			vRP.updateThirst(nuser_id,100)
			vRP.updateHunger(nuser_id,100)
			TriggerClientEvent("resetBleeding",nuser_id)
			TriggerClientEvent("resetDiagnostic",nuser_id)
			local nplayer
			if configtablet.creativedatabasemodificada then
				nplayer = vRP.userSource(parseInt(user))
			else
				nplayer = vRP.getUserSource(parseInt(user))
			end
			vRP.execute("vRP/set_prison",{ user_id = parseInt(nuser_id), prison = parseInt(value), locate = 1 })
			TriggerClientEvent("Notify",source,"locked","Prisão aplicada com "..value.." serviço(s).",8000)
			TriggerClientEvent("Notify",nplayer,"locked","Você foi condenado a "..value.." serviço(s).",8000)

			local identidade = vRP.getUserIdentity(parseInt(user_id)) or 0
            vRP.execute('mdtPolicia/insert_fixa', {user_id = user, penalidade = "Prisão", descricao = desc, oficial = ""..identidade.name.." "..identidade.name2.." #"..user_id.."", valordapenalidade = ""..value.." Meses", data = os.date("%d/%m/%Y,<br> %X %p") })
		end
	end
end


function configtablet.SetarPrisaoCreativeOficial(nuser_id,services,text)
	local source = source
	local user_id = vRP.getUserId(source)

	local identity = vRP.userIdentity(user_id)
	local otherPlayer = vRP.userSource(nuser_id)
	if otherPlayer then
		vCLIENT.syncPrison(otherPlayer,true,false)
		TriggerClientEvent("radio:outServers",otherPlayer)
	end

	vRP.execute("characters/setPrison",{ user_id = parseInt(nuser_id), prison = parseInt(services) })
	TriggerClientEvent("Notify",source,"verde","Prisão efetuada.",5000)
	TriggerClientEvent("Notify",source,"verde","Você foi condenado a "..services.." serviços",5000)
	local identidade = vRP.userIdentity(parseInt(user_id)) or 0
	vRP.execute('mdtPolicia/insert_fixa', {user_id = nuser_id, penalidade = "Prisão", descricao = text, oficial = ""..identidade.name.." "..identidade.name2.." #"..user_id.."", valordapenalidade = ""..services.." Meses", data = os.date("%d/%m/%Y,<br> %X %p") })
end

-- #Prisão vrpex

function configtablet.SetarPrisao(user,value,desc)
	local source = source
	local user_id = vRP.getUserId(source)
    local oficialid = vRP.getUserIdentity(user_id)
	if user then
		local player
		if configtablet.creativedatabasemodificada then
			player = vRP.userSource(parseInt(user))
		else
			player = vRP.getUserSource(parseInt(user))
		end
		if player then
			TriggerClientEvent("Notify",player,"importante","Você foi preso por <b>"..value.." meses</b>.")
			vRP.setUData(user, "vRP:prisao", json.encode(parseInt(value)))
			vRPclient.setHandcuffed(player,false)
			TriggerClientEvent('prisioneiro',player,true)
			vRPclient.teleport(player,1680.1,2513.0,45.5)
			
            prison_lock(parseInt(user))
			
            TriggerClientEvent('removealgemas',player)
			TriggerClientEvent("vrp_sound:source",player,'jaildoor',0.7)
			TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)
			TriggerClientEvent("Notify",source,"sucesso","Prisão do passaporte <b>"..user.."</b> por <b>"..value.." meses</b> efetuada com sucesso.")

            vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
			vRPclient.playSound(player,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
			
            local identidade = vRP.getUserIdentity(parseInt(user_id)) or 0
            vRP.execute('mdtPolicia/insert_fixa', {user_id = user, penalidade = "Prisão", descricao = desc, oficial = ""..identidade.name.." "..identidade.firstname.." #"..user_id.."", valordapenalidade = ""..value.." Meses", data = os.date("%d/%m/%Y,<br> %X %p") })

            local identidadeP = vRP.getUserIdentity(parseInt(user)) or 0
            SendWebhookMessage(webhookprender,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.sobrenome.." \n[==============PRENDEU==============] \n[PASSAPORTE]: "..(user).." "..identidadeP.name.." "..identidadeP.sobrenome.." \n[TEMPO]: "..vRP.format(parseInt(value)).." Meses \n[CRIMES]: "..desc.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
		end
	end
end

function prison_lock(target_id)
	local player
		if configtablet.creativedatabasemodificada then
			player = vRP.userSource(tonumber(target_id))
		else
			player = vRP.getUserSource(tonumber(target_id))
		end
	if player then
		SetTimeout(60000,function()
			local value = vRP.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				TriggerClientEvent("Notify",player,"importante","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.")
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
				TriggerClientEvent('prisioneiro',player,false)
				vRPclient.teleport(player,1850.5,2604.0,45.5)
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				TriggerClientEvent("Notify",player,"importante","Sua sentença terminou, esperamos não ve-lo novamente.")
			end
			vRPclient.PrisionGod(player)
		end)
	end
end