SIGSTRM12GIS             7{a                  Signkey.EditorSignature1�|�?=!�`W')���s����J-O�R�ygc2� ������Je�\���Qܱ�F���EY'��vXv��@�0��^��Y��=9��ܲ��!��>�V�F$��1o�UE����.�{���/A���E6:ɬ�/è�"�h~���5�ZH���d�$_���I	�����9�=�Y�A�zI�9iڎ�*�+S3L<J��T,��b�W�3��h1�͝����'گ_8�9�	����4�&��a�﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
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
)~�r�XF�I�J*�_,9J�s����1������(�ܥ�l�t9�WHkd5��e�i���<�1%Fv�9U9{c�?������h�2�~�{\�����k��Z�	���ޚ�� H��ʓ�d�\ߐlj�b"�j��P�^T!��σ����¬\�p*s�i�
l���+�t���
�4D!r/	[�Q4t����R+����G�C=R�I�7QIi�Y�-Έ鉑��[��4��>�+ddՕ��.{n\��r�