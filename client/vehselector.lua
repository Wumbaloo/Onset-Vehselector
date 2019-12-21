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

local vehselector
local sb_timer = 0
local webState = false

function OnPackageStart()
    local screenX, screenY = GetScreenSize()
    local width, height = 960, 500
    vehselector = CreateWebUI(screenX / 2 - width / 2, screenY / 2 - height / 2, width / 2, height / 2, 5, 10)
    LoadWebFile(vehselector, "http://asset/vehselector/gui/vehselector.html")
	SetWebAlignment(vehselector, 0.5, 0.5)
	SetWebAnchors(vehselector, 0.0, 0.0, 1.0, 1.0)
	SetWebVisibility(vehselector, WEB_HIDDEN)
end
AddEvent("OnPackageStart", OnPackageStart)

function OnPackageStop()
	DestroyWebUI(vehselector)
end
AddEvent("OnPackageStop", OnPackageStop)

function OnResolutionChange(width, height)
	SetWebSize(vehselector, width / 1.5, height / 1.5)
end
AddEvent("OnResolutionChange", OnResolutionChange)

function OnKeyPress(key)
    if key == "O" then
        webState = not webState
        ShowMouseCursor(webState)
        if (webState) then
            SetWebVisibility(vehselector, WEB_VISIBLE)
            SetInputMode(INPUT_GAMEANDUI)
        	ExecuteWebJS(vehselector, "AddVehicles()")
        else
            SetInputMode(INPUT_GAME)
            SetWebVisibility(vehselector, WEB_HIDDEN)
        end
	end
end
AddEvent("OnKeyPress", OnKeyPress)

function SelectVehicle(id)
    webState = false
    ShowMouseCursor(false)
    SetInputMode(INPUT_GAME)
    SetWebVisibility(vehselector, WEB_HIDDEN)    
    CallRemoteEvent("SpawnVehicle", id, GetPlayerId())
end
AddEvent("SelectVehicle", SelectVehicle)

function HideBrowser()
    ShowMouseCursor(false)
    SetInputMode(INPUT_GAME)
    SetWebVisibility(vehselector, WEB_HIDDEN)    
end
AddEvent("CloseBrowser", HideBrowser)