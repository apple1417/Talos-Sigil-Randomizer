SIGSTRM12GIS             ��/6                  Signkey.EditorSignature�TR]Z�.��O��Q�0hn�A��:!��L��e�v�ft�[��0M�"O�ѓ���,m{>��ևʲ�i�T����i#�8��*`Xe�@����I�H�xl�O�a%x��%�@CN�:�(^���e�*m�޽�¹���.��V�F�ԫ[�]��٬�Cq��o��6_����m�8�=����77	�J��T>ʜ>�מq������M�S�X��]
e��vH:y ���'"��g� �`'g<vL�@��﻿Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local seedVar = worldGlobals.Randomizer.Seed.talosProgress
local defaultText = worldGlobals.Randomizer.Seed.default
SeedDisplay:SetText(SeedDisplay:GetTextConfig(), defaultText, true)

for i=1, #Numbers do
  Numbers[i]:EnableUsage()
end
Backspace:EnableUsage()
Clear:EnableUsage()
Random:EnableUsage()

local offset = OffsetMarker:GetPlacement():GetVect() - Backspace:GetPlacement():GetVect()
-- We already have half the gap size, no need to halve again

local seed = "Random Seed"
local awarded = false
RunHandled(WaitForever,  
  OnEvery(Any(Events(Numbers.Used))),
  function(event)
    local index = event.any.signaledIndex
    local failSeed = false
    if seed == defaultText or tonumber(seed) < 214748365 then
      if seed == defaultText then
        seed = ""
      end
      if seed == "0" then
        seed = ""
        failSeed = index == 10
      end
      if index == 10 then
        seed = seed .. "0"
      else
        seed = seed .. tostring(index)
      end
      -- We can only store 32 bit numbers
      if not failSeed and tonumber(seed) <= 2147483647 then
        SeedDisplay:SetText(SeedDisplay:GetTextConfig(), seed, true)
        talosProgress:SetVarValue(seedVar, tonumber(seed))
      else
        seed = tostring(talosProgress:GetVarValue(seedVar))
        failSeed = true
      end
    else
      failSeed = true
    end
    if not awarded and seed == "20171226" then
      Award:PlayOnce()
      awarded = true
    end
    worldGlobals.Randomizer.pressButton(Numbers[index], nil, offset, failSeed)
  end,

  -- The rest of these are basically all the same
  OnEvery(Event(Backspace.Used)),
  function()
    if seed ~= defaultText then
      if #seed <= 1 then
        seed = defaultText
        SeedDisplay:SetText(SeedDisplay:GetTextConfig(), seed, true)
        talosProgress:ClearVar(seedVar)
      else
        seed = string.sub(seed, 1, -2)
        SeedDisplay:SetText(SeedDisplay:GetTextConfig(), seed, true)
        talosProgress:SetVarValue(seedVar, tonumber(seed))
      end
      worldGlobals.Randomizer.pressButton(Backspace, nil, offset)
    else
      worldGlobals.Randomizer.pressButton(Backspace, nil, offset, true)
    end
  end,

  OnEvery(Event(Clear.Used)),
  function()
    if seed ~= defaultText then
      seed = defaultText
      SeedDisplay:SetText(SeedDisplay:GetTextConfig(), seed, true)
      talosProgress:ClearVar(seedVar)
      worldGlobals.Randomizer.pressButton(Clear, nil, offset)
    else
      worldGlobals.Randomizer.pressButton(Clear, nil, offset, true)
    end
  end,

  OnEvery(Event(Random.Used)),
  function()
    seed = tostring(mthRndRangeL(0, 999999))
    SeedDisplay:SetText(SeedDisplay:GetTextConfig(), seed, true)
    talosProgress:SetVarValue(seedVar, tonumber(seed))
    worldGlobals.Randomizer.pressButton(Random, nil, offset)
  end  
);�$�����>5!f����C��{۪'cd���h^(�A�������A�¥�'�H��6�g�U]'F��7�Lل��:5�B�2�s����=�IY�q�ݾb�n���V��l��$�4;�h��8Boyq�����ll��->�CT���D�_�ŭO����3'�bmǵ̘��#��[v��>	�۔��7xa���X���Y�Ujw��2\SH��.^��c�tHN�C�BTw��Z���s�嬊���+�O����