SIGSTRM12GIS             s*��                  Signkey.EditorSignature<=?粣��L��f!{lk0s���H$$�zoM4���"qH��;3$	�
ʓ����'���Am��d<�'�x@���>���ʶc�]��.�n������c���V�(C�%���˭�Yf��6N�v��Sh�d��U��>����X������3^ ��\}����ܷ��[��Ud%����P�Q�빤,�[Y<O0����J����H�$pu�p#�vB��W/�2���?��$}��^�K�$�{�﻿Wait(CustomEvent("Randomizer_Finished"))

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
  local fileToShort = {}
  for i=1, #fileNames do
    fileToShort[fileNames[i]] = shortNames[i]
  end

  -- Trims out the folder structure and the filetype
  local currentWorld = string.sub(worldGlobals.Randomizer.currentWorld, 33, -5)

  --[[
    If we're in standard mode we always want to cache Nexus with high
     priority
    We'll also cache everything in the same hub with standard priority,
     it's going to take long enough to get between the other worlds that
     Nexus can deal with it
  ]]--
  if talosProgress:GetCodeValue(worldGlobals.Randomizer.Mobius.talosProgress) == 0 then
    cache("Nexus", true)
    local portalPos = talosProgress:GetCodeValue(fileToShort[currentWorld])
    local minIndex = 0
    local maxIndex = 26
    if portalPos <= 9 then
     minIndex = 0
      maxIndex = 9
      cache("Islands_02", false)
    elseif 10 <= portalPos and portalPos <= 17 then
      minIndex = 10
      maxIndex = 17
      cache("Islands_03", false)
    else
      minIndex = 18
      maxIndex = 26
    end

    for i=1, #shortNames do
      local index = talosProgress:GetCodeValue(shortNames[i])
      if minIndex <= index and index <= maxIndex then
        cache(fileNames[i], false)
      end
    end

  --[[
    In mobius mode we of course never visit Nexus, so instead we cache
     the next two worlds with high priority, and then the next 6 with
     standard
    If you're just looping through worlds I have a feeling it still won't
     keep up, though nothing I can really do about it
  ]]--
  else
    local nextIndex = talosProgress:GetCodeValue(fileToShort[currentWorld])
    cache(fileNames[nextIndex], true)
    nextIndex = talosProgress:GetCodeValue(shortNames[nextIndex])
    cache(fileNames[nextIndex], true)
    for _=1, 6 do
      nextIndex = talosProgress:GetCodeValue(shortNames[nextIndex])
      cache(fileNames[nextIndex], false)
    end
  end
end
'��M���s�l�!H��&=	$�Jo'/�o5�q���� SX~K�#^���p6j�-�V�����E��_w 1>-oH|j�j�t��D4�$����4�V���(���m����S�4la,xF॔��ߜ�	ǳ�ueY�p����`���o͞�Чi$����K�¥ֱ��B�hh�)�5� ;`g��e��	��ޠ���Hw��~A�����P.�g9�IZ�X�ֈd�HD�3e�-�v�v�����~���