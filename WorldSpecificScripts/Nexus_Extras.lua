SIGSTRM12GIS             ���                  Signkey.EditorSignatureds��Spw_�7~�6��hD\�.M�	�z$�@���@>P���0ޡ�'�����:�"��F��Q���qem���b	\uj�ٙ6�͘�ԉ6��uq�;1?�qC��8jj�V�P���E%���uE#C�H$#DH�+(����<N�D��+���� E�G�S6�%��T�4�	�(�ٔ���1�$�-�ߡS%=$^QRȤn�˄-0VJ��]��[s��⥨T�;r�(��dG�Rx﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

if talosProgress:IsVarSet("Randomizer_NoGates") then
  Gates:AssureOpened()
end

if talosProgress:IsVarSet("Randomizer_Portals") then
  --Wait(CustomEvent("Randomizer_Finished"))
  Wait(Delay(0.1))
  
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
d6P*G�x�|㺽3I�i}{1��c���=�D��@On��/w��ɟM%�~%�����d_K^C���[t��͝��ݿ���Pf&���{�(}�l�7"��a�w�Q�,T�w[��hq�d�閝�?#�����+��(ձ�r��ܵ���,7���1���྘ ��#��R�~�e?A����)J�:7L�z,�KDǢQ��`t���;���@��0 tsy��`�$�T�� �I��A��3�=u�@