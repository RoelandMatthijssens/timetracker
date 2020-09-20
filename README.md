# README

## deploy
* Swap all instances of `createrailsapp` with you app name
* create new masterkey
* run `cap staging deploy` (to create project folders etc, it will fail, but thats ok)
* create log folder on server `~/projects/applicationnane/shared/log/`
* create tmp folder on server `~/projects/applicationnane/shared/tmp/pids`
* create tmp folder on server `~/projects/applicationnane/shared/tmp/sockets/`
* copy masterkey to remote server (`~/projects/applicationname/shared/config/.`
* run `cap staging setup` (to setup postgresql on server)
* run `cap staging puma:config` (to setup puma)
* run `cap staging puma:nginx_config` (to setup nginx)
* restart nginx on server
* run `cap staging deploy`
* run `cap staging puma:start` (puma doesnt autostart for some reason)
* configure dns
