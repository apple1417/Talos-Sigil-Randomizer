SIGSTRM12GIS             �s�                  Signkey.EditorSignature�&�}���rp��R��M���}z�T ̂Q���	���b{��^_h "s�^6��7.��a^�)�$"y�q��d���L��o��TLZ����UP&tbE`:~�`I=o�D4���ν��+Bwi;,�j��P�C	�w�� ���]��܍Y3�K�Wf�I�-t6�v���}d�škm��OZ����^�uQD���&�VEJ�)lImɼh^��f��RὈ�{�rǑ)��H?�1�N�������UFg﻿-- The first cutscene is weird so this makes it safer
Wait(Event(worldInfo.PlayerBorn))

--[[
  Quick failsafe so you know if something went wrong
  Doesn't check talosProgress cause it's also useful to know after generation
]]--
local usingTerminal = false
RunAsync(function()
  Wait(Delay(1))
  if not usingTerminal then
    usingTerminal = true
    terminal:EnableOverlayRendering(true)
    terminal:ClearTexts()
    
    terminal:AddTerminalText("Randomizer_Overlay_Timeout")
    Wait(CustomEvent(terminal, "TerminalEvent_2"))
    
    terminal:ClearTexts()
    terminal:EnableOverlayRendering(false)
    usingTerminal = false
  end
end)

Wait(CustomEvent("Randomizer_Finished"))

-- Incase we finish generation while showing the timeout message
while usingTerminal do
  Wait(CustomEvent("OnStep"))
end
Wait(CustomEvent("OnStep"))
-- We never un-set this now so that we won't show timeout if we get here first
usingTerminal = true

local Randomizer = worldGlobals.Randomizer
local talosProgress = nexGetTalosProgress(worldInfo)
if not talosProgress:IsVarSet(Randomizer.MiscFlags.shownChecksum) then
  talosProgress:SetVar(Randomizer.MiscFlags.shownChecksum)
  
  local sum1 = 0
  local sum2 = 0
  for index=1, #Randomizer.ChecksumMarkers do
    local value = talosProgress:GetCodeValue(Randomizer.ChecksumMarkers[index])
    sum1 = (sum1 + value*index) % 65536
    sum2 = (sum2 + sum1) % 65536
  end
  local checksum = string.format("%08X", sum1 * 65536 + sum2)
  
  local textOrder = {
    "Randomizer_Overlay_Start"
  }
  for char in string.gmatch(checksum, ".") do
    table.insert(textOrder, "Randomizer_Overlay_Hex_" .. char)
  end
  table.insert(textOrder, "Randomizer_Overlay_End")
  
  terminal:EnableOverlayRendering(true)
  terminal:ClearTexts()
  for _, text in pairs(textOrder) do
    terminal:AddTerminalText(text)
    Wait(CustomEvent(terminal, "TerminalEvent_2"))
  end
  terminal:ClearTexts()
  terminal:EnableOverlayRendering(false)
end{��K�@�S�e��DK��E=��bÓ��-���7��G��e�K�����{��3u��`
L[��}��E��Z���f���n*k��W|���#�sW#Ne.L6����`�%��E��xv[#����C{fPj��;����"�e�D�>L �<+v4C��n���le����VE��m��]0�lV+������ٗ�ھ�]���&D��F�������0�0'	w�1��Q6�򱓻�ŭG�