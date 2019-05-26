SIGSTRM12GIS             g��?                  Signkey.EditorSignature�/�
�⍲�����X�:ƥ��AH��үc�����ٱr{���1�9l��w�|;�S���rm�����ٺ�/�!�
������7��,X,���|ch;R|�p�����"��Ӏ���8�������Dd�=[�S�ى����/�I�(s <�D��$��K������]��9�p~��*�\��I�B�-X�J��_�,�M�=E����3��<׈������������F������AM�ְ�Z��+\<�﻿Wait(CustomEvent("Randomizer_ConstantsLoaded"))

--[[
  If you somehow get vars saved before you load into the map (e.g.) editor
   then signs break, so this bit resets it
]]--
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local options = worldGlobals.Randomizer.MiscOptions.AsArray
for i = 1, #options do
  talosProgress:ClearVar(options[i].talosProgress)
end
local options = {
  worldGlobals.Randomizer.Seed,
  worldGlobals.Randomizer.Modes,
  worldGlobals.Randomizer.Scavenger,
  worldGlobals.Randomizer.Moody,
  worldGlobals.Randomizer.Uno,
  worldGlobals.Randomizer.Mobius
}
for i = 1, #options do
  talosProgress:ClearVar(options[i].talosProgress)
end

worldInfo:ActivateTimer(10000000)

-- button : CStaticModelEntity
-- newButton : CStaticModelEntity
-- offset : Vector3f
local pressing = {}
local defaultPressTime = 0.2
worldGlobals.Randomizer.pressButton = function(button, newButton, offset, fail, halfwayFunc)    
    RunAsync(function()
      -- Little bit of simultaneous use protection
      while pressing[button] do
        Wait(Delay(0.15))
      end
      local originalButton = button
      pressing[originalButton] = true
         
      -- If not passed as an argument evaluates to false
      local pressTime = defaultPressTime
      if fail then
        offset = offset / 3
        pressTime = pressTime / 1.5
        SoundUseFail:PlayOnce()
      else
        SoundUse:PlayOnce()
      end
        
      -- Save original position incase we exit in the wrong spot
      -- originalPos : QuatVect
      local originalPos = button:GetPlacement()
      
      local startTime = worldInfo:GetTimePassedFromTimer()
      -- startVect : Vector3f
      local startVect = button:GetPlacement():GetVect()
      while true do
        local currentTime = worldInfo:GetTimePassedFromTimer() - startTime
        if currentTime >= pressTime/2 then
          break
        end
        -- pos : QuatVect
        local pos = button:GetPlacement()
        pos:SetVect(startVect + (offset * 6/5 * currentTime/pressTime))
        button:SetPlacement(pos)
        Wait(CustomEvent("OnStep"))
      end
      
      if (type(halfwayFunc) == "function") then
        halfwayFunc()
      end
      if newButton then      
        worldGlobals.Randomizer.swapPos(button, newButton)
        button = newButton
      end
      
      -- Same as the last waiting block, except the offset is now negative
      startTime = worldInfo:GetTimePassedFromTimer()
      startVect = button:GetPlacement():GetVect()
      while true do
        local currentTime = worldInfo:GetTimePassedFromTimer() - startTime
        if currentTime >= pressTime/2 then
          break
        end
        local pos = button:GetPlacement()
        pos:SetVect(startVect - (offset * 6/5 * currentTime/pressTime))
        button:SetPlacement(pos)
        Wait(CustomEvent("OnStep"))
      end

      -- Restore to original position
      button:SetPlacement(originalPos)            
      button:EnableUsage()
      
      pressing[originalButton] = nil
    end)  
end

-- objA : CStaticModelEntity
-- objB : CStaticModelEntity
worldGlobals.Randomizer.swapPos = function(objA, objB)
  -- pos : QuatVect
  local pos = objA:GetPlacement()
  objA:SetPlacement(objB:GetPlacement())
  objB:SetPlacement(pos)
end

Wait(CustomEvent("OnStep"))
SignalEvent("Randomizer_OptionsConstantsLoaded")H��=�3%�3��V�X�"��0L����ş��缛�UV3�p	w!0�"Nt���!o&�!�쐍E %�&I]�NHr���	��أi�s�6"�x3�\�o����r{/2v��i���1G�� `�����"�ߢ�����4Twk�a����-� Vȉ�h,���h�¹�+�xCbt��~EfN���풅�L͋����h���s��.7���,�=���������zv!��;K�����#T�3�[