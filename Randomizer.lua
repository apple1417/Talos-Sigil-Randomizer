SIGSTRM12GIS             *s3                  Signkey.EditorSignature48�A�Wd��Ԥ�Ÿu�QR^K��.���I�I����PY�? ��V��ӈ�Ʃ`Gg�na�������4(02�O�G�ع����Bفf���}�����1���'	�y0�_Wń�z��.'���x�?�t�Y�j����
؁��Q�S���NYUO#�Ƀ_o�6�p*�%A�Ȼ��3^O(7�M �#y�|Ҳ	Vy���jb�
d
�QjC.�Xe����H�����tVR�o�s|��4�e>8!%﻿--[[
  This is the big script, the one that does everything
  It's in every world but A and B messenger
  It generates the full random sigil/portal configuration
  This is the oldest script in the whole project, there'll be stuff
   that looks weird
]]--

Wait(CustomEvent("Randomizer_ConstantsLoaded"))

-- Grab some stuff from worldGlobals
local Randomizer = worldGlobals.Randomizer
local print = Randomizer.print
local printWarning = Randomizer.printWarning
local printError = Randomizer.printError

print("Loaded Randomizer " .. Randomizer.version)

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local PROB_BOTH_HUBS = 25
local PROB_RAND_ARRANGER = 50

--[[
  Debug mode is kind of hidden, you need to use a command to activate it,
   but everything tends to work now so it doesn't need a switch
]]--
local DEBUG = talosProgress:IsVarSet(Randomizer.MiscFlags.debug)

-- Where the magic happens
if not talosProgress:IsVarSet(Randomizer.MiscFlags.generated) then
  print("Randomizing...")

  --[[
    First make sure that all variables are set to their defaults, so this
     all works properly from a clearTalosProgress()
  ]]--
  if not talosProgress:IsVarSet(Randomizer.Mobius.talosProgress) then
    talosProgress:SetVarValue(Randomizer.Mobius.talosProgress, 0)
  end
  if not talosProgress:IsVarSet(Randomizer.Moody.talosProgress) then
    talosProgress:SetVarValue(Randomizer.Moody.talosProgress, 0)
  end
  if not talosProgress:IsVarSet(Randomizer.Scavenger.talosProgress) then
    talosProgress:SetVarValue(Randomizer.Scavenger.talosProgress, 0)
  end
  if not talosProgress:IsVarSet(Randomizer.Hints.talosProgress) then
    talosProgress:SetVarValue(Randomizer.Hints.talosProgress, 0)
  end

  local RandomizationMode = talosProgress:GetCodeValue(Randomizer.Modes.talosProgress)
  if RandomizationMode == -1 then
    RandomizationMode = Randomizer.Modes.Values.Default.id
    talosProgress:SetVarValue(Randomizer.Modes.talosProgress, Randomizer.Modes.Values.Default.id)
  end
  RandomizationMode = Randomizer.Modes.AsArray[RandomizationMode + 1]
  print("Using randomization mode: ".. RandomizationMode.name)

  local seed = talosProgress:GetCodeValue(Randomizer.Seed.talosProgress)
  if seed == -1 then
    seed = mthRndRangeL(0, 2147483647)
    talosProgress:SetCode(Randomizer.Seed.talosProgress, seed)
  end
  print("Using Seed", seed)

  --[[
    Linear congruential generator using Microsoft VC++ seeds
    Unlike the built-in, we can seed this
    Gives intergers from min to max inclusive
    Thanks Darkid :)
  ]]--
  local function rand(min, max)
    seed = (214013 * seed + 2531011) % 2147483648
    if min == max then return min end
    return (seed % (max - (min - 1))) + min
  end

  -- Set the few things that are normally random based on seed
  talosProgress:SetVarValue("PaintItemSeed", rand(0, 8909478))
  talosProgress:SetVarValue("Code_Floor4", rand(1, 999))
  talosProgress:SetVarValue("Code_Floor5", rand(1, 999))
  local codeF6 = 0
  for i=1,3 do
    local digit = rand(4, 9) -- Yes this is right
    talosProgress:SetVarValue("Code_Floor6" .. tostring(i), digit)
    -- This line means you can guess the code without visiting each world
    talosProgress:SetVar("Code_Floor6DigitSeen" .. tostring(i))
    codeF6 = codeF6*10 + digit
  end
  talosProgress:SetVarValue("Code_Floor6", codeF6)

  -- We can only save numbers, so this is how tetros are ordered
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
    ["NZ3"] =126, ["NZ4"] =127, ["NZ5"] =128, ["NZ6"] =129
  }

  --[[
    This list has two purposes:
     1. Hold the sigils for each arranger
     2. Let the marker unlocking that happens later check what's unlocked
    #2 is the reason for the "weird" name
  ]]--
  local locked = {}
  for key, Arranger in pairs(Randomizer.Arrangers) do
    locked[key] = Arranger.Sigils
  end
  --[[
    All the greens get set later, as we need to lock parts of them to make sure you can't
     enter the wrong hub and softlock, but which parts depends on the starting hub
  ]]--
  locked.A1Gate = {}
  locked.AGate = {}
  locked.BGate = {}
  locked.CGate = {}

  -- If scavenger hunt mode is on decide what ending we're doing
  local Scavenger = talosProgress:GetCodeValue(Randomizer.Scavenger.talosProgress)
  Scavenger = Randomizer.Scavenger.AsArray[Scavenger + 1]
  local ScavengerEnding = nil
  if Scavenger ~= Randomizer.Scavenger.Values.Off then
    --[[
      F6 is no fun in short, you either need to hope for multiple
       star worlds in first hub or spend forever guessing the code
    ]]--
    local maxEnding = 3
    if Scavenger == Randomizer.Scavenger.Values.Full then
      maxEnding = 4
    end
    ScavengerEnding = rand(1, maxEnding)
    talosProgress:SetVarValue(Randomizer.Scavenger.Endings.talosProgress, ScavengerEnding)
    ScavengerEnding = Randomizer.Scavenger.Endings.AsArray[ScavengerEnding]

    -- The only one you can actually do intended
    if RandomizationMode == Randomizer.Modes.Values.Intended then
      ScavengerEnding = Randomizer.Scavenger.Endings.Values.F6
      talosProgress:SetVarValue(Randomizer.Scavenger.Endings.talosProgress, ScavengerEnding.id)
    end

    if DEBUG then
      print("Using scavenger hunt mode: " .. Scavenger.name)
      print("Using scavenger hunt ending: " .. ScavengerEnding.name)
    end
  end

  --[[
    Randomize Portals
    If the option is off all portals will be put in their normal
     spots, but we still need to set everything up so that we unlock
     markers properly
  ]]--
  local portalOrder = {
    Randomizer.Puzzles.A1, Randomizer.Puzzles.A2, Randomizer.Puzzles.A3,
    Randomizer.Puzzles.A4, Randomizer.Puzzles.A5, Randomizer.Puzzles.A6,
    Randomizer.Puzzles.A7, Randomizer.Puzzles.AStar, Randomizer.Puzzles.ADev,
    Randomizer.Puzzles.B1, Randomizer.Puzzles.B2, Randomizer.Puzzles.B3,
    Randomizer.Puzzles.B4, Randomizer.Puzzles.B5, Randomizer.Puzzles.B6,
    Randomizer.Puzzles.B7, Randomizer.Puzzles.BStar, Randomizer.Puzzles.C1,
    Randomizer.Puzzles.C2, Randomizer.Puzzles.C3, Randomizer.Puzzles.C4,
    Randomizer.Puzzles.C5, Randomizer.Puzzles.C6, Randomizer.Puzzles.C7,
    Randomizer.Puzzles.CStar, Randomizer.Puzzles.CMessenger
  }
  local portalIndexes = {}
  -- We need two lists so that we can compare the randomized one to the intial order
  for i = 1, #portalOrder do
      table.insert(portalIndexes, portalOrder[i])
  end

  local startHub = Randomizer.Hub.A
  local Mobius = talosProgress:GetCodeValue(Randomizer.Mobius.talosProgress)
  Mobius = Randomizer.getAllBits(Mobius, Randomizer.Mobius)
  local portals = talosProgress:IsVarSet(Randomizer.MiscOptions.Values.Portals.talosProgress)
  if #Mobius ~= 0 then
    if DEBUG then
      print("Möbius mode is on")
    end
    if portals then
      for index=2, #portalOrder do
        local otherIndex = rand(1, index - 1)
        portalOrder[index], portalOrder[otherIndex] = portalOrder[otherIndex], portalOrder[index]
      end
    else
      -- Move C Messenger to the start of the list
      table.remove(portalOrder)
      table.insert(portalOrder, 1, Randomizer.Puzzles.CMessenger)
    end
  elseif portals then
    if DEBUG then
      print("Randomizing portal locations")
    end
    -- We'll leave A1 alone for now because it has a few extra requirements
    for index=#portalOrder, 2, -1 do
      local otherIndex = rand(2, index)
      portalOrder[index], portalOrder[otherIndex] = portalOrder[otherIndex], portalOrder[index]
    end
    --[[
      A1 can't be Star worlds or C Messenger, you spawn behind a
       gate/wodden barrier upon leaving
      These are spots 8, 17, 25, and 26
    ]]--
    local index = rand(1, 22)
    --[[
      Intended kind of breaks if you spawn outside of A, there's
       just not enough space to put all the sigils
      Short scavenger limits you to one hub so it just kind of
       sucks making you walk to another to get items
    ]]--
    if RandomizationMode == Randomizer.Modes.Values.Intended
        or Scavenger == Randomizer.Scavenger.Values.Short then
      index = rand(1, 8)
    end
    if index < 8 then
      startHub = Randomizer.Hub.A
    elseif index == 8 then
      index = 9
      startHub = Randomizer.Hub.A
    elseif 9 <= index and index < 16 then
      index = index + 1
      startHub = Randomizer.Hub.B
    elseif 16 <= index then
      index = index + 2
      startHub = Randomizer.Hub.C
    end
    if DEBUG then
      print("Starting in " .. startHub.name)
    end
    portalOrder[1], portalOrder[index] = portalOrder[index], portalOrder[1]
  end

  --[[
    Based on the portal configuration we need to make some more lists
     to help us unlock worlds properly
  ]]--
  local open = {}
  local WorldANames = {}
  local WorldBNames = {}
  local WorldCNames = {}
  for index=1, #portalOrder do
    local name = portalOrder[index].talosProgress
    if DEBUG and portals then
      if #Mobius == 0 then
        printWarning(string.format("Portal marker %s is %s", portalIndexes[index].talosProgress, string.sub(name, 1, 2)))
       else
        printWarning(string.format("Portal leaving %s is %s", string.sub(name, 1, 2), portalIndexes[index].talosProgress))
      end
    end
    talosProgress:SetVarValue(name, index)
    -- These lists help us avoid instantly clogging the marker list
    local placedName = portalIndexes[index].talosProgress
    if string.sub(placedName, 1, 1) == "A" then
      WorldANames[portalOrder[index]] = true
    elseif string.sub(placedName, 1, 1) == "B" then
      WorldBNames[portalOrder[index]] = true
    elseif string.sub(placedName, 1, 1) == "C" then
      WorldCNames[portalOrder[index]] = true
    end
  end

  --[[
    Check if a world is accessible
    This does not necessarily  mean a set of markers will unlock
  ]]--
  local function isWorldOpen(world)
    if world == Randomizer.Puzzles.A1 then return true end
    -- An empty list still evaluates to true
    if RandomizationMode == Randomizer.Modes.Values.Intended
        and locked.A1Gate then
      return false
    end
    -- Full Scavenger and Mobius force all worlds open
    if Scavenger == Randomizer.Scavenger.Values.Full or #Mobius ~= 0 then
      return true
    end

    local starOverride = true
    local num = talosProgress:GetCodeValue(world.talosProgress)
    -- Is this a star world?
    if num == 8 or num == 17 or num == 25 then
      starOverride = not (locked.AStar or locked.BStar or locked.CStar)
    end

    return starOverride and open[world]
  end

  --[[
    These lists create the softlock prevention
    Because we use arbitray functions we can add modes with arbitray
     restrictions just by making new lists
    The list entries are formatted as follows:
    {function() [if to unlock], {"list", "of, "markers"}, "world"},
    If no world is given OR the world is not recognised it will
     always be checked, otherwise we can save some iterations and
     add it later, when it's actually unlocked
  ]]--
  local markers = Randomizer.Puzzles.AsArray
  if RandomizationMode == Randomizer.Modes.Values.Default then
    markers = {
      {function() return true end, {
        Randomizer.Puzzles.A1.PaSL,
        Randomizer.Puzzles.A1.StBP,
        Randomizer.Puzzles.A1.Outnumbered,
        Randomizer.Puzzles.A1.OtToU,
        Randomizer.Puzzles.A1.ASOoR,
        Randomizer.Puzzles.A1.Trio,
        Randomizer.Puzzles.A1.Peephole,
        Randomizer.Puzzles.A1.Star
      }},
      {function() return isWorldOpen(Randomizer.Puzzles.A2) end, {
        Randomizer.Puzzles.A2.Guards,
        Randomizer.Puzzles.A2.HoW,
        Randomizer.Puzzles.A2.SM,
        Randomizer.Puzzles.A2.Star
      }, Randomizer.Puzzles.A2},
      {function() return isWorldOpen(Randomizer.Puzzles.A3) end, {
        Randomizer.Puzzles.A3.ABTUStar,
        Randomizer.Puzzles.A3.ABTU,
        Randomizer.Puzzles.A3.AEP,
        Randomizer.Puzzles.A3.LMUStK,
        Randomizer.Puzzles.A3.SfL,
        Randomizer.Puzzles.A3.Clock
      }, Randomizer.Puzzles.A3},
      {function() return isWorldOpen(Randomizer.Puzzles.A4) end, {
        Randomizer.Puzzles.A4.PiF,
        Randomizer.Puzzles.A4.BiO,
        Randomizer.Puzzles.A4.AAT,
        Randomizer.Puzzles.A4.Star
      }, Randomizer.Puzzles.A4},
      {function() return isWorldOpen(Randomizer.Puzzles.A4) and not locked.Connector end, {
        Randomizer.Puzzles.A4.DCtS
      }, Randomizer.Puzzles.A4},
      {function() return isWorldOpen(Randomizer.Puzzles.A5) end, {
        Randomizer.Puzzles.A5.TwoBoxes,
        Randomizer.Puzzles.A5.TwoBoxesStar,
        Randomizer.Puzzles.A5.GOtF,
        Randomizer.Puzzles.A5.YKYMCtS,
        Randomizer.Puzzles.A5.OLB,
        Randomizer.Puzzles.A5.FC,
        Randomizer.Puzzles.A5.FCStar
      }, Randomizer.Puzzles.A5},
      {function() return isWorldOpen(Randomizer.Puzzles.A6) end, {
        Randomizer.Puzzles.A6.Mindfield,
        Randomizer.Puzzles.A6.Deception,
        Randomizer.Puzzles.A6.ADTF,
        Randomizer.Puzzles.A6.Bichromatic,
        Randomizer.Puzzles.A6.Star
      }, Randomizer.Puzzles.A6},
      {function() return isWorldOpen(Randomizer.Puzzles.A7) end, {
        Randomizer.Puzzles.A7.TPLB,
        Randomizer.Puzzles.A7.PW,
        Randomizer.Puzzles.A7.LfI,
        Randomizer.Puzzles.A7.WiaL,
        Randomizer.Puzzles.A7.TI,
        Randomizer.Puzzles.A7.Star
      }, Randomizer.Puzzles.A7},
      {function() return isWorldOpen(Randomizer.Puzzles.AStar) end, {
        Randomizer.Puzzles.AStar.DDM,
        Randomizer.Puzzles.AStar.NW,
        Randomizer.Puzzles.AStar.JfW
      }, Randomizer.Puzzles.AStar},
      {function() return isWorldOpen(Randomizer.Puzzles.B1) end, {
        Randomizer.Puzzles.B1.SaaS,
        Randomizer.Puzzles.B1.WtaD,
        Randomizer.Puzzles.B1.TW,
        Randomizer.Puzzles.B1.OtF,
        Randomizer.Puzzles.B1.RoD,
        Randomizer.Puzzles.B1.Star
      }, Randomizer.Puzzles.B1},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) end, {
        Randomizer.Puzzles.B2.HG,
        Randomizer.Puzzles.B2.Tomb,
        Randomizer.Puzzles.B2.MoTM,
        Randomizer.Puzzles.B2.Moonshot,
        Randomizer.Puzzles.B2.Star
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B3) end, {
        Randomizer.Puzzles.B3.Sunshot,
        Randomizer.Puzzles.B3.BA,
        Randomizer.Puzzles.B3.EN,
        Randomizer.Puzzles.B3.Whoosh,
        Randomizer.Puzzles.B3.Star
      }, Randomizer.Puzzles.B3},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) end, {
        Randomizer.Puzzles.B4.TRA,
        Randomizer.Puzzles.B4.ABUH,
        Randomizer.Puzzles.B4.DP,
        Randomizer.Puzzles.B4.SHT,
        Randomizer.Puzzles.B4.RPS,
        Randomizer.Puzzles.B4.WAtC,
        Randomizer.Puzzles.B4.TRAStar
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and (not locked.Connector or not locked.Cube) end, {
        Randomizer.Puzzles.B4.Sphinx
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) end, {
        Randomizer.Puzzles.B5.Plates,
        Randomizer.Puzzles.B5.MMaOTJ,
        Randomizer.Puzzles.B5.BtIC,
        Randomizer.Puzzles.B5.SES,
        Randomizer.Puzzles.B5.Chambers
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) and ((not locked.Connector and not locked.Fan) or not locked.Cube) end, {
        Randomizer.Puzzles.B5.Obelisk
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B6) end, {
        Randomizer.Puzzles.B6.EA,
        Randomizer.Puzzles.B6.JDaW,
        Randomizer.Puzzles.B6.Crisscross
      }, Randomizer.Puzzles.B6},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) end, {
        Randomizer.Puzzles.B7.WLJ,
        Randomizer.Puzzles.B7.AFaF,
        Randomizer.Puzzles.B7.BSbSStar,
        Randomizer.Puzzles.B7.BSbS,
        Randomizer.Puzzles.B7.BLoM
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and (not locked.Cube or not locked.Fan) end, {
        Randomizer.Puzzles.B7.Pyramid
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.BStar) end, {
        Randomizer.Puzzles.BStar.MGR,
        Randomizer.Puzzles.BStar.CC,
        Randomizer.Puzzles.BStar.Peekaboo
      }, Randomizer.Puzzles.BStar},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) end, {
        Randomizer.Puzzles.C1.Labyrinth,
        Randomizer.Puzzles.C1.Conservatory,
        Randomizer.Puzzles.C1.Blowback,
        Randomizer.Puzzles.C1.Star
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) and not locked.Cube end, {
        Randomizer.Puzzles.C1.MIA
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C2) end, {
        Randomizer.Puzzles.C2.Cemetery,
        Randomizer.Puzzles.C2.ADaaF,
        Randomizer.Puzzles.C2.Rapunzel,
        Randomizer.Puzzles.C2.TSW,
        Randomizer.Puzzles.C2.Star
      }, Randomizer.Puzzles.C2},
      {function() return isWorldOpen(Randomizer.Puzzles.C3) end, {
        Randomizer.Puzzles.C3.TLCaaF,
        Randomizer.Puzzles.C3.BSLS,
        Randomizer.Puzzles.C3.JQ,
        Randomizer.Puzzles.C3.Weathertop,
        Randomizer.Puzzles.C3.Star
      }, Randomizer.Puzzles.C3},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) end, {
        Randomizer.Puzzles.C4.Stables,
        Randomizer.Puzzles.C4.Armory,
        Randomizer.Puzzles.C4.OublietteStar,
        Randomizer.Puzzles.C4.Oubliette,
        Randomizer.Puzzles.C4.ThroneRoomStar
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and not locked.Cube end, {
        Randomizer.Puzzles.C4.ThroneRoom
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) end, {
        Randomizer.Puzzles.C5.TimeCrawls,
        Randomizer.Puzzles.C5.Dumbwaiter,
        Randomizer.Puzzles.C5.TimeFlies,
        Randomizer.Puzzles.C5.UCaJ,
        Randomizer.Puzzles.C5.TFStar
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) and not locked.Cube end, {
        Randomizer.Puzzles.C5.UCaJStar,
        Randomizer.Puzzles.C5.DumbwaiterStar
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C6) end, {
        Randomizer.Puzzles.C6.TWS,
        Randomizer.Puzzles.C6.Circumlocution,
        Randomizer.Puzzles.C6.TSDoR,
        Randomizer.Puzzles.C6.Star
      }, Randomizer.Puzzles.C6},
      {function() return isWorldOpen(Randomizer.Puzzles.C7) end, {
        Randomizer.Puzzles.C7.PB,
        Randomizer.Puzzles.C7.CP,
        Randomizer.Puzzles.C7.CCA,
        Randomizer.Puzzles.C7.DMS,
        Randomizer.Puzzles.C7.Star
      }, Randomizer.Puzzles.C7},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) end, {
        Randomizer.Puzzles.CStar.Nexus
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) and (not locked.Connector or not locked.Cube) end, {
        Randomizer.Puzzles.CStar.Cobweb,
        Randomizer.Puzzles.CStar.UG
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CMessenger) end, {
        Randomizer.Puzzles.CMessenger.Star
      }, Randomizer.Puzzles.CMessenger},
      {function() return not locked.F1 and (not locked.Connector or not locked.F3) end, {
        Randomizer.Puzzles.Nexus.F0
      }},
      {function() return not locked.F1 and not locked.F3 end, {
        Randomizer.Puzzles.Nexus.F3
      }}
    }
  elseif RandomizationMode == Randomizer.Modes.Values.Sixty then
    markers = {
      {function() return isWorldOpen(Randomizer.Puzzles.A1) end, {
        Randomizer.Puzzles.A1.Peephole,
        Randomizer.Puzzles.A1.PaSL,
        Randomizer.Puzzles.A1.Outnumbered,
        Randomizer.Puzzles.A1.ASOoR,
        Randomizer.Puzzles.A1.OtToU,
        Randomizer.Puzzles.A1.Trio,
        Randomizer.Puzzles.A1.StBP,
        Randomizer.Puzzles.A1.Star
      }},
      {function() return isWorldOpen(Randomizer.Puzzles.A2) end, {
        Randomizer.Puzzles.A2.HoW,
        Randomizer.Puzzles.A2.Guards,
        Randomizer.Puzzles.A2.SM,
        Randomizer.Puzzles.A2.Star
      }, Randomizer.Puzzles.A2},
      {function() return isWorldOpen(Randomizer.Puzzles.A3) end, {
        Randomizer.Puzzles.A3.ABTUStar,
        Randomizer.Puzzles.A3.ABTU,
        Randomizer.Puzzles.A3.AEP,
        Randomizer.Puzzles.A3.LMUStK,
        Randomizer.Puzzles.A3.SfL,
        Randomizer.Puzzles.A3.Clock
      }, Randomizer.Puzzles.A3},
      {function() return isWorldOpen(Randomizer.Puzzles.A4) end, {
        Randomizer.Puzzles.A4.PiF,
        Randomizer.Puzzles.A4.BiO,
        Randomizer.Puzzles.A4.AAT,
        Randomizer.Puzzles.A4.Star
      }, Randomizer.Puzzles.A4},
      {function() return isWorldOpen(Randomizer.Puzzles.A4) and not locked.Connector end, {
        Randomizer.Puzzles.A4.DCtS
      }, Randomizer.Puzzles.A4},
      {function() return isWorldOpen(Randomizer.Puzzles.A5) end, {
        Randomizer.Puzzles.A5.TwoBoxes,
        Randomizer.Puzzles.A5.TwoBoxesStar,
        Randomizer.Puzzles.A5.GOtF,
        Randomizer.Puzzles.A5.YKYMCtS,
        Randomizer.Puzzles.A5.FC,
        Randomizer.Puzzles.A5.FCStar
      }, Randomizer.Puzzles.A5},
      {function() return isWorldOpen(Randomizer.Puzzles.A5) and (not locked.Connector or not locked.Cube) end, {
        Randomizer.Puzzles.A5.OLB
      }, Randomizer.Puzzles.A5},
      {function() return isWorldOpen(Randomizer.Puzzles.A6) end, {
        Randomizer.Puzzles.A6.Mindfield,
        Randomizer.Puzzles.A6.Deception,
        Randomizer.Puzzles.A6.ADTF,
        Randomizer.Puzzles.A6.Bichromatic,
        Randomizer.Puzzles.A6.Star
      }, Randomizer.Puzzles.A6},
      {function() return isWorldOpen(Randomizer.Puzzles.A7) end, {
        Randomizer.Puzzles.A7.TPLB,
        Randomizer.Puzzles.A7.PW,
        Randomizer.Puzzles.A7.LfI,
        Randomizer.Puzzles.A7.WiaL,
        Randomizer.Puzzles.A7.TI,
        Randomizer.Puzzles.A7.Star
      }, Randomizer.Puzzles.A7},
      {function() return isWorldOpen(Randomizer.Puzzles.AStar) end, {
        Randomizer.Puzzles.AStar.DDM,
        Randomizer.Puzzles.AStar.NW,
        Randomizer.Puzzles.AStar.JfW
      }, Randomizer.Puzzles.AStar},
      {function() return isWorldOpen(Randomizer.Puzzles.B1) end, {
        Randomizer.Puzzles.B1.RoD
      }, Randomizer.Puzzles.B1},
      {function() return isWorldOpen(Randomizer.Puzzles.B1) and not locked.Cube end, {
        Randomizer.Puzzles.B1.OtF
      }, Randomizer.Puzzles.B1},
      {function() return isWorldOpen(Randomizer.Puzzles.B1) and (not locked.Connector or not locked.Cube) end, {
        Randomizer.Puzzles.B1.WtaD,
        Randomizer.Puzzles.B1.SaaS,
        Randomizer.Puzzles.B1.TW,
        Randomizer.Puzzles.B1.Star
      }, Randomizer.Puzzles.B1},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) end, {
        Randomizer.Puzzles.B2.HG,
        Randomizer.Puzzles.B2.Tomb,
        Randomizer.Puzzles.B2.Moonshot,
        Randomizer.Puzzles.B2.Star
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) and not locked.Cube end, {
        Randomizer.Puzzles.B2.MoTM
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B3) and not locked.Cube end, {
        Randomizer.Puzzles.B3.Sunshot,
        Randomizer.Puzzles.B3.BA,
        Randomizer.Puzzles.B3.Star,
        Randomizer.Puzzles.B3.EN,
        Randomizer.Puzzles.B3.Whoosh
      }, Randomizer.Puzzles.B3},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and (not locked.Cube or not locked.Recorder) end, {
        Randomizer.Puzzles.B4.SHT
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Connector end, {
        Randomizer.Puzzles.B4.TRA,
        Randomizer.Puzzles.B4.WAtC
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and ((not locked.Connector and not locked.Cube) or not locked.Recorder) end, {
        Randomizer.Puzzles.B4.DP,
        Randomizer.Puzzles.B4.RPS
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.B4.ABUH,
        Randomizer.Puzzles.B4.TRAStar
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and ((not locked.Connector and not locked.Cube) or (not locked.Connector and not locked.Fan) or (not locked.Cube and not locked.Recorder)) end, {
        Randomizer.Puzzles.B4.Sphinx
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) end, {
        Randomizer.Puzzles.B5.BtIC,
        Randomizer.Puzzles.B5.Chambers
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) and not locked.Cube end, {
        Randomizer.Puzzles.B5.Plates,
        Randomizer.Puzzles.B5.SES,
        Randomizer.Puzzles.B5.Obelisk
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) and (not locked.Cube or not locked.Recorder) end, {
        Randomizer.Puzzles.B5.MMaOTJ
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B6) end, {
        Randomizer.Puzzles.B6.EA,
        Randomizer.Puzzles.B6.Crisscross
      }, Randomizer.Puzzles.B6},
      {function() return isWorldOpen(Randomizer.Puzzles.B6) and not locked.Connector end, {
        Randomizer.Puzzles.B6.JDaW
      }, Randomizer.Puzzles.B6},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) end, {
        Randomizer.Puzzles.B7.WLJ,
        Randomizer.Puzzles.B7.AFaF
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and (not locked.Connector or not locked.Cube) end, {
        Randomizer.Puzzles.B7.BSbS,
        Randomizer.Puzzles.B7.BSbSStar
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and not locked.Cube end, {
        Randomizer.Puzzles.B7.BLoM
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and (not locked.Cube or not locked.Fan) end, {
        Randomizer.Puzzles.B7.Pyramid
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.BStar) end, {
        Randomizer.Puzzles.BStar.MGR,
        Randomizer.Puzzles.BStar.Peekaboo
      }, Randomizer.Puzzles.BStar},
      {function() return isWorldOpen(Randomizer.Puzzles.BStar) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.BStar.CC
      }, Randomizer.Puzzles.BStar},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) end, {
        Randomizer.Puzzles.C1.Labyrinth,
        Randomizer.Puzzles.C1.Conservatory,
        Randomizer.Puzzles.C1.Blowback,
        Randomizer.Puzzles.C1.Star
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) and not locked.Cube end, {
        Randomizer.Puzzles.C1.MIA
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C2) end, {
        Randomizer.Puzzles.C2.Cemetery,
        Randomizer.Puzzles.C2.ADaaF,
        Randomizer.Puzzles.C2.Rapunzel,
        Randomizer.Puzzles.C2.TSW,
        Randomizer.Puzzles.C2.Star
      }, Randomizer.Puzzles.C2},
      {function() return isWorldOpen(Randomizer.Puzzles.C3) end, {
        Randomizer.Puzzles.C3.BSLS,
        Randomizer.Puzzles.C3.JQ,
        Randomizer.Puzzles.C3.Weathertop,
        Randomizer.Puzzles.C3.Star
      }, Randomizer.Puzzles.C3},
      {function() return isWorldOpen(Randomizer.Puzzles.C3) and not locked.Cube end, {
        Randomizer.Puzzles.C3.TLCaaF
      }, Randomizer.Puzzles.C3},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) end, {
        Randomizer.Puzzles.C4.Stables
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and ((not locked.Connector and (not locked.Cube or not locked.Recorder or not locked.Platform)) or (not locked.Cube and not locked.Recorder and not locked.Platform)) end, {
        Randomizer.Puzzles.C4.Oubliette
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and not locked.Connector end, {
        Randomizer.Puzzles.C4.Armory
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and not locked.Cube end, {
        Randomizer.Puzzles.C4.ThroneRoom
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and (not locked.Cube or not locked.Fan) end, {
        Randomizer.Puzzles.C4.ThroneRoomStar
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4)and ((not locked.Connector and not locked.Cube) or (not locked.Connector and not locked.Recorder and not locked.Platform) or (not locked.Cube and not locked.Recorder and not locked.Platform)) end, {
        Randomizer.Puzzles.C4.OublietteStar
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) end, {
        Randomizer.Puzzles.C5.TimeCrawls,
        Randomizer.Puzzles.C5.TimeFlies,
        Randomizer.Puzzles.C5.TFStar
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) and not locked.Cube end, {
        Randomizer.Puzzles.C5.Dumbwaiter,
        Randomizer.Puzzles.C5.UCaJ,
        Randomizer.Puzzles.C5.UCaJStar,
        Randomizer.Puzzles.C5.DumbwaiterStar
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C6) end, {
        Randomizer.Puzzles.C6.TWS,
        Randomizer.Puzzles.C6.Circumlocution,
        Randomizer.Puzzles.C6.TSDoR,
        Randomizer.Puzzles.C6.Star
      }, Randomizer.Puzzles.C6},
      {function() return isWorldOpen(Randomizer.Puzzles.C7) end, {
        Randomizer.Puzzles.C7.CP
      }, Randomizer.Puzzles.C7},
      {function() return isWorldOpen(Randomizer.Puzzles.C7) and not locked.Cube end, {
        Randomizer.Puzzles.C7.PB,
        Randomizer.Puzzles.C7.CCA,
        Randomizer.Puzzles.C7.DMS,
        Randomizer.Puzzles.C7.Star
      }, Randomizer.Puzzles.C7},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) end, {
        Randomizer.Puzzles.CStar.Nexus
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) and not locked.Cube end, {
        Randomizer.Puzzles.CStar.UG,
        Randomizer.Puzzles.CStar.Cobweb
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CMessenger) end, {
        Randomizer.Puzzles.CMessenger.Star
      }, Randomizer.Puzzles.CMessenger},
      {function() return not locked.F1 and (not locked.Connector or not locked.F3) end, {
        Randomizer.Puzzles.Nexus.F0
      }},
      {function() return not locked.F1 and not locked.F2 and not locked.F3 and not locked.Cube end, {
        Randomizer.Puzzles.Nexus.F3
      }}
    }
  elseif RandomizationMode == Randomizer.Modes.Values.Intended then
    markers = {
      {function() return isWorldOpen(Randomizer.Puzzles.A1) end, {
        Randomizer.Puzzles.A1.Peephole,
        Randomizer.Puzzles.A1.Outnumbered,
        Randomizer.Puzzles.A1.ASOoR,
        Randomizer.Puzzles.A1.OtToU,
        Randomizer.Puzzles.A1.StBP,
        Randomizer.Puzzles.A1.Star
      }},
      {function() return isWorldOpen(Randomizer.Puzzles.A1) and not locked.A1Gate end, {
        Randomizer.Puzzles.A1.PaSL,
        Randomizer.Puzzles.A1.Trio
      }},
      {function() return isWorldOpen(Randomizer.Puzzles.A2) end, {
        Randomizer.Puzzles.A2.HoW,
        Randomizer.Puzzles.A2.Guards,
        Randomizer.Puzzles.A2.SM,
        Randomizer.Puzzles.A2.Star
      }, Randomizer.Puzzles.A2},
      {function() return isWorldOpen(Randomizer.Puzzles.A3) end, {
        Randomizer.Puzzles.A3.ABTUStar,
        Randomizer.Puzzles.A3.ABTU,
        Randomizer.Puzzles.A3.AEP,
        Randomizer.Puzzles.A3.LMUStK,
        Randomizer.Puzzles.A3.SfL,
        Randomizer.Puzzles.A3.Clock
      }, Randomizer.Puzzles.A3},
      {function() return isWorldOpen(Randomizer.Puzzles.A4) and not locked.Connector end, {
        Randomizer.Puzzles.A4.PiF,
        Randomizer.Puzzles.A4.BiO,
        Randomizer.Puzzles.A4.AAT,
        Randomizer.Puzzles.A4.Star,
        Randomizer.Puzzles.A4.DCtS
      }, Randomizer.Puzzles.A4},
      {function() return isWorldOpen(Randomizer.Puzzles.A5) and not locked.Connector end, {
         Randomizer.Puzzles.A5.TwoBoxesStar
      }, Randomizer.Puzzles.A5},
      {function() return isWorldOpen(Randomizer.Puzzles.A5) and not locked.Cube end, {
        Randomizer.Puzzles.A5.TwoBoxes,
        Randomizer.Puzzles.A5.FC,
        Randomizer.Puzzles.A5.FCStar
      }, Randomizer.Puzzles.A5},
      {function() return isWorldOpen(Randomizer.Puzzles.A5) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.A5.OLB,
        Randomizer.Puzzles.A5.GOtF,
        Randomizer.Puzzles.A5.YKYMCtS
      }, Randomizer.Puzzles.A5},
      {function() return isWorldOpen(Randomizer.Puzzles.A6) end, {
        Randomizer.Puzzles.A6.Mindfield
      }, Randomizer.Puzzles.A6},
      {function() return isWorldOpen(Randomizer.Puzzles.A6) and not locked.Connector end, {
        Randomizer.Puzzles.A6.Deception,
        Randomizer.Puzzles.A6.Bichromatic
      }, Randomizer.Puzzles.A6},
      {function() return isWorldOpen(Randomizer.Puzzles.A6) and not locked.Cube end, {
        Randomizer.Puzzles.A6.Star
      }, Randomizer.Puzzles.A6},
      {function() return isWorldOpen(Randomizer.Puzzles.A6) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.A6.ADTF
      }, Randomizer.Puzzles.A6},
      {function() return isWorldOpen(Randomizer.Puzzles.A7) and not locked.Connector end, {
        Randomizer.Puzzles.A7.LfI,
        Randomizer.Puzzles.A7.PW,
        Randomizer.Puzzles.A7.WiaL,
        Randomizer.Puzzles.A7.TI,
        Randomizer.Puzzles.A7.Star
      }, Randomizer.Puzzles.A7},
      {function() return isWorldOpen(Randomizer.Puzzles.A7) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.A7.TPLB
      }, Randomizer.Puzzles.A7},
      {function() return isWorldOpen(Randomizer.Puzzles.AStar) end, {
        Randomizer.Puzzles.AStar.NW,
        Randomizer.Puzzles.AStar.JfW
      }, Randomizer.Puzzles.AStar},
      {function() return isWorldOpen(Randomizer.Puzzles.AStar) and not locked.Fan end, {
        Randomizer.Puzzles.AStar.DDM
      }, Randomizer.Puzzles.AStar},
      {function() return isWorldOpen(Randomizer.Puzzles.B1) and not locked.Connector end, {
        Randomizer.Puzzles.B1.WtaD,
        Randomizer.Puzzles.B1.SaaS,
        Randomizer.Puzzles.B1.TW,
        Randomizer.Puzzles.B1.Star
      }, Randomizer.Puzzles.B1},
      {function() return isWorldOpen(Randomizer.Puzzles.B1) and not locked.Cube end, {
        Randomizer.Puzzles.B1.OtF,
        Randomizer.Puzzles.B1.RoD
      }, Randomizer.Puzzles.B1},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) end, {
        Randomizer.Puzzles.B2.HG
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) and not locked.Connector end, {
        Randomizer.Puzzles.B2.Tomb,
        Randomizer.Puzzles.B2.Star
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.B2.MoTM
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.B2.Moonshot
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B3) and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.B3.Sunshot
      }, Randomizer.Puzzles.B3},
      {function() return isWorldOpen(Randomizer.Puzzles.B3) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.B3.BA,
        Randomizer.Puzzles.B3.Star,
        Randomizer.Puzzles.B3.EN,
        Randomizer.Puzzles.B3.Whoosh
      }, Randomizer.Puzzles.B3},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Recorder end, {
        Randomizer.Puzzles.B4.SHT,
        Randomizer.Puzzles.B4.DP
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.B4.TRA,
        Randomizer.Puzzles.B4.TRAStar
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Connector and not locked.Recorder end, {
        Randomizer.Puzzles.B4.WAtC
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Cube and not locked.Recorder end, {
        Randomizer.Puzzles.B4.RPS
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.B4.ABUH,
        Randomizer.Puzzles.B4.Sphinx
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) and not locked.Recorder end, {
        Randomizer.Puzzles.B5.MMaOTJ
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.B5.SES,
        Randomizer.Puzzles.B5.Obelisk,
        Randomizer.Puzzles.B5.BtIC,
        Randomizer.Puzzles.B5.Chambers
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) and not locked.Connector and not locked.Cube and not locked.Fan and not locked.Recorder end, {
        Randomizer.Puzzles.B5.Plates
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B6) end, {
        Randomizer.Puzzles.B6.EA
      }, Randomizer.Puzzles.B6},
      {function() return isWorldOpen(Randomizer.Puzzles.B6) and not locked.Connector end, {
        Randomizer.Puzzles.B6.JDaW,
        Randomizer.Puzzles.B6.Crisscross
      }, Randomizer.Puzzles.B6},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) end, {
        Randomizer.Puzzles.B7.WLJ,
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and not locked.Connector end, {
        Randomizer.Puzzles.B7.BSbS
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and not locked.Cube end, {
        Randomizer.Puzzles.B7.BLoM,
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.B7.Pyramid
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.B7.AFaF,
        Randomizer.Puzzles.B7.BSbSStar
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.BStar) and not locked.Connector end, {
        Randomizer.Puzzles.BStar.MGR
      }, Randomizer.Puzzles.BStar},
      {function() return isWorldOpen(Randomizer.Puzzles.BStar) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.BStar.CC
      }, Randomizer.Puzzles.BStar},
      {function() return isWorldOpen(Randomizer.Puzzles.BStar) and not locked.Connector and not locked.Recorder end, {
        Randomizer.Puzzles.BStar.Peekaboo
      }, Randomizer.Puzzles.BStar},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) end, {
        Randomizer.Puzzles.C1.Labyrinth,
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) and not locked.Connector end, {
        Randomizer.Puzzles.C1.Conservatory,
        Randomizer.Puzzles.C1.Star
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.C1.Blowback,
        Randomizer.Puzzles.C1.MIA
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C2) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.C2.Cemetery
      }, Randomizer.Puzzles.C2},
      {function() return isWorldOpen(Randomizer.Puzzles.C2) and not locked.Recorder and not locked.Platform end, {
        Randomizer.Puzzles.C2.TSW
      }, Randomizer.Puzzles.C2},
      {function() return isWorldOpen(Randomizer.Puzzles.C2) and not locked.Cube and not locked.Recorder and not locked.Platform end, {
        Randomizer.Puzzles.C2.Rapunzel,
        Randomizer.Puzzles.C2.Star
      }, Randomizer.Puzzles.C2},
      {function() return isWorldOpen(Randomizer.Puzzles.C2) and not locked.Connector and not locked.Cube and not locked.Recorder and not locked.Platform end, {
        Randomizer.Puzzles.C2.ADaaF
      }, Randomizer.Puzzles.C2},
      {function() return isWorldOpen(Randomizer.Puzzles.C3) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.C3.BSLS,
        Randomizer.Puzzles.C3.JQ,
        Randomizer.Puzzles.C3.Weathertop,
        Randomizer.Puzzles.C3.TLCaaF,
        Randomizer.Puzzles.C3.Star
      }, Randomizer.Puzzles.C3},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and not locked.Connector end, {
        Randomizer.Puzzles.C4.Stables
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.C4.Armory
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.C4.ThroneRoom,
        Randomizer.Puzzles.C4.ThroneRoomStar
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) and not locked.Connector and not locked.Cube and not locked.Recorder and not locked.Platform end, {
        Randomizer.Puzzles.C4.Oubliette,
        Randomizer.Puzzles.C4.OublietteStar
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) and not locked.Cube end, {
        Randomizer.Puzzles.C5.UCaJStar
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.C5.UCaJ
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.C5.Dumbwaiter
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) and not locked.Connector and not locked.Cube and not locked.Recorder end, {
        Randomizer.Puzzles.C5.TimeCrawls
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) and not locked.Connector and not locked.Cube and not locked.Fan and not locked.Recorder end, {
        Randomizer.Puzzles.C5.TimeFlies,
        Randomizer.Puzzles.C5.TFStar,
        Randomizer.Puzzles.C5.DumbwaiterStar
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C6) end, {
        Randomizer.Puzzles.C6.TWS
      }, Randomizer.Puzzles.C6},
      {function() return isWorldOpen(Randomizer.Puzzles.C6) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.C6.Circumlocution
      }, Randomizer.Puzzles.C6},
      {function() return isWorldOpen(Randomizer.Puzzles.C6) and not locked.Connector and not locked.Recorder end, {
        Randomizer.Puzzles.C6.TSDoR,
        Randomizer.Puzzles.C6.Star
      }, Randomizer.Puzzles.C6},
      {function() return isWorldOpen(Randomizer.Puzzles.C7) and not locked.Connector and not locked.Recorder end, {
        Randomizer.Puzzles.C7.CCA
      }, Randomizer.Puzzles.C7},
      {function() return isWorldOpen(Randomizer.Puzzles.C7) and not locked.Connector and not locked.Cube and not locked.Fan end, {
        Randomizer.Puzzles.C7.PB,
        Randomizer.Puzzles.C7.CP,
        Randomizer.Puzzles.C7.DMS,
        Randomizer.Puzzles.C7.Star
      }, Randomizer.Puzzles.C7},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) and not locked.Connector and not locked.Cube end, {
        Randomizer.Puzzles.CStar.Nexus,
        Randomizer.Puzzles.CStar.Cobweb
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) and not locked.Connector and not locked.Cube and not locked.Recorder and not locked.Platform end, {
        Randomizer.Puzzles.CStar.UG
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CMessenger) end, {
        Randomizer.Puzzles.CMessenger.Star
      }, Randomizer.Puzzles.CMessenger},
      {function() return not locked.F1 and not locked.Connector end, {
        Randomizer.Puzzles.Nexus.F0
      }}
      -- Yes F3 star is missing, it's explained further down
    }
  elseif RandomizationMode == Randomizer.Modes.Values.Hardmode then
    markers = {
      {function() return isWorldOpen(Randomizer.Puzzles.A1) end, {
        Randomizer.Puzzles.A1.Peephole,
        Randomizer.Puzzles.A1.PaSL,
        Randomizer.Puzzles.A1.Outnumbered,
        Randomizer.Puzzles.A1.ASOoR,
        Randomizer.Puzzles.A1.OtToU,
        Randomizer.Puzzles.A1.Trio,
        Randomizer.Puzzles.A1.StBP,
        Randomizer.Puzzles.A1.Star
      }},
      {function() return isWorldOpen(Randomizer.Puzzles.A2) end, {
        Randomizer.Puzzles.A2.HoW,
        Randomizer.Puzzles.A2.Guards,
        Randomizer.Puzzles.A2.SM,
        Randomizer.Puzzles.A2.Star
      }, Randomizer.Puzzles.A2},
      {function() return isWorldOpen(Randomizer.Puzzles.A3) end, {
        Randomizer.Puzzles.A3.ABTUStar,
        Randomizer.Puzzles.A3.ABTU,
        Randomizer.Puzzles.A3.AEP,
        Randomizer.Puzzles.A3.LMUStK,
        Randomizer.Puzzles.A3.SfL,
        Randomizer.Puzzles.A3.Clock
      }, Randomizer.Puzzles.A3},
      {function() return isWorldOpen(Randomizer.Puzzles.A4) end, {
        Randomizer.Puzzles.A4.PiF,
        Randomizer.Puzzles.A4.BiO,
        Randomizer.Puzzles.A4.AAT,
        Randomizer.Puzzles.A4.Star,
        Randomizer.Puzzles.A4.DCtS
      }, Randomizer.Puzzles.A4},
      {function() return isWorldOpen(Randomizer.Puzzles.A5) end, {
        Randomizer.Puzzles.A5.TwoBoxes,
        Randomizer.Puzzles.A5.TwoBoxesStar,
        Randomizer.Puzzles.A5.GOtF,
        Randomizer.Puzzles.A5.YKYMCtS,
        Randomizer.Puzzles.A5.OLB,
        Randomizer.Puzzles.A5.FC,
        Randomizer.Puzzles.A5.FCStar
      }, Randomizer.Puzzles.A5},
      {function() return isWorldOpen(Randomizer.Puzzles.A6) end, {
        Randomizer.Puzzles.A6.Mindfield,
        Randomizer.Puzzles.A6.Deception,
        Randomizer.Puzzles.A6.ADTF,
        Randomizer.Puzzles.A6.Bichromatic,
        Randomizer.Puzzles.A6.Star
      }, Randomizer.Puzzles.A6},
      {function() return isWorldOpen(Randomizer.Puzzles.A7) end, {
        Randomizer.Puzzles.A7.TPLB,
        Randomizer.Puzzles.A7.PW,
        Randomizer.Puzzles.A7.LfI,
        Randomizer.Puzzles.A7.WiaL,
        Randomizer.Puzzles.A7.TI,
        Randomizer.Puzzles.A7.Star
      }, Randomizer.Puzzles.A7},
      {function() return isWorldOpen(Randomizer.Puzzles.AStar) end, {
        Randomizer.Puzzles.AStar.DDM,
        Randomizer.Puzzles.AStar.NW,
        Randomizer.Puzzles.AStar.JfW
      }, Randomizer.Puzzles.AStar},
      {function() return isWorldOpen(Randomizer.Puzzles.B1) end, {
        Randomizer.Puzzles.B1.SaaS,
        Randomizer.Puzzles.B1.WtaD,
        Randomizer.Puzzles.B1.TW,
        Randomizer.Puzzles.B1.OtF,
        Randomizer.Puzzles.B1.RoD,
        Randomizer.Puzzles.B1.Star
      }, Randomizer.Puzzles.B1},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) end, {
        Randomizer.Puzzles.B2.HG,
        Randomizer.Puzzles.B2.Tomb,
        Randomizer.Puzzles.B2.MoTM,
        Randomizer.Puzzles.B2.Moonshot,
        Randomizer.Puzzles.B2.Star
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B3) end, {
        Randomizer.Puzzles.B3.Sunshot,
        Randomizer.Puzzles.B3.BA,
        Randomizer.Puzzles.B3.EN,
        Randomizer.Puzzles.B3.Whoosh,
        Randomizer.Puzzles.B3.Star
      }, Randomizer.Puzzles.B3},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) end, {
        Randomizer.Puzzles.B4.TRA,
        Randomizer.Puzzles.B4.ABUH,
        Randomizer.Puzzles.B4.DP,
        Randomizer.Puzzles.B4.SHT,
        Randomizer.Puzzles.B4.RPS,
        Randomizer.Puzzles.B4.WAtC,
        Randomizer.Puzzles.B4.TRAStar
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and (not locked.Connector or not locked.Cube) end, {
        Randomizer.Puzzles.B4.Sphinx
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) end, {
        Randomizer.Puzzles.B5.Plates,
        Randomizer.Puzzles.B5.MMaOTJ,
        Randomizer.Puzzles.B5.BtIC,
        Randomizer.Puzzles.B5.SES,
        Randomizer.Puzzles.B5.Chambers
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) and ((not locked.Connector and not locked.Fan) or not locked.Cube) end, {
        Randomizer.Puzzles.B5.Obelisk
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B6) end, {
        Randomizer.Puzzles.B6.EA,
        Randomizer.Puzzles.B6.JDaW,
        Randomizer.Puzzles.B6.Crisscross
      }, Randomizer.Puzzles.B6},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) end, {
        Randomizer.Puzzles.B7.WLJ,
        Randomizer.Puzzles.B7.AFaF,
        Randomizer.Puzzles.B7.BSbSStar,
        Randomizer.Puzzles.B7.BSbS,
        Randomizer.Puzzles.B7.BLoM
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and (not locked.Cube or not locked.Fan) end, {
        Randomizer.Puzzles.B7.Pyramid
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.BStar) end, {
        Randomizer.Puzzles.BStar.MGR,
        Randomizer.Puzzles.BStar.CC,
        Randomizer.Puzzles.BStar.Peekaboo
      }, Randomizer.Puzzles.BStar},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) end, {
        Randomizer.Puzzles.C1.Labyrinth,
        Randomizer.Puzzles.C1.Conservatory,
        Randomizer.Puzzles.C1.Blowback,
        Randomizer.Puzzles.C1.MIA,
        Randomizer.Puzzles.C1.Star
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C2) end, {
        Randomizer.Puzzles.C2.Cemetery,
        Randomizer.Puzzles.C2.ADaaF,
        Randomizer.Puzzles.C2.Rapunzel,
        Randomizer.Puzzles.C2.TSW,
        Randomizer.Puzzles.C2.Star
      }, Randomizer.Puzzles.C2},
      {function() return isWorldOpen(Randomizer.Puzzles.C3) end, {
        Randomizer.Puzzles.C3.TLCaaF,
        Randomizer.Puzzles.C3.BSLS,
        Randomizer.Puzzles.C3.JQ,
        Randomizer.Puzzles.C3.Weathertop,
        Randomizer.Puzzles.C3.Star
      }, Randomizer.Puzzles.C3},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) end, {
        Randomizer.Puzzles.C4.Stables,
        Randomizer.Puzzles.C4.Armory,
        Randomizer.Puzzles.C4.OublietteStar,
        Randomizer.Puzzles.C4.Oubliette,
        Randomizer.Puzzles.C4.ThroneRoom,
        Randomizer.Puzzles.C4.ThroneRoomStar
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) end, {
        Randomizer.Puzzles.C5.TimeCrawls,
        Randomizer.Puzzles.C5.Dumbwaiter,
        Randomizer.Puzzles.C5.TimeFlies,
        Randomizer.Puzzles.C5.UCaJ,
        Randomizer.Puzzles.C5.TFStar,
        Randomizer.Puzzles.C5.UCaJStar,
        Randomizer.Puzzles.C5.DumbwaiterStar
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C6) end, {
        Randomizer.Puzzles.C6.TWS,
        Randomizer.Puzzles.C6.Circumlocution,
        Randomizer.Puzzles.C6.TSDoR,
        Randomizer.Puzzles.C6.Star
      }, Randomizer.Puzzles.C6},
      {function() return isWorldOpen(Randomizer.Puzzles.C7) end, {
        Randomizer.Puzzles.C7.PB,
        Randomizer.Puzzles.C7.CP,
        Randomizer.Puzzles.C7.CCA,
        Randomizer.Puzzles.C7.DMS,
        Randomizer.Puzzles.C7.Star
      }, Randomizer.Puzzles.C7},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) end, {
        Randomizer.Puzzles.CStar.Nexus,
        Randomizer.Puzzles.CStar.Cobweb,
        Randomizer.Puzzles.CStar.UG
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CMessenger) end, {
        Randomizer.Puzzles.CMessenger.Star
      }, Randomizer.Puzzles.CMessenger},
      {function() return not locked.F1 and (not locked.Connector or not locked.F3) end, {
        Randomizer.Puzzles.Nexus.F0
      }},
      {function() return not locked.F1 and not locked.F3 end, {
        Randomizer.Puzzles.Nexus.F3
      }}
    }
  elseif RandomizationMode == Randomizer.Modes.Values.SixtyHardmode then
    markers = {
      {function() return isWorldOpen(Randomizer.Puzzles.A1) end, {
        Randomizer.Puzzles.A1.Peephole,
        Randomizer.Puzzles.A1.PaSL,
        Randomizer.Puzzles.A1.Outnumbered,
        Randomizer.Puzzles.A1.ASOoR,
        Randomizer.Puzzles.A1.OtToU,
        Randomizer.Puzzles.A1.Trio,
        Randomizer.Puzzles.A1.StBP,
        Randomizer.Puzzles.A1.Star
      }},
      {function() return isWorldOpen(Randomizer.Puzzles.A2) end, {
        Randomizer.Puzzles.A2.HoW,
        Randomizer.Puzzles.A2.Guards,
        Randomizer.Puzzles.A2.SM,
        Randomizer.Puzzles.A2.Star
      }, Randomizer.Puzzles.A2},
      {function() return isWorldOpen(Randomizer.Puzzles.A3) end, {
        Randomizer.Puzzles.A3.ABTUStar,
        Randomizer.Puzzles.A3.ABTU,
        Randomizer.Puzzles.A3.AEP,
        Randomizer.Puzzles.A3.LMUStK,
        Randomizer.Puzzles.A3.SfL,
        Randomizer.Puzzles.A3.Clock
      }, Randomizer.Puzzles.A3},
      {function() return isWorldOpen(Randomizer.Puzzles.A4) end, {
        Randomizer.Puzzles.A4.PiF,
        Randomizer.Puzzles.A4.BiO,
        Randomizer.Puzzles.A4.AAT,
        Randomizer.Puzzles.A4.Star,
        Randomizer.Puzzles.A4.DCtS
      }, Randomizer.Puzzles.A4},
      {function() return isWorldOpen(Randomizer.Puzzles.A5) end, {
        Randomizer.Puzzles.A5.TwoBoxes,
        Randomizer.Puzzles.A5.TwoBoxesStar,
        Randomizer.Puzzles.A5.GOtF,
        Randomizer.Puzzles.A5.YKYMCtS,
        Randomizer.Puzzles.A5.OLB,
        Randomizer.Puzzles.A5.FC,
        Randomizer.Puzzles.A5.FCStar
      }, Randomizer.Puzzles.A5},
      {function() return isWorldOpen(Randomizer.Puzzles.A6) end, {
        Randomizer.Puzzles.A6.Mindfield,
        Randomizer.Puzzles.A6.Deception,
        Randomizer.Puzzles.A6.ADTF,
        Randomizer.Puzzles.A6.Bichromatic,
        Randomizer.Puzzles.A6.Star
      }, Randomizer.Puzzles.A6},
      {function() return isWorldOpen(Randomizer.Puzzles.A7) end, {
        Randomizer.Puzzles.A7.TPLB,
        Randomizer.Puzzles.A7.PW,
        Randomizer.Puzzles.A7.LfI,
        Randomizer.Puzzles.A7.WiaL,
        Randomizer.Puzzles.A7.TI,
        Randomizer.Puzzles.A7.Star
      }, Randomizer.Puzzles.A7},
      {function() return isWorldOpen(Randomizer.Puzzles.AStar) end, {
        Randomizer.Puzzles.AStar.DDM,
        Randomizer.Puzzles.AStar.NW,
        Randomizer.Puzzles.AStar.JfW
      }, Randomizer.Puzzles.AStar},
      {function() return isWorldOpen(Randomizer.Puzzles.B1) end, {
        Randomizer.Puzzles.B1.SaaS,
        Randomizer.Puzzles.B1.WtaD,
        Randomizer.Puzzles.B1.TW,
        Randomizer.Puzzles.B1.OtF,
        Randomizer.Puzzles.B1.RoD,
        Randomizer.Puzzles.B1.Star
      }, Randomizer.Puzzles.B1},
      {function() return isWorldOpen(Randomizer.Puzzles.B2) end, {
        Randomizer.Puzzles.B2.HG,
        Randomizer.Puzzles.B2.Tomb,
        Randomizer.Puzzles.B2.MoTM,
        Randomizer.Puzzles.B2.Moonshot,
        Randomizer.Puzzles.B2.Star
      }, Randomizer.Puzzles.B2},
      {function() return isWorldOpen(Randomizer.Puzzles.B3) and not locked.Cube end, {
        Randomizer.Puzzles.B3.Sunshot,
        Randomizer.Puzzles.B3.BA,
        Randomizer.Puzzles.B3.EN,
        Randomizer.Puzzles.B3.Whoosh,
        Randomizer.Puzzles.B3.Star
      }, Randomizer.Puzzles.B3},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) end, {
        Randomizer.Puzzles.B4.SHT,
        Randomizer.Puzzles.B4.WAtC
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Connector end, {
        Randomizer.Puzzles.B4.TRA,
        Randomizer.Puzzles.B4.TRAStar,
        Randomizer.Puzzles.B4.Sphinx
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and not locked.Connector and (not locked.Cube or not locked.Fan) end, {
        Randomizer.Puzzles.B4.ABUH
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B4) and ((not locked.Connector and not locked.Cube) or not locked.Recorder) end, {
        Randomizer.Puzzles.B4.DP,
        Randomizer.Puzzles.B4.RPS
      }, Randomizer.Puzzles.B4},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) end, {
        Randomizer.Puzzles.B5.Plates,
        Randomizer.Puzzles.B5.MMaOTJ,
        Randomizer.Puzzles.B5.BtIC,
        Randomizer.Puzzles.B5.SES,
        Randomizer.Puzzles.B5.Chambers
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B5) and ((not locked.Connector and not locked.Fan) or not locked.Cube) end, {
        Randomizer.Puzzles.B5.Obelisk
      }, Randomizer.Puzzles.B5},
      {function() return isWorldOpen(Randomizer.Puzzles.B6) end, {
        Randomizer.Puzzles.B6.EA,
        Randomizer.Puzzles.B6.JDaW,
        Randomizer.Puzzles.B6.Crisscross
      }, Randomizer.Puzzles.B6},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) end, {
        Randomizer.Puzzles.B7.WLJ,
        Randomizer.Puzzles.B7.AFaF,
        Randomizer.Puzzles.B7.BSbSStar,
        Randomizer.Puzzles.B7.BSbS,
        Randomizer.Puzzles.B7.BLoM
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.B7) and (not locked.Cube or not locked.Fan) end, {
        Randomizer.Puzzles.B7.Pyramid
      }, Randomizer.Puzzles.B7},
      {function() return isWorldOpen(Randomizer.Puzzles.BStar) end, {
        Randomizer.Puzzles.BStar.MGR,
        Randomizer.Puzzles.BStar.CC,
        Randomizer.Puzzles.BStar.Peekaboo
      }, Randomizer.Puzzles.BStar},
      {function() return isWorldOpen(Randomizer.Puzzles.C1) end, {
        Randomizer.Puzzles.C1.Labyrinth,
        Randomizer.Puzzles.C1.Conservatory,
        Randomizer.Puzzles.C1.Blowback,
        Randomizer.Puzzles.C1.MIA,
        Randomizer.Puzzles.C1.Star
      }, Randomizer.Puzzles.C1},
      {function() return isWorldOpen(Randomizer.Puzzles.C2) end, {
        Randomizer.Puzzles.C2.Cemetery,
        Randomizer.Puzzles.C2.ADaaF,
        Randomizer.Puzzles.C2.Rapunzel,
        Randomizer.Puzzles.C2.TSW,
        Randomizer.Puzzles.C2.Star
      }, Randomizer.Puzzles.C2},
      {function() return isWorldOpen(Randomizer.Puzzles.C3) end, {
        Randomizer.Puzzles.C3.TLCaaF,
        Randomizer.Puzzles.C3.BSLS,
        Randomizer.Puzzles.C3.JQ,
        Randomizer.Puzzles.C3.Weathertop,
        Randomizer.Puzzles.C3.Star
      }, Randomizer.Puzzles.C3},
      {function() return isWorldOpen(Randomizer.Puzzles.C4) end, {
        Randomizer.Puzzles.C4.Stables,
        Randomizer.Puzzles.C4.Armory,
        Randomizer.Puzzles.C4.ThroneRoom,
        Randomizer.Puzzles.C4.ThroneRoomStar,
        Randomizer.Puzzles.C4.Oubliette,
        Randomizer.Puzzles.C4.OublietteStar
      }, Randomizer.Puzzles.C4},
      {function() return isWorldOpen(Randomizer.Puzzles.C5) end, {
        Randomizer.Puzzles.C5.TimeCrawls,
        Randomizer.Puzzles.C5.Dumbwaiter,
        Randomizer.Puzzles.C5.TimeFlies,
        Randomizer.Puzzles.C5.UCaJ,
        Randomizer.Puzzles.C5.TFStar,
        Randomizer.Puzzles.C5.UCaJStar,
        Randomizer.Puzzles.C5.DumbwaiterStar
      }, Randomizer.Puzzles.C5},
      {function() return isWorldOpen(Randomizer.Puzzles.C6) end, {
        Randomizer.Puzzles.C6.TWS,
        Randomizer.Puzzles.C6.Circumlocution,
        Randomizer.Puzzles.C6.TSDoR,
        Randomizer.Puzzles.C6.Star
      }, Randomizer.Puzzles.C6},
      {function() return isWorldOpen(Randomizer.Puzzles.C7) end, {
        Randomizer.Puzzles.C7.PB,
        Randomizer.Puzzles.C7.CP,
        Randomizer.Puzzles.C7.CCA,
        Randomizer.Puzzles.C7.DMS,
        Randomizer.Puzzles.C7.Star
      }, Randomizer.Puzzles.C7},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) end, {
        Randomizer.Puzzles.CStar.Nexus,
        Randomizer.Puzzles.CStar.UG
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CStar) and not locked.Cube end, {
        Randomizer.Puzzles.CStar.Cobweb
      }, Randomizer.Puzzles.CStar},
      {function() return isWorldOpen(Randomizer.Puzzles.CMessenger) end, {
        Randomizer.Puzzles.CMessenger.Star
      }, Randomizer.Puzzles.CMessenger},
      {function() return not locked.F1 and (not locked.Connector or not locked.F3) end, {
        Randomizer.Puzzles.Nexus.F0
      }},
      {function() return not locked.F1 and not locked.F3 end, {
        Randomizer.Puzzles.Nexus.F3
      }}
    }
  end

  --[[
    Based on the marker lists randomize the sigils
    This will work with any mode you define in the lists
  ]]--
  if RandomizationMode == Randomizer.Modes.Values.Default
      or RandomizationMode == Randomizer.Modes.Values.Sixty
      or RandomizationMode == Randomizer.Modes.Values.Intended
      or RandomizationMode == Randomizer.Modes.Values.Hardmode
      or RandomizationMode == Randomizer.Modes.Values.SixtyHardmode then
    local checkGates = true
    local arrangerStage = 0
    local availableMarkers = 0
    local openMarkers = {}

    --[[
      In scavenger hunt or mobius mode you don't have to deal with
       doors, so we can disable that softlock protection
    ]]--
    if Scavenger ~= Randomizer.Scavenger.Values.Off or #Mobius ~= 0 then
      checkGates = false
      locked.A1Gate = Randomizer.Arrangers.A1Gate.Sigils
      locked.AGate  = Randomizer.Arrangers.AGate.Sigils
      locked.BGate  = Randomizer.Arrangers.BGate.Sigils
      locked.CGate  = Randomizer.Arrangers.CGate.Sigils
    end

    --[[
      We just have a list of the world names in each hub, we want the indexes
       of the marker lists using those worlds
    ]]--
    local closedMarkers = {}
    local WorldA = {}
    local WorldB = {}
    local WorldC = {}
    for i=1, #markers do
      if WorldANames[markers[i][3]] then
        table.insert(WorldA, i)
      elseif WorldBNames[markers[i][3]] then
        table.insert(WorldB, i)
      elseif WorldCNames[markers[i][3]] then
        table.insert(WorldC, i)
      else
        table.insert(closedMarkers, i)
      end
    end

    -- Adds all markers from provided locations to the global lists
    local function addWorldMarkers(worlds)
      if not worlds then return end
      for i=1, #worlds do
        table.insert(closedMarkers, worlds[i])
        open[markersyh�R����b�N3x�dQt	/'���c��ά����彼qa!��i|���^���g7���w�謸��O#�$�����9�f�XQ�%�;�MG��j�WeTߜ�w~-�'�M/���QB�q�p($�
L�۴����}�p�&��i�۫OV<A����lMFUeJ�ƞ����b�L�^Ł��p��{Qq�7bh�����)'z��#nxN��{+\���U-e��r��{=�9�B6Ͽ����Q0�B@e�FB�[worlds[i]][3]] = true
      end
    end

    local Arranger = nil
    local accessableArrangers = {}
    local lastHubs = {}
    if startHub == Randomizer.Hub.A then
      accessableArrangers = {Randomizer.Arrangers.AGate}
      locked.AGate = Randomizer.Arrangers.AGate.Sigils
      WorldA = addWorldMarkers(WorldA)
      lastHubs = {
        Randomizer.Arrangers.BGate,
        Randomizer.Arrangers.CGate
      }
    elseif startHub == Randomizer.Hub.B then
      accessableArrangers = {Randomizer.Arrangers.BGate}
      locked.BGate = Randomizer.Arrangers.BGate.Sigils
      WorldB = addWorldMarkers(WorldB)
      lastHubs = {
        Randomizer.Arrangers.AGate,
        Randomizer.Arrangers.CGate
      }
    elseif Randomizer.Hub.C then
      accessableArrangers = {Randomizer.Arrangers.CGate}
      locked.CGate = Randomizer.Arrangers.CGate.Sigils
      WorldC = addWorldMarkers(WorldC)
      lastHubs = {
        Randomizer.Arrangers.AGate,
        Randomizer.Arrangers.BGate
      }
    end
    -- For scavenger hunt we have all worlds open
    if Scavenger ~= Randomizer.Scavenger.Values.Off then
      accessableArrangers = {}
    end
    if scavenger == Randomizer.Scavenger.Values.Full or #Mobius ~= 0  then
      WorldA = addWorldMarkers(WorldA)
      WorldB = addWorldMarkers(WorldB)
      WorldC = addWorldMarkers(WorldC)
    end

    -- Place the provided sigils in accessable areas
    local function placeSigils(sigils)
      for i=1, #sigils do
        local index = rand(1, availableMarkers)
        for j=1, #openMarkers do
          if #openMarkers == 0 then
            printError("Ran out of space for sigils - some spots will be empty")
          end
          if index > #markers[openMarkers[j]][2] then
            index = index - #markers[openMarkers[j]][2]
          else
            local randMarker = table.remove(markers[openMarkers[j]][2], index)
            talosProgress:SetCode(randMarker.talosProgress, tetroIndexes[sigils[i]])
            tetroIndexes[sigils[i]] = nil
            availableMarkers = availableMarkers - 1
            if #markers[openMarkers[j]][2] == 0 then
              table.remove(openMarkers, j)
            end
            if DEBUG then
              printWarning(string.format("Placed %s in %s", sigils[i], randMarker.full))
            end
            break
          end
        end
      end
    end

    --[[
      F3 star has issues with the intended mode, as explained later,
       so we manually set it to either a star or a grey sigil here
       before it can cause problems
      In scavenger hunts we don't want this because intended ones
       can only be F1+F6, and if this locks a grey it's uncompletable
      We fix the missing marker later
    ]]--
    if RandomizationMode == Randomizer.Modes.Values.Intended
        and Scavenger == Randomizer.Scavenger.Values.Off then
      local sigil = ""
      local marker = Randomizer.Puzzles.Nexus.F3
      -- Weighted based on the amount of sigils of each type
      local sigilIndex = rand(1, 39)
      if sigilIndex <= 9 then
        -- Place a grey sigil (9/39)
        sigil = table.remove(locked.F6, sigilIndex)
      else
        -- Place a star (30/39)
        sigil = table.remove(locked.AStar, 1)
      end
      talosProgress:SetCode(marker.talosProgress, tetroIndexes[sigil])
      tetroIndexes[sigil] = nil
      if DEBUG then
        printWarning(string.format("Placed %s in %s", sigil, marker.full))
      end
      -- Also while we're here fix A1 gate
      locked.A1Gate = Randomizer.Arrangers.A1Gate.Sigils
    end

    --[[
      This loop is what actually does it all
      The basic idea is as follows:
       1. Work out what markers are currently unlocked
       2. Pick a random arranger
       3. Place the sigils for that arranger in the unlocked spots
       4. Repeat
      This is complicated by the facts that:
       1. You can easily run out of markers to place sigils
       2. You can softlock by entering the wrong hub world
      So we have a bunch of extra logic to try prevent both issues
    ]]--
    while arrangerStage ~= -1 or #accessableArrangers > 0 do
      -- To make sure I don't hit the instruction limit per frame
      Wait(CustomEvent("OnStep"))

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

      -- Chose what arrangers can be picked
      if arrangerStage ~= -1 then
        -- In scavenger hunt mode we only want the specific arrangers for each ending
        if Scavenger ~= Randomizer.Scavenger.Values.Off then
          --[[
            Intended always needs A1 Gate
            Because the others don't it's kind of awkward using arrangerStage
          ]]--
          if RandomizationMode == Randomizer.Modes.Values.Intended
              and locked.A1Gate then
            accessableArrangers = {Randomizer.Arrangers.A1Gate}
          else
            accessableArrangers = ScavengerEnding.Arrangers
            arrangerStage = -1
          end
        elseif RandomizationMode == Randomizer.Modes.Values.Intended then
          --[[
            Because of how restrictive Intended is we need a special unlocking order,
             the default one breaks every time
            The order we use instead is:
            1. A1 Gate
            2. First Hub Items (Connector, Cube)
            3. Other Hubs
            4. Other Items
            5. Star Worlds
            6. F1
            7. Rest of Tower
            Note that this does mean F3 star could only ever be a grey sigil
            Looking at the restrictions it could theoretically also be a star,
             which is why we set it earlier
          ]]--
          if arrangerStage == 0 then
            accessableArrangers = {Randomizer.Arrangers.A1Gate}
            arrangerStage = 1
          elseif arrangerStage == 1 then
            accessableArrangers = {
              Randomizer.Arrangers.Connector,
              Randomizer.Arrangers.Cube
            }
            arrangerStage = 2
          elseif arrangerStage == 2 and #accessableArrangers == 0 then
            accessableArrangers = {Randomizer.Arrangers.AGate}
            arrangerStage = 3
          elseif arrangerStage == 3 then
            accessableArrangers = {
              Randomizer.Arrangers.BGate,
              Randomizer.Arrangers.CGate
            }
            arrangerStage = 4
          elseif arrangerStage == 4 and #accessableArrangers == 0 then
            accessableArrangers = {
              Randomizer.Arrangers.Fan,
              Randomizer.Arrangers.Recorder,
              Randomizer.Arrangers.Platform
            }
            arrangerStage = 5
          elseif arrangerStage == 5 and #accessableArrangers == 0 then
            accessableArrangers = {
              Randomizer.Arrangers.AStar,
              Randomizer.Arrangers.BStar,
              Randomizer.Arrangers.CStar
            }
            arrangerStage = 6
          elseif arrangerStage == 6 and #accessableArrangers == 0 then
            accessableArrangers = {Randomizer.Arrangers.F1}
            arrangerStage = 7
          elseif arrangerStage == 7 then
            accessableArrangers = {
              Randomizer.Arrangers.F2,
              Randomizer.Arrangers.F3,
              Randomizer.Arrangers.F4,
              Randomizer.Arrangers.F5,
              Randomizer.Arrangers.F6
            }
            arrangerStage = -1
          end
        --[[
          The default unlocking order is as follows:
          1. Hubs
          2. Items
          3. Star worlds
          4. F1 + F2 + F3
          5. Everything else
          This does restrict certain combinations (e.g. you have to visit a star world to leave
           your starting hub), but it ends up distributing the sigils much more nicely than
           the old orders that did
        ]]--
        else
          if arrangerStage == 0 and #accessableArrangers == 0 then
            if startHub == Randomizer.Hub.A then
              table.insert(accessableArrangers, Randomizer.Arrangers.BGate)
              table.insert(accessableArrangers, Randomizer.Arrangers.CGate)
              arrangerStage = 1
            elseif startHub == Randomizer.Hub.B then
              table.insert(accessableArrangers, Randomizer.Arrangers.AGate)
              table.insert(accessableArrangers, Randomizer.Arrangers.CGate)
              arrangerStage = 1
            elseif startHub == Randomizer.Hub.C then
              table.insert(accessableArrangers, Randomizer.Arrangers.AGate)
              table.insert(accessableArrangers, Randomizer.Arrangers.BGate)
              arrangerStage = 1
            end
          elseif arrangerStage == 1 and #accessableArrangers == 0 then
            accessableArrangers = {
              Randomizer.Arrangers.Connector,
              Randomizer.Arrangers.Cube,
              Randomizer.Arrangers.Fan,
              Randomizer.Arrangers.Recorder,
              Randomizer.Arrangers.Platform
            }
            arrangerStage = 2
          elseif arrangerStage == 2 and #accessableArrangers == 0 then
            accessableArrangers = {
              Randomizer.Arrangers.AStar,
              Randomizer.Arrangers.BStar,
              Randomizer.Arrangers.CStar
            }
            arrangerStage = 3
          elseif arrangerStage == 3 and #accessableArrangers == 0 then
            accessableArrangers = {
              Randomizer.Arrangers.F1,
              Randomizer.Arrangers.F2,
              Randomizer.Arrangers.F3
            }
            arrangerStage = 4
          elseif arrangerStage == 4 and #accessableArrangers == 0 then
            accessableArrangers = {
              Randomizer.Arrangers.F4,
              Randomizer.Arrangers.F5,
              Randomizer.Arrangers.F6,
              Randomizer.Arrangers.A1Gate
            }
            arrangerStage = -1
          end
        end
      end

      local index = rand(1, #accessableArrangers)
      Arranger = table.remove(accessableArrangers, index)
      local sigils = locked[Arranger.name]
      locked[Arranger.name] = nil
      if DEBUG then
        print("Selected " .. Arranger.name .. " Arranger")
      end
      if not sigils then
        printError(Arranger.name .. " does not have any sigils assigned to it")
      end

      --[[
        Make sure you can't go to the wrong hub first and softlock.
        Sometimes does this by unlocking both, but usually by hiding
         required sigils outside of the first hub
        Requires at least two sigils in each hub to always be unlockable
        Don't need to this do both times you unlock a new hub.
      ]]--
      if checkGates then
        if Arranger == lastHubs[1] or Arranger == lastHubs[2] then
          -- Sometimes we want both hubs to be accessable when you leave A
          if rand(0, 99) < PROB_BOTH_HUBS then
            if DEBUG then
              print("Both Hubs open after " .. startHub.name)
            end

            -- If so we're going to manually add the sigils for both
            if startHub == Randomizer.Hub.A then
              sigils = {"DI2", "DL2", "DT1", "DT2", "DZ3",
                        "DJ4", "DJ5", "DL3", "DT3", "DT4", "DZ4"}
            elseif startHub == Randomizer.Hub.B then
              sigils = {"DI1", "DJ3", "DL1", "DZ2",
                        "DJ4", "DJ5", "DL3", "DT3", "DT4", "DZ4"}
            elseif startHub == Randomizer.Hub.C then
              sigils = {"DI1", "DJ3", "DL1", "DZ2",
                        "DI2", "DL2", "DT1", "DT2", "DZ3"}
            end

            -- For the intended mode we don't want to re-create this list
            if RandomizationMode ~= Randomizer.Modes.Values.Intended then
              locked.A1Gate = Randomizer.Arrangers.A1Gate.Sigils
            end

            -- Only one of these will be left in the table by this point
            for i=1, #accessableArrangers do
              if accessableArrangers[i] == Randomizer.Arrangers.AGate
                 or accessableArrangers[i] == Randomizer.Arrangers.BGate
                 or accessableArrangers[i] == Randomizer.Arrangers.CGate then
                table.remove(accessableArrangers, i)
                break
              end
            end
            -- This stuff just does nothing if it's already nil
            locked.AGate = nil
            locked.BGate = nil
            locked.CGate = nil
            WorldA = addWorldMarkers(WorldA)
            WorldB = addWorldMarkers(WorldB)
            WorldC = addWorldMarkers(WorldC)
          else
            --[[
              Otherwise we're only opening one hub, and we need to make sure you
               can't visit the wrong one
            ]]--
            if DEBUG then
              print(string.sub(Arranger.name, 1, 1) .. " open after " .. startHub.name)
            end
            --[[
              Based on world order, these are the sigils that
               need to be locked:
              ABC and CBA -> JJJ lock
              BAC and CAB -> T lock
              ACB and BCA -> I lock
              We now get a list of these sigils to lock, and fix
               the sigils for the other gates
            ]]--
            local uniqueSigils = {}
            if Arranger == Randomizer.Arrangers.AGate then
              if startHub == Randomizer.Hub.B then
                uniqueSigils = {"DT3"}
                locked.CGate = {"DJ4", "DJ5", "DL3", "DT4", "DZ4"}
              elseif startHub == Randomizer.Hub.C then
                uniqueSigils = {"DT1"}
                locked.BGate = {"DI2", "DL2", "DT2", "DZ3"}
              end
              locked.A1Gate = Randomizer.Arrangers.A1Gate.Sigils
              sigils = Randomizer.Arrangers.AGate.Sigils
              WorldA = addWorldMarkers(WorldA)
            elseif Arranger == Randomizer.Arrangers.BGate then
              if startHub == Randomizer.Hub.A then
                uniqueSigils = {"DJ1", "DJ4", "DJ5"}
                locked.A1Gate = {"DJ2", "DZ1"}
                locked.CGate = {"DL3", "DT3", "DT4", "DZ4"}
              elseif startHub == Randomizer.Hub.C then
                uniqueSigils = {"DJ1", "DJ2", "DJ3"}
                locked.A1Gate = {"DZ1"}
                locked.AGate = {"DI1", "DL1", "DZ2"}
              end
              sigils = Randomizer.Arrangers.BGate.Sigils
              WorldB = addWorldMarkers(WorldB)
            elseif Arranger == Randomizer.Arrangers.CGate then
              if startHub == Randomizer.Hub.A then
                uniqueSigils = {"DI2"}
                locked.BGate = {"DL2", "DT1", "DT2", "DZ3"}
              elseif startHub == Randomizer.Hub.B then
                uniqueSigils = {"DI1"}
                locked.AGate = {"DJ3", "DL1", "DZ2"}
              end
              locked.A1Gate = Randomizer.Arrangers.A1Gate.Sigils
              sigils = Randomizer.Arrangers.CGate.Sigils
              WorldC = addWorldMarkers(WorldC)
            end

            --[[
              For the intended mode we've already placed A1 Gate, which means:
              1. We don't want to re-set locked.A1Gate
              2. We don't need to lock the sigils that were already placed
            ]]--
            if RandomizationMode == Randomizer.Modes.Values.Intended then
              locked.A1Gate = nil
              if uniqueSigils[1] == "DJ1" then
                uniqueSigils = {"DJ4", "DJ5"}
              end
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
                if #tempOpenMarkers == 0 then
                  printError("Ran out of space for sigils - some spots will be empty")
                end
                if index > #markers[tempOpenMarkers[j]][2] then
                  index = index - #markers[tempOpenMarkers[j]][2]
                else
                  local randMarker = table.remove(markers[tempOpenMarkers[j]][2], index)
                  talosProgress:SetCode(randMarker.talosProgress, tetroIndexes[uniqueSigils[i]])
                  tetroIndexes[uniqueSigils[i]] = nil
                  tempAvailableMarkers = tempAvailableMarkers - 1
                  --[[
                    We don't bother removing empty tables here,
                     unlike placeSigils(), because worst case we
                     iterate over it just twice more
                  ]]--
                  if DEBUG then
                    printWarning(string.format("Placed %s in %s", uniqueSigils[i], randMarker.full))
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
      elseif not checkGates then
        if Arranger == Randomizer.Arrangers.AGate then
          WorldA = addWorldMarkers(WorldA)
        elseif Arranger == Randomizer.Arrangers.BGate then
          WorldB = addWorldMarkers(WorldB)
        elseif Arranger == Randomizer.Arrangers.CGate then
          WorldC = addWorldMarkers(WorldC)
        end
      end

      placeSigils(sigils)
    end
  --[[
    For scavenger hunt, Fully Random and None will always place all
     the sigils, but for the other modes we need to make sure we
     actually do that too
  ]]--
  if Scavenger ~= Randomizer.Scavenger.Values.Off then
    Wait(CustomEvent("OnStep"))
    local allArrangers = {}
    for k, _ in pairs(Randomizer.Arrangers) do
      table.insert(allArrangers, k)
    end
    -- Just to be sure that there's no inconsitencies with pairs()
    table.sort(allArrangers)
    -- Find all markers that are still available
    local allMarkers = {}
    for i=1, #markers do
      for j=1, #markers[i][2] do
        table.insert(allMarkers, markers[i][2][j])
      end
    end
    -- Intended has no F3 Star marker in the global list
    if RandomizationMode == Randomizer.Modes.Values.Intended then
      table.insert(allMarkers, Randomizer.Puzzles.Nexus.F3.talosProgress)
    end
    --[[
      Place the remaining sigils at the remaining markers
      There's no need to randomize this because you won't see
       these sigils anyway
    ]]--
    for i=1, #allArrangers do
      local Arranger = locked[allArrangers[i]]
      if Arranger ~= nil then
        for j=1, #Arranger do
          local sigil = Arranger[j]
          local marker = table.remove(allMarkers, 1).talosProgress
          talosProgress:SetCode(marker, tetroIndexes[sigil])
          tetroIndexes[sigil] = nil
        end
      end
    end
  end

  --[[
    Fully Random ignores all that logic to do simple knuth randomization
     over everything
  ]]--
  elseif RandomizationMode == Randomizer.Modes.Values.FullyRandom then
    for i = 1, #markers do
      local currentMarker = markers[i]
      local otherMarker = markers[rand(1, i)]
      if DEBUG then
        printWarning(string.format("Swapping %s with %s", currentMarker.full, otherMarker.full))
      end
      talosProgress:SetCode(
        markers[i].talosProgress,
        talosProgress:GetCodeValue(otherMarker.talosProgress)
      )
      talosProgress:SetCode(otherMarker.talosProgress, i)
    end

  --[[
    When there is no randomization we can go through the Randomizer.Puzzles table,
     which has all the default sigils in it
  ]]--
  elseif RandomizationMode == Randomizer.Modes.Values.None then
    for _, Level in pairs(Randomizer.Puzzles.WorldsAsArray) do
      for key, Puzzle in pairs(Level) do
        if key ~= "talosProgress" then
          talosProgress:SetCode(Puzzle.talosProgress, tetroIndexes[Puzzle.sigil])
        end
      end
    end
  end

  -- Mobius Mode is made to work with everything else so we do this last
  if #Mobius ~= 0 then
    local randArrangers = false
    for _, Ending in pairs(Mobius) do
      if Ending == Randomizer.Mobius.Values.RandomArrangers then
        randArrangers = true
        break
      end
    end
    if randArrangers then
      local selectedHints = {}
      for i = 1, #Randomizer.Hints.AsArray do
        local Hint = Randomizer.Hints.AsArray[i]
        if rand(0, 99) < PROB_RAND_ARRANGER then
          table.insert(selectedHints, Hint)
        end
      end
      -- Just incase you got an empty list
      if #selectedHints == 0 then
        -- Note that this is not an item arranger
        selectedHints = {Randomizer.Hints.Values.A1Gate}
      end
      --[[
        When you unlock items all the yellow arrangers are completed, without using up the
         sigils, so if it selects a yellow arranger you won't be able to tell which one it
         selected, so you won't know what sigils you need to collect
        To fix this we just ignore them if needed
      ]]--
      local hintsVal = 0
      for i = 1, #selectedHints do
        if talosProgress:IsVarSet(Randomizer.MiscOptions.Values.AllItems.talosProgress)
            and (seletedHints[i] == Randomizer.Hints.Values.Connector
            or seletedHints[i] == Randomizer.Hints.Values.Cube
            or seletedHints[i] == Randomizer.Hints.Values.Fan
            or seletedHints[i] == Randomizer.Hints.Values.Recorder
            or seletedHints[i] == Randomizer.Hints.Values.Platform) then
          -- Do nothing
        else
          hintsVal = hintsVal + selectedHints[i].mask
        end
      end
      -- If you already selected hints this will overwrite it
      talosProgress:SetVarValue(Randomizer.Hints.talosProgress, hintsVal)
    end
  end

  --[[
    Some things might want to keep doing random stuff after generation,
     to try make it less predictable they should base it off of this
  ]]--
  talosProgress:SetVarValue(Randomizer.MiscFlags.extraSeed, rand(1, 2147483647))

  talosProgress:SetVar(Randomizer.MiscFlags.generated)
  talBackupAndSaveTalosProgress(worldInfo)
  if DEBUG then
    print("=======================\n Randomization Finished\n=======================")
  else
    print("Randomization Finished")
  end
end

-- Send a signal to the post randomization script
Wait(CustomEvent("OnStep"))
SignalEvent("Randomizer_Generated")
[���}����՟�6��}��e���$g~�+8�HL-ȗ_����t�dF�3N5j�ϩ)������t�w7l�3�S��G��y��1ϡ Δo����;1�Q��7���Qv����s=�}��E�A$�P�r��OHt�	����&���������h�`�o����Q.�!n�eY�i� $����
Q�1�S���.	�c7��}u�VDaMrȔ"	����l�t��ff�1R