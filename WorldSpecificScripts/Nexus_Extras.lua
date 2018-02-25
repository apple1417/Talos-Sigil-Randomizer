SIGSTRM12GIS             &�J�                  Signkey.EditorSignaturey����$+%��ߠ�q���w�'���W������+�g��x��X8j��]�j��Ϗ��F��$���M��-��W�i=����Կr1�q�����I�l��@��lBp��:�1$�'�dȠ�¶@�P��SZ��ms���uQڜ�|m�p�'�:^�r�!p��k��S�I��{��]gh�_�_k
�&�G��Gth�����.��wn�P�L�7J��uYF!&hNS��n��9b��-�)��p��Њd6﻿-- talosProgress : CTalosProgress
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
�P��`�d��!�()[�45��u�"e�<�,����S�w�I�$(5X��Q �&t�=�2��Ӄ�Ap�h
��h�!�|��@� Wf��Ff��;�8����
t��y�aL	��|P�CB[�uYࣃ����{�K�z
�"Ah4`m��RyU4���s�-���J��}�)^$淅&��!�e�&��xzUJ�Õ�`Y�����רgl����[smn��f��Cz9�֕t