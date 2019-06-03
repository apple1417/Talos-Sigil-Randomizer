SIGSTRM12GIS             ��	�                  Signkey.EditorSignatureLD�H?(2�1V�e!�M�y֗P��s���~5SdU:��^;�0)���{�7���͕
�op�e�ʹm(�y*��i�Sn��C��7���%m��Я����_o��^M����1�Zg@��_�4�s����7x
5*�}gp#��=5�v�ǁS-����R���Bh_��[$$���v
��Iz��>rNOg���:��hrdtո���⚕��Χ-~�p�Xg��6�z�'^{��7��\����7﻿Wait(CustomEvent("Randomizer_Finished"))

worldInfo:ActivateTimer(10000000)
local ANIMATION_LENGTH = 3
local LOWER_DISTANCE = 3.1
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local function lowerDoor(index, amount)
  -- pos : QuatVect
  local pos = fences[index]:GetPlacement()
  pos.vy = pos.vy - amount
  fences[index]:SetPlacement(pos)
  pos = arrangers[index]:GetPlacement()
  pos.vy = pos.vy - amount
  arrangers[index]:SetPlacement(pos)
end

local sigils = {}
for i = 1, #worldGlobals.Randomizer.worldMarkers do
  local sigilNum = talosProgress:GetCodeValue(worldGlobals.Randomizer.worldMarkers[i]:GetName())
  local sigil = worldGlobals.Randomizer.allTetros[sigilNum]
  sigil:DisablePicking()
  table.insert(sigils, sigil)
end

local lowered = {}
for i = 1, #arrangers do
  if arrangers[i]:IsSolved() then
    lowerDoor(i, LOWER_DISTANCE)
    lowered[i] = true
    sigils[i]:EnablePicking()
  end
end

RunHandled(WaitForever,
  OnEvery(Any(Events(arrangers.Solved))),
  function(event)
    RunAsync(function()
      local index = event.any.signaledIndex
      if lowered[index] then
        return
      end

      barriers[index]:Disable()
      sigils[index]:EnablePicking()

      Wait(Delay(1))

      local startTime = worldInfo:GetTimePassedFromTimer()
      local lastTime = startTime
      sounds[index]:PlayOnce()
      while true do
        local currentTime = worldInfo:GetTimePassedFromTimer()
        if currentTime - startTime >= ANIMATION_LENGTH then
          break
        end

        local amount = LOWER_DISTANCE * (currentTime - lastTime)/ANIMATION_LENGTH
        lowerDoor(index, amount)
        lastTime = currentTime
        Wait(CustomEvent("OnStep"))
      end
    end)
  end
)
��&�0�1��,����	�n*݁���*�M'?R�{�s�⭻�&l6�q���_��SpQ�$�/��I,���R>+�lp���D!���;L��'p>

"��/��Ed"���6z�q��V��08�+�Bu�R��v���.�}��RH�=2:+	�IaJ��u�g�F�Sˉ�������=0�d�^,)R���<*�M��$ꗷgq�pe?}ֽ�6�˕��ǎX~(��v�cU��=i�bDQ,P7�ȟc!���0x~cmd�