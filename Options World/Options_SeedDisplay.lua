SIGSTRM12GIS             ~��w                  Signkey.EditorSignature��Dn+�j����8�c�o� =@�Z��%i���Ѧ�PZ%���U���Ӻ�������B���'��W�MwW�ᐿs����x���l�d��pۓC�/_#�.� C�E���GV�Qa����|�!�!G���c&�M`��?�t��_m�ɯS�r��N��J���I���:�sd(�6�B�4��z)�քS�k�5�����=/��~�D|��:�n�>� �v�bMI������s9O���{�Ӯ�h���=�W7M�﻿-- Deals with entering seeds

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local seed = "No Seed"
local seedPtr = seedDisplay:GetTextConfig()

--[[
  The buttons are just static models, we need to manually enable usage
  We also need to disable all the lights
]]--
for index=1, #numbers do
  numbers[index]:EnableUsage()
  numberLights[index]:Deactivate()
end
backspace:EnableUsage()
backspaceLight:Deactivate()
clear:EnableUsage()
clearLight:Deactivate()
random:EnableUsage()
randomLight:Deactivate()

RunHandled(
  function()
    WaitForever()
  end,
  
  OnEvery(Any(Events(numbers.Used))),
  function(event)
    local index = event.any.signaledIndex
    local failSeed = true
    if seed == "No Seed" or tonumber(seed) < 214748365 then
      if seed == "No Seed" then
        seed = ""
      end
      if index == 10 then
        seed = seed .. "0"
      else
        seed = seed .. tostring(index)
      end
      -- We can only store 32 bit numbers, and negatives break the prng
      if tonumber(seed) <= 2147483647 then
        seedDisplay:SetText(seedPtr, seed, true)
        talosProgress:SetVarValue("Randomizer_Seed", tonumber(seed))
        failSeed = false
      else
        seed = talosProgress:GetCodeValue("Randomizer_Seed")
      end
    end
    --[[
      This goes in a RunAsync() so that you can press other buttons
       while the selected one goes through the animation
    ]]--
    RunAsync(function()
      if failSeed then
        soundUseFail:PlayOnce()
      else
        soundUse:PlayOnce()
      end
      numbers[index]:PlayAnim("Push")
      numberLights[index]:Activate()
      Wait(Delay(0.6))
      numbers[index]:EnableUsage()
      numberLights[index]:Deactivate()
    end)
  end,
  
  -- The rest of these are basically all the same
  OnEvery(Event(backspace.Used)),
  function()
    if seed ~= "No Seed" then
      if #seed <= 1 then
        seed = "No Seed"
        seedDisplay:SetText(seedPtr, seed, true)
        talosProgress:ClearVar("Randomizer_Seed")
      else
        seed = string.sub(seed, 1, -2)
        seedDisplay:SetText(seedPtr, seed, true)
        talosProgress:SetVarValue("Randomizer_Seed", tonumber(seed))
      end
      soundUse:PlayOnce()
    else
      soundUseFail:PlayOnce()
    end
    RunAsync(function()
      backspace:PlayAnim("Push")
      backspaceLight:Activate()
      Wait(Delay(0.6))
      backspace:EnableUsage()
      backspaceLight:Deactivate()
    end)
  end,
  
  OnEvery(Event(clear.Used)),
  function ()
    if seed ~= "No Seed" then
      seed = "No Seed"
      seedDisplay:SetText(seedPtr, seed, true)
      talosProgress:ClearVar("Randomizer_Seed")
      soundUse:PlayOnce()
    else
      soundUseFail:PlayOnce()
    end
    RunAsync(function()
      clear:PlayAnim("Push")
      clearLight:Activate()
      Wait(Delay(0.6))
      clear:EnableUsage()
      clearLight:Deactivate()
    end)
  end,
  
  OnEvery(Event(random.Used)),
  function()
    seed = tostring(mthRndRangeL(0, 999999))
    seedDisplay:SetText(seedPtr, seed, true)
    talosProgress:SetVarValue("Randomizer_Seed", tonumber(seed))
    soundUse:PlayOnce()
    RunAsync(function()
      random:PlayAnim("Push")
      randomLight:Activate()
      Wait(Delay(0.6))
      random:EnableUsage()
      randomLight:Deactivate()
    end)
  end
)��� T�
�z�VA�f):]ɠnA���rUC�ɕ��hs���@��S�7��؜�&ğ(V�^T|{���p�A��;C�q���� ��ڕ�C�V+�@��8Υ�W)67��gf��}��d-/CŶ�Z�pYjPd!X�q��7#���yD5����eFK����3��4QAѶ�i�7h`+������|ضY�5�zN��˙@[�F��^��E�R^�E�I ������Q�Eۘ�j%�!���7�0,�k��	�