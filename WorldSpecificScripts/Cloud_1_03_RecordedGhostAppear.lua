SIGSTRM12GIS             ��u                  Signkey.EditorSignature!Mo7���;�6N|�)�M����J�@d���rd��ug;ͪ�f���=s.zt%��f���7,� WzF�;}Þ��ޝ����kb�t߮�j���{q�*`MLJW���5:�"�ӏ��?PcLG ��ܟ�e�~h�VLN�fx�뷩�� Xe�0�}l�B|���0��h�y�ń�.g��֮�0���v��Iҫ�Sxl^Fےamz|̐�NM���Lݶ_Ci�}�ʄ���j���#Z��w﻿Wait(CustomEvent("Randomizer_Finished"))
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
)���[�\�t[��f<�>O�'7(Z=.�^����Bhi����z�j�|�K�|Of\��\+��"�<Q޾��N��&A�d�O��X���K EbtX�Z]2	����X2<S���Y.�ɷÌ�{�	�|�Q(�R�Z~��@�������a�@�u/c6��9�YL�o�gIhLt��>~>@룄7��;$��h�P����J�AF%���:�ˡ%��d�}��7�WU�=��w�{�Ў��2��R�{`9�:�2�.Ӛ�