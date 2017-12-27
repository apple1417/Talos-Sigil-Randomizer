SIGSTRM12GIS             �8,$                  Signkey.EditorSignatureLE	�����C~�7=�M�+��W����i�(;p��֜��(_�]��`EZ57��#�t�(�mB	Q�/['���y��z"� ��pC�/~ �\���+�3�5�Tl;#?�c���p\7����Cм^mmL�xR� �i�s)_U�1�x���n���~�N�[<�T%(`�)���`�
�i����6n��"��IK,��W<��ZCo���N���!�^�%qJG�M�Sg�os�(��XF�i��ά}Z���u6���﻿--Wait(CustomEvent("Randomizer_Finished"))
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
  end)�(���R9؋jK�L<+�,+˙��S�*r_��Hg�ꥁ������ť���]��V�pt����u*��s m}�9񠅞��B� �bFT��5�ػ���m�͒����s�v���wv���!
<�u8{cs�9k%��-82qb�v��5N�lҙ�--G�լA������9�������U����d�Cj>��Oo蛺���t:N^�h���� ٱ %QP�T�;?��B���&��-�1��b���̖��@9��bm