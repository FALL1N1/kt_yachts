-- blips
local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=}, 
     {title="Yacht", colour=37, id=455, x = -396.0, y = 6892.68, z = 5.5734}, 
  } 
  
local items = {
	
	-- radar / antenna on roof
	[1] = GetHashKey("apa_mp_apa_yacht_radar_01a"),
	
	-- yacht 3rd upgrade
	[2] = GetHashKey("apa_mp_apa_yacht_option3"),
	
	-- silver (a) or golden(b) rails
	-- o1, o2, o3
	[3] = GetHashKey("apa_mp_apa_yacht_o3_rail_a"),
	
	-- firework launcher
	[4] = GetHashKey("apa_mp_apa_yacht_launcher_01a"),
	
	-- light upgrade ( a - d )
	-- level 1: apa_mp_apa_y3_l1d
	-- level 2: apa_mp_apa_y3_l2d
	[5] = GetHashKey("apa_mp_apa_y3_l2d"),
	
	-- jacuzzi 
	[6] = GetHashKey("apa_mp_apa_yacht_jacuzzi_ripple1"),
	[7] = GetHashKey("apa_mp_apa_yacht_jacuzzi_cam"),
	[8] = GetHashKey("apa_mp_apa_yacht_jacuzzi_ripple003"),
	[9] = GetHashKey("apa_mp_apa_yacht_jacuzzi_ripple2"),
	
	-- yacht float
	-- apa_prop_yacht_float_1a or apa_prop_yacht_float_1b
	--
	
	
	
	 
}
  
local YachtPaintVariants = {  
    [0] = 0, -- Pacific 
    [1] = 1, -- Azure 
    [2] = 2, -- Nautical
    [3] = 3, -- Continental  
    [4] = 4, -- Battleship
    [5] = 5, -- Intrepid 
    [6] = 6, -- Uniform
    [7] = 7, -- Classico
    [8] = 8, -- Mediterranean
    [9] = 9, -- Command
    [10] = 10, -- Mariner
    [11] = 11, -- Ruby
    [12] = 12, -- Vintage
    [13] = 13, -- Pristine
    [14] = 14, -- Merchant
    [15] = 15, -- Voyager
} 
  
AddEventHandler('onClientResourceStop', function(res)
	Citizen.CreateThread(function()
	
	  	for i=1,#items do
			RequestModel(items[i])
		end
	
		for i=1,#items do 
		  DeleteObject(items[i])
		end
		
			
		local obj_Yacht = GetClosestObjectOfType(-381.77390000, 6946.96000000, 5.42995500, 0.1, GetHashKey('apa_mp_apa_yacht'))
		DeleteObject(obj_Yacht)
		  
		RemoveIpl("apa_ch2_superyacht")
		RemoveIpl("apa_yacht_grp12_3")
		RemoveIpl("apa_yacht_grp12_3_int")
		RemoveIpl("apa_yacht_grp12_3_lod") 
		
	end)
end)

function SetUpYacht()
	Citizen.CreateThread(function()
	createBlips();
	
	-- spawn objects?
  	RequestIpl("apa_ch2_superyacht")
  	RequestIpl("apa_yacht_grp12_3")
  	RequestIpl("apa_yacht_grp12_3_int")
  	RequestIpl("apa_yacht_grp12_3_lod")
	
 
  	for i=1,#items do
  		RequestModel(items[i])
  	end
	
    local obj_Yacht = GetClosestObjectOfType(-381.77390000, 6946.96000000, 5.42995500, 0.1, GetHashKey('apa_mp_apa_yacht'))
	
	Wait(1000)
	
    for i=1,#items do
      local pos = GetEntityCoords(obj_Yacht)
      local h = GetEntityHeading(obj_Yacht)
      local o
      if i == 1 then
        o = CreateObject(items[i], pos.x+1.715, pos.y-1.05, pos.z+13.05, true, true, true)
      elseif i == 3 then
        o = CreateObject(items[i], pos.x, pos.y, pos.z-7.225, true, true, true)
      elseif i == 5 then
        o = CreateObject(items[i], pos.x, pos.y, pos.z-4.05, true, true, true)
      elseif i == 6 then
        o = CreateObject(items[i], pos.x-13.9, pos.y-49.0, pos.z-0.9, true, true, true)
      elseif i == 7 then
        o = CreateObject(items[i], pos.x-13.9, pos.y-49.0, pos.z-0.9, true, true, true)
      elseif i == 8 then
        o = CreateObject(items[i], pos.x-13.9, pos.y-49.0, pos.z-0.9, true, true, true)
      elseif i == 9 then
        o = CreateObject(items[i], pos.x-13.9, pos.y-49.0, pos.z-0.9, true, true, true)
      else
        o = CreateObject(items[i], pos.x, pos.y, pos.z-5.227, true, true, true)
      end
      SetEntityHeading(o, h)
    end
	-- yacht colour
    SetObjectTextureVariant(obj_Yacht, YachtPaintVariants[15]) 
  end)
end 

function createBlips()
  
	-- blips
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 1.0)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end

function setupJacuzzi()
 
	-- if player leaves the jacuzzi
	 if state == 'out' then
		-- ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		-- TriggerEvent('skinchanger:loadSkin', skin)
	 else
		-- TriggerEvent('skinchanger:getSkin', function(skin)
		-- 	local clothesSkin = { ['tshirt_1'] = 0, ['tshirt_2'] = 0, ['torso_1'] = 0, ['torso_2'] = 0,['arms'] = 0, ['arms_2'] = 0, ['pants_1'] = 0, ['pants_2'] = 0 ['shoes_1'] = 0, ['shoes_2'] = 0, }
		-- 	TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
		-- end)
	 end

end



SetUpYacht()
