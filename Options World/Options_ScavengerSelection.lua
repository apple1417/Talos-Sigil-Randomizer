SIGSTRM12GIS             �7�                  Signkey.EditorSignature��'���� �+���S�t�u�δ.�;/y�?�'Z9�h�)O�-+��z�Z� �8g�7a�I1�?����g-1/��h�fĨ)C�B�?<C�,���!�+ц���w'��Z�$ �'�<�;Z}`ދw�����u^�� �#������!�uA�y�o$�Y�I��[��>�2e:pHx��zR���0!����k����"bh9t�e����~P���_Z���X�o��:Uq���d�Qtpd��W�"﻿Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))
local Scavenger = worldGlobals.Randomizer.Scavenger

local offset = GreenButtons[1]:GetPlacement():GetVect() - GrayButtons[1]:GetPlacement():GetVect()
offset = offset / 2

local buttonIndex = 1
for i = 1, #Scavenger.AsArray do
  if Scavenger.AsArray[i] ~= Scavenger.Values.Off then
    GrayButtons[buttonIndex]:EnableUsage()
    GrayTexts[buttonIndex]:SetText(
      GrayTexts[buttonIndex]:GetTextConfig(),
      Scavenger.AsArray[i].name,
      true
    )
    GreenTexts[buttonIndex]:SetText(
      GreenTexts[buttonIndex]:GetTextConfig(),
      Scavenger.AsArray[i].name,
      true
    )
    buttonIndex = buttonIndex + 1
  end
end

local emptyButton = {}
for i = #Scavenger.AsArray + 1, #GrayButtons do
  emptyButton[i] = true
  GrayButtons[i]:EnableUsage()
end

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local currentIndex = 0
RunHandled(WaitForever,
  OnEvery(Any(Events(GrayButtons.Used))),
  function(event)
    local index = event.any.signaledIndex
    if emptyButton[index] then
      worldGlobals.Randomizer.pressButton(GrayButtons[index], nil, offset, true)
    else
      worldGlobals.Randomizer.pressButton(
        GrayButtons[index], GreenButtons[index],
        offset, false,
        function()
          talosProgress:SetVarValue(
            Scavenger.talosProgress,
            Scavenger.AsArray[index].id
          )
          if currentIndex ~= 0 then
            GrayButtons[currentIndex]:EnableUsage()
            worldGlobals.Randomizer.swapPos(GrayButtons[currentIndex], GreenButtons[currentIndex])
          end
          currentIndex = index
          talosProgress:SetVarValue(
            Scavenger.talosProgress,
            Scavenger.AsArray[index].id
          )
          SignalEvent("Randomizer_ScavengerOn")
        end
      )
    end
  end,
  OnEvery(Any(Events(GreenButtons.Used))),
  function()
    SignalEvent("Randomizer_ScavengerOff")
  end,
  OnEvery(CustomEvent("Randomizer_ScavengerOff")),
  function()
    worldGlobals.Randomizer.pressButton(
      GreenButtons[currentIndex], GrayButtons[currentIndex],
      offset, false,
      function()
        currentIndex = 0
        talosProgress:ClearVar(Scavenger.talosProgress)
      end
    )    
  end
)�l����N>0ԟcx��u�+ο7j���h���U��W���B�iZ*�`�=���?9 �1M�߄��6���h.[�.��W��jcp&)�~��p��^���_�W_�����K^RkI���wLy��{�!qG�s��8�:(�>�#�<��Y%y2,�A^v��t}�jq,�C@�>�5`Iz�~����&��P�̆������$E:k�ne&jpx2�x�<���סBL$��;�)��1��_a�-J^�