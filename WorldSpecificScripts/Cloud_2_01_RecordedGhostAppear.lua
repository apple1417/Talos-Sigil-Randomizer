SIGSTRM12GIS             y�J^                  Signkey.EditorSignature(�E'\qۦ���Ms�%��1-l�E��vݧ��� +X~U�m���V�2�C�1� �NNEa��I��K�6�Bz���F	�|+���`��6�Z�G�S  ����El�b�����?�.��*ǒ��jbR��r{7�X���u%ni�h�ΐ�iY����g!�������z�Z[�No��?/�Y"#�oE�ti���s�Y{�����\�r�GOHMϚ1�J��b$���B��7g�0|�H$��up��<�1 �.ܖY9���﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local sigilNum = talosProgress:GetCodeValue("319_SPM_000_PM_008")
local RoD = worldGlobals.allTetros[worldGlobals.tetros[sigilNum]]

local elohimVoice_Cease = Depfile("Content/Talos/Locales/enu/Sounds/Voiceovers/Elohim/Elohim-050_Cease.ogg")
local elohimVoice_InTimeOf = Depfile("Content/Talos/Locales/enu/Sounds/Voiceovers/Elohim/Elohim-051_In_the_time_of_your_ancestors.ogg")

RunHandled(WaitForever,
  On(Event(RoD.Picked)), 
  function()
    detector_StartGhost:Recharge()
    Wait(Event(detector_StartGhost.Activated))
    local recordedGhost = botManager:SpawnGhostNPC("Recorded Ghost", mkrSpawnPlace)
    animMover_GhostSound:PlayAnim("Default")
    soundGhostScream:PlayLooping()
    Wait(Delay(5))
    worldGlobals.ElohimSayOnce(elohimVoice_Cease, 0)  
    Wait(Delay(1.5))
    soundGhostScream:Stop()
    Wait(Delay(2))
    worldGlobals.ElohimSayOnce(elohimVoice_InTimeOf, 0)  
  end)
 

8k4{n%�u�K��!=1��L��P0jD�-BNs���`����P_,B������m	=V&�n�/C;��$��M�e�(�oh]���i���8���R��������+NB7O�O�cpH b����Յ�ތ������r�Q��p!�Ά��p��
&4h/�X�s�u�i��\[ҹ>"l 	��d��a!|LD��F�����'DX L��;�ҥ˯.V�׀j�\���<ĺ�I=:%��{��