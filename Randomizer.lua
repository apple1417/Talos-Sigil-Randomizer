SIGSTRM12GIS             �_>                  Signkey.EditorSignature�$������C1�g��i{��T������95i��>�Hav�	dR]9��,��d�,@�c������f����ob���4a���H�G�6�K�:ؑ=b������c���D&yN\|���Z��k�Ţ�LM��_8�A�P2���IÊ$��5�Q�J����)r����c�r��q���^�F��"�RȨ�TzTk�̵>X0~�3�؅���y@
Ԫ�}Ůz'�%��L7W5��3�/���q�(�cD�?{﻿print("Loaded randomizer v0.6")

worldGlobals.allTetros = {
  ["**1"]=s1, ["**2"]=s2, ["**3"]=s3, ["**4"]=s4, ["**5"]=s5,
  ["**6"]=s6, ["**7"]=s7, ["**8"]=s8, ["**9"]=s9, ["**10"]=s10,
  ["**11"]=s11, ["**12"]=s12, ["**13"]=s13, ["**14"]=s14, ["**15"]=s15,
  ["**16"]=s16, ["**17"]=s17, ["**18"]=s18, ["**19"]=s19, ["**20"]=s20,
  ["**21"]=s21, ["**22"]=s22, ["**23"]=s23, ["**24"]=s24, ["**25"]=s25,
  ["**26"]=s26, ["**27"]=s27, ["**28"]=s28, ["**29"]=s29, ["**30"]=s30,
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
  ["MS1"]=MS1, ["MS2"]=MS2,
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
}

worldGlobals.tetros = {
  "**1", "**2", "**3", "**4", "**5", "**6", "**7", "**8", "**9", "**10",
  "**11", "**12", "**13", "**14", "**15", "**16", "**17", "**18", "**19", "**20",
  "**21", "**22", "**23", "**24", "**25", "**26", "**27", "**28", "**29", "**30", 
  "DI1", "DI2", "DJ1", "DJ2", "DJ3", "DJ4", "DJ5", "DL1", "DL2", "DL3",
  "DT1", "DT2", "DT3", "DT4", "DZ1", "DZ2", "DZ3", "DZ4",
  "EL1", "EL2", "EL3", "EL4", "EO1", "ES1", "ES2", "ES3", "ES4",
  "MI1", "MJ1", "ML1", "ML2", "ML3", "ML4", "MO1", "MS1", "MS2",
  "MT1", "MT2", "MT3", "MT4", "MT5", "MT6", "MT7", "MT8", "MT9", "MT10", 
  "MZ1", "MZ2", "MZ3", "MZ4",
  "NI1", "NI2", "NI3", "NI4", "NI5", "NI6", "NJ1", "NJ2", "NJ3", "NJ4",
  "NL1", "NL2", "NL3", "NL4", "NL5", "NL6", "NL7", "NL8", "NL9", "NL10",
  "NO1", "NO2", "NO3", "NO4", "NO5", "NO6", "NO7", "NS1", "NS2", "NS3", "NS4",
  "NT1", "NT2", "NT3", "NT4", "NT5", "NT6", "NT7", "NT8", "NT9", "NT10", "NT11", "NT12",
  "NZ1", "NZ2", "NZ3", "NZ4", "NZ5", "NZ6"
}

for sigilName, sigil in pairs(worldGlobals.allTetros) do
  assert(sigilName == sigil:GetName(), "Sigil " .. sigil:GetName() .. " is saved as variable " .. sigilName)
end

local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

if not talosProgress:IsVarSet("Randomizer_Generated") then
  print("Generating Sigil Configuration")
  talosProgress:SetVar("Randomizer_Generated") -- You can clear this var to force a re-roll
  
  local seed = talosProgress:GetCodeValue("Randomizer_Seed")
  if seed == -1 then
    seed = mthRndL()
  end
  talosProgress:SetCode("Randomizer_Seed", -1)

  local mode = talosProgress:GetCodeValue("Randomizer_Mode")
  if mode == -1 then
    mode = 0
  end
  
  local markers = {
  -- These can be accessed without any requirements (world A)
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
    "220_SPM_000_PM_032",
    "204_SPM_000_PM_004",
    "207_SPM_000_PM_005",
    "209_SPM_000_PM_012",
    "210_SPM_000_PM_015",
    "211_SPM_000_PM_008",
    "212_SPM_000_PM_017",
    "218_SPM_000_PM_016",
    "244_SPM_000_PM_008",
    "244_SRT_SPM_000_PM_006",
    "303_SPM_000_PM_010",
    "305_SPM_000_PM_004",
    "Cloud_1_02_SRT_SPM_000_PM_016",
    "Cloud_1_02_SRT_SPM_001_PM_003",
    "Cloud_1_03_SRT_SPM_000_PM_005",
    "Cloud_1_04_SRT_SPM_000_PM_007",
    "Cloud_1_06_SRT_SPM_000_PM_007",
    "Cloud_1_07_SRT_SPM_000_PM_021",
  -- Require A Star
    "115_SRT_TAM_004_PM_016",
    "117_SRT_SPM_000_PM_028",
    "119_SRT_SPM_000_PM_033",
  -- Require World B
    "113_SPM_000_PM_036",
    "118_SPM_000_PM_062",
    "120_SPM_000_PM_029",
    "203_SPM_000_PM_011",
    "205_SPM_000_PM_003",
    "206_SPM_000_PM_021",
    "208_SPM_000_PM_014",
    "213_SPM_000_PM_010",
    "215_SPM_000_PM_013",
    "221_SPM_002_PM_001",
    "222_SPM_004_PM_001",
    "223_SPM_000_PM_009",
    "224_SRT_SPM_000_PM_071",
    "224_SRT_SPM_000_PM_091",
    "238_SPM_000_PM_018",
    "239_SPM_000_PM_018",
    "300a_SPM_000_PM_007",
    "301_SPM_000_PM_010",
    "302_SPM_000_PM_008",
    "310_SPM_000_PM_024",
    "311_SPM_000_PM_041",
    "314_SPM_000_PM_012",
    "315_TAM_002_PM_001",
    "316_SPM_000_PM_012",
    "319_SPM_000_PM_008",
    "321_SPM_000_PM_005",
    "322_SPM_000_PM_008",
    "401_SPM_004_PM_008",
    "402_SPM_000_PM_020",
    "407_SPM_000_PM_018",
    "409_SPM_000_PM_024",
    "414_SPM_000_PM_007",
    "Cloud_2_01_SRT_SPM_000_PM_004",
    "Cloud_2_02_SRT_SPM_000_PM_039",
    "Cloud_2_03_SRT_SPM_002_PM_013",
    "Cloud_2_04_SRT_SPM_000_PM_017",
  -- Require B Star
    "214_SRT_SPM_000_PM_025",
    "306_SRT_SPM_000_PM_016",
    "411_SRT_SPM_000_PM_014",
  -- Require B + Items
    "Cloud_2_04_SRT_SPM_002_PM_002",
    "Cloud_2_05_SRT_TAM_003_PM_003",
    "Cloud_2_07_SRT_TAM_001_PM_004",
  -- Require World C
    "112_SPM_000_PM_034",
    "114_SPM_000_PM_032",
    "216_SPM_000_PM_015",
    "217_SPM_000_PM_040",
    "219_SPM_000_PM_008",
    "225_SPM_000_PM_044",
    "226_SPM_000_PM_039",
    "227_SPM_002_PM_033",
    "229_SPM_000_PM_070",
    "230_SPM_000_PM_019",
    "232_SPM_000_PM_012",
    "233_SPM_000_PM_015",
    "234_SPM_000_PM_015",
    "308_WPM_000_PM_017",
    "309_SPM_000_PM_018",
    "312_SPM_000_PM_032",
    "313_SPM_000_PM_016",
    "317_SPM_000_PM_024",
    "318_SPM_000_PM_026",
    "328_SPM_000_PM_016",
    "403_SPM_000_PM_015",
    "404_SPM_000_PM_022",
    "405_SRT_SPM_000_PM_047",
    "405_SRT_SPM_000_PM_050",
    "408_SPM_000_PM_033",
    "408_SRT_SPM_000_PM_034",
    "416_SPM_000_PM_026",
    "417_SPM_000_PM_029",
    "418_SPM_000_PM_014",
    "Cloud_3_01_SRT_SPM_000_PM_017",
    "Cloud_3_02_SRT_TAM_001",
    "Cloud_3_03_SRT_SPM_000_PM_069",
    "Cloud_3_05_SRT_SPM_000_PM_035",
    "Cloud_3_05_SRT_SPM_002_PM_016",
    "Cloud_3_05_SRT_SPM_033_PM_012",
    "Cloud_3_06_SRT_SPM_000_PM_008",
    "Cloud_3_07_SRT_SPM_000_PM_021",
    "Islands_01_SRT_SPM_000_PM_003",
  -- Require C Star
    "235_SRT_SPM_000_PM_037",
    "320_SRT_SPM_000_PM_046",
    "504_SRT_SPM_000_PM_021",
  -- Require Tower Access
    "LeapOfFaith_PM_010",
    "Secret_28_SRT_SPM_000_PM_004"
  }
  if mode == 0 then -- Fully Random (for now)
    -- Knuth randomization
    for i = 1, #markers do
      local otherMarker = markers[mthRndRangeL(1, i)]
      talosProgress:SetCode(markers[i], talosProgress:GetCodeValue(otherMarker))
      talosProgress:SetCode(otherMarker, i)
    end
  end
end

-- Move sigils onto markers in this world
for _, worldMarker in pairs(worldMarkers) do
  local sigilNum = talosProgress:GetCodeValue(worldMarker:GetName())
  local sigil = worldGlobals.allTetros[worldGlobals.tetros[sigilNum]]
  assert(sigil ~= nil, "Marker " .. worldMarker:GetName() .. " does not have a sigil assigned to it!")
  sigil:SetPlacement(worldMarker:GetPlacement())
end

SignalEvent("Randomizer_Finished")���nc�)���y�:�\;����$cvp�yC��)[2��ݼ��t�(H���lV�J,s 
/�5	2��,�|V�ۅ=��Y>y1��a�"_B
H�4k�@&
)=����5*G�DqGn�o*��@Tm�'%�)us�K�� 6c+��������%&�$����(f��4���N>3��ä8~M8G)�Y|$�^|;��`�6�r`�"?�
���3��
9x3"'M�FK�C�/��e���:��3��a�	� �"s@�++9�go