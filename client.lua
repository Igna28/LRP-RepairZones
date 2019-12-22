ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', Config.SuggestionCommand, Config.SuggestionLabel)
end)

local function isPedDrivingAVehicle() -- Function from RealVehicleDamage
	local ped = GetPlayerPed(-1)
	vehicle = GetVehiclePedIsIn(ped, false)
	if IsPedInAnyVehicle(ped, false) then
		if GetPedInVehicleSeat(vehicle, -1) == ped then
			local class = GetVehicleClass(vehicle)
			if class ~= 15 and class ~= 16 and class ~=21 and class ~=13 then
				return true
			end
		end
	end
	return false
end

local function IsCloseToRepairZone()
    for i = 1, #Config.RepairZone do
        local plyCoords = GetEntityCoords(GetPlayerPed(-1))
        local distance = GetDistanceBetweenCoords(Config.RepairZone[i].x, Config.RepairZone[i].y, Config.RepairZone[i].z,  plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
        if distance <= Config.RepairDistanceAroundBlip then
        	return true
       	end
	end
	return false
end

local function IsWhitelistedJob()
	for k,v in ipairs(Config.WhitelistedJob) do
		if v == ESX.PlayerData.job.name then
			return Config.WhitelistedJobsPrice
		end	
	end
	return Config.RegularPrice
end

RegisterNetEvent('LRP-RepairZone:Repair')
AddEventHandler('LRP-RepairZone:Repair', function()
    if isPedDrivingAVehicle() then
		if IsCloseToRepairZone() then
			local price = IsWhitelistedJob()
			ESX.TriggerServerCallback('LRP-RepairZone:RemoveMoney', function(tookMoney)
				if tookMoney then
					local ped = GetPlayerPed(-1)
					vehicle = GetVehiclePedIsIn(ped, false)
					exports['progressBars']:startUI(Config.ProgressBarTime, Config.ProgressLabel)
					FreezeEntityPosition(vehicle, true)
					Citizen.Wait(Config.ProgressBarTime)
					FreezeEntityPosition(vehicle, false)
					SetVehicleUndriveable(vehicle, false)
					SetVehicleFixed(vehicle)
					SetVehicleEngineOn(vehicle, true, false)
					exports['mythic_notify']:SendAlert('inform', "You're charged $".. price .." for the repair of your vehicle.")
				else
					exports['mythic_notify']:SendAlert('error', "You don't have enough money. Need $".. price .. ".")
				end
			end, price)
		else
			exports['mythic_notify']:SendAlert('error', "You can't repair vehicles in this place.")
		end
	else
		exports['mythic_notify']:SendAlert('error', "You're not in any vehicle.")
	end
end)