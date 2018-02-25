SIGSTRM12GIS             ��                  Signkey.EditorSignature��x�KTOi��R��T����*��lG�����^l�����~Jl�o3:3��|�f�C�4[��")�2�a%A�g��~��[ޣ8�jJ�Y�{X��o��t8W��	J�vI�b��}�^ �=� h��K�͘bW.� �i9A�,Ϙ!\z�����N�Fk��[🍕�]����&�E��bi�jM%wdwt�cL�>d��9�w�|qTW0 ��Y��䌜 ˏ<���Y8�h��<?��+3�Xڧ�﻿-- talosProgress : CTalosProgress
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
    end
  end
end
 ���zw�t��q6�X1��j�*|O��)2��>�	����/o?�;jAJ��8]��H?n[#�?s�m�<N��#�{C���R]mE���/&"��(�j������+��z�^g�K&���Φ��  W��)vd�[�3|ʾ����`t�iС����:�C����R���o[�����C���L������xD��^͍��w!��*9t�#HA���s�㠿���u�;�
�7[���˵X�ֻZ�,