SIGSTRM12GIS             m /�                  Signkey.EditorSignature2h�ua�{�`��c %������7@?��+aH)���d�I�����f��#��y��v�6_�=,�Glm�LG9`DS:��5NY*R�w4��+$�{y��i�p��MnFpϵ8���C��Y�(��a����Sd |ȍ.>�����G4�fƲL:P:��3;�*VH��R*{8�ߔe�!�;����H!�F#&���W�J�
#��7� K/�&��C�Ϊڨ��-��U5��>g���﻿Wait(CustomEvent("Randomizer_Finished"))
local talosProgress = nexGetTalosProgress(worldInfo)
local sigilNum = talosProgress:GetCodeValue(worldGlobals.Randomizer.Puzzles.A3.ABTU.talosProgress)
local ABTU = worldGlobals.Randomizer.allTetros[sigilNum]
sigilNum = talosProgress:GetCodeValue(worldGlobals.Randomizer.Puzzles.A3.LMUStK.talosProgress)
local LMUStK = worldGlobals.Randomizer.allTetros[sigilNum]

RunHandled(WaitForever,
  On(Any(Event(ABTU.Picked), Event(LMUStK.Picked))),
  function()
    detectors_015_020_Exit:Recharge()
    Wait(Any(Events(detectors_015_020_Exit.Activated)))
    local recordedGhost = botManager:SpawnGhostNPC("Recorded Ghost", mkrSpawnPlace)
  end
)���\�1@LM��f+�8+������٨�[�}QHT�L{3:mg`P��>v��������3F�YJ���N���s2+�\]����|yȓ������kjQD�����קQ�@S�r��{�'�A[��L�8��0�ǋs���m*���%U���<��I�_#�	��7�E�ү��>/|ć�UO:��1e�Uݜ�
���m F�Ne_>�������92F7����hڡsl����RbRN�