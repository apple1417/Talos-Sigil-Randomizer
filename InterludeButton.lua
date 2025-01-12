SIGSTRM12GIS             �C�                  Signkey.EditorSignatureR�eG�>p�[��mD���Π�OL�
ܶ�]�	y���Q-5&�L�M����.Rg���;&��Bk�l݇������9�W�uC���Y�Z�Gn,�8z��[f��Ő�#R^{�5�M+�����c����<B����G�{�"R��fp��ey���
��l��ON�e�Nn���_t
)I5n4�`�#P]���0y+sU�;�=��sB��@�d�9wЎ��K>�k U���a���w3��x��.��9�U﻿Wait(CustomEvent("Randomizer_PortalFound"))
local portal = worldGlobals.Randomizer.portal

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

if talosProgress:GetCodeValue(worldGlobals.Randomizer.Mobius.talosProgress) == 0 then
  -- Hide the button
  GrayButton:Disappear()
  GreenButton:Disappear()
  Pillar:Disappear()
else
  worldInfo:ActivateTimer(10000000)
  worldInfo:AddToWorldCache_AsHighPriority("Content/Talos/Levels/Randomizer/Interlude.wld")

  local OFFSET = GreenButton:GetPlacement():GetVect() - GrayButton:GetPlacement():GetVect()
  OFFSET = OFFSET/1.5
  local PRESS_TIME = 0.2

  -- This is basically the function is Options_Constants.lua, just simplified for this situation
  GrayButton:EnableUsage()
  local isOn = false
  RunHandled(WaitForever,
    OnEvery(Any(Event(GrayButton.Used), Event(GreenButton.Used))),
    function(event)
      RunAsync(function()
        local button, newButton = nil, nil
        if event.any.signaledIndex == 1 then
          button = GrayButton
          newButton = GreenButton
        else
          button = GreenButton
          newButton = GrayButton
        end

        SoundUse:PlayOnce()
        local originalPos = button:GetPlacement()
        local startTime = worldInfo:GetTimePassedFromTimer()
        local startVect = button:GetPlacement():GetVect()
        while true do
          local currentTime = worldInfo:GetTimePassedFromTimer() - startTime
          if currentTime >= PRESS_TIME/2 then
            break
          end
          -- pos : QuatVect
          local pos = button:GetPlacement()
          pos:SetVect(startVect + (OFFSET * 6/5 * currentTime/PRESS_TIME))
          button:SetPlacement(pos)
          Wait(CustomEvent("OnStep"))
        end

        local pos = GrayButton:GetPlacement()
        GrayButton:SetPlacement(GreenButton:GetPlacement())
        GreenButton:SetPlacement(pos)

        pos = portal:GetPlacement()
        portal:SetPlacement(interludePortal:GetPlacement())
        interludePortal:SetPlacement(pos)

        isOn = not isOn
        if isOn then
          worldGlobals.Randomizer.portal = interludePortal
        else
          worldGlobals.Randomizer.portal = portal
        end

        startTime = worldInfo:GetTimePassedFromTimer()
        startVect = newButton:GetPlacement():GetVect()
        while true do
          local currentTime = worldInfo:GetTimePassedFromTimer() - startTime
          if currentTime >= PRESS_TIME/2 then
            break
          end
          local pos = newButton:GetPlacement()
          pos:SetVect(startVect - (OFFSET * 6/5 * currentTime/PRESS_TIME))
          newButton:SetPlacement(pos)
          Wait(CustomEvent("OnStep"))
        end
        newButton:SetPlacement(originalPos)
        newButton:EnableUsage()
      end)
    end
  )
end
A=��SYQ�p$ݽ���
�~��\\�f��	C�.�� �$\&�xml�|�?�^�G[��r}#_�Eq����̔FLv6P��X��Ǩ_B���n1�^>z���5Hߜ�����%-����3�����eEh|W���E��a�6d�]�mfar��"jq!q��Z�T��I�ū`��gĶ�FqME�pO�,���|�h�Rw���!����g1*�ރ�>@r��BAѼ�կ��W�:�tiB�o�B��0�ZK��Wȅ<