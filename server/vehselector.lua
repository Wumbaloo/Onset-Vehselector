--[[	
	Copyright (C) 2019 Blue Mountains GmbH
	This program is free software: you can redistribute it and/or modify it under the terms of the Onset
	Open Source License as published by Blue Mountains GmbH.
	This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without
	even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
	See the Onset Open Source License for more details.
	You should have received a copy of the Onset Open Source License along with this program. If not,
	see https://bluemountains.io/Onset_OpenSourceSoftware_License.txt
]]--

function SpawnVehicle(player, id)
	local x, y, z = GetPlayerLocation(player)
	local heading = GetPlayerHeading(player)
	
	AddPlayerChat(player, "Vehicle #" .. id .. " spawned.")
	local vehicle = CreateVehicle(tonumber(id), tonumber(x), tonumber(y), tonumber(z), tonumber(heading))
	SetPlayerInVehicle(player, vehicle)
end
AddRemoteEvent("SpawnVehicle", SpawnVehicle)