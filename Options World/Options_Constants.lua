SIGSTRM12GIS             �
�J                  Signkey.EditorSignature}���ڡ�xE>�v�ǁ�w�����-��#��`�z��!hPO�
�Fx�t��pn��
��2�6�]R�t�#Iepg�P�	"ZO�nD�$o����S��J6�(/�1�zW�צ�2�C���`��x�u��l�����r�˻�;�v+ȹęgSn�L�_J'���4p��& �d3Ulʛ���+u���Hz!���=�����#�����J�4�wP�>��oI��#����`�:Ĥ��Q�[�iw���﻿Wait(CustomEvent("Randomizer_ConstantsLoaded"))

versionText:SetText(
  versionText:GetTextConfig(),
  worldGlobals.Randomizer.version,
  true
)
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
if talosProgress:IsVarSet(worldGlobals.Randomizer.MiscFlags.debug) or corIsAppEditor() then
  worldGlobals.Randomizer.printWarning("Disabling Precaching")
else
  worldInfo:AddToWorldCache_AsHighPriority("Content/Talos/Levels/Randomizer/Cloud_1_01.wld")
end

--[[
  If you somehow get vars saved before you load into the map (e.g.) editor
   then signs break, so this bit resets it
]]--
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
=����{����6|��q�ɦ�K�D�q�Z6�J+t�������WWH��y�� ���Z���̵$:{�&U&�}L��Ѝz��1�7��Vk�J���gxr*�����u��-6w�O�x<�o[�r�eI�UϦGH�iA�� ��O+9��ﰗd2��7a�6�L�aR�N�Tf
$:b.�eri���
͂+�e��*	�5^�q���9�#��OP7�\��Q��l	�E�W�P��'��Y�BΆ� TRp�Z�'b�*�n