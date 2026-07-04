fx_version 'cerulean'
game 'gta5'

author 'doge'
description 'Email on job promotion/demotion/termination/hire.'
version '1.0.0'


server_script 'server.lua'



shared_script '@qb-core/shared/main.lua'
shared_script '@ox_lib/init.lua'

dependencies {
	'lb-phone',
  'qb-core',
  'qb-management'
  }

lua54 'yes'