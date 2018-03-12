SIGSTRM12GIS             ��                  Signkey.EditorSignatureT���#	L_/���eCR]X$r�$����n���Z�H��;�vj��k�;"�O-/>C/]� �����x�)ԺK^,F��<�T�%���.� p�d婸W[AZK�ֹ������m���^')���)�xҏ����� ������C�Dn-Q��3XБ��vdXM.���j�\�{�a>����+��B��������8����e��u��9;G�/�:)K�����ה{7���w/A��52�﻿Wait(CustomEvent("Randomizer_Finished"))
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
  end)���t����p����('-���O_	����Ωe�����ЯY!r ��\m�yޖ�r�!�q�4c�P�'X��)�������<��7�j��Y�cF"��*$���"�����y�)g`y�E��d��^W���P�-#�b�mlq�K��c'_;�fǔ���[�t��|�3��&� �S�_6_^�x��x��Q��d�x C*&^�\ل��Hv@��"�ʦ����	��0��� DK��fqs��:л