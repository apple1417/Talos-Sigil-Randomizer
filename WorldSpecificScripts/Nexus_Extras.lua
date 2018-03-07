SIGSTRM12GIS             ���#                  Signkey.EditorSignatureC�uĖƳ�ֿe
 4����O��LW��䞷Ң�1�3n�<  Sa��D�H�����f�� ��Q0-��h�{Ƙ��&��� �����z.�-%~���=Ym�]�;��L) ,l5з���M�Z�O������������4�1��}��Jz��IDD\ݶ�x��G�O�9d,��k��S�}��0b�1ײ��H��g��i܎!Ke~:Q�4x�C"�WF�10F��b�L��\b��﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

if talosProgress:IsVarSet("Randomizer_NoGates") then
  Gates:AssureOpened()
end

Wait(CustomEvent("Randomizer_Finished"))
eternalizeText:SetText(eternalizeText:GetTextConfig(), "Seed: " .. talosProgress:GetCodeValue("Randomizer_Seed"), true)
trancendenceText:SetText(trancendenceText:GetTextConfig(), "Seed: " .. talosProgress:GetCodeValue("Randomizer_Seed"), true)

if talosProgress:IsVarSet("Randomizer_Portals") then
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
      portalList[i]:SetPlacement(OOB)
    else
      portalList[i]:SetPlacement(portalLocations[locationNum])
      if talosProgress:IsVarSet("Randomizer_Debug") then
        conWarningF(string.format("Placing %s at %s\n", portalList[i]:GetName(),  portalNames[locationNum]))
      end
    end
  end
else
  DevIslandNumber:Disappear()
end

local A1Location = talosProgress:GetCodeValue("A1")
if A1Location < 8 then
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
elseif 9 < A1Location and A1Location < 17 then
  ALowerGate:Disappear()
  ALowerArranger:Disappear()
  ALowerLight:Deactivate()
  BUpperGate:Disappear()
  BUpperArranger:Disappear()
  BUpperLight:Deactivate()
  CLowerGate:Disappear()
  CLowerArranger:Disappear()
  CLowerLight:Deactivate()
elseif 17 < A1Location then
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
end
03���HΪ��������0���V�/���u�Q-����M�r>M��;��71�+��#���;��<
���])���QaU��0oC��R;^���7oډ�Nx����;me�|��.�:��޲�C��ے��C��;��]�P�M��h%qBU��"󴅌o�H ޗ��ayr&))4ʙ %y��%~���E<4��mK=�؉J���[Yp�s�q8	F�6V����f�]pB���IâP����&�또0����