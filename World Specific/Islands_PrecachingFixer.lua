SIGSTRM12GIS             ���                  Signkey.EditorSignature�7��y�AV�������7`Ѧ�T���{�Ű^Z��O���Lե�(p1oֆv�8�l�*��h}j��^�|��5�2�)W�7xu��:�Lk/�����;]{
˂��xY��T���Kb��|ݑ����q
gX���J,%���8��k��ך*V���37"s�*t9:x0��p��Z��%�ŵD�FMd��Ӓ���V�gpƽ��fY�t|;fm�����Z����B�2�
1���E�${﻿Wait(CustomEvent("Randomizer_Generated"))

--[[
  Workshop maps in general break precaching, let alone when the next world
   to cache can vary from playthrough to playthrough, so I have to manually
   re-implement it
]]--


-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local printWarning = worldGlobals.Randomizer.printWarning
--[[
  Caching causes a bunch of log lines, which spam the console and are kind
   of annoying, so if debug mode or we're in the editor then just don't do it
]]
if talosProgress:IsVarSet(worldGlobals.Randomizer.MiscFlags.debug) or corIsAppEditor() then
  printWarning("Disabling Precaching")
else
  local function cache(world, high)
    if high then
        worldInfo:AddToWorldCache_AsHighPriority("Content/Talos/Levels/Randomizer/" .. world .. ".wld")
    else
      worldInfo:AddToWorldCache("Content/Talos/Levels/Randomizer/" .. world .. ".wld")
    end
  end

  local fileNames = {
    "Cloud_1_01", "Cloud_1_02", "Cloud_1_03", "Cloud_1_04",
    "Cloud_1_05", "Cloud_1_06", "Cloud_1_07", "Cloud_1_08",
    "DeveloperIsland",
    "Cloud_2_01", "Cloud_2_02", "Cloud_2_03", "Cloud_2_04",
    "Cloud_2_05", "Cloud_2_06", "Cloud_2_07", "Cloud_2_08",
    "Cloud_3_01", "Cloud_3_02", "Cloud_3_03", "Cloud_3_04",
    "Cloud_3_05", "Cloud_3_06", "Cloud_3_07", "Cloud_3_08",
    "Islands_01"
  }
  local shortNames = {
    "A1-Portal", "A2-Portal", "A3-Portal", "A4-Portal", "A5-Portal", "A6-Portal", "A7-Portal", "A*-Portal", "AD-Portal",
    "B1-Portal", "B2-Portal", "B3-Portal", "B4-Portal", "B5-Portal", "B6-Portal", "B7-Portal", "B*-Portal",
    "C1-Portal", "C2-Portal", "C3-Portal", "C4-Portal", "C5-Portal", "C6-Portal", "C7-Portal", "C*-Portal", "CM-Portal"
  }
  -- Trims out the folder structure and the filetype
  local currentWorld =

  --[[
    We're always going to be in standard mode, so we always want to cache
     Nexus with high priority
    We'll also cache everything in the same hub with standard priority,
     it's going to take long enough to get between the other worlds that
     Nexus can deal with it
  ]]--
  cache("Nexus", true)
  local minIndex = 0
  local maxIndex = 26
  if worldGlobals.Randomizer.currentWorld == "Content/Talos/Levels/Randomizer/Islands02.wld" then
    minIndex = 0
    maxIndex = 9
  else
    minIndex = 10
    maxIndex = 17
  end

  for i=1, #shortNames do
    local index = talosProgress:GetCodeValue(shortNames[i])
    if minIndex <= index and index <= maxIndex then
      cache(fileNames[i], false)
    end
  end
end
7PWp�2�0�~D����ߊ;�2����M�#?h����ETxK�Q���#�5`d�I9׹xJj<���ӛu�{��y����Ú���Ҟ�qt�q�"�I�o�� қ�)ꑞ��%�>��x��U���mB�؎]������st�w%��)�;�i�"���*��?�D�a�%���d���C�f#o�B����6d:�b�\�8A	4�:t�=h�_�ΐ�1c��+���gX���OEQ�T�+z5�b���)"�