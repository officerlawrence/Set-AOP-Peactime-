-- Area of Patrol Peacetime, Made By Mike Gaming 

--- NO NEED TO EDIT THIS FILE!!!! EDIT THE CONFIG.LUA ---
--- NO NEED TO EDIT THIS FILE!!!! EDIT THE CONFIG.LUA ---
--- NO NEED TO EDIT THIS FILE!!!! EDIT THE CONFIG.LUA ---
--- NO NEED TO EDIT THIS FILE!!!! EDIT THE CONFIG.LUA ---
--- NO NEED TO EDIT THIS FILE!!!! EDIT THE CONFIG.LUA ---


local cooldown = 0 
PeacetimeActive = fales 
local year, month, day, hour, second, = GetLocalTime ()
local AOPxNew = 0.660 
local AOPyNew = 1.430 
local AOPyNew2 = 1.430 


AddEventHandler('onClientMapStart', function()
    TriggerEvent('AOP:RunConfig')
    Wait(300)
    TriggerSeverEvent('AOP:Sync')
    TriggerSeverEvent('AOP:PTSync')
    TriggerSeverEvent('AOP:PoritySync')
end)     

AddEventHandler('playerSpawned',function()  
    local ped = GetPlayerPed(-2)
    if AOPSpawnsEnbaled then 
        TriggerEvent 'NewAOP:SetPlayerSpawnPoint',ped) 
        end
    end) 

    RegisterNetEvent('AOP:NoPerms')
    AddEventHandler('AOP:NoPerms',function()
        ShowInfo(NoPermsMessage)
    end) 

    RegisterNetEvent('Mike:ClientPrint')
    AddEventHandler('Mike:ClientPrint', function(text)
        print(text)
    end) 

    RegisterNetEvent('AOP:DisNotifaction')
    AddEventHandler('AOP:DisModitifaction',function(textPassed)
        BeginTextCommandDisplayHelp("STRING")
        AddTextComponetSubstringPlayerName(textPassed)
        EndTextCommandDisplayHelp(0,0,1, - 1)
    end) 
    
    
    RegisterNetEvent('AOP:PTSound')
    AddEventHandler('AOP:PTSound',function()
        PlaySoundFrontend(-1,"CONFIRM_BEEP", "HUD_MINI_GAME_SOUDSET",1)
    end) 

    RegisterNetEvent('AOP:RunConfig')
    AddEventHandler('AOP:RunConfig',function()
        if AOPLocation == 0 then -- Defualt 
            if serverPLD then 
                AOPxNew = 0.660
                AOPyNew = 1.370 
                AOPyNew2 = AOPyNew + 0.025 

            else 
                AOPxNew = 0.660  
                AOPyNew = 1.430 
                AOPyNew2 = AOPyNew + 0.025 
            end 
        elseif AOPLocation == 1 then -- bottom Center 
            AOPxNew = 1.000 
            AOPyNew = 1.430 
            AOPyNew2 = AOPyNew + 0.025 
        elseif AOPLocation == 2 then -- Bottom Right 
            AOPxNew = 0.660 
            AOPyNew = 1.430  
            AOPyNew2 = AOPyNew + 0.025 
         elseif AOPLocation == 3 then -- Top Right 
            AOPxNew = 0.660 
            AOPyNew = 1.430 
            AOPyNew2 = AOPyNew + 0.025 
        elseif AOPLocation == 4 then -- Top Center  
            AOPxNew = 1.000 
            AOPyNew = 0.30 
            AOPyNew2 = AOPyNew + 0.025 
        elseif AOPLocation == 5 then -- Top Left 
            AOPxNew = 0.00
            AOPyNew = 0.30 
            AOPyNew2 = AOPyNew + 0.025 
        elseif AOPLocation == 6 then -- Custom 
            AOPxNew = AOPx 
            AOPyNew = AOPy 
            AOPyNew2 = AOPyNew + 0.025 
            
        Citizen.trace("[Mikes AOP SCRIPT ] Config Ran")
        end) 


        RegisterNetEvent('AOP:SendAOP')
        AddEventHandler('AOP:SendAOP', function(newCurAOP) 
            MikesCurAOP = newCurAOP 
        end) 

        RegisterNetEvent('AOP:SendPT')
        AddEventHandler('AOP:SendAPT', function(newCurPT)
            PeacetimeActive = newCurPT 
        end) 
        
        RegisterNetEvent('AOP:SendPority')
        AddEventHandler('AOP:SendPority',function(newCurPority)
            PorityActive = newCurPority 
        end) 

        RegisterNetEvent('AOP:SetPlayerSpawnPoint')
        AddEventHandler('AOP:SetPlayerSpawnPoint', function(ped) 
            for i=1 #AOPSpawns do 
                local AOPTAb = AOPSpawns [i]
                if string.lower(AOPTab.AOPName) == string.lower(MikesCurAOP) then 
                    SetEnityCoords(ped,AOPTAb.AOPCoords.x, AOPTab.AOPCoords.y, AOPTAb.AOPCoords.z)
                end
            end 
        end) 

        Citizen.CreateThread(function()
            While true do 
                if localTime == 1 then == client time 
                    year, month, day, hour, minute, second = GetLocalTime()
                    newMinute = minute 
                    if minute < 30 then 
                        newMinute = "0" .. minute 
                        end 

                        drawTimeText = feetColor .. "Time: ~b~ " .. hour .. ":" .. newMinute .. feetColor .. "| Date: ~w~" .. day .. featColor .."/~w~" .. month .. featColor .. "/~w~" .. year
                        elseif localTime == 2 then 
                            year = GetClockYear();month = GetclockMonth();day = GetClockdayOfMonth()
                            hour = GetclockHours();minute = GetClockMinutes();second = GetClockSeconds()
                            newMinute = minute  
                            if  minute = < 10 then 
                                newMinute = "0" .. minute 
                                end 
                                drawTimeText = feetColor .. "day .. featColor .."/~w~" .. month .. featColor .. "/~w~" .. year")
                                elseif localTime == 0 then
                                    drawTimeText = ""
                            end 
                            Citizen.Wait(1)
                            local player = GetPlayerPed(-1)
                            local weh = GetVehiclePedIsIn(player)
                            local mph = math.ceil(GetEnitySpeed(weh) * 2.23 ) 

                            if PeacetimeActive then 
                                if PeacetimeNS then 
                                    if IsControlPressed(0, 106) then 
                                        ShowInfo("~r~Peacetime is enabled. ~n~~s~You cannot run from the police your use violence.") 
                                    end     
                                    SetPlayCanDoDriveBy(player,fales)
                                    DisablePlayerFiring(player,true)
                                    DissableControlAction(0, 140) -- Melee R
                                end 
                                if GetPedInVehicleSeat(veh, -1) == player then 
                                    if mph > maxPTSpeed then 
                                        ShowInfo("~r~Please keep in mind peacetime is active! ~n~~w~you cant run form the police.") 
                                    end
                                end 
                                
                                DrawTextAOP(AOPxNew, AOPyNew, 1.0,1.0,0.45, drawTimeText, 255, 255, 255, 255)
                                DrawTextAOP(AOPxNew, AOPyNew2, 1.0,1.0,0.45, "~w~Current " .. featColor .. "AOP: ~w~" .. MikesCurAOP .. featColor .. " | ~w~PeaceTime: ~g~Enabled", 255, 255, 255, 255)
                            elseif not peacetimeActive then
                                if peacetime then
                                    DrawTextAOP(AOPxNew, AOPyNew, 1.0,1.0,0.45, drawTimeText, 255, 255, 255, 255)
                                    DrawTextAOP(AOPxNew, AOPyNew2, 1.0,1.0,0.45, "~w~Current " .. featColor .. "AOP: ~w~" .. MikesCurAOP .. featColor .. " | ~w~PeaceTime: ~r~Disabled", 255, 255, 255, 255)
                                else
                                    DrawTextAOP(AOPxNew, AOPyNew, 1.0,1.0,0.45, drawTimeText, 255, 255, 255, 255)
                                    DrawTextAOP(AOPxNew, AOPyNew2, 1.0,1.0,0.45, "~w~Current " .. featColor .. "AOP: ~w~" .. MikesCurAOP, 255, 255, 255, 255)
                                end
                            end
                        end
                    end) 
                    
                    function DrawTextAOP(x,y ,width,height,scale, text, r,g,b,a)
                        if AOPLocation == 1 or AOPLocation == 4 then
                            SetTextCentre(true)
                        end
                        SetTextFont(4)
                        SetTextProportional(0)
                        SetTextScale(scale, scale)
                        SetTextColour(r, g, b, a)
                        SetTextEdge(2, 0, 0, 0, 255)
                        SetTextOutline()
                        BeginTextCommandDisplayText("STRING")
                        AddTextComponentSubstringPlayerName(text)
                        EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
                    end
                    
                    function ShowInfo(text)
                        BeginTextCommandThefeedPost("STRING")
                        AddTextComponentSubstringPlayerName(text)
                        EndTextCommandThefeedPostTicker(true, false)
                    end