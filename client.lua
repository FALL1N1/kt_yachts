local yx = -381.773
local yy = 6946.96
local yz = 5.429955
local yo = 0
local yr = 0.1

local o = {}

-- blips
local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=}, 
     {title="Yacht", colour=37, id=455, x = yx, y = yy, z = yz}, 
  } 
  
local yacht_exterior = {
	
	-- radar / antenna on roof
	[1] = GetHashKey("apa_mp_apa_yacht_radar_01a"),
	
	-- yacht 3rd upgrade
	[2] = GetHashKey("apa_mp_apa_yacht_option3"),
	
	-- silver (a) or golden(b) rails
	-- o1, o2, o3
	[3] = GetHashKey("apa_mp_apa_yacht_o3_rail_b"),
	
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
	
	-- invisible object containing the yacht itself, must be at the center of the yacht
	[10] = GetHashKey("apa_ch2_superyacht_refproxy012"),
	
	-- flag for the pole
	[11] = GetHashKey("prop_flag_usboat"),
	
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

function main()
	Citizen.CreateThread(function()
	
	-- in case we are reloading the plugin
	unLoadYachts() 
	--for i=1,#yacht_exterior do 
	--	DeleteObject(yacht_exterior[i])
	--end

	loadYachts() -- load all yachts from the maps
	createBlips() -- create blips for all yachts 
	
	Wait(100) -- wait 1s till proceed
	 
	-- Yacht is now spawned, let's proceed
    local obj_Yacht = GetClosestObjectOfType(yx, yy, yz, 0.1, GetHashKey('apa_mp_apa_yacht'))
 
	 
    for i=1,#yacht_exterior do
      local pos = GetEntityCoords(obj_Yacht)
      local h = GetEntityHeading(obj_Yacht)
     
      if i == 1 then
        o[i] = CreateObject(yacht_exterior[i], pos.x+1.715, pos.y-1.05, pos.z+13.05, true, true, true)
      elseif i == 2 then
        o[i] = CreateObject(yacht_exterior[i], pos.x, pos.y, pos.z-5.227, true, true, true)
      elseif i == 3 then
        o[i] = CreateObject(yacht_exterior[i], pos.x, pos.y, pos.z-7.225, true, true, true)
      elseif i == 5 then
        o[i] = CreateObject(yacht_exterior[i], pos.x, pos.y, pos.z-4.05, true, true, true)
      elseif i == 6 then
        o[i] = CreateObject(yacht_exterior[i], pos.x-13.9, pos.y-49.0, pos.z-0.9, true, true, true)
      elseif i == 7 then
        o[i] = CreateObject(yacht_exterior[i], pos.x-13.9, pos.y-49.0, pos.z-0.9, true, true, true)
      elseif i == 10 then
        o[i] = CreateObject(yacht_exterior[i], pos.x, pos.y, pos.z, true, true, true)
      else
        o[i] = CreateObject(yacht_exterior[i], pos.x, pos.y, pos.z-5.227, true, true, true)
         --o[i] = CreateObject(yacht_exterior[i], pos.x, pos.y, pos.z, true, true, true)
      end
      SetEntityHeading(o[i], h)
    end
	Wait(100)
		tlog(GetEntityCoords(o[2]) .. "\n")
    SetObjectTextureVariant(obj_Yacht, YachtPaintVariants[15]) -- Set main colour for the yacht (models differ, the roof, upgrades etc..)
    SetObjectTextureVariant(o[1], YachtPaintVariants[15]) -- Set main colour for the radar
    SetObjectTextureVariant(o[2], YachtPaintVariants[15]) -- Set main colour for the yacht (models differ, the roof, upgrades etc..)
    -- SetObjectTextureVariant(obj_YachtExtUpgrade, YachtPaintVariants[15]) -- Set main colour for the yacht exteriors
    -- SetObjectTextureVariant(obj_YachtFireworkLauncher, YachtPaintVariants[15]) -- Set main colour for the yacht exteriors
	-- make the ocean calmer /temp fix until we resolve the yacht movement/
	while true do
		Wait(0)
		Citizen.InvokeNative(0xC54A08C85AE4D410, 0.5)
	end
  end)
end 

AddEventHandler('onClientResourceStop', function(res)
	Citizen.CreateThread(function()
	
	  	for i=1,#yacht_exterior do
			RequestModel(yacht_exterior[i])
		end
	
		for i=1,#yacht_exterior do 
		  DeleteObject(yacht_exterior[i])
		end
		 
		unLoadYachts()
		
	end)
end)

function setupYachtPaint() 

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

function loadYachts()
	RequestIpl("apa_ch2_superyacht")
	RequestIpl("apa_yacht_grp01_1")
	RequestIpl("apa_yacht_grp01_1_int")
	RequestIpl("apa_yacht_grp01_1_lod")
	RequestIpl("apa_yacht_grp01_2")
	RequestIpl("apa_yacht_grp01_2_int")
	RequestIpl("apa_yacht_grp01_2_lod")
	RequestIpl("apa_yacht_grp01_3")
	RequestIpl("apa_yacht_grp01_3_int")
	RequestIpl("apa_yacht_grp01_3_lod")
	RequestIpl("apa_yacht_grp02_1")
	RequestIpl("apa_yacht_grp02_1_int")
	RequestIpl("apa_yacht_grp02_1_lod")
	RequestIpl("apa_yacht_grp02_2")
	RequestIpl("apa_yacht_grp02_2_int")
	RequestIpl("apa_yacht_grp02_2_lod")
	RequestIpl("apa_yacht_grp02_3")
	RequestIpl("apa_yacht_grp02_3_int")
	RequestIpl("apa_yacht_grp02_3_lod")
	RequestIpl("apa_yacht_grp03_1")
	RequestIpl("apa_yacht_grp03_1_int")
	RequestIpl("apa_yacht_grp03_1_lod")
	RequestIpl("apa_yacht_grp03_2")
	RequestIpl("apa_yacht_grp03_2_int")
	RequestIpl("apa_yacht_grp03_2_lod")
	RequestIpl("apa_yacht_grp03_3")
	RequestIpl("apa_yacht_grp03_3_int")
	RequestIpl("apa_yacht_grp03_3_lod")
	RequestIpl("apa_yacht_grp04_1")
	RequestIpl("apa_yacht_grp04_1_int")
	RequestIpl("apa_yacht_grp04_1_lod")
	RequestIpl("apa_yacht_grp04_2")
	RequestIpl("apa_yacht_grp04_2_int")
	RequestIpl("apa_yacht_grp04_2_lod")
	RequestIpl("apa_yacht_grp04_3")
	RequestIpl("apa_yacht_grp04_3_int")
	RequestIpl("apa_yacht_grp04_3_lod")
	RequestIpl("apa_yacht_grp05_1")
	RequestIpl("apa_yacht_grp05_1_int")
	RequestIpl("apa_yacht_grp05_1_lod")
	RequestIpl("apa_yacht_grp05_2")
	RequestIpl("apa_yacht_grp05_2_int")
	RequestIpl("apa_yacht_grp05_2_lod")
	RequestIpl("apa_yacht_grp05_3")
	RequestIpl("apa_yacht_grp05_3_int")
	RequestIpl("apa_yacht_grp05_3_lod")
	RequestIpl("apa_yacht_grp06_1")
	RequestIpl("apa_yacht_grp06_1_int")
	RequestIpl("apa_yacht_grp06_1_lod")
	RequestIpl("apa_yacht_grp06_2")
	RequestIpl("apa_yacht_grp06_2_int")
	RequestIpl("apa_yacht_grp06_2_lod")
	RequestIpl("apa_yacht_grp06_3")
	RequestIpl("apa_yacht_grp06_3_int")
	RequestIpl("apa_yacht_grp06_3_lod")
	RequestIpl("apa_yacht_grp07_1")
	RequestIpl("apa_yacht_grp07_1_int")
	RequestIpl("apa_yacht_grp07_1_lod")
	RequestIpl("apa_yacht_grp07_2")
	RequestIpl("apa_yacht_grp07_2_int")
	RequestIpl("apa_yacht_grp07_2_lod")
	RequestIpl("apa_yacht_grp07_3")
	RequestIpl("apa_yacht_grp07_3_int")
	RequestIpl("apa_yacht_grp07_3_lod")
	RequestIpl("apa_yacht_grp08_1")
	RequestIpl("apa_yacht_grp08_1_int")
	RequestIpl("apa_yacht_grp08_1_lod")
	RequestIpl("apa_yacht_grp08_2")
	RequestIpl("apa_yacht_grp08_2_int")
	RequestIpl("apa_yacht_grp08_2_lod")
	RequestIpl("apa_yacht_grp08_3")
	RequestIpl("apa_yacht_grp08_3_int")
	RequestIpl("apa_yacht_grp08_3_lod")
	RequestIpl("apa_yacht_grp09_1")
	RequestIpl("apa_yacht_grp09_1_int")
	RequestIpl("apa_yacht_grp09_1_lod")
	RequestIpl("apa_yacht_grp09_2")
	RequestIpl("apa_yacht_grp09_2_int")
	RequestIpl("apa_yacht_grp09_2_lod")
	RequestIpl("apa_yacht_grp09_3")
	RequestIpl("apa_yacht_grp09_3_int")
	RequestIpl("apa_yacht_grp09_3_lod")
	RequestIpl("apa_yacht_grp10_1")
	RequestIpl("apa_yacht_grp10_1_int")
	RequestIpl("apa_yacht_grp10_1_lod")
	RequestIpl("apa_yacht_grp10_2")
	RequestIpl("apa_yacht_grp10_2_int")
	RequestIpl("apa_yacht_grp10_2_lod")
	RequestIpl("apa_yacht_grp10_3")
	RequestIpl("apa_yacht_grp10_3_int")
	RequestIpl("apa_yacht_grp10_3_lod")
	RequestIpl("apa_yacht_grp11_1")
	RequestIpl("apa_yacht_grp11_1_int")
	RequestIpl("apa_yacht_grp11_1_lod")
	RequestIpl("apa_yacht_grp11_2")
	RequestIpl("apa_yacht_grp11_2_int")
	RequestIpl("apa_yacht_grp11_2_lod")
	RequestIpl("apa_yacht_grp11_3")
	RequestIpl("apa_yacht_grp11_3_int")
	RequestIpl("apa_yacht_grp11_3_lod")
	RequestIpl("apa_yacht_grp12_1")
	RequestIpl("apa_yacht_grp12_1_int")
	RequestIpl("apa_yacht_grp12_1_lod")
	RequestIpl("apa_yacht_grp12_2")
	RequestIpl("apa_yacht_grp12_2_int")
	RequestIpl("apa_yacht_grp12_2_lod")
	RequestIpl("apa_yacht_grp12_3")
	RequestIpl("apa_yacht_grp12_3_int")
	RequestIpl("apa_yacht_grp12_3_lod")
end

function unLoadYachts()

    for i=1,#o do 
        DeleteObject(o[i])  
    end


	RemoveIpl("apa_ch2_superyacht")
	RemoveIpl("apa_yacht_grp01_1")
	RemoveIpl("apa_yacht_grp01_1_int")
	RemoveIpl("apa_yacht_grp01_1_lod")
	RemoveIpl("apa_yacht_grp01_2")
	RemoveIpl("apa_yacht_grp01_2_int")
	RemoveIpl("apa_yacht_grp01_2_lod")
	RemoveIpl("apa_yacht_grp01_3")
	RemoveIpl("apa_yacht_grp01_3_int")
	RemoveIpl("apa_yacht_grp01_3_lod")
	RemoveIpl("apa_yacht_grp02_1")
	RemoveIpl("apa_yacht_grp02_1_int")
	RemoveIpl("apa_yacht_grp02_1_lod")
	RemoveIpl("apa_yacht_grp02_2")
	RemoveIpl("apa_yacht_grp02_2_int")
	RemoveIpl("apa_yacht_grp02_2_lod")
	RemoveIpl("apa_yacht_grp02_3")
	RemoveIpl("apa_yacht_grp02_3_int")
	RemoveIpl("apa_yacht_grp02_3_lod")
	RemoveIpl("apa_yacht_grp03_1")
	RemoveIpl("apa_yacht_grp03_1_int")
	RemoveIpl("apa_yacht_grp03_1_lod")
	RemoveIpl("apa_yacht_grp03_2")
	RemoveIpl("apa_yacht_grp03_2_int")
	RemoveIpl("apa_yacht_grp03_2_lod")
	RemoveIpl("apa_yacht_grp03_3")
	RemoveIpl("apa_yacht_grp03_3_int")
	RemoveIpl("apa_yacht_grp03_3_lod")
	RemoveIpl("apa_yacht_grp04_1")
	RemoveIpl("apa_yacht_grp04_1_int")
	RemoveIpl("apa_yacht_grp04_1_lod")
	RemoveIpl("apa_yacht_grp04_2")
	RemoveIpl("apa_yacht_grp04_2_int")
	RemoveIpl("apa_yacht_grp04_2_lod")
	RemoveIpl("apa_yacht_grp04_3")
	RemoveIpl("apa_yacht_grp04_3_int")
	RemoveIpl("apa_yacht_grp04_3_lod")
	RemoveIpl("apa_yacht_grp05_1")
	RemoveIpl("apa_yacht_grp05_1_int")
	RemoveIpl("apa_yacht_grp05_1_lod")
	RemoveIpl("apa_yacht_grp05_2")
	RemoveIpl("apa_yacht_grp05_2_int")
	RemoveIpl("apa_yacht_grp05_2_lod")
	RemoveIpl("apa_yacht_grp05_3")
	RemoveIpl("apa_yacht_grp05_3_int")
	RemoveIpl("apa_yacht_grp05_3_lod")
	RemoveIpl("apa_yacht_grp06_1")
	RemoveIpl("apa_yacht_grp06_1_int")
	RemoveIpl("apa_yacht_grp06_1_lod")
	RemoveIpl("apa_yacht_grp06_2")
	RemoveIpl("apa_yacht_grp06_2_int")
	RemoveIpl("apa_yacht_grp06_2_lod")
	RemoveIpl("apa_yacht_grp06_3")
	RemoveIpl("apa_yacht_grp06_3_int")
	RemoveIpl("apa_yacht_grp06_3_lod")
	RemoveIpl("apa_yacht_grp07_1")
	RemoveIpl("apa_yacht_grp07_1_int")
	RemoveIpl("apa_yacht_grp07_1_lod")
	RemoveIpl("apa_yacht_grp07_2")
	RemoveIpl("apa_yacht_grp07_2_int")
	RemoveIpl("apa_yacht_grp07_2_lod")
	RemoveIpl("apa_yacht_grp07_3")
	RemoveIpl("apa_yacht_grp07_3_int")
	RemoveIpl("apa_yacht_grp07_3_lod")
	RemoveIpl("apa_yacht_grp08_1")
	RemoveIpl("apa_yacht_grp08_1_int")
	RemoveIpl("apa_yacht_grp08_1_lod")
	RemoveIpl("apa_yacht_grp08_2")
	RemoveIpl("apa_yacht_grp08_2_int")
	RemoveIpl("apa_yacht_grp08_2_lod")
	RemoveIpl("apa_yacht_grp08_3")
	RemoveIpl("apa_yacht_grp08_3_int")
	RemoveIpl("apa_yacht_grp08_3_lod")
	RemoveIpl("apa_yacht_grp09_1")
	RemoveIpl("apa_yacht_grp09_1_int")
	RemoveIpl("apa_yacht_grp09_1_lod")
	RemoveIpl("apa_yacht_grp09_2")
	RemoveIpl("apa_yacht_grp09_2_int")
	RemoveIpl("apa_yacht_grp09_2_lod")
	RemoveIpl("apa_yacht_grp09_3")
	RemoveIpl("apa_yacht_grp09_3_int")
	RemoveIpl("apa_yacht_grp09_3_lod")
	RemoveIpl("apa_yacht_grp10_1")
	RemoveIpl("apa_yacht_grp10_1_int")
	RemoveIpl("apa_yacht_grp10_1_lod")
	RemoveIpl("apa_yacht_grp10_2")
	RemoveIpl("apa_yacht_grp10_2_int")
	RemoveIpl("apa_yacht_grp10_2_lod")
	RemoveIpl("apa_yacht_grp10_3")
	RemoveIpl("apa_yacht_grp10_3_int")
	RemoveIpl("apa_yacht_grp10_3_lod")
	RemoveIpl("apa_yacht_grp11_1")
	RemoveIpl("apa_yacht_grp11_1_int")
	RemoveIpl("apa_yacht_grp11_1_lod")
	RemoveIpl("apa_yacht_grp11_2")
	RemoveIpl("apa_yacht_grp11_2_int")
	RemoveIpl("apa_yacht_grp11_2_lod")
	RemoveIpl("apa_yacht_grp11_3")
	RemoveIpl("apa_yacht_grp11_3_int")
	RemoveIpl("apa_yacht_grp11_3_lod")
	RemoveIpl("apa_yacht_grp12_1")
	RemoveIpl("apa_yacht_grp12_1_int")
	RemoveIpl("apa_yacht_grp12_1_lod")
	RemoveIpl("apa_yacht_grp12_2")
	RemoveIpl("apa_yacht_grp12_2_int")
	RemoveIpl("apa_yacht_grp12_2_lod")
	RemoveIpl("apa_yacht_grp12_3")
	RemoveIpl("apa_yacht_grp12_3_int")
	RemoveIpl("apa_yacht_grp12_3_lod")
end

function tlog(val)
	Citizen.Trace(val)
end

main()
