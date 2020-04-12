function SetUpYacht()
  Citizen.CreateThread(function()
    --YACHT_NAME()
    --INITIALISE(100)
    --SET_YACHT_NAME("YTGN", false, "gb")
  	RemoveIpl("apa_yacht_grp12_1")
  	RemoveIpl("apa_yacht_grp12_1_int")
  	RemoveIpl("apa_yacht_grp12_1_lod")
  	RemoveIpl("apa_yacht_grp12_2")
  	RemoveIpl("apa_yacht_grp12_2_int")
  	RemoveIpl("apa_yacht_grp12_2_lod")
  	RequestIpl("apa_yacht_grp12_3")
  	RequestIpl("apa_yacht_grp12_3_int")
  	RequestIpl("apa_yacht_grp12_3_lod")
  	RemoveIpl("apa_ch2_superyacht")

    local interiorId

  	interiorId = GetInteriorAtCoords(-381.77390000, 6946.96000000, 5.42995500) --GetInteriorFromEntity(GetPlayerPed(-1))

  	local items = {
  		[1] = GetHashKey("apa_mp_apa_yacht_radar_01a"),
  		[2] = GetHashKey("apa_mp_apa_yacht_option3"),
  		[3] = GetHashKey("apa_mp_apa_yacht_o3_rail_a"), -- apa_mp_apa_yacht_o3_rail_b
  		[4] = GetHashKey("apa_mp_apa_yacht_launcher_01a"),
		[5] = GetHashKey("apa_mp_apa_y3_l2d"),
		[6] = GetHashKey("apa_mp_apa_yacht_jacuzzi_ripple1") -- apa_mp_apa_yacht_jacuzzi_ripple2, apa_mp_apa_yacht_jacuzzi_ripple003
  	}
  	for i=1,#items do
  		RequestModel(items[i])
  	end

    local loading = true
    while loading do
      Wait(0)
      loading = false
      for i=1,#items do
        if not HasModelLoaded(items[i]) then
          loading = true
        end
      end
    end

  	RefreshInterior(interiorId)
    DisplayHelpText(interiorId)

    for i=1,#items do
      local x = GetClosestObjectOfType(-381.77390000, 6946.96000000, 5.42995500, 100.0, items[i])
      SetEntityAsMissionEntity(x, true, true)
      DeleteEntity(x)
    end

    local e = GetClosestObjectOfType(-381.77390000, 6946.96000000, 5.42995500, 0.1, GetHashKey('apa_mp_apa_yacht'))


    Wait(1000)
    for i=1,#items do
      local pos = GetEntityCoords(e)
      local h = GetEntityHeading(e)
      local o
      if i == 1 then
        o = CreateObject(items[i], pos.x+1.715, pos.y-1.05, pos.z+13.05, true, true, true)
      elseif i == 3 then
        o = CreateObject(items[i], pos.x, pos.y, pos.z-7.225, true, true, true)
      elseif i == 5 then
        o = CreateObject(items[i], pos.x, pos.y, pos.z-4.05, true, true, true)
      elseif i == 6 then
        o = CreateObject(items[i], pos.x-13.9, pos.y-49.0, pos.z-0.9, true, true, true)
      else
        o = CreateObject(items[i], pos.x, pos.y, pos.z-5.227, true, true, true)
      end
      SetEntityHeading(o, h)
    end
    SetObjectTextureVariant(e, 9)


    DrawEmptyRect("apa_prop_ap_name_text", "apa_prop_ap_name_text")
    while true do
      Wait(0)
      --DrawYachtName(name)
      ModifyWater(-396.0, 6892.68, 5.0, 0.0)
      --SetRainFxIntensity(0.0)
      --SetWavesIntensity(0.0)
    end
  end)
end

SetUpYacht()



























function DrawYachtName(name, style, color, font)
    if stage == 0 then
        if (renderId == -1) then
            renderId = CreateNamedRenderTargetForModel(target, prop)
        end
        if (movieId == -1) then
            movieId = RequestScaleformMovie("YACHT_NAME")
        end
        stage = 1
    elseif stage == 1 then
        if (HasScaleformMovieLoaded(movieId)) then
            local parameters = {
                p0 = {type = "string", value = name},
                p1 = {type = "int", value = 1},
                p2 = {type = "string", value = "US"}
            }
            SetupScaleform(movieId, "SET_YACHT_NAME", parameters)
            stage = 2
        else
            movieId = RequestScaleformMovie("YACHT_NAME")
        end
    elseif stage == 2 then
        SetTextRenderId(renderId)
        SetUiLayer(4)
        N_0xc6372ecd45d73bcd(true)
        ScreenDrawPositionBegin(73, 73)
        DrawScaleformMovie(movieId, 0.196, 0.245, 0.46, 0.66, 255, 255, 255, 255, 0)
        SetTextRenderId(GetDefaultScriptRendertargetRenderId())
        ScreenDrawPositionEnd()
    end
end

function CreateNamedRenderTargetForModel(name, model)
    local handle = 0
    if not IsNamedRendertargetRegistered(name) then
        RegisterNamedRendertarget(name, false)
    end
    if not IsNamedRendertargetLinked(model) then
        LinkNamedRendertarget(model)
    end
    if IsNamedRendertargetRegistered(name) then
        handle = GetNamedRendertargetRenderId(name)
    end

    return handle
end

function SetupScaleform(movieId, scaleformFunction, parameters)
    BeginScaleformMovieMethod(movieId, scaleformFunction)
    N_0x77fe3402004cd1b0(name)
    if (IsTable(parameters)) then
        for i = 0, Tablelength(parameters) - 1 do
            local p = parameters["p" .. tostring(i)]
            if (p.type == "bool") then
                PushScaleformMovieMethodParameterBool(p.value)
            elseif (p.type == "int") then
                PushScaleformMovieMethodParameterInt(p.value)
            elseif (p.type == "float") then
                PushScaleformMovieMethodParameterFloat(p.value)
            elseif (p.type == "string") then
                PushScaleformMovieMethodParameterString(p.value)
            elseif (p.type == "buttonName") then
                PushScaleformMovieMethodParameterButtonName(p.value)
            end
        end
    end
    EndScaleformMovieMethod()
    N_0x32f34ff7f617643b(movieId, 1)
end

-- Check if a variable is a table
function IsTable(T)
    return type(T) == 'table'
end
-- Return the number of elements of the table
function Tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

function HighlightObject(object)
    x, y, z = table.unpack(GetEntityCoords(object, true))
    SetDrawOrigin(x, y, z, 0)
    RequestStreamedTextureDict("helicopterhud", false)
    DrawSprite("helicopterhud", "hud_corner", -0.01, -0.01, 0.006, 0.006, 0.0, 255, 0, 0, 200)
    DrawSprite("helicopterhud", "hud_corner", 0.01, -0.01, 0.006, 0.006, 90.0, 255, 0, 0, 200)
    DrawSprite("helicopterhud", "hud_corner", -0.01, 0.01, 0.006, 0.006, 270.0, 255, 0, 0, 200)
    DrawSprite("helicopterhud", "hud_corner", 0.01, 0.01, 0.006, 0.006, 180.0, 255, 0, 0, 200)
    ClearDrawOrigin()
end

function DrawEmptyRect(name, model)
    local step = 250
    local timeout = 5 * 1000
    local currentTime = 0
    local renderId = CreateNamedRenderTargetForModel(name, model)

    while (not IsNamedRendertargetRegistered(name)) do
        Citizen.Wait(step)
        currentTime = currentTime + step
        if (currentTime >= timeout) then return false end
    end
    if (IsNamedRendertargetRegistered(name)) then
        SetTextRenderId(renderId)
        SetUiLayer(4)
        DrawRect(0.5, 0.5, 1.0, 1.0, 0, 0, 0, 0)
        SetTextRenderId(GetDefaultScriptRendertargetRenderId())

        ReleaseNamedRendertarget(0, name)
    end

    return true
end

modelstuff = {
	---Chumash---
	{location = "chumash", model = "apa_MP_Apa_Yacht",x=-3542.82200000, y=1488.25000000, z=5.42995500, pitch = 0.0, roll = 0.0, yaw = 237.0 },-- Chumash
	{location = "chumash", model = "apa_MP_Apa_Yacht_Win",x=-3542.82200000, y=1488.25000000, z=5.42995500, pitch = 0.0 , roll = 0.0 , yaw = 237.0  },
	{location = "chumash", model = "apa_mp_apa_yacht_o3_rail_b",x=-3542.82200000, y=1488.25000000, z=19.99997000, pitch = 0.0, roll = 0.0, yaw = 237.0 },
	{location = "chumash", model = "apa_mp_apa_yacht_option3",x=-3542.82200000, y=1488.25000000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 237.0 },
	{location = "chumash", model = "apa_MP_Apa_Yacht_Jacuzzi_Cam",x=-3516.95, y=1531.93, z=5.30, pitch = 0.0, roll = 0.0 , yaw = 237.0},
	{location = "chumash", model = "apa_mp_apa_yacht_jacuzzi_ripple003",x=-3516.95, y=1531.93, z=5.30, pitch = 0.0, roll = 0.0, yaw = 237.0},
	{location = "chumash", model = "apa_mp_apa_yacht_jacuzzi_ripple1",x=-3516.95, y=1531.93, z=5.30, pitch = 0.0, roll = 0.0, yaw = 237.0},
	{location = "chumash", model = "apa_mp_apa_yacht_radar_01a",x=-3543.97, y=1490.08, z=18.54, pitch = 0.0, roll = 0.0, yaw = 237.0},
	{location = "chumash", model = "apa_mp_apa_y3_l2c",x=-3542.82200000, y=1488.25000000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 237.0}, -- End of Chumash
	---Zancudo---
	{location = "zancudo", model = "apa_MP_Apa_Yacht", x=-2814.48900000, y=4072.74000000, z=5.42995500, pitch = 0.0, roll = 0.0, yaw = 322.0 }, -- Zancudo
	{location = "zancudo", model = "apa_MP_Apa_Yacht_Win",x=-1995.72500000, y=-1523.69400000, z=5.42995500, pitch = 0.0 , roll = 0.0 , yaw = 322.0  },
	{location = "zancudo", model = "apa_mp_apa_yacht_o3_rail_b",x=-1995.72500000, y=-1523.69400000, z=19.99997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "zancudo", model = "apa_mp_apa_yacht_option3",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "zancudo", model = "apa_MP_Apa_Yacht_Jacuzzi_Cam",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0 , yaw = 0.0},
	{location = "zancudo", model = "apa_mp_apa_yacht_jacuzzi_ripple003",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "zancudo", model = "apa_mp_apa_yacht_jacuzzi_ripple1",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "zancudo", model = "apa_mp_apa_yacht_radar_01a",x=-1997.62, y=-1524.73, z=18.54, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "zancudo", model = "apa_mp_apa_y3_l2c",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 }, -- End Zancudo
	---Pacific Bluffs---
	{location = "bluffs", model = "apa_MP_Apa_Yacht",x=-1995.72500000, y=-1523.69400000, z=5.42997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "bluffs", model = "apa_MP_Apa_Yacht_Win",x=-1995.72500000, y=-1523.69400000, z=5.42995500, pitch = 0.0 , roll = 0.0 , yaw = 322.0  },
	{location = "bluffs", model = "apa_mp_apa_yacht_o3_rail_b",x=-1995.72500000, y=-1523.69400000, z=19.99997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "bluffs", model = "apa_mp_apa_yacht_option3",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "bluffs", model = "apa_MP_Apa_Yacht_Jacuzzi_Cam",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0 , yaw = 0.0},
	{location = "bluffs", model = "apa_mp_apa_yacht_jacuzzi_ripple003",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "bluffs", model = "apa_mp_apa_yacht_jacuzzi_ripple1",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "bluffs", model = "apa_mp_apa_yacht_radar_01a",x=-1997.62, y=-1524.73, z=18.54, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "bluffs", model = "apa_mp_apa_y3_l2c",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	---Vespucci Beach---
	{location = "vespucci", model = "apa_MP_Apa_Yacht",x=-1995.72500000, y=-1523.69400000, z=5.42997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "vespucci", model = "apa_MP_Apa_Yacht_Win",x=-1995.72500000, y=-1523.69400000, z=5.42995500, pitch = 0.0 , roll = 0.0 , yaw = 322.0  },
	{location = "vespucci", model = "apa_mp_apa_yacht_o3_rail_b",x=-1995.72500000, y=-1523.69400000, z=19.99997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "vespucci", model = "apa_mp_apa_yacht_option3",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "vespucci", model = "apa_MP_Apa_Yacht_Jacuzzi_Cam",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0 , yaw = 0.0},
	{location = "vespucci", model = "apa_mp_apa_yacht_jacuzzi_ripple003",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "vespucci", model = "apa_mp_apa_yacht_jacuzzi_ripple1",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "vespucci", model = "apa_mp_apa_yacht_radar_01a",x=-1997.62, y=-1524.73, z=18.54, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "vespucci", model = "apa_mp_apa_y3_l2c",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	---LSIA---
	{location = "lsia", model = "apa_MP_Apa_Yacht",x=-1995.72500000, y=-1523.69400000, z=5.42997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "lsia", model = "apa_MP_Apa_Yacht_Win",x=-1995.72500000, y=-1523.69400000, z=5.42995500, pitch = 0.0 , roll = 0.0 , yaw = 322.0  },
	{location = "lsia", model = "apa_mp_apa_yacht_o3_rail_b",x=-1995.72500000, y=-1523.69400000, z=19.99997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "lsia", model = "apa_mp_apa_yacht_option3",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "lsia", model = "apa_MP_Apa_Yacht_Jacuzzi_Cam",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0 , yaw = 0.0},
	{location = "lsia", model = "apa_mp_apa_yacht_jacuzzi_ripple003",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "lsia", model = "apa_mp_apa_yacht_jacuzzi_ripple1",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "lsia", model = "apa_mp_apa_yacht_radar_01a",x=-1997.62, y=-1524.73, z=18.54, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "lsia", model = "apa_mp_apa_y3_l2c",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	---Burro--
	{location = "burro", model = "apa_MP_Apa_Yacht",x=-1995.72500000, y=-1523.69400000, z=5.42997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "burro", model = "apa_MP_Apa_Yacht_Win",x=-1995.72500000, y=-1523.69400000, z=5.42995500, pitch = 0.0 , roll = 0.0 , yaw = 322.0  },
	{location = "burro", model = "apa_mp_apa_yacht_o3_rail_b",x=-1995.72500000, y=-1523.69400000, z=19.99997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "burro", model = "apa_mp_apa_yacht_option3",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "burro", model = "apa_MP_Apa_Yacht_Jacuzzi_Cam",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0 , yaw = 0.0},
	{location = "burro", model = "apa_mp_apa_yacht_jacuzzi_ripple003",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "burro", model = "apa_mp_apa_yacht_jacuzzi_ripple1",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "burro", model = "apa_mp_apa_yacht_radar_01a",x=-1997.62, y=-1524.73, z=18.54, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "burro", model = "apa_mp_apa_y3_l2c",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	---Palomino---
	{location = "palomino", model = "apa_MP_Apa_Yacht",x=-1995.72500000, y=-1523.69400000, z=5.42997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "palomino", model = "apa_MP_Apa_Yacht_Win",x=-1995.72500000, y=-1523.69400000, z=5.42995500, pitch = 0.0 , roll = 0.0 , yaw = 322.0  },
	{location = "palomino", model = "apa_mp_apa_yacht_o3_rail_b",x=-1995.72500000, y=-1523.69400000, z=19.99997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "palomino", model = "apa_mp_apa_yacht_option3",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "palomino", model = "apa_MP_Apa_Yacht_Jacuzzi_Cam",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0 , yaw = 0.0},
	{location = "palomino", model = "apa_mp_apa_yacht_jacuzzi_ripple003",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "palomino", model = "apa_mp_apa_yacht_jacuzzi_ripple1",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "palomino", model = "apa_mp_apa_yacht_radar_01a",x=-1997.62, y=-1524.73, z=18.54, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "palomino", model = "apa_mp_apa_y3_l2c",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	---Wind Farm---
	{location = "wind", model = "apa_MP_Apa_Yacht",x=-1995.72500000, y=-1523.69400000, z=5.42997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "wind", model = "apa_MP_Apa_Yacht_Win",x=-1995.72500000, y=-1523.69400000, z=5.42995500, pitch = 0.0 , roll = 0.0 , yaw = 322.0  },
	{location = "wind", model = "apa_mp_apa_yacht_o3_rail_b",x=-1995.72500000, y=-1523.69400000, z=19.99997000, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "wind", model = "apa_mp_apa_yacht_option3",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "wind", model = "apa_MP_Apa_Yacht_Jacuzzi_Cam",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0 , yaw = 0.0},
	{location = "wind", model = "apa_mp_apa_yacht_jacuzzi_ripple003",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "wind", model = "apa_mp_apa_yacht_jacuzzi_ripple1",x=-2037.07, y=-1493.86, z=5.30, pitch = 0.0, roll = 0.0, yaw = 0.0 },
	{location = "wind", model = "apa_mp_apa_yacht_radar_01a",x=-1997.62, y=-1524.73, z=18.54, pitch = 0.0, roll = 0.0, yaw = 322.0 },
	{location = "wind", model = "apa_mp_apa_y3_l2c",x=-1995.72500000, y=-1523.69400000, z=20.0, pitch = 0.0, roll = 0.0, yaw = 322.0 },
}
