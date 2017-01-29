# Fivem_TruckerJob
Ported version from https://www.gta5-mods.com/scripts/trucking-job-lua to FiveReborn https://forum.fivem.net/t/release-truckerjob/4736/21

######### THIS IS NOT A FINAL RELEASE #########

If you want to try it out: 
Don't forget to put "-TruckerJob" into your citmp-server.yml unter "AutoStartResources:"

Have fun.
## v0.3 ##
- bugfixes
- corrections
- navigation approvement
- truck disappears after finishing the job
- blips fixed
- visual money (not implemented yet)

## v0.22 ##
- guarantee that trailer and truck is loaded, before spawn
- small bugfixes

## v0.21 ##
- missiontext added
- make sure you have MissionText activated! https://github.com/schneehaze/fivem_missiontext
Or add following code on top:

RegisterNetEvent("BASE:missiontext")
AddEventHandler("BASE:missiontext", function(text, time)
        ClearPrints()
        SetTextEntry_2("STRING")
        AddTextComponentString(text)
        DrawSubtitleTimed(time, 1)
end)

## v0.2 ##
- refactored code
- it's working now, haha
- if have arrived the destination, you can detach the trailer and gain money (mission complete)
- no hardcoded locations (only in the very begining)

## v0.1 ##
- spawn trucks
- spawn trailers via menu
- markers are visible
- markers are getting invisible
