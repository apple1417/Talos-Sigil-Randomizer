SIGSTRM12GIS             `�Zc                  Signkey.EditorSignatureF�V� Iً���IH���ƿ�>���y��B��*�Z*�m�,��k-�)`���.g�6A����XUS���vL����{*<�r1����ڝ�La��B�d+�N��;�`P�D.H�R	eN����LD����l���B�߆�R_�zd\�aO�W^I����g��yJ�.c����?7t�moJƾ|=�*�I��C���b6C��Ӥ�W�5[����.�!X���6�u\�� ,��S@��xfi�`hzkaa��t7M﻿-- talosProgress : CTalosProgress
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
    seed = tostring(mthRndRangeL(0, 2147483647))
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
)%c����cb����UQ�����Ͷ(��铩�׌�R�;_��h+��Ԃ�ęOj�i��yc�;͠"�P�t'\#܄fR-wR��(M:�W��TD&�����:d(�.tY꿿�]>#&����vr��<��vd�
Ď� ,��U	G�<9�F�_�]͠���}W�9O4�wLR\%C��i��sԵ���E�#XH/T⺒㵗(�.�f�\n��"�ܜ�L�Y���� ���
� �cz�uԍQ�N����#