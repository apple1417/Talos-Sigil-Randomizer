SIGSTRM12GIS             �;g?                  Signkey.EditorSignature5��>�wGm�W��r��@�W���pkjS�e���^~h��)(!�y�~��HIڼ{�Jʈ~�R��n>ۃԯr����O���������K��g��@_�[q!;?�;�G�Dv��RUdn�v��Z������"�|�o��.�ߎ^��r:���>e<�)j��z{�Cy�O��J6�ƺH���7�seD�D滶�x�._���[Ww��.~	Stvjƥ\Z�7#�C���:A�6oж7)�t�4O�@��1�z﻿Wait(CustomEvent("Randomizer_Finished"))
local talosProgress = nexGetTalosProgress(worldInfo)
local sigilNum = talosProgress:GetCodeValue(worldGlobals.Randomizer.Puzzles.B1.RoD.talosProgress)
local RoD = worldGlobals.Randomizer.allTetros[sigilNum]

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
  end)�*���g���[ Z�)˫��K$z�`õd\�務��~�hi��qj8����dL��>P�jKɬ�f�ǣ+e�I�ç0�%pxo�C��3��#�d@�3�XE��������9�u(1�u���<������!RN��F�h�+�����d"�@.��"H�� ���	���%]NghfsF�AV�?ȥ�]�`�RVP���=w[hsm�?<>t�ԇc���6K-�����������؜ӏ�ƥ��������