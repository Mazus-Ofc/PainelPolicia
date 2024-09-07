fx_version 'adamant'
game 'gta5'

ui_page "nui/html.html"

files {
	"nui/*",
    "nui/imagens/*",
    "nui/imagens/svg/*"
}

client_scripts {
	"@vrp/lib/utils.lua",
    "config.lua",
    "client.lua",
    "prepare.lua"
}

server_script {
    "@vrp/lib/utils.lua",
    "config.lua",
    "server.lua",
    "prepare.lua"
}

dependency 'screenshot-basic'