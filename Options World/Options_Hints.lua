SIGSTRM12GIS             ����                  Signkey.EditorSignature��,�4\w�?��PTqNw]���
	�E��7�d�� �K|њ_n5����7�F� -$B/�����2���Ҩ}^Y�O�o��?g���\����/���� �}�ݣ_ta�l:4=���1Kh2��P��X��Wwg�a�g�k�����T��e��+�3zÑ�,oe��+���e�}.�"'�% �w�=R(��j\cd���B��]�܅���HEH�	G�f���Y�g���r�6�۳
͹��﻿Wait(CustomEvent("Randomizer_OptionsConstantsLoaded"))
local Hints = worldGlobals.Randomizer.Hints

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local offset = GreenButtons[1]:GetPlacement():GetVect() - GrayButtons[1]:GetPlacement():GetVect()
offset = offset / 2

for i=1, #GrayButtons do
  GrayButtons[i]:EnableUsage()
end


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
lDa��+�*��$K�;e	� p���<�	��y��M���R0ul�o\�r&�w]N���y��h|*�#]�I0�^��t�a$�ec&�}�D��Ơk��hM�,���~}xh����l��>�~�1� ��y����{}��V���</<���NI-�.��LH_*:�V�N_ŀ�U�ӡ�����<��� �����5�Y;��y�����k�5q��c�ZUS�.�^�vt�tk/�=��ߟ@�<  ���*�~|��j