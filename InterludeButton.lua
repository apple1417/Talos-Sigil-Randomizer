SIGSTRM12GIS             '��
                  Signkey.EditorSignature
=ϟ�2M�Ǉ�G[�U��H���͹:�2\�{��M��[2�f�J,�n��u!����WKe�ؖ��$�L��s�T6տ�@����T~�3P��O��R�lu2o�������V��)��������8�n�D�&e9u(�.d��J�,�f�6B����&��?�v�M�gP*n���Ԑ��3�QV��k�����+��P�|�7aJ�{�L��������oC.꟧��:0n
���$I�	~�kR��s0��﻿Wait(CustomEvent("Randomizer_PortalFound"))
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
endS�2e�7{lW�r�x�|ԙr`ϧ��,�~)\���Z����\8��FA��Gtdqs�nt��l9�Ȍ����ЭH����51�a3�����p�AD��0�8��ӆf��t�n�0����A.<po��,�"��1u=yځ_E|�<��>_8$�eM��^W���{Y��f��
~o�;��)�܂+�_�7�E���S���9��
��=��p�$������� ���0���`$�QN�3�|�e�����:oI�Q