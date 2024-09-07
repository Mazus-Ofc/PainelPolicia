local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
flx = {}
Tunnel.bindInterface("PainelPolicia",flx)



vCLIENT = Tunnel.getInterface('police')
vPLAYER = Tunnel.getInterface('player')

function flx.GetAll(user_id)
	local rows = vRP.query("mdtPolicia/select",{ user_id = user_id })
	if #rows > 0 then
		return rows[1]
	else
		return ""
	end
end

function flx.Setall(user_id,img)
	vRP.execute("mdtPolicia/getall",{ user_id = user_id, img = img })
end

function flx.getUData(user_id)
	local rows = vRP.query("mdtPolicia/get_img",{ user_id = user_id })
	if #rows > 0 then
		return rows[1].img
	else
		return ""
	end
end

function flx.GetData(user_id)
	local rows = vRP.query("mdtPolicia/search_get",{ user_id = user_id })
	if #rows > 0 then
		return rows[1].img
	else
		return ""
	end
end

function flx.VerificarIdentificacao(user)
	local search_get = flx.GetData(user)
	if search_get == "" then
		return false
	else
		local identidade
		if configtablet.creativedatabasemodificada then
			identidade = vRP.userIdentity(parseInt(user)) or 0
		else
			identidade = vRP.getUserIdentity(parseInt(user)) or 0
		end
		local img = flx.getUData(parseInt(user))
		local fixa = vRP.query("mdtPolicia/get_fixa",{ user_id = user })
		if configtablet.tabletcreative then
			if configtablet.creativedatabasemodificada then
				return identidade.name,identidade.name2,identidade.phone,identidade.serial,""..math.random(18,30).."",img,fixa
			else
				return identidade.name,identidade.name2,identidade.phone,identidade.registration,""..math.random(18,30).."",img,fixa
			end
		else
			return identidade.name,identidade.firstname,identidade.phone,identidade.registration,parseInt(identidade.age),img,fixa
		end
	end
end

function flx.Prender(user,servicos,desc)
	local source
	if configtablet.creativedatabasemodificada then
		source = vRP.userSource(tonumber(user))
	else
		source = vRP.getUserSource(tonumber(user))
	end
	local id = vRP.getUserId(source)
	if id == nil then
		return 'off'
	elseif user then
		local users
		if configtablet.creativedatabasemodificada then
			users = vRP.userList()
		else
			users = vRP.getUsers()
		end
		for k,v in pairs(users) do
			if k == parseInt(user) then
				if configtablet.tabletcreative then
					if configtablet.creativedatabasemodificada then
						configtablet.SetarPrisaoCreativeOficial(parseInt(user),parseInt(servicos),desc)
					else
						configtablet.SetarPrisaoCreative(parseInt(user),parseInt(servicos),desc)
					end
				else
					configtablet.SetarPrisao(parseInt(user),parseInt(servicos),desc)
				end
			end
		end
	end
end

function flx.Multar(user,valor,desc)
	local source
	if configtablet.creativedatabasemodificada then
		source = vRP.userSource(tonumber(user))
	else
		source = vRP.getUserSource(tonumber(user))
	end
	local id = vRP.getUserId(source)
	if id == nil then
		return 'off'
	elseif user then
		local users
		if configtablet.creativedatabasemodificada then
			users = vRP.userList()
		else
			users = vRP.getUsers()
		end
		for k,v in pairs(users) do			
			if k == parseInt(user) then
				if configtablet.tabletcreative then
					if configtablet.creativedatabasemodificada then
						configtablet.SetarMultaCreativeOficial(parseInt(user),parseInt(valor),desc)
					else
						configtablet.SetarMultaCreative(parseInt(user),parseInt(valor),desc)
					end
				else
					configtablet.SetarMulta(parseInt(user),parseInt(valor),desc)
				end
			end
		end
	end
end

function flx.Data(user_id)
	local rows = vRP.query("mdtPolicia/img_get",{ user_id = user_id })
	if #rows > 0 then
		return rows[1].img
	else
		return ""
	end
end

function flx.AlterarImagem(user,url)
	if flx.Data(user) == "" then
		flx.Setall(user,url[1])
	else
		vRP.execute('mdtPolicia/update_img', { user_id = user, img = url[1]})
	end
end

function flx.DeleteFixa(data)
	local source = source
	local police = vRP.getUserId(source)
	if vRP.hasPermission(police,configtablet.excluirfixa) then
		vRP.execute('mdtPolicia/delete_fixa', { data = data })
		return true
	else
		return false
	end
end

function flx.Horario()
	return os.date("%d/%m/%Y as %X %p")
end

function flx.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,configtablet.permissao)
end


function flx.GerarCrimes()
	return configtablet.crimes
end

function flx.GerarMultas()
	return configtablet.multas
end

function flx.GerarConfig()
	return configtablet.tempomaximo
end

function flx.GerarConfigMulta()
	return configtablet.multamaxima
end