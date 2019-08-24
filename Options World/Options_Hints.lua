SIGSTRM12GIS             �<6                  Signkey.EditorSignature9�����D���#?�`7<��xMN��-1���֐��Yǐ��C��_��Fh����D l�t�zs���g�\��+E�K��dE~^7��7	�������汾*~\3�����.bЋ�$I�~0_'�4ZY�Yz�pr��J�=��G��Z	(g�#�D+��BP�{_(?���o\ͼ�O��G�-	9Uu
Ɣ�#n�bgp���B:V`t�?�xx]�����I�W������g��ũ��~�0�(R�K7A﻿Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))
local Hints = worldGlobals.Randomizer.Hints

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local offset = GreenButtons[1]:GetPlacement():GetVect() - GrayButtons[1]:GetPlacement():GetVect()
offset = offset / 2

for i=1, #GrayButtons do
  GrayButtons[i]:EnableUsage()
end

-- Default hints value, make sure to update in Randomizer_Startup.lua
local currentHints = 3584

local val = string.match(prjGetCustomOccasion(), "Randomizer_AutoHints=(%d-);")
if val ~= nil then
  currentHints = tonumber(val)
end

for i=1, #GrayButtons do
  if worldGlobals.Randomizer.checkBit(currentHints, i - 1) then
    worldGlobals.Randomizer.swapPos(GrayButtons[i], GreenButtons[i])

    GrayButtons[i]:DisableUsage()
    GreenButtons[i]:EnableUsage()
  end
end

talosProgress:SetVarValue(Hints.talosProgress, currentHints)

RunHandled(WaitForever,
  OnEvery(Any(Events(GrayButtons.Used))),
  function(event)
    local index = event.any.signaledIndex

    worldGlobals.Randomizer.pressButton(
      GrayButtons[index], GreenButtons[index],
      offset, false,
      function()
        currentHints = currentHints + Hints.AsArray[index].mask
        talosProgress:SetVarValue(Hints.talosProgress, currentHints)
      end
   )
  end,
  OnEvery(Any(Events(GreenButtons.Used))),
  function(event)
    local index = event.any.signaledIndex

    worldGlobals.Randomizer.pressButton(
      GreenButtons[index], GrayButtons[index],
      offset, false,
      function()
        currentHints = currentHints - Hints.AsArray[index].mask
        talosProgress:SetVarValue(Hints.talosProgress, currentHints)
      end
   )
  end
)
QeЍ��1?X2�G�#���i�f�.KdR���ء��.S]h(yJ����*1�B�"����i���;B�m�B ��N�1,���"q #�c!	lr����>=kH �Tɯ�ϊ-�6kw�ҳ]�*�� |T75k[������#��I��Ӝ����dU9�8�W!"�KR�W��@1�[k̼7��:�d�l[�( �f��y�Ql�cP������˟)F�2�_
��S��^�!���y@�aN"{A)��&���