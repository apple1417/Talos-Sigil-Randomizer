SIGSTRM12GIS             �q�=                  Signkey.EditorSignaturehqrk�(�0�x�3˯�@r1V���_���;����4�:d9j2��>Я�-�=F�+��p<f����l�fKc�+�S�
 �7�?2����
�X��=�p�4��)?�����88#�	`�	W�݄kQ�e�d�r/�':�bޙl��
�j�#�B���b��'��V���ӔIèɿ��A�jNg����� Pm���Ch��X?a�����sݸ��E@��t��>�Ue�Šz����n�i�L|�P縙�}:�:j﻿--[[
  There are a few extra things we need to do to get everything setup
   properly, they're all in this script
]]--

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local mode = talosProgress:GetCodeValue("Randomizer_Mode")

-- Can't do this in options world because we can't undo it
if talosProgress:IsVarSet("Randomizer_UnlockItems") then
  talosProgress:AssureUnlockedMechanic("MechanicCube")
  talosProgress:AssureUnlockedMechanic("MechanicRods")
  talosProgress:AssureUnlockedMechanic("MechanicFan")
  talosProgress:AssureUnlockedMechanic("MechanicShield")
  talosProgress:AssureUnlockedMechanic("MechanicTime")
  prjOnMechanicLockingChanged(worldInfo)
end

-- Might need to open the gate
if talosProgress:IsVarSet("Randomizer_NoGates") then
  Gate:AssureOpened()
end

Wait(CustomEvent("Randomizer_Finished"))
local allMarkers = {
  "001_SPM_000_PM_005", "001a_SPM_000_PM_008", "005_SPM_000_PM_009", "006_SPM_000_PM_003",
  "007_SPM_000_PM_006", "008_SPM_000_PM_016", "011_SPM_000_PM_009", "012_SPM_000_PM_004",
  "013_SPM_000_PM_006", "015_SRT_SPM_000_PM_017", "015_SRT_SPM_000_PM_018", "017_SPM_000_PM_023",
  "020_SPM_000_PM_014", "107_SPM_000_PM_007", "108_SPM_000_PM_012", "111_SPM_000_PM_012",
  "112_SPM_000_PM_034", "113_SPM_000_PM_036", "114_SPM_000_PM_032", "115_SRT_TAM_004_PM_016",
  "117_SRT_SPM_000_PM_028", "118_SPM_000_PM_062", "119_SRT_SPM_000_PM_033", "120_SPM_000_PM_029",
  "201_SPM_000_PM_013", "201_SRT_SPM_000_PM_004", "202b_SPM_000_PM_004", "202c_SPM_000_PM_003",
  "202d_SPM_000_PM_002", "202e_SPM_000_PM_004", "202f_SPM_000_PM_003", "203_SPM_000_PM_011",
  "204_SPM_000_PM_004", "205_SPM_000_PM_003", "206_SPM_000_PM_021", "207_SPM_000_PM_005",
  "208_SPM_000_PM_014", "209_SPM_000_PM_012", "210_SPM_000_PM_015", "211_SPM_000_PM_008",
  "212_SPM_000_PM_017", "213_SPM_000_PM_010", "214_SRT_SPM_000_PM_025", "215_SPM_000_PM_013",
  "216_SPM_000_PM_015", "217_SPM_000_PM_040", "218_SPM_000_PM_016", "219_SPM_000_PM_008",
  "220_SPM_000_PM_032", "221_SPM_002_PM_001", "222_SPM_004_PM_001", "223_SPM_000_PM_009",
  "224_SRT_SPM_000_PM_071", "224_SRT_SPM_000_PM_091", "225_SPM_000_PM_044", "226_SPM_000_PM_039",
  "227_SPM_002_PM_033", "229_SPM_000_PM_070", "230_SPM_000_PM_019", "232_SPM_000_PM_012",
  "233_SPM_000_PM_015", "234_SPM_000_PM_015", "235_SRT_SPM_000_PM_037", "238_SPM_000_PM_018",
  "239_SPM_000_PM_018", "244_SPM_000_PM_008", "244_SRT_SPM_000_PM_006", "300a_SPM_000_PM_007",
  "301_SPM_000_PM_010", "302_SPM_000_PM_008", "303_SPM_000_PM_010", "305_SPM_000_PM_004",
  "306_SRT_SPM_000_PM_016", "308_SPM_000_PM_017", "309_SPM_000_PM_018", "310_SPM_000_PM_024",
  "311_SPM_000_PM_041", "312_SPM_000_PM_032", "313_SPM_000_PM_016", "314_SPM_000_PM_012",
  "315_TAM_002_PM_001", "316_SPM_000_PM_014", "317_SPM_000_PM_024", "318_SPM_000_PM_026",
  "319_SPM_000_PM_008", "320_SRT_SPM_000_PM_046", "321_SPM_000_PM_005", "322_SPM_000_PM_008",
  "328_SPM_000_PM_016", "401_SPM_004_PM_008", "402_SPM_000_PM_020", "403_SPM_000_PM_015",
  "404_SPM_000_PM_022", "405_SRT_SPM_000_PM_047", "405_SRT_SPM_000_PM_050", "407_SPM_000_PM_018",
  "408_SPM_000_PM_033", "408_SRT_SPM_000_PM_034", "409_SPM_000_PM_024", "411_SRT_SPM_000_PM_014",
  "414_SPM_000_PM_007", "416_SPM_000_PM_026", "417_SPM_000_PM_029", "418_SPM_000_PM_014",
  "504_SRT_SPM_000_PM_021", "Cloud_1_02_SRT_SPM_000_PM_016", "Cloud_1_02_SRT_SPM_001_PM_003", "Cloud_1_03_SRT_SPM_000_PM_005",
  "Cloud_1_04_SRT_SPM_000_PM_007", "Cloud_1_06_SRT_SPM_000_PM_007", "Cloud_1_07_SRT_SPM_000_PM_021", "Cloud_2_01_SRT_SPM_000_PM_004",
  "Cloud_2_02_SRT_SPM_000_PM_039", "Cloud_2_03_SRT_SPM_002_PM_013", "Cloud_2_04_SRT_SPM_000_PM_017", "Cloud_2_04_SRT_SPM_002_PM_002",
  "Cloud_2_05_SRT_TAM_003_PM_003", "Cloud_2_07_SRT_TAM_001_PM_004", "Cloud_3_01_SRT_SPM_000_PM_017", "Cloud_3_02_SRT_TAM_001",
  "Cloud_3_03_SRT_SPM_000_PM_069", "Cloud_3_05_SRT_SPM_000_PM_035", "Cloud_3_05_SRT_SPM_002_PM_016", "Cloud_3_05_SRT_SPM_003_PM_012",
  "Cloud_3_06_SRT_SPM_000_PM_008", "Cloud_3_07_SRT_SPM_000_PM_021", "Islands_01_SRT_SPM_000_PM_003", "LeapOfFaith_PM_010",
  "Secret_28_SRT_SPM_000_PM_004",
  "PaintItemSeed", "Code_Floor4", "Code_Floor5", "Code_Floor6",
  "A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8", "ADevIsland",
  "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8",
  "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "CMessenger"
}

--[[
  Fletcher Checksum
  Uses all values in the list above
  Not really that useful anymore, but helped worked out when people
   were getting different things on the same seed
]]--
local sum1 = 0
local sum2 = 0
for index=1, #allMarkers do
  local value = talosProgress:GetCodeValue(allMarkers[index])
  if value == -1 then
    conErrorF("'" .. allMarkers[index] .. "' does not have a value assigned to it\n")
  end
  sum1 = (sum1 + value*index) % 65536
  sum2 = (sum2 + sum1) % 65536
end
conInfoF(string.format("\nChecksum: %08X\n\n", sum1 * 65536 + sum2))

-- Give a warning about A1 gate, don't want to get rid of the arranger
if (mode == 1 or mode == 2) and not Arranger:IsSolved() then
  Arranger:DontSaveProgressWhenSolved()
  RunHandled(function() WaitForever() end,
    OnEvery(Event(Arranger.Enter)),
    function()
      worldInfo:ShowMessageToAll("WARNING: Solving this gate can cause softlocks. There are other ways around it.")
    end,
    OnEvery(Event(Arranger.Solved)),
    function()
      worldInfo:ShowMessageToAll("Last chance, if you reset checkpoint now it won't be saved. (Use the pause menu, DON'T hold {plcmdHome})")
    end
  )
end���~״ K��b8uŎ�d0���O�m�~0hnrga��l�lf������\�Z��<�a���Г�1Œw�*q�	�g(�m�)���4�pݳ���ǨկO+t<����Ѹ�ܠ�6^2҂"%���7k�[�a��M:6�֑�9��>U�8��k���\;S��M������W;hn����X �*��V]Fz��k��c�( ��,��/[SU0_6?N�o��^c�^����W�`��-�'��}�����j$�u�\��