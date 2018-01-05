SIGSTRM12GIS             -�;                  Signkey.EditorSignature~�/8tl�h�l=�@�����w@��򠄖�N���e�{wq�j?�W��5h3[;���&$�˞�(c����UMS5(�] :������)ؿr��Zy.pbdjm*4�z�D�Ɍ&u���GNx4mɐ	�K�~�]4Db�����F<\������,�)�EH�+�o�7��t8�8G�$c���,�!� ܅�u��E���]V2Gu0?����iE.}�yHS/L�0y��<�)����4*ܓ{ǌ��<�hN�����O�﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local sigilNum = talosProgress:GetCodeValue("319_SPM_000_PM_008")
local RoD = worldGlobals.allTetros[sigilNum]

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
  end)#�� @R�B�����{���M�}�'9���Խl�b��T��Hon�q��)�5Ő��~����JV���TF�G�͸+�\Aٌ7��o_CS7������aR�,�=؀�g�˛&�	�����ʭt�J����ԥu���k��[��H[ ���X���짙t%��a�iu,��L�
}��M��H& (?��@9N����RN{�na#bm5�t��B$�]1��!�̱�g@��'��ܛ���M3