SIGSTRM12GIS             J��f                  Signkey.EditorSignature]o��.VT�%X��J�����m"^_�=�������v��+�y7A�,��0�-tVB�|���ŲGwWp�����km����/�?�&Ί���,��	
w�_Ƣ�wzk)��ފ��؄�W0� ���6���.�T\"��49��>!��`�yU��	|mU+pX�D$iK�!@H���.܍�h�!���+n51�$Ƃ.�M��^���a<(I���O��L\]gP�q%����o�q�!��\5��Ӱ�U�﻿print("Loaded randomizer v0.6")

worldGlobals.allTetros = {
  ["**1"]=s1, ["**2"]=s2, ["**3"]=s3, ["**4"]=s4, ["**5"]=s5,
  ["**6"]=s6, ["**7"]=s7, ["**8"]=s8, ["**9"]=s9, ["**10"]=s10,
--  ["**11"]=s11, ["**12"]=s12, ["**13"]=s13, ["**14"]=s14, ["**15"]=s15,
--  ["**16"]=s16, ["**17"]=s17, ["**18"]=s18, ["**19"]=s19, ["**20"]=s20,
--  ["**21"]=s21, ["**22"]=s22, ["**23"]=s23, ["**24"]=s24, ["**25"]=s25,
--  ["**26"]=s26, ["**27"]=s27, ["**28"]=s28, ["**29"]=s29, ["**30"]=s30,
  ["DI1"]=DI1, ["DI2"]=DI2,
  ["DJ1"]=DJ1, ["DJ2"]=DJ2, ["DJ3"]=DJ3, ["DJ4"]=DJ4, ["DJ5"]=DJ5,
  ["DL1"]=DL1, ["DL2"]=DL2, ["DL3"]=DL3,
  ["DT1"]=DT1, ["DT2"]=DT2, ["DT3"]=DT3, ["DT4"]=DT4,
  ["DZ1"]=DZ1, ["DZ2"]=DZ2, ["DZ3"]=DZ3, ["DZ4"]=DZ4,
  ["EL1"]=EL1, ["EL2"]=EL2, ["EL3"]=EL3, ["EL4"]=EL4,
  ["EO1"]=EO1,
  ["ES1"]=ES1, ["ES2"]=ES2, ["ES3"]=ES3, ["ES4"]=ES4,
  ["MI1"]=MI1,
  ["MJ1"]=MJ1,
  ["ML1"]=ML1, ["ML2"]=ML2, ["ML3"]=ML3, ["ML4"]=ML4,
  ["MO1"]=MO1,
--[[  ["MS1"]=MS1, ["MS2"]=MS2,
  ["MT1"]=MT1, ["MT2"]=MT2, ["MT3"]=MT3, ["MT4"]=MT4, ["MT5"]=MT5,
  ["MT6"]=MT6, ["MT7"]=MT7, ["MT8"]=MT8, ["MT9"]=MT9, ["MT10"]=MT10,
  ["MZ1"]=MZ1, ["MZ2"]=MZ2, ["MZ3"]=MZ3, ["MZ4"]=MZ4,
  ["NI1"]=NI1, ["NI2"]=NI2, ["NI3"]=NI3, ["NI4"]=NI4, ["NI5"]=NI5,
  ["NI6"]=NI6,
  ["NJ1"]=NJ1, ["NJ2"]=NJ2, ["NJ3"]=NJ3, ["NJ4"]=NJ4,
  ["NL1"]=NL1, ["NL2"]=NL2, ["NL3"]=NL3, ["NL4"]=NL4, ["NL5"]=NL5,
  ["NL6"]=NL6, ["NL7"]=NL7, ["NL8"]=NL8, ["NL9"]=NL9, ["NL10"]=NL10,
  ["NO1"]=NO1, ["NO2"]=NO2, ["NO3"]=NO3, ["NO4"]=NO4, ["NO5"]=NO5,
  ["NO6"]=NO6, ["NO7"]=NO7,
  ["NS1"]=NS1, ["NS2"]=NS2, ["NS3"]=NS3, ["NS4"]=NS4,
  ["NT1"]=NT1, ["NT2"]=NT2, ["NT3"]=NT3, ["NT4"]=NT4, ["NT5"]=NT5,
  ["NT6"]=NT6, ["NT7"]=NT7, ["NT8"]=NT8, ["NT9"]=NT9, ["NT10"]=NT10,
  ["NT11"]=NT11, ["NT12"]=NT12,
  ["NZ1"]=NZ1, ["NZ2"]=NZ2, ["NZ3"]=NZ3, ["NZ4"]=NZ4, ["NZ5"]=NZ5,
  ["NZ6"]=NZ6
--]]
}

for sigilName, sigil in pairs(worldGlobals.allTetros) do
  assert(sigilName == sigil:GetName())
end

local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

if (talosProgress:GetCodeValue("Randomizer_Generated") ~= 1) then
  talosProgress:SetCode("Randomizer_Generated", 1)
  local markers = { -- These can be accessed without any requirements (world A)
    "001a_SPM_000_PM_008",
    "001_SPM_000_PM_005",
    "005_SPM_000_PM_009",
    "006_SPM_000_PM_003",
    "007_SPM_000_PM_006",
    "008_SPM_000_PM_016",
    "011_SPM_000_PM_009",
    "012_SPM_000_PM_004",
    "013_SPM_000_PM_006",
    "015_SRT_SPM_000_PM_017",
    "015_SRT_SPM_000_PM_018",
    "017_SPM_000_PM_023",
    "020_SPM_000_PM_014",
    "107_SPM_000_PM_007",
    "108_SPM_000_PM_012",
    "111_SPM_000_PM_012",
    "201_SPM_000_PM_013",
    "201_SRT_SPM_000_PM_004",
    "202b_SPM_000_PM_004",
    "202c_SPM_000_PM_003",
    "202d_SPM_000_PM_002",
    "202e_SPM_000_PM_004",
    "202f_SPM_000_PM_003",
    "202_SPM_000_PM_032",
    "204_SPM_000_PM_004",
    "207_SPM_000_PM_005",
    "209_SPM_000_PM_012",
    "210_SPM_000_PM_015",
    "211_SPM_000_PM_008",
    "212_SPM_000_PM_017",
    "218_SPM_000_PM_016",
    "244_SPM_000_PM_008",
    "303_SPM_000_PM_010",
    "305_SPM_000_PM_004",
    "Cloud_1_02_SRT_SPM_000_PM_016",
    "Cloud_1_02_SRT_SPM_001_PM_003",
    "Cloud_1_03_SRT_SPM_000_PM_005",
    "Cloud_1_04_SRT_SPM_000_PM_007",
    "Cloud_1_06_SRT_SPM_000_PM_007",
    "Cloud_1_07_SRT_SPM_000_PM_021",
  }
  
  local tetros = {
    "**1", "**2", "**3", "**4", "**5", "**6", "**7", "**8", "**9", "**10",
    "DI1", "DI2", "DJ1", "DJ2", "DJ3", "DJ4", "DJ5", "DL1", "DL2", "DL3",
    "DT1", "DT2", "DT2", "DT4", "DZ1", "DZ2", "DZ3", "DZ4",
    "EL1", "EL2", "EL3", "EL4", "EO1", "ES1", "ES2", "ES3", "ES4",
    "MI1", "MJ1", "ML1", "ML2", "ML3", "ML4", "MO1",
  }
  
  -- Knuth randomization
  worldGlobals.replacements = {}
  for i = 1, #markers do
    local otherMarker = markers[mthRndRangeL(1, i)]
    worldGlobals.replacements[markers[i]] = worldGlobals.replacements[otherMarker]
    worldGlobals.replacements[otherMarker] = tetros[i]
  end
end

-- Move sigils onto markers in this world
for _, worldMarker in pairs(worldMarkers) do
  local sigilName = worldGlobals.replacements[worldMarker:GetName()]
  local sigil = worldGlobals.allTetros[sigilName]
  assert(sigil ~= nil, "Marker " .. worldMarker:GetName() .. " does not have a sigil assigned to it!")
  sigil:SetPlacement(worldMarker:GetPlacement())
end
�&�0���8�kص�0U9��E^���k��5(B��җ"Dѯt!��-��)����LpP:"P9em��mX��1Ï�(�F�^O��Md%�"S_�"g%׫��r�"�?��+�	�9��{Q�05����E��Ů�a�w]ι�
J�$��vi������?�Lb�����5Rj�9Ev�>����<�킃$��`�C�b�ǉ���m'�aݯC|�[�f�F4B!�)L�W�C
�,C�A������2/3@�[���:�����