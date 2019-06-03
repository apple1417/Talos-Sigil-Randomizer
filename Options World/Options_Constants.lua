SIGSTRM12GIS             �i�y                  Signkey.EditorSignature��+�Yy�-��ѧ��b)*��	"��'�,_�'c��{�7��Y-�g�k��F�*��PtIu���i��� ���c����D!�٥�d��jȔ�f�̼�P����U���au��	�=�D�P��y�����`y��
�ڿ��M`�����e{�}Q��Z����q�EŶsQ��jT6���!�!��k"BX��pe����GP�OM(�)Z�`�.��s�wtE�P��ʂ�G7�a�
�"/"�4H堊﻿Wait(CustomEvent("Randomizer_ConstantsLoaded"))

versionText:SetText(
  versionText:GetTextConfig(),
  worldGlobals.Randomizer.version,
  true
)

worldInfo:AddToWorldCache_AsHighPriority("Content/Talos/Levels/Randomizer/Cloud_1_01.wld")

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
  worldGlobals.Randomizer.Mobius,
  worldGlobals.Randomizer.Hints
}
for i = 1, #options do
  talosProgress:ClearVar(options[i].talosProgress)
end
--[[
  Clearing the other flags means we'll get checksum issues if I visit another world,
   so best also clear this to make the main script fix it
]]--
talosProgress:ClearVar(worldGlobals.Randomizer.MiscFlags.generated)

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
SignalEvent("Randomizer_OptionsConstantsLoaded")
��T��>}�#C0�]����d�e�2^�<�CI���1�i
���0�%�����Q��o���.H��T{�j��P����f-�/'/$�	�E�_���S�J���!,�J�&���F1��!�K��nD�����
Γ2~bm�`����8��.��v��h"��Z�w��딭ef�Z�
��Fd��
���ܓ5w��P�9��~��@��>>֪�����B��Q�L�å������T��n��f�@���e: