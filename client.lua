local yx = -381.773
local yy = 6946.96
local yz = 5.429955
local yo = 0
local yr = 0.1

local o = {}

-- #1 ПОД ЛЕТИЩЕ; ПОСОКА - ЧАСОВНИКОВА
local yachtList = { 
	{yid = 1, title="Yacht", X=-1460.536, Y=-3761.467, Z=5.42997},
	{yid = 2, title="Yacht", X=-2117.581, Y=-2543.346, Z=5.429955},
	{yid = 3, title="Yacht", X=-1605.074, Y=-1872.468, Z=5.429955},
	{yid = 4, title="Yacht", X=-1995.725, Y=-1523.694, Z=5.42997},
	{yid = 5, title="Yacht", X=-2072.941, Y=-1024.157, Z=10.98968},
	{yid = 6, title="Yacht", X=-2697.862, Y=-540.6123, Z=5.429955},
	{yid = 7, title="Yacht", X=-3205.344, Y=-219.0104, Z=5.429955},
	{yid = 8, title="Yacht", X=-3448.254, Y=311.5018, Z=5.429955},
	{yid = 9, title="Yacht", X=-3542.822, Y=1488.25, Z=5.429955},
	{yid = 10, title="Yacht", X=-3280.501, Y=2140.507, Z=5.429955},
	{yid = 11, title="Yacht", X=-3148.379, Y=2807.555, Z=5.429955},
	{yid = 12, title="Yacht", X=-3254.552, Y=3685.677, Z=5.429955},
	{yid = 13, title="Yacht", X=-2814.49, Y=4072.74, Z=5.429955},
	{yid = 14, title="Yacht", X=-2368.441, Y=4697.874, Z=5.429955},
	{yid = 15, title="Yacht", X=-777.4865, Y=6566.907, Z=5.429955},
	{yid = 16, title="Yacht", X=-381.7739, Y=6946.96, Z=5.429955},
	{yid = 17, title="Yacht", X=581.5955, Y=7124.558, Z=5.429955},
	{yid = 18, title="Yacht", X=1396.638, Y=6860.203, Z=5.429955},
	{yid = 19, title="Yacht", X=2004.462, Y=6907.157, Z=5.42997},
	{yid = 20, title="Yacht", X=3490.105, Y=6305.785, Z=5.429955},
	{yid = 21, title="Yacht", X=3751.681, Y=5753.501, Z=5.429955},
	{yid = 22, title="Yacht", X=3684.853, Y=5212.238, Z=5.429955},
	{yid = 23, title="Yacht", X=4250.581, Y=4576.565, Z=5.429955},
	{yid = 24, title="Yacht", X=4225.028, Y=3988.001, Z=5.429955},
	{yid = 25, title="Yacht", X=4204.355, Y=3373.7, Z=5.429955},
	{yid = 26, title="Yacht", X=3784.802, Y=2548.541, Z=5.429955},
	{yid = 27, title="Yacht", X=3404.51, Y=1977.044, Z=5.429955},
	{yid = 28, title="Yacht", X=3411.1, Y=1193.445, Z=5.429955},
	{yid = 29, title="Yacht", X=3021.254, Y=-723.3903, Z=5.429955},
	{yid = 30, title="Yacht", X=3029.018, Y=-1495.702, Z=5.429955},
	{yid = 31, title="Yacht", X=2976.622, Y=-1994.76, Z=5.429955},
	{yid = 32, title="Yacht", X=2490.885, Y=-2428.848, Z=5.429955},
	{yid = 33, title="Yacht", X=2049.79, Y=-2821.624, Z=5.429955},
	{yid = 34, title="Yacht", X=1546.892, Y=-3045.627, Z=5.429955},
	{yid = 35, title="Yacht", X=-351.0608, Y=-3553.323, Z=5.429955},
}

local blips = {
    -- Example {title="", colour= icon colour, id= icon id, x=, y=, z=}, 
	{title="Yacht", colour=37, id=455, x=-1460.536, y=-3761.467, z=5.42997},
	{title="Yacht", colour=37, id=455, x=-2117.581, y=-2543.346, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-1605.074, y=-1872.468, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-1995.725, y=-1523.694, z=5.42997},
	{title="Yacht", colour=37, id=455, x=-2072.941, y=-1024.157, z=10.98968},
	{title="Yacht", colour=37, id=455, x=-2697.862, y=-540.6123, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-3205.344, y=-219.0104, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-3448.254, y=311.5018, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-3542.822, y=1488.25, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-3280.501, y=2140.507, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-3148.379, y=2807.555, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-3254.552, y=3685.677, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-2814.49, y=4072.74, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-2368.441, y=4697.874, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-777.4865, y=6566.907, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-381.7739, y=6946.96, z=5.429955},
	{title="Yacht", colour=37, id=455, x=581.5955, y=7124.558, z=5.429955},
	{title="Yacht", colour=37, id=455, x=1396.638, y=6860.203, z=5.429955},
	{title="Yacht", colour=37, id=455, x=2004.462, y=6907.157, z=5.42997},
	{title="Yacht", colour=37, id=455, x=3490.105, y=6305.785, z=5.429955},
	{title="Yacht", colour=37, id=455, x=3751.681, y=5753.501, z=5.429955},
	{title="Yacht", colour=37, id=455, x=3684.853, y=5212.238, z=5.429955},
	{title="Yacht", colour=37, id=455, x=4250.581, y=4576.565, z=5.429955},
	{title="Yacht", colour=37, id=455, x=4225.028, y=3988.001, z=5.429955},
	{title="Yacht", colour=37, id=455, x=4204.355, y=3373.7, z=5.429955},
	{title="Yacht", colour=37, id=455, x=3784.802, y=2548.541, z=5.429955},
	{title="Yacht", colour=37, id=455, x=3404.51, y=1977.044, z=5.429955},
	{title="Yacht", colour=37, id=455, x=3411.1, y=1193.445, z=5.429955},
	{title="Yacht", colour=37, id=455, x=3021.254, y=-723.3903, z=5.429955},
	{title="Yacht", colour=37, id=455, x=3029.018, y=-1495.702, z=5.429955},
	{title="Yacht", colour=37, id=455, x=2976.622, y=-1994.76, z=5.429955},
	{title="Yacht", colour=37, id=455, x=2490.885, y=-2428.848, z=5.429955},
	{title="Yacht", colour=37, id=455, x=2049.79, y=-2821.624, z=5.429955},
	{title="Yacht", colour=37, id=455, x=1546.892, y=-3045.627, z=5.429955},
	{title="Yacht", colour=37, id=455, x=-351.0608, y=-3553.323, z=5.429955},
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
	-- comment: doubt we'd need it since there are 3 integrated in the third upgrade
	--[4] = GetHashKey("apa_mp_apa_yacht_launcher_01a"),
	
	-- light upgrade ( a - d )
	-- level 1: apa_mp_apa_y3_l1d
	-- level 2: apa_mp_apa_y3_l2d
	[5] = GetHashKey("apa_mp_apa_y3_l2d"),
	
	-- jacuzzi 
	[6] = GetHashKey("apa_mp_apa_yacht_jacuzzi_ripple1"), -- water/jacuzzi effect
	[7] = GetHashKey("apa_mp_apa_yacht_jacuzzi_cam"), -- exists on original model, dunno what it stands for, but it is there
	-- comment: rest are unnecessary?
	--[8] = GetHashKey("apa_mp_apa_yacht_jacuzzi_ripple003"),
	--[9] = GetHashKey("apa_mp_apa_yacht_jacuzzi_ripple2"),
	
	-- invisible object containing the yacht itself, must be at the center of the yacht
	[10] = GetHashKey("apa_ch2_superyacht_refproxy012"),
	
	-- flag for the pole
	-- comment: this is not the proper model, currently there as a placeholder
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
	for i=1,#yacht_exterior do 
		DeleteObject(GetClosestObjectOfType(yx, yy, yz, 0.1, yacht_exterior[i]))
	end
	
	Wait(100)
	loadYachts() -- load all yachts from the maps
	createBlips() -- create blips for all yachts 
	
	Wait(100) -- wait 1s till proceed
	 
	-- Yacht is now spawned, let's proceed
    local obj_Yacht = GetClosestObjectOfType(yx, yy, yz, 0.1, GetHashKey('apa_mp_apa_yacht'))
	SetObjectTextureVariant(obj_Yacht, YachtPaintVariants[15])
	local pos = GetEntityCoords(obj_Yacht)
	local h = GetEntityHeading(obj_Yacht)
	Wait(1000)
	customizeYacht(obj_Yacht, pos, h, 15)
	
	-- After the yacht is built we must use "AttachEntityToEntity" or "AttachEntityToEntityPhysically" so the objects can share movement

	-- make the ocean calmer /temp fix until we resolve the yacht movement/
	while true do
		Wait(0)
		Citizen.InvokeNative(0xC54A08C85AE4D410, 0.5)
	end
  end)
end 
 
AddEventHandler('onClientResourceStart', function(resName)
	Wait(1000)
	loadYachts()
end)

AddEventHandler('onClientResourceStop', function(resName)
	Wait(1000)
	unLoadYachts()
end)


function customizeYacht(yacht_object, pos, h, PaintID) 

    for i=1,#yacht_exterior do 
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
	  elseif i == 11 then
        o[i] = CreateObject(yacht_exterior[i], pos.x-16.15, pos.y-54.5, pos.z+1.2, true, true, true)
      else
        o[i] = CreateObject(yacht_exterior[i], pos.x, pos.y, pos.z+5.227, true, true, true)
         --o[i] = CreateObject(yacht_exterior[i], pos.x, pos.y, pos.z, true, true, true)
      end
		SetActivateObjectPhysicsAsSoonAsItIsUnfrozen(o[i], true)
		SetEntityDynamic(o[i], true)

	SetObjectTextureVariant(o[i], YachtPaintVariants[PaintID])
	SetEntityHeading(o[i], h)
	AttachEntityToEntityPhysically(yacht_object, o[i], i, pos.x, pos.y, pos.z, 0, 0, 0, true, true, false, false, 0, true)
	
	Wait(100)
    end
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
