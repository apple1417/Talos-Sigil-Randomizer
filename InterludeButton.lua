SIGSTRM12GIS             �K��                  Signkey.EditorSignature�oNm\{� cO�7�*�2�`g1�,G�~���=W)�n[q�>ww�7�ۖ��⻺�b�ͬ;�n��ȜޱF����_wHb�h��q.�zo���Fc"x���X�W��B��ov��<y`�Ӆ��N����1��'����$��5�������:?�QFbFq��������GS������ �'A즺A���H���'�Z�z��@dZ�t)��9I�P}�;���.��x�@��%���dM*]5X���)M
� _���!﻿Wait(CustomEvent("Randomizer_PortalFound"))
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
end�.�3��l�*����Ձ���>���4[�,����:8TW�˗���Į�|�L��x(��鴐�Ϋ=%;Ͳλ�h�����^p��үgy�����Sb���2�Vu�:���D��$3�����+GC�?���]|��������5S{��3jY"[��I��G��Z�N��C#�A�hs�4���$N� ����8��Ή+,2
Յb�U��UHOmנ��g����)�.s"D�"\C�?x���	]