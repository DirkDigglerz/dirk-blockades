fx_version 'cerulean'
games { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
lua54 'yes'
author 'DirkScripts'
description 'Blockades script (CUSTOM).'
version '1.0.0'

client_script {
  'config.lua',
  'src/client/init.lua',
}


server_script {
  'config.lua',
  'src/server/init.lua',
}

dependencies{
  'dirk-core', 
}