SIGSTRM12GIS             ���                  Signkey.EditorSignature�0���8�fzC��<�R��Hg>�+��Ϝ�O$���q������|W\�e�qU/���<���m�'+�]I�e�������'"p��/������hנ��d��7j*�s�x\��EM�z�����B��z�ǉc�bķ��C�����*a���HN����/G�y����	�F�ɯϣ��֥C2H����!�A��d�*Gi��l�Ϸ���;y��8��y�m[�?{��K18�5�o_�Q'��	�{��﻿Wait(CustomEvent("Randomizer_Finished"))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local sigilNum = talosProgress:GetCodeValue("015_SRT_SPM_000_PM_018")
local ABTU = worldGlobals.allTetros[sigilNum]
sigilNum = talosProgress:GetCodeValue("020_SPM_000_PM_014")
local SwallowedKey = worldGlobals.allTetros[sigilNum]

RunHandled(WaitForever,
  On(Any(Event(ABTU.Picked), Event(SwallowedKey.Picked))),
  function()
    detectors_015_020_Exit:Recharge()
    Wait(Any(Events(detectors_015_020_Exit.Activated)))
    local recordedGhost = botManager:SpawnGhostNPC("Recorded Ghost", mkrSpawnPlace)
  end
)M��?&EM��;�ྐྵ�&| �ޚ��}5O"�aqW��K�S��?4ڤ ��g�.�؏�)!�I��n���W#�[G{�C�Zŗ��z�^�/o��k���m���i�Q�-�d�Fp��>X�3���"��tzr����O�����$��M���m@��g`�,O>����� ��*wv����?gN��I�Ed�T��)���."yP��O(yC�8��G���E�����e�e={8㛏��n���cEn«\�Q0^