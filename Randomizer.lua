SIGSTRM12GIS             �9�                  Signkey.EditorSignature)ǲw��Z��)��d��sO��/2v���.7<����Y撽�l�KD�����2��9j���J���Y 2uŅ��_ІP�6P�9+q�n<4A�{���JM@}�+�y�4Y�������_�R�a��"��K����� F -��;e�:�y��` P�f�F�tC�V+�G��%�߾�������+���,d<Hzl�Y*\d�&�	Z�^󐵓;�I�),x[!m �A�I����a�L-T~MB;﻿local function print(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conInfoF(out)
end

local function printWarning(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conWarningF(out)
end

local function printError(...)
  local out = ""
  for i=1,arg.n do
    out = out .. tostring(arg[i]) .. " "
  end
  out = string.sub(out, 1, -2) .. "\n"
  conErrorF(out)
end

print("Loaded Randomizer v8")

worldGlobals.allTetros = {
   s1,  s2,  s3,  s4,  s5,  s6,  s7,  s8,  s9, s10,
  s11, s12, s13, s14, s15, s16, s17, s18, s19, s20,
  s21, s22, s23, s24, s25, s26, s27, s28, s29, s30,
  DI1, DI2,
  DJ1, DJ2, DJ3, DJ4, DJ5,
  DL1, DL2, DL3,
  DT1, DT2, DT3, DT4,
  DZ1, DZ2, DZ3, DZ4,
  EL1, EL2, EL3, EL4,
  EO1,
  ES1, ES2, ES3, ES4,
  MI1,
  MJ1,
  ML1, ML2, ML3, ML4,
  MO1,
  MS1, MS2,
  MT1, MT2, MT3, MT4, MT5, MT6, MT7, MT8, MT9, MT10,
  MZ1, MZ2, MZ3, MZ4,
  NI1, NI2, NI3, NI4, NI5, NI6,
  NJ1, NJ2, NJ3, NJ4,
  NL1, NL2, NL3, NL4, NL5, NL6, NL7, NL8, NL9, NL10,
  NO1, NO2, NO3, NO4, NO5, NO6, NO7,
  NS1, NS2, NS3, NS4,
  NT1, NT2, NT3, NT4, NT5, NT6, NT7, NT8, NT9, NT10, NT11, NT12,
  NZ1, NZ2, NZ3, NZ4, NZ5, NZ6
}
worldGlobals.worldMarkers = worldMarkers

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local PROB_BOTH_HUBS = 25
local DEBUG = talosProgress:IsVarSet("Randomizer_Debug")
-- DEBUG = true

if not talosProgress:IsVarSet("Randomizer_Generated") then
  print("Randomizing...")
  local mode = talosProgress:GetCodeValue("Randomizer_Mode")
  if mode == -1 then
    mode = 1
  end
  print("Using Mode", mode)

  local seed = talosProgress:GetCodeValue("Randomizer_Seed")
  if seed == -1 then
    seed = mthRndRangeL(0, 2147483647)
    talosProgress:SetCode("Randomizer_Seed", seed)
  end
  print("Using Seed", seed)
  
  --[[
  Linear congruential generator using Microsoft VC++ seeds
   Unlike the built-in, we can seed this
   Thanks Darkid :)
  ]]--
  local function rand(min, max)
    seed = (214013 * seed + 2531011) % 2147483648
    return  mthFloorF(((seed/2147483647) * (max - min)) + min)
  end

  talosProgress:SetVarValue("PaintItemSeed", rand(0, 8909478))
  talosProgress:SetVarValue("Code_Floor4", rand(1, 999))
  talosProgress:SetVarValue("Code_Floor5", rand(1, 999))
  local codeF6 = 0
  for i=1,3 do
    local digit = rand(4, 9) -- Yes this is right
    talosProgress:SetVarValue("Code_Floor6" .. tostring(i), digit)
    talosProgress:SetVar("Code_Floor6DigitSeen" .. tostring(i))
    codeF6 = codeF6*10 + digit
  end
  talosProgress:SetVarValue("Code_Floor6", codeF6)

  local tetroIndexes = {
    ["**1"] =  1, ["**2"] =  2, ["**3"] =  3, ["**4"] =  4, ["**5"] =  5,
    ["**6"] =  6, ["**7"] =  7, ["**8"] =  8, ["**9"] =  9, ["**10"]= 10,
    ["**11"]= 11, ["**12"]= 12, ["**13"]= 13, ["**14"]= 14, ["**15"]= 15,
    ["**16"]= 16, ["**17"]= 17, ["**18"]= 18, ["**19"]= 19, ["**20"]= 20,
    ["**21"]= 21, ["**22"]= 22, ["**23"]= 23, ["**24"]= 24, ["**25"]= 25,
    ["**26"]= 26, ["**27"]= 27, ["**28"]= 28, ["**29"]= 29, ["**30"]= 30,
    ["DI1"] = 31, ["DI2"] = 32, ["DJ1"] = 33, ["DJ2"] = 34, ["DJ3"] = 35,
    ["DJ4"] = 36, ["DJ5"] = 37, ["DL1"] = 38, ["DL2"] = 39, ["DL3"] = 40,
    ["DT1"] = 41, ["DT2"] = 42, ["DT3"] = 43, ["DT4"] = 44, ["DZ1"] = 45,
    ["DZ2"] = 46, ["DZ3"] = 47, ["DZ4"] = 48, ["EL1"] = 49, ["EL2"] = 50,
    ["EL3"] = 51, ["EL4"] = 52, ["EO1"] = 53, ["ES1"] = 54, ["ES2"] = 55,
    ["ES3"] = 56, ["ES4"] = 57, ["MI1"] = 58, ["MJ1"] = 59, ["ML1"] = 60,
    ["ML2"] = 61, ["ML3"] = 62, ["ML4"] = 63, ["MO1"] = 64, ["MS1"] = 65,
    ["MS2"] = 66, ["MT1"] = 67, ["MT2"] = 68, ["MT3"] = 69, ["MT4"] = 70,
    ["MT5"] = 71, ["MT6"] = 72, ["MT7"] = 73, ["MT8"] = 74, ["MT9"] = 75,
    ["MT10"]= 76, ["MZ1"] = 77, ["MZ2"] = 78, ["MZ3"] = 79, ["MZ4"] = 80,
    ["NI1"] = 81, ["NI2"] = 82, ["NI3"] = 83, ["NI4"] = 84, ["NI5"] = 85,
    ["NI6"] = 86, ["NJ1"] = 87, ["NJ2"] = 88, ["NJ3"] = 89, ["NJ4"] = 90,
    ["NL1"] = 91, ["NL2"] = 92, ["NL3"] = 93, ["NL4"] = 94, ["NL5"] = 95,
    ["NL6"] = 96, ["NL7"] = 97, ["NL8"] = 98, ["NL9"] = 99, ["NL10"]=100,
    ["NO1"] =101, ["NO2"] =102, ["NO3"] =103, ["NO4"] =104, ["NO5"] =105,
    ["NO6"] =106, ["NO7"] =107, ["NS1"] =108, ["NS2"] =109, ["NS3"] =110,
    ["NS4"] =111, ["NT1"] =112, ["NT2"] =113, ["NT3"] =114, ["NT4"] =115,
    ["NT5"] =116, ["NT6"] =117, ["NT7"] =118, ["NT8"] =119, ["NT9"] =120,
    ["NT10"]=121, ["NT11"]=122, ["NT12"]=123, ["NZ1"] =124, ["NZ2"] =125,
    ["NZ3"] =126, ["NZ4"] =127, ["NZ5"] =128, ["NZ6"] =129,
  }
  
  --[[
    These names are the same as in MarkerNames.txt, with the world
     name as a prefix
    "[World] Star" it has been changed to "[World]-Star"
    "CM-Star", "F0-Star", and "F3-Star" are the only other exceptions
  ]]--
  local translate = {
    ["A1-PaSL"] = "005_SPM_000_PM_009", ["A1-Beaten Path"] = "107_SPM_000_PM_007", ["A1-Outnumbered"] = "006_SPM_000_PM_003", ["A1-OtToU"] = "011_SPM_000_PM_009", ["A1-ASooR"] = "007_SPM_000_PM_006", ["A1-Trio"] = "012_SPM_000_PM_004", ["A1-Peephole"] = "001_SPM_000_PM_005", ["A1-Star"] = "Cloud_1_02_SRT_SPM_000_PM_016",
    ["A2-Guards"] = "008_SPM_000_PM_016", ["A2-Hall of Windows"] = "001a_SPM_000_PM_008", ["A2-Suicide Mission"] = "013_SPM_000_PM_006", ["A2-Star"] = "Cloud_1_02_SRT_SPM_001_PM_003",
    ["A3-Stashed for Later"] = "108_SPM_000_PM_012", ["A3-ABTU"] = "015_SRT_SPM_000_PM_018", ["A3-ABTU Star"] = "015_SRT_SPM_000_PM_017", ["A3-Swallowed the Key"] = "020_SPM_000_PM_014", ["A3-AEP"] = "017_SPM_000_PM_023", ["A3-Clock Star"] = "Cloud_1_03_SRT_SPM_000_PM_005",
    ["A4-Branch it Out"] = "202c_SPM_000_PM_003", ["A4-Above All That"] = "202f_SPM_000_PM_003", ["A4-Push it Further"] = "202b_SPM_000_PM_004", ["A4-Star"] = "Cloud_1_04_SRT_SPM_000_PM_007", ["A4-DCtS"] = "202d_SPM_000_PM_002",
    ["A5-Two Boxes"] = "201_SPM_000_PM_013", ["A5-Two Boxes Star"] = "201_SRT_SPM_000_PM_004", ["A5-YKYMCTS"] = "204_SPM_000_PM_004", ["A5-Over the Fence"] = "202e_SPM_000_PM_004", ["A5-OLB"] = "207_SPM_000_PM_005", ["A5-FC"] = "244_SPM_000_PM_008", ["A5-FC Star"] = "244_SRT_SPM_000_PM_006",
    ["A6-Mobile Mindfield"] = "111_SPM_000_PM_012", ["A6-Deception"] = "210_SPM_000_PM_015", ["A6-Door too Far"] = "218_SPM_000_PM_016", ["A6-Bichromatic"] = "303_SPM_000_PM_010", ["A6-Star"] = "Cloud_1_06_SRT_SPM_000_PM_007",
    ["A7-LFI"] = "212_SPM_000_PM_017", ["A7-Trapped Inside"] = "305_SPM_000_PM_004", ["A7-Two Buzzers"] = "209_SPM_000_PM_012", ["A7-Star"] = "Cloud_1_07_SRT_SPM_000_PM_021", ["A7-WiaL"] = "220_SPM_000_PM_032", ["A7-Pinhole"] = "211_SPM_000_PM_008",
    ["A*-JfW"] = "119_SRT_SPM_000_PM_033", ["A*-Nervewrecker"] = "117_SRT_SPM_000_PM_028", ["A*-DDM"] = "115_SRT_TAM_004_PM_016",
    ["B1-WtaD"] = "203_SPM_000_PM_011", ["B1-Third Wheel"] = "302_SPM_000_PM_008", ["B1-Over the Fence"] = "316_SPM_000_PM_014", ["B1-RoD"] = "319_SPM_000_PM_008", ["B1-SaaS"] = "205_SPM_000_PM_003", ["B1-Star"] = "Cloud_2_01_SRT_SPM_000_PM_004",
    ["B2-Tomb"] = "213_SPM_000_PM_010", ["B2-Star"] = "Cloud_2_02_SRT_SPM_000_PM_039", ["B2-MotM"] = "221_SPM_002_PM_001", ["B2-Moonshot"] = "223_SPM_000_PM_009", ["B2-Higher Ground"] = "120_SPM_000_PM_029",
    ["B3-Blown Away"] = "300a_SPM_000_PM_007", ["B3-Star"] = "Cloud_2_03_SRT_SPM_002_PM_013", ["B3-Sunshot"] = "222_SPM_004_PM_001", ["B3-Eagle's Nest"] = "401_SPM_004_PM_008", ["B3-Woosh"] = "409_SPM_000_PM_024",
    ["B4-Self Help"] = "322_SPM_000_PM_008", ["B4-Double-Plate"] = "321_SPM_000_PM_005", ["B4-TRA"] = "215_SPM_000_PM_013", ["B4-TRA Star"] = "Cloud_2_04_SRT_SPM_000_PM_017", ["B4-RPS"] = "407_SPM_000_PM_018", ["B4-ABUH"] = "310_SPM_000_PM_024", ["B4-WAtC"] = "414_SPM_000_PM_007", ["B4-Sphinx Star"] = "Cloud_2_04_SRT_SPM_002_PM_002",
    ["B5-SES"] = "314_SPM_000_PM_012", ["B5-Plates"] = "238_SPM_000_PM_018", ["B5-Two Jammers"] = "239_SPM_000_PM_018", ["B5-Iron Curtain"] = "311_SPM_000_PM_041", ["B5-Chambers"] = "315_TAM_002_PM_001", ["B5-Obelisk Star"] = "Cloud_2_05_SRT_TAM_003_PM_003",
    ["B6-Crisscross"] = "208_SPM_000_PM_014", ["B6-JDaW"] = "206_SPM_000_PM_021", ["B6-Egyptian Arcade"] = "113_SPM_000_PM_036",
    ["B7-AFaF"] = "224_SRT_SPM_000_PM_071", ["B7-WLJ"] = "118_SPM_000_PM_062", ["B7-BSbS"] = "301_SPM_000_PM_010", ["B7-BSbS Star"] = "224_SRT_SPM_000_PM_091", ["B7-BLoM"] = "402_SPM_000_PM_020", ["B7-Star"] = "Cloud_2_07_SRT_TAM_001_PM_004",
    ["B*-Merry Go Round"] = "214_SRT_SPM_000_PM_025", ["B*-Cat's Cradle"] = "306_SRT_SPM_000_PM_016", ["B*-Peekaboo"] = "411_SRT_SPM_000_PM_014",
    ["C1-Conservatory"] = "219_SPM_000_PM_008", ["C1-MIA"] = "416_SPM_000_PM_026", ["C1-Labyrinth"] = "114_SPM_000_PM_032", ["C1-Blowback"] = "312_SPM_000_PM_032", ["C1-Star"] = "Cloud_3_01_SRT_SPM_000_PM_017",
    ["C2-ADaaF"] = "403_SPM_000_PM_015", ["C2-Star"] = "Cloud_3_02_SRT_TAM_001", ["C2-Rapunzel"] = "417_SPM_000_PM_029", ["C2-Cemetery"] = "217_SPM_000_PM_040", ["C2-Short Wall"] = "418_SPM_000_PM_014",
    ["C3-Three Connectors"] = "225_SPM_000_PM_044", ["C3-Jammer Quarantine"] = "317_SPM_000_PM_024", ["C3-BSLS"] = "229_SPM_000_PM_070", ["C3-Weathertop"] = "318_SPM_000_PM_026", ["C3-Star"] = "Cloud_3_03_SRT_SPM_000_PM_069",
    ["C4-Armory"] = "313_SPM_000_PM_016", ["C4-Oubliette"] = "405_SRT_SPM_000_PM_050", ["C4-Oubliette Star"] = "405_SRT_SPM_000_PM_047", ["C4-Stables"] = "216_SPM_000_PM_015", ["C4-Throne Room"] = "408_SPM_000_PM_033", ["C4-Throne Room Star"] = "408_SRT_SPM_000_PM_034",
    ["C5-Time Flies"] = "328_SPM_000_PM_016", ["C5-Time Flies Star"] = "Cloud_3_05_SRT_SPM_003_PM_012", ["C5-Time Crawls"] = "232_SPM_000_PM_012", ["C5-Dumbwaiter"] = "309_SPM_000_PM_018", ["C5-Dumbwaiter Star"] = "Cloud_3_05_SRT_SPM_002_PM_016", ["C5-UCaJ"] = "404_SPM_000_PM_022", ["C5-UCAJ Star"] = "Cloud_3_05_SRT_SPM_000_PM_035",
    ["C6-Seven Doors"] = "234_SPM_000_PM_015", ["C6-Star"] = "Cloud_3_06_SRT_SPM_000_PM_008", ["C6-Circumlocution"] = "226_SPM_000_PM_039", ["C6-Two Way Steet"] = "112_SPM_000_PM_034",
    ["C7-Carrier Pigeons"] = "230_SPM_000_PM_019", ["C7-DMS"] = "308_SPM_000_PM_017", ["C7-Star"] = "Cloud_3_07_SRT_SPM_000_PM_021", ["C7-Prison Break"] = "227_SPM_002_PM_033", ["C7-Crisscross"] = "233_SPM_000_PM_015",
    ["C*-Unreachable Garden"] = "235_SRT_SPM_000_PM_037", ["C*-Nexus"] = "320_SRT_SPM_000_PM_046", ["C*-Cobweb"] = "504_SRT_SPM_000_PM_021",
    ["CM-Star"] = "Islands_01_SRT_SPM_000_PM_003", ["F0-Star"] = "Secret_28_SRT_SPM_000_PM_004", ["F3-Star"] = "LeapOfFaith_PM_010"
  }
  
  local toTranslate = false
  local markers = {
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
    "Secret_28_SRT_SPM_000_PM_004"
  }
  
  local locked = {
    ["A1 Gate"] = {"DJ1", "DJ2", "DZ1"},
    ["A Gate"] = {"DI1", "DJ3", "DL1", "DZ2"},
    ["B Gate"] = {"DL2", "DT1", "DT2", "DZ3"}, -- and DI2
    ["C Gate"] = {"DL3", "DT3", "DT4", "DZ4"}, -- and DJ4, DJ5
    ["A Star"] = {"**1", "**2", "**3", "**4", "**5", "**6", "**7", "**8", "**9", "**10"},
    ["B Star"] = {"**11", "**12", "**13", "**14", "**15", "**16", "**17", "**18", "**19", "**20"},
    ["C Star"] = {"**21", "**22", "**23", "**24", "**25", "**26", "**27", "**28", "**29", "**30"},
    ["Connector"] = {"ML1", "MT1", "MT2"},
    ["Cube"] = {"ML2", "MT3", "MT4", "MZ1"},
    ["Fan"] = {"ML3", "MS1", "MT5", "MT6", "MZ2"},
    ["Recorder"] = {"MJ1", "MS2", "MT7", "MT8", "MZ3"},
    ["Platform"] = {"MI1", "ML4", "MO1", "MT9", "MT10", "MZ4"},
    ["F1"] = {"NL1", "NL2", "NZ1", "NZ2"},
    ["F2"] = {"NL3", "NL4", "NL5", "NL6", "NO1", "NT1", "NT2", "NT3", "NT4"},
    ["F3"] = {"NI1", "NI2", "NI3", "NI4", "NJ1", "NJ2", "NL7", "NL8", "NS1", "NZ3"},
    ["F4"] = {"NJ3", "NL9", "NO2", "NO3", "NS2", "NS3", "NT5", "NT6", "NT7", "NT8", "NZ4", "NZ5"},
    ["F5"] = {"NI5", "NI6", "NJ4", "NL10", "NO4", "NO5", "NO6", "NO7", "NS4", "NT9", "NT10", "NT11", "NT12", "NZ6"},
    ["F6"] = {"EL1", "EL2", "EL3", "EL4", "EO1", "ES1", "ES2", "ES3", "ES4"}
  }
  
  -- Default
  if mode == 1 then
    toTranslate = false
    markers = {
      -- A
      {function() return true end, {
        "001a_SPM_000_PM_008", "001_SPM_000_PM_005", "005_SPM_000_PM_009", "006_SPM_000_PM_003",
        "007_SPM_000_PM_006", "008_SPM_000_PM_016", "011_SPM_000_PM_009", "012_SPM_000_PM_004",
        "013_SPM_000_PM_006", "015_SRT_SPM_000_PM_017", "015_SRT_SPM_000_PM_018", "017_SPM_000_PM_023",
        "020_SPM_000_PM_014", "107_SPM_000_PM_007", "108_SPM_000_PM_012", "111_SPM_000_PM_012",
        "201_SPM_000_PM_013", "201_SRT_SPM_000_PM_004", "202b_SPM_000_PM_004", "202c_SPM_000_PM_003",
        "202e_SPM_000_PM_004", "202f_SPM_000_PM_003", "220_SPM_000_PM_032", "204_SPM_000_PM_004",
        "207_SPM_000_PM_005", "209_SPM_000_PM_012", "210_SPM_000_PM_015", "211_SPM_000_PM_008",
        "212_SPM_000_PM_017", "218_SPM_000_PM_016", "244_SPM_000_PM_008", "244_SRT_SPM_000_PM_006",
        "303_SPM_000_PM_010", "305_SPM_000_PM_004", "Cloud_1_02_SRT_SPM_000_PM_016", "Cloud_1_02_SRT_SPM_001_PM_003",
        "Cloud_1_03_SRT_SPM_000_PM_005", "Cloud_1_04_SRT_SPM_000_PM_007", "Cloud_1_06_SRT_SPM_000_PM_007", "Cloud_1_07_SRT_SPM_000_PM_021"
      }},
      {function() return not locked["Connector"] end, {
        "202d_SPM_000_PM_002"
      }},
      -- B
      {function() return not locked["B Gate"] end, {
        "113_SPM_000_PM_036", "118_SPM_000_PM_062", "120_SPM_000_PM_029", "203_SPM_000_PM_011",
        "205_SPM_000_PM_003", "206_SPM_000_PM_021", "208_SPM_000_PM_014", "213_SPM_000_PM_010",
        "215_SPM_000_PM_013", "221_SPM_002_PM_001", "222_SPM_004_PM_001", "223_SPM_000_PM_009",
        "224_SRT_SPM_000_PM_071", "224_SRT_SPM_000_PM_091", "238_SPM_000_PM_018", "239_SPM_000_PM_018",
        "300a_SPM_000_PM_007", "301_SPM_000_PM_010", "302_SPM_000_PM_008", "310_SPM_000_PM_024",
        "311_SPM_000_PM_041", "314_SPM_000_PM_012", "315_TAM_002_PM_001", "316_SPM_000_PM_014",
        "319_SPM_000_PM_008", "321_SPM_000_PM_005", "322_SPM_000_PM_008", "401_SPM_004_PM_008",
        "402_SPM_000_PM_020", "407_SPM_000_PM_018", "409_SPM_000_PM_024", "414_SPM_000_PM_007",
        "Cloud_2_01_SRT_SPM_000_PM_004", "Cloud_2_02_SRT_SPM_000_PM_039", "Cloud_2_03_SRT_SPM_002_PM_013", "Cloud_2_04_SRT_SPM_000_PM_017"
      }},
      {function() return not locked["B Gate"] and not locked["Connector"] end, {
        "Cloud_2_04_SRT_SPM_002_PM_002"
      }},
      {function() return not locked["B Gate"] and not locked["Connector"] and not locked["Fan"] end, {
        "Cloud_2_05_SRT_TAM_003_PM_003"
      }},
      {function() return not locked["B Gate"] and not locked["Fan"] end, {
        "Cloud_2_07_SRT_TAM_001_PM_004"
      }},
      -- C
      {function() return not locked["C Gate"] end, {
        "112_SPM_000_PM_034", "114_SPM_000_PM_032", "216_SPM_000_PM_015", "217_SPM_000_PM_040",
        "219_SPM_000_PM_008", "225_SPM_000_PM_044", "226_SPM_000_PM_039", "227_SPM_002_PM_033",
        "229_SPM_000_PM_070", "230_SPM_000_PM_019", "232_SPM_000_PM_012", "233_SPM_000_PM_015",
        "234_SPM_000_PM_015", "308_SPM_000_PM_017", "309_SPM_000_PM_018", "312_SPM_000_PM_032",
        "313_SPM_000_PM_016", "317_SPM_000_PM_024", "318_SPM_000_PM_026", "328_SPM_000_PM_016",
        "403_SPM_000_PM_015", "404_SPM_000_PM_022", "405_SRT_SPM_000_PM_047", "405_SRT_SPM_000_PM_050",
        "408_SPM_000_PM_033", "408_SRT_SPM_000_PM_034", "416_SPM_000_PM_026", "417_SPM_000_PM_029",
        "418_SPM_000_PM_014", "Cloud_3_01_SRT_SPM_000_PM_017", "Cloud_3_02_SRT_TAM_001", "Cloud_3_03_SRT_SPM_000_PM_069",
        "Cloud_3_05_SRT_SPM_003_PM_012", "Cloud_3_06_SRT_SPM_000_PM_008", "Cloud_3_07_SRT_SPM_000_PM_021", "Islands_01_SRT_SPM_000_PM_003"
      }},
      {function() return not locked["C Gate"] and not locked["Cube"] end, {
        "Cloud_3_05_SRT_SPM_002_PM_016", "Cloud_3_05_SRT_SPM_000_PM_035"
      }},
      -- Star Worlds
      {function() return not locked["A Star"] and not locked["B Star"] and not locked["C Star"] end, {
        "115_SRT_TAM_004_PM_016", "117_SRT_SPM_000_PM_028", "119_SRT_SPM_000_PM_033", "214_SRT_SPM_000_PM_025",
        "306_SRT_SPM_000_PM_016", "411_SRT_SPM_000_PM_014", "504_SRT_SPM_000_PM_021"
      }},
      {function()
        return not locked["A Star"] and not locked["B Star"] and not locked["C Star"]
               and not locked["Connector"]
       end, {
        "320_SRT_SPM_000_PM_046", "235_SRT_SPM_000_PM_037"
      }},      
      -- Nexus
      {function() return not locked["F3"] end, {
        "LeapOfFaith_PM_010"
      }},
      {function() return (not locked["Connector"] and not locked["C Gate"] and not locked["F1"]) or not locked["F3"] end, {
        "Secret_28_SRT_SPM_000_PM_004"
      }}
    }
  -- 60FPS
  elseif mode == 2 then
    toTranslate = false
    markers = {
      -- A
      {function() return true end, {
        "001a_SPM_000_PM_008", "001_SPM_000_PM_005", "005_SPM_000_PM_009", "006_SPM_000_PM_003",
        "007_SPM_000_PM_006", "008_SPM_000_PM_016", "011_SPM_000_PM_009", "012_SPM_000_PM_004",
        "013_SPM_000_PM_006", "015_SRT_SPM_000_PM_017", "015_SRT_SPM_000_PM_018", "017_SPM_000_PM_023",
        "020_SPM_000_PM_014", "107_SPM_000_PM_007", "108_SPM_000_PM_012", "111_SPM_000_PM_012",
        "201_SPM_000_PM_013", "201_SRT_SPM_000_PM_004", "202b_SPM_000_PM_004", "202c_SPM_000_PM_003",
        "202e_SPM_000_PM_004", "202f_SPM_000_PM_003", "220_SPM_000_PM_032", "204_SPM_000_PM_004",
        "207_SPM_000_PM_005", "209_SPM_000_PM_012", "210_SPM_000_PM_015", "211_SPM_000_PM_008",
        "218_SPM_000_PM_016", "244_SPM_000_PM_008", "244_SRT_SPM_000_PM_006", "303_SPM_000_PM_010",
        "305_SPM_000_PM_004", "Cloud_1_02_SRT_SPM_000_PM_016", "Cloud_1_02_SRT_SPM_001_PM_003", "Cloud_1_03_SRT_SPM_000_PM_005",
        "Cloud_1_04_SRT_SPM_000_PM_007", "Cloud_1_06_SRT_SPM_000_PM_007", "Cloud_1_07_SRT_SPM_000_PM_021"
      }},
      {function() return not locked["Connector"] end, {
        "202d_SPM_000_PM_002", "212_SPM_000_PM_017"
      }},
      -- B
      {function() return not locked["B Gate"] end, {
        "113_SPM_000_PM_036", "118_SPM_000_PM_062", "120_SPM_000_PM_029", "213_SPM_000_PM_010",
        "223_SPM_000_PM_009", "224_SRT_SPM_000_PM_071", "224_SRT_SPM_000_PM_091", "311_SPM_000_PM_041",
        "315_TAM_002_PM_001", "319_SPM_000_PM_008", "Cloud_2_02_SRT_SPM_000_PM_039"
      }},
      {function() return not locked["B Gate"] and not locked["Connector"] end, {
        "206_SPM_000_PM_021", "208_SPM_000_PM_014", "215_SPM_000_PM_013", "301_SPM_000_PM_010",
        "414_SPM_000_PM_007"
      }},
      {function() return not locked["B Gate"] and not locked["Connector"] and not locked["Cube"] end, {
        "310_SPM_000_PM_024", "Cloud_2_04_SRT_SPM_000_PM_017"
      }},
      {function() return not locked["B Gate"] and not locked["Connector"] and not locked["Fan"] end, {
        "Cloud_2_05_SRT_TAM_003_PM_003"
      }},
      {function()
        return not locked["B Gate"]
               and ((not locked["Connector"] and not locked["Cube"])
                    or not locked["Recorder"])
       end, {
        "321_SPM_000_PM_005", "407_SPM_000_PM_018"
      }},
      {function() return not locked["B Gate"] and (not locked["Connector"] or not locked["Cube"]) end, {
        "203_SPM_000_PM_011", "205_SPM_000_PM_003", "302_SPM_000_PM_008", "Cloud_2_01_SRT_SPM_000_PM_004"
      }},
      {function() return not locked["B Gate"] and (locked["Connector"] or not locked["Cube"]) end, {
        "401_SPM_004_PM_008", "409_SPM_000_PM_024"
      }},
      {function() return not locked["B Gate"] and not locked["Connector"] and (not locked["Cube"] or not locked["Fan"]) end, {
        "Cloud_2_04_SRT_SPM_002_PM_002"
      }},
      {function() return not locked["B Gate"] and not locked["Cube"] end, {
        "221_SPM_002_PM_001", "222_SPM_004_PM_001", "238_SPM_000_PM_018", "300a_SPM_000_PM_007",
        "314_SPM_000_PM_012", "316_SPM_000_PM_014", "402_SPM_000_PM_020", "Cloud_2_03_SRT_SPM_002_PM_013"
      }},
      {function() return not locked["B Gate"] and (not locked["Cube"] or not locked["Recorder"]) end, {
        "239_SPM_000_PM_018", "322_SPM_000_PM_008"
      }},
      {function() return not locked["B Gate"] and not locked["Fan"] end, {
        "Cloud_2_07_SRT_TAM_001_PM_004"
      }},
      -- C
      {function() return not locked["C Gate"] end, {
        "112_SPM_000_PM_034", "114_SPM_000_PM_032", "216_SPM_000_PM_015", "217_SPM_000_PM_040",
        "219_SPM_000_PM_008", "226_SPM_000_PM_039", "229_SPM_000_PM_070", "230_SPM_000_PM_019",
        "232_SPM_000_PM_012", "234_SPM_000_PM_015", "312_SPM_000_PM_032", "317_SPM_000_PM_024",
        "318_SPM_000_PM_026", "328_SPM_000_PM_016", "403_SPM_000_PM_015", "408_SPM_000_PM_033",
        "416_SPM_000_PM_026", "417_SPM_000_PM_029", "418_SPM_000_PM_014", "Cloud_3_01_SRT_SPM_000_PM_017",
        "Cloud_3_02_SRT_TAM_001", "Cloud_3_03_SRT_SPM_000_PM_069", "Cloud_3_05_SRT_SPM_003_PM_012", "Cloud_3_06_SRT_SPM_000_PM_008",
        "Islands_01_SRT_SPM_000_PM_003"
      }},
      {function() return not locked["C Gate"] and not locked["Connector"] end, {
        "313_SPM_000_PM_016"
      }},
      {function()
        return not locked["C Gate"] and not locked["Connector"]
               and (not locked["Cube"] or not locked["Recorder"] or not locked["Platform"])
       end, {
        "405_SRT_SPM_000_PM_050"
      }},
      {function() return not locked["C Gate"] and not locked["Cube"] end, {
        "225_SPM_000_PM_044", "227_SPM_002_PM_033", "233_SPM_000_PM_015", "308_SPM_000_PM_017",
        "309_SPM_000_PM_018", "404_SPM_000_PM_022", "Cloud_3_05_SRT_SPM_002_PM_016", "Cloud_3_05_SRT_SPM_000_PM_035",
        "Cloud_3_07_SRT_SPM_000_PM_021" 
      }},
      {function() return not locked["C Gate"] and (not locked["Cube"] or not locked["Fan"]) end, {
        "408_SRT_SPM_000_PM_034"
      }},
      {function()
        return not locked["C Gate"]
               and ((not locked["Connector"] and not locked["Cube"])
                   or (not locked["Recorder"] and not locked["Platform"]))
       end, {
        "405_SRT_SPM_000_PM_047"
      }},
      -- Star Worlds
      {function() return not locked["A Star"] and not locked["B Star"] and not locked["C Star"] end, {
        "115_SRT_TAM_004_PM_016", "117_SRT_SPM_000_PM_028", "119_SRT_SPM_000_PM_033", "214_SRT_SPM_000_PM_025",
        "411_SRT_SPM_000_PM_014"
      }},
      {function()
        return not locked["A Star"] and not locked["B Star"] and not locked["C Star"]
               and not locked["Connector"]
       end, {
        "320_SRT_SPM_000_PM_046"
      }},      
      {function()
        return not locked["A Star"] and not locked["B Star"] and not locked["C Star"]
               and not locked["Connector"] and not locked["Cube"]
       end, {
        "306_SRT_SPM_000_PM_016", "235_SRT_SPM_000_PM_037", "504_SRT_SPM_000_PM_021"
      }},
      -- Nexus
      {function()
        return (not locked["F2"] and not locked["F3"] and not locked["Cube"])
               or not locked["F5"]
      end, {
        "LeapOfFaith_PM_010"
      }},
      {function() return (not locked["Connector"] and not locked["C Gate"] and not locked["F1"]) or not locked["F3"] end, {
        "Secret_28_SRT_SPM_000_PM_004"
      }}
    }
  end
  
  --[[
  Both Default and 60FPS can use the same code here, just need
   to have defined the marker list first
  ]]--
  if mode == 1 or mode == 2 then
    local arranger = ""
    local accessableArrangers = {"A Gate", "A Star", "Connector", "Cube"}
    local checkGates = true
    local availableMarkers = 0
    local openMarkers = {}
    local closedMarkers = {}
    for i=1, #markers do
      closedMarkers[i] = i
    end
    
    -- Place the provided sigils in accessable areas
    local function placeSigils(sigils)
      for i=1, #sigils do
        local index = rand(1, availableMarkers)
        for j=1, #openMarkers do
          if index > #markers[openMarkers[j]][2] then
            index = index - #markers[openMarkers[j]][2]
          else
            local randMarker = table.remove(markers[openMarkers[j]][2], index)
            if toTranslate then
              talosProgress:SetCode(translate[randMarker], tetroIndexes[sigils[i]])
            else
              talosProgress:SetCode(randMarker, tetroIndexes[sigils[i]])
            end
            tetroIndexes[sigils[i]] = nil
            availableMarkers = availableMarkers - 1
            if #markers[openMarkers[j]][2] == 0 then
              table.remove(openMarkers, j)
            end
            if DEBUG then
              printWarning(string.format("Placed %s at marker %s", sigils[i], randMarker))
            end            
            break
          end
        end
      end
    end    
    
    while #accessableArrangers > 0 do
      -- Find the markers that are currently accessable
      local toRemove = {}
      for i=1, #closedMarkers do
        local index = closedMarkers[i]
        if markers[index][1]() then
          table.insert(openMarkers, index)
          table.insert(toRemove, i)
          availableMarkers = availableMarkers + #markers[index][2]
          if DEBUG then
            print("Added " .. #markers[index][2] .. " new markers")
          end
        end
      end
      -- If I don't do it this way it'll skip stuff when the indexes move down
      for i=1, #toRemove do
        table.remove(closedMarkers, toRemove[i] - (i - 1))
      end
      if DEBUG then
        print(availableMarkers .. " total markers accessable")
      end
    
      local index = rand(1, #accessableArrangers)
      local arranger = table.remove(accessableArrangers, index)
      if arranger == "A Gate" then
        table.insert(accessableArrangers, "B Gate")
        table.insert(accessableArrangers, "C Gate")
        table.insert(accessableArrangers, "F1")
      elseif arranger == "B Gate" then
        table.insert(accessableArrangers, "Fan")
        table.insert(accessableArrangers, "Recorder")
        table.insert(accessableArrangers, "B Star")
      elseif arranger == "C Gate" then
        table.insert(accessableArrangers, "Platform")
        table.insert(accessableArrangers, "C Star")
      elseif arranger == "F1" then
        table.insert(accessableArrangers, "F2")
        table.insert(accessableArrangers, "F3")
        table.insert(accessableArrangers, "F6")
      elseif arranger == "F3" then
        table.insert(accessableArrangers, "F4")
      elseif arranger == "F4" then
        table.insert(accessableArrangers, "F5")
      end
      if DEBUG then
        print("Selected " .. arranger .. " Arranger")
      end
      local sigils = locked[arranger]
      locked[arranger] = nil
      
      --[[
        Make sure you can't go to the wrong hub first and softlock.
        Sometimes does this by unlocking both, but usually by hiding
         required sigils outside of A
        Requires at least two sigils in each hub to always be unlockable
        Don't need to do both times you unlock a hub.
      ]]--
      if checkGates then
        if arranger == "B Gate" or arranger == "C Gate" then
          -- Sometimes we want both hubs to be accessable when you leave A
          if rand(0, 99) < PROB_BOTH_HUBS then
            if DEBUG then
              print("Both Hubs open after A")
            end
            -- If so we're going to manually add the sigils for the second one
            sigils = {"DI2", "DL2", "DT1", "DT2", "DZ3",
                      "DJ4", "DJ5", "DL3", "DT3", "DT4", "DZ4"}
            -- Need to make sure we use up the extra sigils
            if arranger == "B Gate" then
              table.insert(accessableArrangers, "Platform")
              table.insert(accessableArrangers, "C Star")              
            elseif arranger == "C Gate" then
              table.insert(accessableArrangers, "Fan")
              table.insert(accessableArrangers, "Recorder")
              table.insert(accessableArrangers, "B Star")
            end
            -- Both gates are always unlocked at the same time, this is safe
            for i=1, #accessableArrangers do
              local v = accessableArrangers[i]
              if v == "B Gate" or v == "C Gate" then
                table.remove(accessableArrangers, i)
              end
            end
            locked["B Gate"] = nil
            locked["C Gate"] = nil
          else
            if DEBUG then
              print(string.sub(arranger, 1, 1) .. " open after A")
            end
            
            local uniqueSigils = {}
            if arranger == "B Gate" then
              uniqueSigils = {"DJ4", "DJ5"}
              sigils = {"DI2", "DL2", "DT1", "DT2", "DZ3"}
            elseif arranger == "C Gate" then
              uniqueSigils = {"DI2"}
              sigils = {"DJ4", "DJ5", "DL3", "DT3", "DT4", "DZ4"}
            end
            
            -- Find the markers this world unlocked
            local tempOpenMarkers = {}
            local tempAvailableMarkers = 0
            for i=1, #closedMarkers do
              local index = closedMarkers[i]
              if markers[index][1]() then
                table.insert(tempOpenMarkers, index)
                tempAvailableMarkers = tempAvailableMarkers + #markers[index][2]
              end
            end
            if DEBUG then
              print("Found " .. tempAvailableMarkers .. " newly-available spots")
            end
            
            -- Place the unique sigils in the new spots
            for i=1, #uniqueSigils do
              local index = rand(1, tempAvailableMarkers)
              for j=1, #tempOpenMarkers do
                if index > #markers[tempOpenMarkers[j]][2] then
                  index = index - #markers[tempOpenMarkers[j]][2]
                else
                  local randMarker = table.remove(markers[tempOpenMarkers[j]][2], index)
                  if toTranslate then
                    talosProgress:SetCode(translate[randMarker], tetroIndexes[uniqueSigils[i]])
                  else
                    talosProgress:SetCode(randMarker, tetroIndexes[uniqueSigils[i]])
                  end
                  tetroIndexes[uniqueSigils[i]] = nil
                  tempAvailableMarkers = tempAvailableMarkers - 1
                  --[[
                    We don't bother removing empty tables here, unlike placeSigils(),
                     because worst case we iterate over it just once
                  ]]--
                  if DEBUG then
                    printWarning(string.format("Placed %s at marker %s", uniqueSigils[i], randMarker))
                  end            
                  break
                end
              end
            end
            if DEBUG then
              print("Finished locking unique sigils")
            end
          end
          checkGates = false
        end
      end
      
      placeSigils(sigils)
    end
    
    
    if DEBUG then
      print("Selected A1 Gate Arranger")
      print(availableMarkers .. " total markers accessable")
    end  
    placeSigils(locked["A1 Gate"])
  
  -- Fully Random
  elseif mode == 3 then
    -- Knuth randomization
    for i = 1, #markers do
      local otherMarker = markers[rand(1, i)]
      talosProgress:SetCode(markers[i], talosProgress:GetCodeValue(otherMarker))
      talosProgress:SetCode(otherMarker, i)
    end
  end
  
  talosProgress:SetVar("Randomizer_Generated")
  talBackupAndSaveTalosProgress(worldInfo)
  if DEBUG then
    print("=======================\n Randomization Finished\n=======================")
  else
    print("Randomization Finished")
  end
end

-- Move sigils to the correct positions
for i=1, #worldMarkers do
  local worldMarker = worldMarkers[i]
  local sigilNum = talosProgress:GetCodeValue(worldMarker:GetName())
  local sigil = worldGlobals.allTetros[sigilNum]
  assert(sigil ~= nil, "Marker " .. worldMarker:GetName() .. " does not have a sigil assigned to it!")
  sigil:SetPlacement(worldMarker:GetPlacement())
  if DEBUG then
    printWarning(string.format("Moving %s to %s", sigil:GetName(), worldMarker:GetName()))
  end
end

SignalEvent("Randomizer_Finished")��\�v�M�-�dX�;��:K��ak�7H����^��OCZ9d�;,X3�
�q�{���2c�m�Q-&��kn���G��h��!
ЭE��u�[&&s��qt
)ߛ�*���ղR(o��L�>�<^����k�iY롑�Y9�R��"�������4U�o�� rk�0,���J�H���(t���USG��T��k5S���4;��ĊQ�~j����j�D�b�#��_�������@��J[ۯ��(-�T�