local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

--use this for debugging
function Chat(t)
	TriggerEvent("chatMessage", 'TRUCKER', { 0, 255, 255}, "" .. tostring(t))
end


--neu locations
local TruckingCompagny = { 
    ["x"] = -7.100, ["y"] = -0.300, ["z"] = 73.077
}
local TruckingTrainer = {
    ["x"] = -9.300, ["y"] = 2.030, ["z"] = 73.110
}

local R1 = 0
local V1 = 128
local B1 = 192
local Alpha1 = 200

--Menu 2
local R2 = 0
local V2 = 128
local B2 = 64
local Alpha2 = 200

---------------------------------------
--     DO NOT EDIT BEYOND HERE     --
---------------------------------------
local Truck = {"HAULER", "PACKER", "PHANTOM"}
local Trainer = {"TANKER", "TRAILERS", "TRAILERS2", "TRAILERLOGS"}
local Hashtrainer = GetHashKey(Trainer[1])
local trainerType = 1
local TruckingDestination = { {0, 0, 0}, {94.5723, -1290.0820, 0.0000} }
local blip = 0
local blip2 = false
local blip3 = 0
local tempblip = 0
local count = 0
local money = false
local remover = false
local givemoney = 0
local MissionX = 0
local MissionY = 0
local MissionZ = 0
local trainer = 0

local GUI = {}
GUI.GUI = {}
GUI.title = {}
GUI.menu1 = {}
GUI.menu2 = {}
GUI.description = {}
GUI.TitleCount = 0
GUI.Menu1buttonCount = 0
GUI.Menu2buttonCount = 0
GUI.desCount = 0
GUI.time = 0
GUI.selectionmenu1 = 0
GUI.selectionmenu2 = 0
GUI.loaded = false
GUI.hiddenMenu1 = true
GUI.hiddenMenu2 = true
GUI.showedText1 = false
GUI.showedText2 = false


-- Function local
Citizen.CreateThread(function()
	while true do
		Wait(0)
            local playerPed = GetPlayerPed(-1)
            local player = PlayerId()
            local playerEntity = GetPlayerPedScriptIndex(player)
            local coords = GetOffsetFromEntityInWorldCoords(playerPed, 0.0, 0.0, 0.0)
            GUI.tick()
            
             local playerCoords = GetEntityCoords( playerPed, nil )
                if(IsControlPressed(0, Keys["N"])) then
						Chat(playerCoords)				
					end
            
            
             
    end
end)
function GUI.unload()
	for i, coords in pairs(TruckingCompagny) do
		UI.REMOVE_BLIP(blip)
	end
end

function GUI.init()
GUI.time = GetGameTimer()
GUI.loaded = true
	--for i, coords in pairs(TruckingCompagny) do
		tempblip = AddBlipForCoord(TruckingCompagny["x"], TruckingCompagny["y"], TruckingCompagny["z"])
		SetBlipSprite(tempblip,67) -- 67 /8 9
        SetBlipScale(tempblip, 0.8)
		SetBlipAsShortRange(tempblip, true)
    --end
	
GUI.addTitle("Trucking Job",0.425, 0.19, 0.45, 0.07)
GUI.addDescription("Help:",0.575, 0.375, 0.15, 0.30)	

GUI.addButtonMenu1("RON Tanker trailer", GUI.OptionMission1, 0.35, 0.25, 0.3, 0.05)
GUI.addButtonMenu1("Container trailer", GUI.OptionMission2, 0.35, 0.30, 0.3, 0.05)
GUI.addButtonMenu1("Articulated trailer", GUI.OptionMission3, 0.35, 0.35, 0.3, 0.05)
GUI.addButtonMenu1("Log Trailer", GUI.OptionMission4, 0.35, 0.40, 0.3, 0.05)
GUI.addButtonMenu1(" ", GUI.Null, 0.35, 0.45, 0.3, 0.05)
GUI.addButtonMenu1("Exit Menu", GUI.Exit, 0.35, 0.50, 0.3, 0.05)


GUI.addButtonMenu2("Mission 1 [ 5.000$ ]", GUI.Mission1, 0.35, 0.25, 0.3, 0.05)
GUI.addButtonMenu2("Mission 2 [ 10.000$ ]", GUI.Mission2, 0.35, 0.30, 0.3, 0.05)
GUI.addButtonMenu2("Mission 3 [ 15.000$ ]", GUI.Mission3, 0.35, 0.35, 0.3, 0.05)
GUI.addButtonMenu2("Mission 4 [ 20.000$ ]", GUI.Mission4, 0.35, 0.40, 0.3, 0.05)
GUI.addButtonMenu2("Mission 5 [ 30.000$ ]", GUI.Mission5, 0.35, 0.45, 0.3, 0.05)
GUI.addButtonMenu2("Exit Menu", GUI.Exit, 0.35, 0.50, 0.3, 0.05)

end

function GUI.addTitle(name, xpos, ypos, xscale, yscale)
	print("Added Title "..name )
	GUI.title[GUI.TitleCount +1] = {}
	GUI.title[GUI.TitleCount +1]["name"] = name
	GUI.title[GUI.TitleCount +1]["xpos"] = xpos
	GUI.title[GUI.TitleCount +1]["ypos"] = ypos 	
	GUI.title[GUI.TitleCount +1]["xscale"] = xscale
	GUI.title[GUI.TitleCount +1]["yscale"] = yscale
end

function GUI.addButtonMenu1(name, func, xpos, ypos, xscale, yscale)
	print("Added Button "..name )
	GUI.menu1[GUI.Menu1buttonCount +1] = {}
	GUI.menu1[GUI.Menu1buttonCount +1]["name"] = name
	GUI.menu1[GUI.Menu1buttonCount+1]["func"] = func
	GUI.menu1[GUI.Menu1buttonCount+1]["xpos"] = xpos
	GUI.menu1[GUI.Menu1buttonCount+1]["ypos"] = ypos 	
	GUI.menu1[GUI.Menu1buttonCount+1]["xscale"] = xscale
	GUI.menu1[GUI.Menu1buttonCount+1]["yscale"] = yscale
	GUI.Menu1buttonCount = GUI.Menu1buttonCount+1
end

function GUI.addButtonMenu2(name, func, xpos, ypos, xscale, yscale)
	print("Added Button "..name )
	GUI.menu2[GUI.Menu2buttonCount +1] = {}
	GUI.menu2[GUI.Menu2buttonCount +1]["name"] = name
	GUI.menu2[GUI.Menu2buttonCount+1]["func"] = func
	GUI.menu2[GUI.Menu2buttonCount+1]["xpos"] = xpos
	GUI.menu2[GUI.Menu2buttonCount+1]["ypos"] = ypos 	
	GUI.menu2[GUI.Menu2buttonCount+1]["xscale"] = xscale
	GUI.menu2[GUI.Menu2buttonCount+1]["yscale"] = yscale
	GUI.Menu2buttonCount = GUI.Menu2buttonCount+1
end

function GUI.addDescription(name, xpos, ypos, xscale, yscale)
	print("Added Description "..name )
	GUI.description[GUI.desCount +1] = {}
	GUI.description[GUI.desCount +1]["name"] = name
	GUI.description[GUI.desCount +1]["xpos"] = xpos
	GUI.description[GUI.desCount +1]["ypos"] = ypos 	
	GUI.description[GUI.desCount +1]["xscale"] = xscale
	GUI.description[GUI.desCount +1]["yscale"] = yscale
end

-- Function Primaire 

--function wait(seconds)
-- local start = os.time()
--  repeat until os.time() > start + seconds
--end

function GUI.spawntruck()
    local playerPed = GetPlayerPed(-1)
	local Hashtruck = GetHashKey(Truck[1])
	RequestModel(Hashtruck)				
	local truck = CreateVehicle(Hashtruck, 2.785, 6.990, 71.00, 180, true, false)
	--SetVehicleOnGroundProperly(truck)
	--SetPedIntoVehicle(PlayerPedId(), truck, -1);
	print("spawn truck")		
	Wait(1)
    return truck
end

function GUI.spawntrainer()
        local playerPed = GetPlayerPed(-1)
		RequestModel( GetHashKey( Trainer[trainerType] ) )
        --global.. so it's possible to destroy it
        
        trainer = CreateVehicle(GetHashKey(Trainer[trainerType]), 1.370, 29.109, 72.000, 0.1, true, false)
        -- added
        SetEntityAsMissionEntity(trainer, true, true);
--		SetVehicleOnGroundProperly(trainer)
    	print("spawn trainer")
		Wait(1)
end

function GUI.Money()
local playerPed = GetPlayerName()
local modelHash = 0
		if (IsPedModel(playerPed, GetHashKey("s_m_m_trucker_01"))) then
			modelHash = 0x59511A6C
		end
	
		local statname = "SP"..modelHash.."_TOTAL_CASH"
		local hash = GetHashKey(statname)
		local bool, val = StatGetInt(hash, 0, -1)

		StatSetInt(hash, val + givemoney, true)

		money = false
		count = 1
end

function GUI.Marker()
count = 0
   local i = 0
	--for i, coords in pairs(TruckingTrainer) do
		blip2 = AddBlipForEntity(trainer)
		SetBlipSprite(blip2, 9)
		SetBlipScale(blip2, 0.1)
		SetBlipColour(blip2, 3)
		SetBlipAsShortRange(blip2, false)	
		SetBlipRoute(blip2, true)
	--end

	--for i, coords in pairs(TruckingDestination) do
		blip3 = AddBlipForCoord(MissionX,MissionY,MissionZ)
		SetBlipSprite(blip3, 2)
		SetBlipScale(blip3, 1.2)
		SetBlipColour(blip3,2)
		SetBlipAsShortRange(blip3, false)
		SetBlipRoute(blip3, false)	
	--end							
		print("marker destination")
		Wait(1)	
		GUI.hiddenMenu2 = true
end

-- Option Mission

function GUI.OptionMission1()
	GUI.hiddenMenu1 = true
	GUI.hiddenMenu2 = false
	trainerType = 1
end

function GUI.OptionMission2()
	GUI.hiddenMenu1 = true
	GUI.hiddenMenu2 = false
	trainerType = 2
end

function GUI.OptionMission3()
	GUI.hiddenMenu1 = true
	GUI.hiddenMenu2 = false
	trainerType = 3
end

function GUI.OptionMission4()
	GUI.hiddenMenu1 = true
	GUI.hiddenMenu2 = false
	trainerType = 4
end

-- Mission 

function GUI.Mission1()
		MissionX = 1212.4463
		MissionY = 2667.4351
		MissionZ = 38.79
		givemoney = 5000
		print("Loaded Mission 1")
		remover = true
	    GUI.spawntrainer()
		GUI.Marker()
end

function GUI.Mission2()
		MissionX = 2574.5144
		MissionY = 328.5554
		MissionZ = 108.45
		givemoney = 10000
		print("Loaded Mission 2")
		remover = true
	    GUI.spawntrainer()
		GUI.Marker()
end

function GUI.Mission3()
		MissionX = -2565.0894
		MissionY = 2345.8904
		MissionZ = 33.06
		givemoney = 15000
		print("Loaded Mission 3")
		remover = true
	    GUI.spawntrainer()
		GUI.Marker()
end

function GUI.Mission4()
		MissionX = 1706.7966
		MissionY = 4943.9897
		MissionZ = 42.16
		givemoney = 20000
		print("Loaded Mission 4")
		remover = true
	    GUI.spawntrainer()
		GUI.Marker()
end

function GUI.Mission5()
		MissionX = 196.5617
		MissionY = 6631.0967
		MissionZ = 31.53
		givemoney = 30000
		print("Loaded Mission 5")
		remover = true
	    GUI.spawntrainer()
		GUI.Marker()
end

function GUI.Null()

end

function GUI.Exit()
	GUI.hiddenMenu1 = true
	GUI.hiddenMenu2 = true
	print("Exit menu")
end

-- Master Function

function GUI.tick()
    local playerPed = PlayerPedId()
    local player = GetPlayerPed(playerPed)
    local playerExists = DoesEntityExist(playerPed)
    local playerCoords = GetEntityCoords( playerPed, nil )
    local trainerCoords = GetEntityCoords( trainer, nil )
    local truck = false
    local trainer = false
    
	if( playerExists ) then
				if( GetDistanceBetweenCoords( playerCoords, -7.100, -0.300, 73.077, false ) < 5 ) then
                    --Check, if text was already shown...
                    if GUI.showedText1 then
                        --do nothing...
                    else
				        GUI.drawText()
                        GUI.showedText1 = true
                    end
            
                    if GUI.showedText2 then
                        --also do nothing...
                    else
                        GUI.drawText2()
                        GUI.showedText2 = true
                    end
            
					if(IsControlPressed(0, Keys["N-"])) then
						GUI.hiddenMenu1 = false						
					end
						
					if(IsControlPressed(0, Keys["N+"])) then
						truck = GUI.spawntruck()
					end
            
				else
				    GUI.hiddenMenu1 = true
				    GUI.hiddenMenu2 = true
                    GUI.showedText1 = false
                    GUI.showedText2 = false
				end
				
				if( GetDistanceBetweenCoords( playerCoords , trainerCoords, false ) < 5 and remover == true) then
					--for i, coords in pairs(TruckingTrainer) do
                      
                        --doesn't work for a reason..
						--RemoveBlip(blip2)
                        SetBlipAlpha(blip2, 0)
					--end

			--		for i, coords in pairs(TruckingDestination) do
						SetBlipRoute(blip3, true)
			--		end
                end

			--		if( GetDistanceBetweenCoords( coords.x, coords.y, coords.z,MissionX , MissionY , MissionZ, false ) < 3 and remover == true) then
			--				for i, coords in pairs(TruckingDestination) do
			--						RemoveBlip(blip3[0])
			--						money = true
			--						if (money == true and count == 0) then
											GUI.Money()
			--						end	
			--					
			--				end
			--				remover = false
			--		end
		
		if (Type == 1) then
			Hashtrainer = GetHashKey(Trainer[1])
		end

		if (Type == 2) then
			Hashtrainer = GetHashKey(Trainer[2])
		end

		if (Type == 3) then
			Hashtrainer = GetHashKey(Trainer[3])
		end

		if (Type == 4) then
			Hashtrainer = GetHashKey(Trainer[4])
		end
					
		if(not GUI.hiddenMenu1)then
			if( GUI.time == 0) then
				GUI.time = GetGameTimer()
			end
			if((GetGameTimer() - GUI.time)> 100) then
				GUI.updateSelectionMenu1()
			end	
			GUI.renderMenu1GUI()	
			if(not GUI.loaded ) then
				GUI.init()	 
			end
		end
		
		if(not GUI.hiddenMenu2)then
			if( GUI.time == 0) then
				GUI.time = GetGameTimer()
			end
			if((GetGameTimer() - GUI.time)> 100) then
				GUI.updateSelectionMenu2()
			end	
			GUI.renderMenu2GUI()	
			if(not GUI.loaded ) then
				GUI.init()	 
			end
		end
        
        --added
        if ( DoesEntityExist(trainer) ) then
            if( IsVehicleDriveable(trainer) ) then
            --nothing
            else
                DeleteVehicle(trainer)
            end
        end
        
    end
end

-- GUI Function 
function GUI.drawText()
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.35)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0,255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        Chat("Press NumPad - to show menu") 
        DrawText(0.015, 0.015)
		DrawRect(0.1,0.045,0.18,0.07,0,0,0,200)
end

function GUI.drawText2()
        SetTextFont(0)
        SetTextProportional(1)
        SetTextScale(0.0, 0.35)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0,255)
        SetTextEdge(1, 0, 0, 0, 255)
        SetTextDropshadow()
        SetTextOutline()
        SetTextEntry("STRING")
        Chat("Press NumPad + to spawn truck") 
        DrawText(0.015, 0.045)
end


function GUI.updateSelectionMenu1() 
	if( IsControlPressed(0, Keys["DOWN"]) ) then 
		if(GUI.selectionmenu1 < GUI.Menu1buttonCount -1  )then
			GUI.selectionmenu1 = GUI.selectionmenu1 +1
			GUI.time = 0
		end
	elseif ( IsControlPressed(0, Keys["TOP"]) )then
		if(GUI.selectionmenu1 > 0)then
			GUI.selectionmenu1 = GUI.selectionmenu1 -1
			GUI.time = 0
		end
	elseif ( IsControlPressed(0, Keys["ENTER"]) ) then
		if(type(GUI.menu1[GUI.selectionmenu1 +1]["func"]) == "function") then
			GUI.menu1[GUI.selectionmenu1 +1]["func"](GUI.menu1[GUI.selectionmenu1 +1]["args"])
		else
			print(type(GUI.menu1[GUI.selectionmenu1]["func"]))
		end
		GUI.time = 0
	end
	local iterator = 0
	for id, settings in ipairs(GUI.menu1) do
		GUI.menu1[id]["active"] = false
		if(iterator == GUI.selectionmenu1 ) then
			GUI.menu1[iterator +1]["active"] = true
		end
		iterator = iterator +1
	end
end

function GUI.updateSelectionMenu2() 
	if( IsControlPressed(0, Keys["DOWN"]) ) then 
		if(GUI.selectionmenu2 < GUI.Menu2buttonCount -1  )then
			GUI.selectionmenu2 = GUI.selectionmenu2 +1
			GUI.time = 0
		end
	elseif ( IsControlPressed(0, Keys["TOP"]) )then
		if(GUI.selectionmenu2 > 0)then
			GUI.selectionmenu2 = GUI.selectionmenu2 -1
			GUI.time = 0
		end
	elseif ( IsControlPressed(0, Keys["ENTER"]) ) then
		if(type(GUI.menu2[GUI.selectionmenu2 +1]["func"]) == "function") then
			GUI.menu2[GUI.selectionmenu2 +1]["func"](GUI.menu2[GUI.selectionmenu2 +1]["args"])
		else
			print(type(GUI.menu2[GUI.selectionmenu2]["func"]))
		end
		GUI.time = 0
	end
	local iterator = 0
	for id, settings in ipairs(GUI.menu2) do
		GUI.menu2[id]["active"] = false
		if(iterator == GUI.selectionmenu2 ) then
			GUI.menu2[iterator +1]["active"] = true
		end
		iterator = iterator +1
	end
end

function GUI.renderMenu1GUI()
	 GUI.renderTitle()
	 GUI.renderButtonsMenu1()
	 GUI.renderDescription()
end

function GUI.renderMenu2GUI()
	 GUI.renderTitle()
	 GUI.renderButtonsMenu2()
	 GUI.renderDescription()
end

function GUI.renderBox(xpos,ypos,xscale,yscale,color1,color2,color3,color4)
	DrawRect(xpos,ypos,xscale,yscale, color1, color2, color3, color4);
end

function GUI.renderTitle()
		for id, settings in pairs(GUI.title) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		boxColor = {0,0,0,255}
		SetTextFont(0)
		SetTextScale(0.0, 0.40)
		SetTextColour(255, 255, 255, 255)
		SetTextCentre(true)
		SetTextDropshadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"])
		DrawText((settings["xpos"] + 0.001), (settings["ypos"] - 0.015))
		AddTextComponentString(settings["name"])
		GUI.renderBox(settings["xpos"],settings["ypos"],settings["xscale"],settings["yscale"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
		end
end

function GUI.renderButtonsMenu1()
	
	for id, settings in pairs(GUI.menu1) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		boxColor = {0,0,0,100}
		if(settings["active"]) then
			boxColor = {R1,V1,B1,Alpha1}
		end
		SetTextFont(0)
		SetTextScale(0.0, 0.35)
		SetTextColour(255, 255, 255, 255)
		SetTextCentre(true)
		SetTextDropShadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"])
		DrawText((settings["xpos"] + 0.001), (settings["ypos"] - 0.015))
		AddTextComponentString(settings["name"])
		GUI.renderBox(settings["xpos"] ,settings["ypos"], settings["xscale"], settings["yscale"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
	 end     
end

function GUI.renderButtonsMenu2()
	
	for id, settings in pairs(GUI.menu2) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		boxColor = {0,0,0,100}
		if(settings["active"]) then
			boxColor = {R2,V2,B2,Alpha2}
		end
		SetTextFont(0)
		SetTextScale(0.0, 0.35)
		SetTextColour(255, 255, 255, 255)
		SetTextCentre(true)
		SetTextDropShadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"])
		DrawText((settings["xpos"] + 0.001), (settings["ypos"] - 0.015))
		AddTextComponentString(settings["name"])
		GUI.renderBox(settings["xpos"] ,settings["ypos"], settings["xscale"], settings["yscale"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
	 end     
end

function GUI.renderDescription()
		for id, settings in pairs(GUI.description) do
		local screen_w = 0
		local screen_h = 0
		screen_w, screen_h =  GetScreenResolution(0, 0)
		boxColor = {0,0,0,240}
		SetTextFont(0)
		SetTextScale(0.0, 0.37)
		SetTextColour(255, 255, 255, 255)
		SetTextDropShadow(0, 0, 0, 0, 0)
		SetTextEdge(0, 0, 0, 0, 0)
		SetTextEntry("STRING")
		AddTextComponentString(settings["name"] .. "\n" .."\n" .."Num8 for UP" .. "\n" .. "Num2 for DOWN" .. "\n" .. "Num5 to Select".. "\n" .."Hold H to Detach" .. "\n" .. "Trainer")
		DrawText((settings["xpos"] - 0.06), (settings["ypos"] - 0.13))
		AddTextComponentString(settings["name"])
		GUI.renderBox(settings["xpos"],settings["ypos"],settings["xscale"],settings["yscale"],boxColor[1],boxColor[2],boxColor[3],boxColor[4])
		end
end

return GUI
