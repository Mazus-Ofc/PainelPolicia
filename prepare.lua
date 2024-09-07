local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

libflx = {}
Proxy.addInterface("PainelPolicia", libflx)

vRP.prepare('mdtPolicia/createimg', [[CREATE TABLE IF NOT EXISTS mdtPolicia_tablet_img(
	`user_id` int(11) NOT NULL,
	`img` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`user_id`)
)]])

vRP.prepare('mdtPolicia/createfixa', [[CREATE TABLE IF NOT EXISTS mdtPolicia_tablet_fixa(
	`user_id` int(11) NOT NULL,
	`penalidade` varchar(255) DEFAULT NULL,
	`descricao` varchar(255) DEFAULT NULL,
	`oficial` varchar(255) DEFAULT NULL,
	`valordapenalidade` varchar(255) DEFAULT NULL,
	`data` varchar(255) DEFAULT NULL
)]])

vRP.prepare("mdtPolicia/getall","REPLACE INTO mdtPolicia_tablet_img(user_id,img)VALUES(@user_id,@img)")
vRP.prepare("mdtPolicia/select","SELECT img FROM mdtPolicia_tablet_img WHERE user_id = @user_id")
vRP.prepare("mdtPolicia/get_img","SELECT * FROM mdtPolicia_tablet_img WHERE user_id = @user_id")
vRP.prepare("mdtPolicia/get_fixa","SELECT * FROM mdtPolicia_tablet_fixa WHERE user_id = @user_id")
vRP.prepare("mdtPolicia/update_img","UPDATE mdtPolicia_tablet_img SET img = @img WHERE user_id = @user_id")
vRP.prepare("mdtPolicia/insert_fixa","INSERT INTO mdtPolicia_tablet_fixa(user_id,penalidade,descricao,oficial,valordapenalidade,data) VALUES(@user_id,@penalidade,@descricao,@oficial,@valordapenalidade,@data)")
vRP.prepare("mdtPolicia/img_get","SELECT user_id FROM mdtPolicia_tablet_img WHERE user_id = @user_id")
vRP.prepare("mdtPolicia/delete_fixa","DELETE FROM mdtPolicia_tablet_fixa WHERE data = @data")
CreateThread(function ()
	vRP.execute('mdtPolicia/createimg')
	vRP.execute('mdtPolicia/createfixa')
end)

if configtablet.tabletcreative then
	if configtablet.creativedatabasemodificada then
		vRP.prepare("mdtPolicia/search_get",'SELECT id FROM summerz_characters WHERE id = @user_id')
	else
		vRP.prepare("mdtPolicia/search_get",'SELECT id FROM vrp_users WHERE id = @user_id')
	end
else
	vRP.prepare("mdtPolicia/search_get","SELECT user_id FROM vrp_user_identities WHERE user_id = @user_id")
end