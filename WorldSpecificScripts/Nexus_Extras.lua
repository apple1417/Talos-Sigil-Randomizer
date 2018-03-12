SIGSTRM12GIS             �ٚ                  Signkey.EditorSignature]5�C���h�M�#iB���9��H���0"s�R%�λTc^C��3����&�����&c�#��J =��F7�ʽ�Ş����>�ztL�8���ٶ�[2��X1�;v^q����iV������NbJ�#�q�zR�C�`�]!=���j�ݴ��J�,-*��vΤ#�]�zQ���q��%�����5�0qϭ��1_y9D6�(�w�7�EO+��_�Dղ,>0RԲ(���[o�m�"���w��﻿--[[
  Like "Cloud_1_01_ExtraOptions" there are just a bunch of small
   things we need to do to properly setup this world, all put
   into this script
]]--

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

-- It's easier to open all gates, even the ones that'll dissapear later
if talosProgress:IsVarSet("Randomizer_NoGates") then
  Gates:AssureOpened()
end

Wait(CustomEvent("Randomizer_Finished"))
-- Want the seeds to show up on signs by each ending
eternalizeText:SetText(eternalizeText:GetTextConfig(), "Seed: " .. talosProgress:GetCodeValue("Randomizer_Seed"), true)
trancendenceText:SetText(trancendenceText:GetTextConfig(), "Seed: " .. talosProgress:GetCodeValue("Randomizer_Seed"), true)

-- Because Nexus already has all the portals we can just shuffle them around
if talosProgress:IsVarSet("Randomizer_Portals") then
  --[[
    Because people had trouble remembering dev island was a thing we give
     it a normal portal outline when random portals are on
  ]]--
  DevIslandCover:Disappear()
  
  local portalNames = {
    "A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "ADevIsland",
    "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8",
    "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "CMessenger"
  }
  local portalList = {
    A1, A2, A3, A4, A5, A6, A7, A8, ADevIsland,
    B1, B2, B3, B4, B5, B6, B7, B8,
    C1, C2, C3, C4, C5, C6, C7, C8, CMessenger
  }
  
  local portalLocations = {}
  for i=1, #portalList do
    portalLocations[i] = portalList[i]:GetPlacement()
  end
  local OOB = thisScript:GetPlacement()
  
  for i=1, #portalNames do
    local locationNum = talosProgress:GetCodeValue(portalNames[i])
    if locationNum < 0 then
      conErrorF("Portal " .. portalNames[i] .. " does not have a location assigned to it!\n")
      -- To make sure you notice, incase you're not looking at console
      portalList[i]:SetPlacement(OOB)
    else
      portalList[i]:SetPlacement(portalLocations[locationNum])
      if talosProgress:IsVarSet("Randomizer_Debug") then
        conWarningF(string.format("Placing %s at %s\n", portalList[i]:GetName(),  portalNames[locationNum]))
      end
    end
  end
else
  -- When random portals are off we want to keep dev island hidden
  DevIslandNumber:Disappear()
end

--[[
  Because you can't solve arrangers from behind we need to have
   extra gates incase random portals puts you outside of A
]]--
local A1Location = talosProgress:GetCodeValue("A1")
-- Start in A
if A1Location <= 9 then
  AUpperGate:Disappear()
  AUpperArranger:Disappear()
  AUpperLight:Deactivate()
  BLowerGate:Disappear()
  BLowerArranger:Disappear()
  BLowerWalls:Disappear()
  BLowerLight:Deactivate()
  CLowerGate:Disappear()
  CLowerArranger:Disappear()
  CLowerLight:Deactivate()
-- Start in B
elseif 10 <= A1Location and A1Location <= 17 then
  ALowerGate:Disappear()
  ALowerArranger:Disappear()
  ALowerLight:Deactivate()
  BUpperGate:Disappear()
  BUpperArranger:Disappear()
  BUpperLight:Deactivate()
  CLowerGate:Disappear()
  CLowerArranger:Disappear()
  CLowerLight:Deactivate()
-- Start in C
elseif 18 <= A1Location then
  ALowerGate:Disappear()
  ALowerArranger:Disappear()
  ALowerLight:Deactivate()
  BLowerGate:Disappear()
  BLowerArranger:Disappear()
  BLowerWalls:Disappear()
  BLowerLight:Deactivate()
  CUpperGate:Disappear()
  CUpperArranger:Disappear()
  CUpperLight:Deactivate()
endG]�T`�ՇK�哇�X:�(�W��q6�D�C�"���foN�ϛF��`�d�B���VV2,��x�5����Ϥ_�"��k�����(pͮ8��n����U�[��%e��O���������t���v��I���c	�H�s�>7Bs%c�5@{`l��ם��u�BD��o���̦�X�h�ɹ�����Jy��-@��~SY����ʅ��콺w�~�2�n�h�����:i�Uc˸>�W�̼Ӿ'��#"=΁�