SIGSTRM12GIS             ��eo                  Signkey.EditorSignature}�.>�!wPr��)��b�`m-��F���O�(::`H'�7���c�j�	9�m=y:�Έ�1�B�4��y��x�����olsH��^��CÐ9��N�<b{�S��Q�������Z~�R����ٓ�X6�}����"�� �_���*�pi�	rG�A�EJ�)^�:�Vԛ%3��,���l��H�p��=>?����}�Nݝ�T0d	��	qǶ�R�>Zu��=W��`�Jrj0���lM�&�1p-L��8�﻿-- We want to get the player, but also have to wait for rando setup to finish
local event = Wait(All(Event(worldInfo.PlayerBorn), CustomEvent("Randomizer_Finished")))
 -- player : CPlayerPuppetEntity
local player = event.all[1]:GetBornPlayer()

--[[
  Workshop maps in general break precaching, let alone when the next world
   to cache can vary from playthrough to playthrough, so I have to manually
   re-implement it
]]--


-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
--[[
  Caching causes a bunch of log lines, which spam the console and are kind
   of annoying, so if debug mode or we're in the editor then just don't do it
]]
if talosProgress:IsVarSet(worldGlobals.Randomizer.MiscFlags.debug) or corIsAppEditor() then
  worldGlobals.Randomizer.printWarning("Disabling Precaching")
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
    "Cloud_1_01", "Cloud_1_02", "Cloud_1_03", "Cloud_1_04",
    "Cloud_1_05", "Cloud_1_06", "Cloud_1_07", "Cloud_1_08",
    "Cloud_1_01", "Cloud_1_02", "Cloud_1_03", "Cloud_1_04",
    "Cloud_1_05", "Cloud_1_06", "Cloud_1_07", "Cloud_1_08",
    "Islands_01"
  }

  --[[
    The basic idea for Nexus is to cache everything in the player's hub with
     high priority, and everything else on standard
  ]]--
  local function cacheA()
    cache("Islands_02", true)
    cache("Islands_03", false)
    for i=1, #fileNames do
      cache(fileNames[i], i <= 9)
    end
  end

  local function cacheB()
    cache("Islands_02", false)
    cache("Islands_03", true)
    for i=1, #fileNames do
      cache(fileNames[i], 10 <= i and i <= 17)
    end
  end

  local function cacheC()
    cache("Islands_02", false)
    cache("Islands_03", false)
    for i=1, #fileNames do
      cache(fileNames[i], 18 <= i)
    end
  end

  local function cacheAll()
    cache("Islands_02", false)
    cache("Islands_03", false)
    for i=1, #fileNames do
      cache(fileNames[i], false)
    end
  end

  -- Use the player's y value to try work out what world they're likely to visit next
  local y = player:GetPlacement().vy
  if -100 < y and y <= 0 then
    cacheA()
  elseif -200 < y and y <= -100 then
    cacheB()
  elseif y <= -200 then
    cacheC()
  else
    cacheAll()
  end

  -- If the player goes down an elevator try redo caching, in case they don't reset
  RunHandled(WaitForever,
    OnEvery(Event(AButton.Used)),
    cacheA,
    OnEvery(Event(BButton.Used)),
    cacheB,
    OnEvery(Event(CButton.Used)),
    cacheC
  )
end
$�S���g��Vu�xXYvo�e
�2�D_A�T��I��^��L�\3�RQet֖xl��b(g� �����@���'�3�� �sp�L�{��3��X��G���y�C�\��[�ҧ3��7V���5��>?X�1-t��>����GkG	AmnK��6���X�n�� c̳�t�Ն�Ǿ��E��*�{������<�x��T��0�9AGt�3��N6�N�ى+�g�{�#��>J�[)n�
�Q 9C�