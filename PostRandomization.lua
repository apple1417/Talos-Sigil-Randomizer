SIGSTRM12GIS             ��m�                  Signkey.EditorSignature~5��t��t�<J��Y�G ����g��w2���o�饉-�����^��H��Px�[����jԂC�n�ޓ,�}�fi�ԥ�$
�A�bW�8�U��4�E����@p�hw��Ж(�!��(��*{�(O����H?�ns�?nb�[��Q0+�8�6�4'e��YEy�IZ6$�w�����w�'�Z���D/h�w��m�%f/v^O" '�C�;���P�+�IQ���ʃH�L�&[���ߜƏk+	k﻿--[[
  This script deals with setting up the world after randomization
  This is stuff like moving sigils and portals into position, as
   well as dealing with mobius endings and moody sigil locking
]]--

--[[
  Portals are SUPER time sensitive, if we take more than 2 ticks from world load to
   swap them out then you'll go through it as soon as you load in
  Because of this we start them straight away, ignoring all the nice constants just to
   save that extra tick, and we don't even wait for randomization to finish, just for
   our var to be set

  Nexus already has all the portals so we use another script for that
  Moving portals leaves the base behind, so we have useless ones as our
   markers, which we then get rid of so that animations don't overlap
]]--
-- portal : CPhaseInPortalEntity
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
RunAsync(function()
  if worldInfo:GetWorldFileName() ~= "Content/Talos/Levels/Randomizer/Nexus.wld" then
    --[[
      If this is already assigned then we don't need to do any processing, we know
       the portal we want
      It's already dealt with properly upon assignment, we just need to deal with
       it on load
    ]]--
    if talosProgress:IsVarSet("Randomizer_MobiusDone") then
      local pos = emptyPortal:GetPlacement()
      emptyPortal:SetPlacement(messengerPortal:GetPlacement())
      messengerPortal:SetPlacement(pos)

      while worldGlobals.Randomizer == nil do
        Wait(CustomEvent("OnStep"))
      end
      worldGlobals.Randomizer.portal = messengerPortal
      SignalEvent("Randomizer_PortalFound")
      return
    end


    local allPortals = {
      A1, A2, A3, A4, A5, A6, A7, A8, AD,
      B1, B2, B3, B4, B5, B6, B7, B8,
      C1, C2, C3, C4, C5, C6, C7, C8, CM,
      A1_I, A2_I, A3_I, A4_I, A5_I, A6_I, A7_I, A8_I, AD_I,
      B1_I, B2_I, B3_I, B4_I, B5_I, B6_I, B7_I, B8_I,
      C1_I, C2_I, C3_I, C4_I, C5_I, C6_I, C7_I, C8_I, CM_I
    }

    local portalNum = talosProgress:GetCodeValue(emptyPortal:GetName())
    local iter = 0
    while portalNum == -1 do
      iter = iter + 1
      if iter == 2 then
        conWarningF("'" .. emptyPortal:GetName() .. "' did not have a portal assigned to it quickly enough!\n")
      elseif iter >= 10 then
        conErrorF("At least 10 ticks late, assuming '" .. emptyPortal:GetName() .. "' does not have a portal assigned to it!\n")
        return
      end
      Wait(CustomEvent("OnStep"))
      portalNum = talosProgress:GetCodeValue(emptyPortal:GetName())
    end
    if iter >= 2 then
      conWarningF("Portal was eventually assigned " .. iter - 1 .. " ticks late\n")
    end
    -- Assigned before portals so we should be safe to use the current value
    if talosProgress:GetCodeValue("Randomizer_Mobius") ~= 0 then
      portalNum = portalNum + 26
    end
    local portal = allPortals[portalNum]

    local emptyPos = emptyPortal:GetPlacement()
    local portalPos = portal:GetPlacement()
    emptyPortal:SetPlacement(portalPos)
    portal:SetPlacement(emptyPos)
    if talosProgress:IsVarSet("Randomizer_Debug") then
      conWarningF(string.format("Placing %s at %s\n", portal:GetName(),  emptyPortal:GetName()))
    end

    while worldGlobals.Randomizer == nil do
      Wait(CustomEvent("OnStep"))
    end
    worldGlobals.Randomizer.portal = portal
    SignalEvent("Randomizer_PortalFound")
  end
end)

-- Wait for generation script, and also get the player
local event = Wait(All(Event(worldInfo.PlayerBorn),
                       CustomEvent("Randomizer_Generated")))

-- player : CPlayerPuppetEntity
local player = event.all[1]:GetBornPlayer()

local Randomizer = worldGlobals.Randomizer
local print = Randomizer.print
local printWarning = Randomizer.printWarning
local printError = Randomizer.printError
local DEBUG = talosProgress:IsVarSet(Randomizer.MiscFlags.debug)

--[[
  It's not fun assigning all tetros to this list, so we let other
   scripts use it as well, saving a bunch of work
]]--
Randomizer.allTetros = {
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
Randomizer.worldMarkers = worldMarkers

local allTetros = Randomizer.allTetros
local currentWorld = Randomizer.currentWorld

--[[
  Send a signal to all other scripts that might error if randomization
   hasn't finished or they don't have access to sigils
]]--
SignalEvent("Randomizer_Finished")



-- Checksum
RunAsync(function()
  --[[
    Fletcher Checksum
    Not really that useful anymore, but helped worked out when people
     were getting different things on the same seed
  ]]--
  local sum1 = 0
  local sum2 = 0
  for index=1, #Randomizer.ChecksumMarkers do
    local value = talosProgress:GetCodeValue(Randomizer.ChecksumMarkers[index])
    if value == -1 then
      printError("'" .. Randomizer.ChecksumMarkers[index] .. "' does not have a value assigned to it\n")
    end
    sum1 = (sum1 + value*index) % 65536
    sum2 = (sum2 + sum1) % 65536
  end
  local checksum = sum1 * 65536 + sum2

  -- Get printable versions of other vars that affect sigil arrangement
  local seed = talosProgress:GetCodeValue(Randomizer.Seed.talosProgress)
  local mode = Randomizer.Modes.AsArray[
    talosProgress:GetCodeValue(Randomizer.Modes.talosProgress) + 1
  ].name
  local portals = "Disabled"
  if talosProgress:IsVarSet(Randomizer.MiscOptions.Values.Portals.talosProgress) then
    portals = "Enabled"
  end
  local scavenger = Randomizer.Scavenger.AsArray[
    talosProgress:GetCodeValue(Randomizer.Scavenger.talosProgress) + 1
  ].name
  local mobius = "Disabled"
  local mobiusVar = talosProgress:GetCodeValue(Randomizer.Mobius.talosProgress)
  if mobiusVar ~= 0 then
    mobius =  string.format("%02X", mobiusVar)
  end


  print("")
  print("Seed: " .. seed)
  print("Mode: " .. mode)
  print("Random Portals: " .. portals)
  print("Scavenger Hunt: " .. scavenger)
  print("Möbius Mode: ".. mobius)
  print(string.format("Checksum: %08X", checksum))
  print("")
end)



-- Jetpack
RunAsync(function()
  if talosProgress:IsVarSet(Randomizer.MiscOptions.Values.Jetpack.talosProgress) then
    local hasJetpack = talosProgress:IsVarSet(Randomizer.MiscFlags.jetpackState)
    local canUseJetpack =  not (currentWorld == "Content/Talos/Levels/Randomizer/Nexus.wld"
                                or currentWorld == "Content/Talos/Levels/Randomizer/Interlude.wld")
    if hasJetpack and canUseJetpack then
      player:AddJetpack()
    end
    RunHandled(WaitForever,
      OnEvery(CustomEvent("TetrominoAwarded")),
      function()
        hasJetpack = not hasJetpack
        if hasJetpack then
          talosProgress:SetVar(Randomizer.MiscFlags.jetpackState)
          if canUseJetpack then
            player:AddJetpack()
          end
        else
          talosProgress:ClearVar(Randomizer.MiscFlags.jetpackState)
          player:RemoveJetpack()
        end
        talBackupAndSaveTalosProgress(worldInfo)
      end
    )
  end
end)



-- Place sigils
RunAsync(function()
  if currentWorld == "Content/Talos/Levels/Randomizer/DeveloperIsland.wld" then
    talosProgress:SetVar(Randomizer.MiscFlags.devIslandVisited)
  else
    local acceptableSigils = nil
    if talosProgress:GetCodeValue(Randomizer.Scavenger.talosProgress) ~= 0 then
      acceptableSigils = {}
      local scavengerEnding = Randomizer.Scavenger.Endings.AsArray[
        talosProgress:GetCodeValue(Randomizer.Scavenger.Endings.talosProgress)
      ]
      for i = 1, #scavengerEnding.Arrangers do
        local Sigils = scavengerEnding.Arrangers[i].Sigils
        for j = 1, #Sigils do
          acceptableSigils[Sigils[j]] = true
        end
      end
      -- In intended mode we also accept A1 gate
      if talosProgress:GetCodeValue(Randomizer.Modes.talosProgress) == Randomizer.Modes.Values.Intended.id then
          for i = 1, #Randomizer.Arrangers.A1 do
            acceptableSigils[Randomizer.Arrangers.A1[i]] = true
          end
      end
    end
    -- Move sigils to the correct positions
    for i = 1, #worldMarkers do
      local marker = worldMarkers[i]
      local sigilNum = talosProgress:GetCodeValue(marker:GetName())
      local sigil = allTetros[sigilNum]
      if sigil == nil then
        printError("Marker '" .. marker:GetName() .. "' does not have a sigil assigned to it!")
      else
        -- For scavenger hunt, decide if to actually move the sigils
        if not acceptableSigils or acceptableSigils[sigil:GetName()] then
          sigil:SetPlacement(marker:GetPlacement())
          if DEBUG then
            printWarning(string.format("Moving %s to %s", sigil:GetName(), marker:GetName()))
          end
        end
      end
    end
  end
end)



-- Make sure the correct sigils are uncollectable for moody/uno
if talosProgress:GetCodeValue(Randomizer.Moody.talosProgress) ~= 0
   or talosProgress:IsVarSet(Randomizer.Uno.talosProgress) then

  local checkColour = talosProgress:GetCodeValue(Randomizer.Moody.talosProgress) % 2 == 1
  local checkShape = talosProgress:GetCodeValue(Randomizer.Moody.talosProgress) > 1
  local uno = talosProgress:IsVarSet(Randomizer.Uno.talosProgress)

  local function disableTetros(lastColour, lastShape)
    for i = 1, #allTetros do
      local tetro = allTetros[i]
      local sigil = tetro:GetName()

      local sigilColour = Randomizer.LastColour.fromSigil(sigil)
      local sigilShape = Randomizer.LastShape.fromSigil(sigil)

      if uno then
        -- If you haven't grabbed a sigil yet
        if lastColour == nil then
          tetro:EnablePicking()
        -- Only need to check one of these to be sure it's a star
        elseif lastColour == Randomizer.LastColour.Values.Star then
          tetro:EnablePicking()
        elseif sigilColour == Randomizer.LastColour.Values.Star then
          tetro:EnablePicking()
        elseif sigilColour == lastColour or sigilShape == lastShape then
          tetro:EnablePicking()
        else
          tetro:DisablePicking()
        end
      else
        if checkColour and sigilColour == lastColour then
          tetro:DisablePicking()
        elseif checkShape and sigilShape == lastShape then
          tetro:DisablePicking()
        else
          tetro:EnablePicking()
        end
    end
    end
  end

  RunAsync(function()
    if (checkColour or checkShape) and uno then
      printError("Both Moody Sigils and Uno Mode are on, only going to use Moody's rules")
      uno = false
    end

    disableTetros(
      Randomizer.LastColour.AsArray[talosProgress:GetCodeValue(Randomizer.LastColour.talosProgress)],
      Randomizer.LastShape.AsArray[talosProgress:GetCodeValue(Randomizer.LastShape.talosProgress)]
    )

    RunHandled(WaitForever,
      OnEvery(CustomEvent("TetrominoAwarded")),
      -- event : CTetrominoAwardedScriptEvent
      function(event)
        local sigil = event:GetTetromino()
        local colour = Randomizer.LastColour.fromSigil(sigil)
        local shape = Randomizer.LastShape.fromSigil(sigil)
        talosProgress:SetVarValue(Randomizer.LastColour.talosProgress, colour.id)
        talosProgress:SetVarValue(Randomizer.LastShape.talosProgress, shape.id)
        talBackupAndSaveTalosProgress(worldInfo)
        disableTetros(colour, shape)
      end
    )
  end)
end



-- Deal with the mobius mode endings
if talosProgress:GetCodeValue(Randomizer.Mobius.talosProgress) ~= 0 and currentWorld ~= "Content/Talos/Levels/Randomizer/Nexus.wld" then
  local function finished(str)
    worldInfo:ShowMessageToAll("Goal Achived:\n" .. str)
    if not talosProgress:IsVarSet(Randomizer.MiscFlags.mobiusDone) then
      talosProgress:SetVar(Randomizer.MiscFlags.mobiusDone)
      talBackupAndSaveTalosProgress(worldInfo)

      local pos = worldGlobals.Randomizer.portal:GetPlacement()
      worldGlobals.Randomizer.portal:SetPlacement(messengerPortal:GetPlacement())
      messengerPortal:SetPlacement(pos)
      worldGlobals.Randomizer.portal = messengerPortal

      if DEBUG then
        print("Goal achieved, replacing portal '" .. portal:GetName() .. "' with '" .. messengerPortal:GetName() .. "'")
      end
    end
  end

  RunAsync(function()
    local mobius = talosProgress:GetCodeValue(Randomizer.Mobius.talosProgress)

    --[[
      Setup the requirements for Two Tower Floors and Random Arrangers,
        we don't need to do it every time we get a sigil
    ]]--
    local floorCombos = {}
    if Randomizer.checkBit(mobius, Randomizer.Mobius.Values.TwoTower.id) then
      local floors = {
        Randomizer.Hints.Values.F1,
        Randomizer.Hints.Values.F2,
        Randomizer.Hints.Values.F3,
        Randomizer.Hints.Values.F4,
        Randomizer.Hints.Values.F5,
        Randomizer.Hints.Values.F6
      }
      for i = 1, #floors do
        for j = i + 1, #floors do
          -- Get the union of the two tables
          local combo = {}
          for k, v in pairs(floors[i].SigilCounts) do
            if combo[k] then
              combo[k] = combo[k] + v
            else
              combo[k] = v
            end
          end
          for k, v in pairs(floors[j].SigilCounts) do
            if combo[k] then
              combo[k] = combo[k] + v
            else
              combo[k] = v
            end
          end
          table.insert(floorCombos, combo)
        end
      end
    end

    local randArrangerSigils = {}
    if Randomizer.checkBit(mobius, Randomizer.Mobius.Values.RandomArrangers.id) then
      local Arrangers = Randomizer.getAllBits(
        talosProgress:GetCodeValue(Randomizer.Hints.talosProgress),
        Randomizer.Hints
      )
      for i = 1, #Arrangers do
        for k, v in pairs(Arrangers[i].SigilCounts) do
          if randArrangerSigils[k] ~= nil then
            randArrangerSigils[k] = randArrangerSigils[k] + v
          else
            randArrangerSigils[k] = v
          end
        end
      end
    end

    -- Save the next world incase we go to the interlude
    local portalNum = talosProgress:GetCodeValue(emptyPortal:GetName())
    talosProgress:SetVarValue(worldGlobals.Randomizer.MiscFlags.mobiusInterlude, portalNum)

    RunHandled(WaitForever,
      OnEvery(CustomEvent("TetrominoAwarded")),
      function()
        local collected = talosProgress:GetInventoryTetrominoes() .. talosProgress:GetUsedupTetrominoes()

        -- Scavenger Hunt Endings
        if talosProgress:GetCodeValue(Randomizer.Scavenger.talosProgress) ~= 0 then
          local acceptableSigils = {}
          local scavengerEnding = Randomizer.Scavenger.Endings.AsArray[
            talosProgress:GetCodeValue(Randomizer.Scavenger.Endings.talosProgress)
          ]
          for i = 1, #scavengerEnding.Arrangers do
            local Sigils = scavengerEnding.Arrangers[i].Sigils
            for j = 1, #Sigils do
              acceptableSigils[Sigils[j]] = true
            end
          end
          -- In intended mode we also accept A1 gate
          if talosProgress:GetCodeValue(Randomizer.Modes.talosProgress) == Randomizer.Modes.Values.Intended.id then
              for i = 1, #Randomizer.Arrangers.A1 do
                acceptableSigils[Randomizer.Arrangers.A1[i]] = true
              end
          end

          local allScavenger = true
          for i = 1, #acceptableSigils do
            local _, count = string.gsub(collected, acceptableSigils[i] + "%d+;", "")
            if count == 0 then
              allScavenger = false
              break
            end
          end
          if allScavenger then
            finished("Finished Scavenger Hunt")
          end
        end

        if Randomizer.checkBit(mobius, Randomizer.Mobius.Values.AllSigils.id) then
          local _, sigilCount = string.gsub(collected, "[DMNE%*][IJLOSTZ%*]%d+;", "")
          if sigilCount == 129 then
            finished("Collected All Sigils")
          end
        end

        if Randomizer.checkBit(mobius, Randomizer.Mobius.Values.AllShape.id) then
          local _, count = string.gsub(collected, "[DMNE%*]I%d+;", "")
          if count >= 9 then
            finished("Collected All 'I' Sigils")
          end
          local _, count = string.gsub(collected, "[DMNE%*]J%d+;", "")
          if count >= 10 then
            finished("Collected All 'J' Sigils")
          end
          local _, count = string.gsub(collected, "[DMNE%*]L%d+;", "")
          if count >= 21 then
            finished("Collected All 'L' Sigils")
          end
          local _, count = string.gsub(collected, "[DMNE%*]O%d+;", "")
          if count >= 9 then
            finished("Collected All 'O' Sigils")
          end
          local _, count = string.gsub(collected, "[DMNE%*]S%d+;", "")
          if count >= 10 then
            finished("Collected All 'S' Sigils")
          end
          local _, count = string.gsub(collected, "[DMNE%*]T%d+;", "")
          if count >= 26 then
            finished("Collected All 'T' Sigils")
          end
          local _, count = string.gsub(collected, "[DMNE%*]Z%d+;", "")
          if count >= 14 then
            finished("Collected All 'Z' Sigils")
          end
          local _, count = string.gsub(collected, "[DMNE%*]%*%d+;", "")
          if count >= 30 then
            finished("Collected All Stars")
          end
        end

        if Randomizer.checkBit(mobius, Randomizer.Mobius.Values.AllColour.id) then
          local _, count = string.gsub(collected, "D[IJLOSTZ%*]%d+;", "")
          if count >= 18 then
            finished("Collected All Green Sigils")
          end
          local _, count = string.gsub(collected, "M[IJLOSTZ%*]%d+;", "")
          if count >= 23 then
            finished("Collected All Yellow Sigils")
          end
          local _, count = string.gsub(collected, "N[IJLOSTZ%*]%d+;", "")
          if count >= 49 then
            finished("Collected All Red Sigils")
          end
          local _, count = string.gsub(collected, "E[IJLOSTZ%*]%d+;", "")
          if count >= 9 then
            finished("Collected All Grey Sigils")
          end
          local _, count = string.gsub(collected, "%*[IJLOSTZ%*]%d+;", "")
          if count >= 30 then
            finished("Collected All Stars")
          end
        end

        if Randomizer.checkBit(mobius, Randomizer.Mobius.Values.Eternalize.id) then
          local _, count = string.gsub(collected, "[DMN][IJLOSTZ]%d+;", "")
          if count >= 90 then
            finished("Unlocked Eternalize Ending")
          end
        end

        if Randomizer.checkBit(mobius, Randomizer.Mobius.Values.TwoTower.id) then
          for i = 1, #floorCombos do
            local complete = true
            for shape, requiredCount in pairs(floorCombos[i]) do
              local _, actualCount = string.gsub(collected, shape .. "%d+;", "")
              if actualCount < requiredCount then
                complete = false
                break
              end
            end

            if complete then
              finished("Collected all sigils for two different Tower Floors")
            end
          end
        end

        if Randomizer.checkBit(mobius, Randomizer.Mobius.Values.RandomArrangers.id) then
          local complete = true
          for shape, requiredCount in pairs(randArrangerSigils) do
            local _, actualCount = string.gsub(collected, shape .. "%d+;", "")
            if actualCount < requiredCount then
              complete = false
              break
            end
          end
          if complete then
            finished("Completed all Random Arrangers")
          end
        end
      end
    )
  end)
end



-- Award extra random sigils if needed
if talosProgress:IsVarSet(Randomizer.MiscOptions.Values.ExtraSigils.talosProgress)
   and not talosProgress:IsVarSet(Randomizer.MiscFlags.extraSigilsGiven) then

  local seed = talosProgress:GetCodeValue(Randomizer.MiscFlags.extraSeed)
  local function randSigil(max)
    seed = (214013 * seed + 2531011) % 2147483648
    return (seed % max) + 1
  end

  RunAsync(function()
    for _=1, 20 do
      randSigil(0)
    end

    talosProgress:SetVar(Randomizer.MiscFlags.extraSigilsGiven)
    local sigils = {
      "**",
      "DI", "DJ", "DL", "DT", "DZ",
      "MI", "MJ", "ML", "MO", "MS", "MT", "MZ",
      "NI", "NJ", "NL", "NO", "NS", "NT", "NZ"
    }

    if DEBUG then
      print("Extra Random Sigils:")
    end
    for sigilNum = 50, 65 do
      local sigil = sigils[randSigil(#sigils)]

      local awardedSigil = sigil .. sigilNum

      if DEBUG then
        printWarning("Awarded " .. awardedSigil)
      end
      talosProgress:StoreTetromino(awardedSigil)
    end
  end)
end



-- These two are things we can't do in the options world because there's no way to undo them
RunAsync(function()
  if talosProgress:IsVarSet(Randomizer.MiscOptions.Values.AllItems.talosProgress) then
    talosProgress:AssureUnlockedMechanic("MechanicCube")
    talosProgress:AssureUnlockedMechanic("MechanicRods")
    talosProgress:AssureUnlockedMechanic("MechanicFan")
    talosProgress:AssureUnlockedMechanic("MechanicShield")
    talosProgress:AssureUnlockedMechanic("MechanicTime")
    prjOnMechanicLockingChanged(worldInfo)
  end
end)
RunAsync(function()
  local hints = Randomizer.getAllBits(
    talosProgress:GetCodeValue(Randomizer.Hints.talosProgress),
    Randomizer.Hints
  )

  local allHints = {
    A1Gate, AGate, BGate, CGate,
    Connector, Cube, Fan, Recorder, Platform,
    F1, F2, F3, F4, F5, F6
  }

  for _, v in pairs(hints) do
    talosProgress:FakeSeenArranger(allHints[v.id + 1])
  end
end)
)lu'{Tbe�*X����J����_=�;�DP�7igO=��X���d��[��q���M���~B�5���������X$Տ�E<8�@KW����q����.�xz
q��)�yKУ�_צ���y���6QY�i��I����{�(�G��������DL�i��ο���D�Z"|����Z�B�o%n?��2���i��ˢ?�1�d����FS�Z3a�_9�,�r_��#"���>�"$`�j	�!\ϜE�