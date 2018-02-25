SIGSTRM12GIS             �e�                  Signkey.EditorSignaturejt�j�q}�)��Ml�/ۯ�D�_R�,�S#�+�B_�XyR
~��G�N���.�8����`��C�����x1� {麻�|�;����]ܩ��}ҷN��"�3і����wS��Ll�2�}�����,[
5fio�P��ߺ���)ğ���L�Ft��nߑ�@��._؉����6�M��|S#3� 䌮�qP}��R��k�H�P�4-?a�1I�d��-���4�P֖��?�1܏;�6oy=_T)���﻿Wait(CustomEvent("Randomizer_Finished"))
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local markers = {
{
  "005_SPM_000_PM_009",
  "107_SPM_000_PM_007",
  "006_SPM_000_PM_003",
  "011_SPM_000_PM_009",
  "007_SPM_000_PM_006",
  "012_SPM_000_PM_004",
  "001_SPM_000_PM_005",
  "Cloud_1_02_SRT_SPM_000_PM_016"
},
{
  "008_SPM_000_PM_016",
  "001a_SPM_000_PM_008",
  "013_SPM_000_PM_006",
  "Cloud_1_02_SRT_SPM_001_PM_003"
},
{
  "108_SPM_000_PM_012",
  "015_SRT_SPM_000_PM_018",
  "015_SRT_SPM_000_PM_017",
  "020_SPM_000_PM_014",
  "017_SPM_000_PM_023",
  "Cloud_1_03_SRT_SPM_000_PM_005"
},
{
  "202c_SPM_000_PM_003",
  "202f_SPM_000_PM_003",
  "202b_SPM_000_PM_004",
  "Cloud_1_04_SRT_SPM_000_PM_007",
  "202d_SPM_000_PM_002"
},
{
  "201_SPM_000_PM_013",
  "201_SRT_SPM_000_PM_004",
  "204_SPM_000_PM_004",
  "202e_SPM_000_PM_004",
  "207_SPM_000_PM_005",
  "244_SPM_000_PM_008",
  "244_SRT_SPM_000_PM_006"
},
{
  "111_SPM_000_PM_012",
  "210_SPM_000_PM_015",
  "218_SPM_000_PM_016",
  "303_SPM_000_PM_010",
  "Cloud_1_06_SRT_SPM_000_PM_007"
},
{
  "212_SPM_000_PM_017",
  "305_SPM_000_PM_004",
  "209_SPM_000_PM_012",
  "Cloud_1_07_SRT_SPM_000_PM_021",
  "220_SPM_000_PM_032",
  "211_SPM_000_PM_008"
},
{
  "119_SRT_SPM_000_PM_033",
  "117_SRT_SPM_000_PM_028",
  "115_SRT_TAM_004_PM_016" 
},
{}, -- Dev Island
{
  "203_SPM_000_PM_011",
  "302_SPM_000_PM_008",
  "316_SPM_000_PM_014",
  "319_SPM_000_PM_008",
  "205_SPM_000_PM_003",
  "Cloud_2_01_SRT_SPM_000_PM_004",
},
{
  "213_SPM_000_PM_010",
  "Cloud_2_02_SRT_SPM_000_PM_039",
  "221_SPM_002_PM_001",
  "223_SPM_000_PM_009",
  "120_SPM_000_PM_029"
},
{
  "300a_SPM_000_PM_007",
  "Cloud_2_03_SRT_SPM_002_PM_013",
  "222_SPM_004_PM_001",
  "401_SPM_004_PM_008",
  "409_SPM_000_PM_024"
},
{
  "322_SPM_000_PM_008",
  "321_SPM_000_PM_005",
  "215_SPM_000_PM_013",
  "Cloud_2_04_SRT_SPM_000_PM_017",
  "407_SPM_000_PM_018",
  "310_SPM_000_PM_024",
  "414_SPM_000_PM_007",
  "Cloud_2_04_SRT_SPM_002_PM_002"
},
{
  "314_SPM_000_PM_012",
  "238_SPM_000_PM_018",
  "239_SPM_000_PM_018",
  "311_SPM_000_PM_041",
  "315_TAM_002_PM_001",
  "Cloud_2_05_SRT_TAM_003_PM_003"
},
{
  "208_SPM_000_PM_014",
  "206_SPM_000_PM_021",
  "113_SPM_000_PM_036"
},
{
  "224_SRT_SPM_000_PM_071",
  "118_SPM_000_PM_062",
  "301_SPM_000_PM_010",
  "224_SRT_SPM_000_PM_091",
  "402_SPM_000_PM_020",
  "Cloud_2_07_SRT_TAM_001_PM_004"
},
{
  "214_SRT_SPM_000_PM_025",
  "306_SRT_SPM_000_PM_016",
  "411_SRT_SPM_000_PM_014"
},
{
  "219_SPM_000_PM_008",
  "416_SPM_000_PM_026",
  "114_SPM_000_PM_032",
  "312_SPM_000_PM_032",
  "Cloud_3_01_SRT_SPM_000_PM_017"
},
{
  "403_SPM_000_PM_015",
  "Cloud_3_02_SRT_TAM_001",
  "417_SPM_000_PM_029",
  "217_SPM_000_PM_040",
  "418_SPM_000_PM_014"
},
{
  "225_SPM_000_PM_044",
  "317_SPM_000_PM_024",
  "229_SPM_000_PM_070",
  "318_SPM_000_PM_026",
  "Cloud_3_03_SRT_SPM_000_PM_069"
},
{
  "313_SPM_000_PM_016",
  "405_SRT_SPM_000_PM_050",
  "405_SRT_SPM_000_PM_047",
  "216_SPM_000_PM_015",
  "408_SPM_000_PM_033",
  "408_SRT_SPM_000_PM_034"
},
{
  "328_SPM_000_PM_016",
  "Cloud_3_05_SRT_SPM_003_PM_012",
  "232_SPM_000_PM_012",
  "309_SPM_000_PM_018",
  "Cloud_3_05_SRT_SPM_002_PM_016",
  "404_SPM_000_PM_022",
  "Cloud_3_05_SRT_SPM_000_PM_035"
},
{
  "234_SPM_000_PM_015",
  "Cloud_3_06_SRT_SPM_000_PM_008",
  "226_SPM_000_PM_039",
  "112_SPM_000_PM_034"
},
{
  "230_SPM_000_PM_019",
  "308_SPM_000_PM_017",
  "Cloud_3_07_SRT_SPM_000_PM_021",
  "227_SPM_002_PM_033",
  "233_SPM_000_PM_015"
},
{
  "235_SRT_SPM_000_PM_037",
  "320_SRT_SPM_000_PM_046",
  "504_SRT_SPM_000_PM_021"
},
{
  "Islands_01_SRT_SPM_000_PM_003"
}
}

local worlds = {
  "A1", "A2", "A3", "A4", "A5", "A6", "A7",
  "B1", "B2", "B3", "B4", "B5", "B6", "B7",
  "C1", "C2", "C3", "C4", "C5", "C6", "C7"
}

for index=1, #worlds do
  local worldNum = talosProgress:GetCodeValue(worlds[index])
  local allSolved = true
  for _, v in pairs(markers[worldNum]) do
    assert(talosProgress:IsVarSet(v), "Marker " .. v .. " does not have a sigil assigned to it!")  
    local sigilNum = talosProgress:GetCodeValue(v)
    local sigil = worldGlobals.allTetros[sigilNum]
    if not sigil:IsPicked() then
      allSolved = false
    end
  end
  if allSolved then
    LobbyNumberAnimators[index]:StartAnimation("Off")
  else
    LobbyNumberAnimators[index]:StartAnimation("On")
  end
endW���:O�ge�Zp4KIm`'N�}@h2���� ��?��s�s�r���R����>�*����7�k�?��˛(n��|8��5���]�?�p��C�v]S'yd�j*���RCH�h,D���者e8�Qo/g\8���-�'�
9��z#���� )}�����X�q����~uO�uoF�
�WO]����ef��DUS��G��)X{�r���W���8�r���gp#T�N~<�R|�C\bE&�