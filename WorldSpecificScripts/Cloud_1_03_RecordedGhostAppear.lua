SIGSTRM12GIS             G Z                  Signkey.EditorSignature%�c��Vx���e�%��%�!ɩ�㚤`�5���uH2O�	��<�(�U�/|�����,�F�N��?�t�0ߝ2��?��k��i������������ETc"�_�ɶ���%��'송5�vF��c����<۾΋�mMf�ti$=�Y� ��(s�ݸ�n˸��?�Z97�{睩y���!a���I�(��^�V����&sW�XoU���}l���������Hx �i[��;+o��g��K��?�C£�a��a﻿--Wait(CustomEvent("Randomizer_Finished"))
Wait(Delay(0.1))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local sigilNum = talosProgress:GetCodeValue("015_SRT_SPM_000_PM_018")
local ABTU = worldGlobals.allTetros[worldGlobals.tetros[sigilNum]]
sigilNum = talosProgress:GetCodeValue("020_SPM_000_PM_014")
local SwallowedKey = worldGlobals.allTetros[worldGlobals.tetros[sigilNum]]

RunHandled(WaitForever,
  On(Any(Event(ABTU.Picked), Event(SwallowedKey.Picked))), 
  function()
    detectors_015_020_Exit:Recharge()
    Wait(Any(Events(detectors_015_020_Exit.Activated)))
    local recordedGhost = botManager:SpawnGhostNPC("Recorded Ghost", mkrSpawnPlace)
  end
)K���9��\��%m�� ��Mȸ7ڼ�r����!�1�F���У����&1~�a������.8W��mN�%"�t�tiuz2��z�wha��9�~�l}E�Q�}���p�<�\攑���9��G���@a������Y�5�peH���N�k͉T��d����I�a�&<\�{�^��&���Mx3��P��Wk�Y\2,<�X ���$������fʏB��QY��7G,�����ʉڕy����.$<r��iL�