
fx_version "cerulean"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
games {"rdr3"}
lua54 "yes"
version '2.0.14'

escrow_ignore {
    'fw_func.lua',
	'config.lua',
    'config_base_hunt.lua',
    'events.lua',
    'webhook.lua',
}

ui_page 'html/index.html'

files {
    'html/js.js',
    'html/index.html',
    'html/style.css',
    'not.js',
    'html/files/*.png',
    'html/files/*.mp3',
}

shared_scripts {
    'config.lua',
    'config_base_hunt.lua',
}

client_scripts {
    'client.lua',
    'events.lua',
    'not.js'
}


server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'fw_func.lua',
    'server.lua',
    'webhook.lua',
}
dependency '/assetpacks'