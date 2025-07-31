fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"
lua54 'yes'




client_script {
    'warmenu.lua',
    'client.lua'
}

server_scripts {
    'server.lua'
}

shared_scripts {
    'config.lua'
}

ui_page "html/index.html"

files {
	'html/index.html',
	'html/index.js',
	'html/style.css',
    'html/hay.png',
    'html/poop.png',
    'html/feed.png',
    'html/hayspread.png',
    'html/water.png',
    'html/milk.png',
    'html/eggs.png',
    
}
escrow_ignore {
	'warmenu.lua',
    'client.lua',
    'config.lua',
    'fxmanifestredem.lua',

}

client_exports { 'closeRanchInv' }

dependency '/assetpacks'
dependency '/assetpacks-redm'