SIGSTRM12GIS             ��.                   Signkey.EditorSignature�0���Nt�I`rD����B����D���M8l��ŢU����#�t������<��mon���s��K��M8Y5֊��>��
�E�GN+4�t(+�������s*>I/-���S`'·/rV�:�ˬgc��	Z��쑟۞l�cC^L��{��������ٍDxX$T� !��W�T�:�\�M�o�Oϩ������{�K#�k�xT!�}���j5��D�{��S���dVR�Q{@���z�eH﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local seed = "No Seed"
local seedPtr = seedDisplay:GetTextConfig()

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
      if tonumber(seed) < 2147483647 then
        seedDisplay:SetText(seedPtr, seed, true)
        talosProgress:SetVarValue("Randomizer_Seed", tonumber(seed))
        failSeed = false
      else
        seed = talosProgress:GetCodeValue("Randomizer_Seed")
      end
    end
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
)�4��U�X�������Э֥���I�6-�x��Z�U���l��G�8񉝷��T��|�p�K��l���z��U11_&L�nY�����������9��.yde"E�,�s�S�����G����m9Q(�N�K��4e�� ��n��̐��!�*��l�z����vn���׋� ː��dO�*�d柂���e+���&\���c0�!G�1�'H���*i�0rA�'�G�Xo�g��>(���