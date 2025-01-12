SIGSTRM12GIS             ��B                  Signkey.EditorSignature��fu��_�B���AR��g쓍2�\&���8�f"vu)#�N�n,�7�����%�I�x��ɭ�+�Y���O��O��nq��fߐf�ȉ�����OT�}.�:⟄�H�v=8�;�]����,�&M{�/�;;���[P)�w�5��)�	�����F�4�15�»�1@_@��y"`����� l��;S�/MN,^�b��hny�7#{O���q(T��5���]�<o����آ�`�Ym�8﻿-- There are a bunch of small things we need to do to properly setup Nexus

--[[
  Deal with portals
  We already have all the portals in their default positions in this case so if Random
   Portals is off we won't need to do anything
  Random Portals is set before the world loads so we can safely straight away
  If it is set then just like in the normal script we need to make sure the individual
   vars are actually set before we can move them
]]--
-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
RunAsync(function()
  if talosProgress:IsVarSet("Randomizer_Portals") then
    --[[
      Arbitraritly use C Messenger portal to check if values have been set
      Technically this is one of the last ones set which makes it safer, but
       everything should be set in a single tick anyway
    ]]--
    local portalNum = talosProgress:GetCodeValue("CM-Portal")
    local iter = 0
    while portalNum == -1 do
      iter = iter + 1
      if iter == 2 then
        conWarningF("'CM-Portal' did not have a portal assigned to it quickly enough!\n")
      elseif iter >= 10 then
        conErrorF("At least 10 ticks late, assuming 'CM-Portal' does not have a portal assigned to it!\n")
        return
      end
      Wait(CustomEvent("OnStep"))
      portalNum = talosProgress:GetCodeValue("CM-Portal")
    end
    if iter >= 2 then
      conWarningF("Portal was eventually assigned " .. iter - 1 .. " ticks late\n")
    end

    local allPortals = {
      A1, A2, A3, A4, A5, A6, A7, AStar, ADevIsland,
      B1, B2, B3, B4, B5, B6, B7, BStar,
      C1, C2, C3, C4, C5, C6, C7, CStar, CMessenger
    }

    local portalLocations = {}
    for i = 1, #allPortals do
      portalLocations[i] = allPortals[i]:GetPlacement()
    end
    local OOB = thisScript:GetPlacement()

    for i = 1, #allPortals do
      local locationNum = talosProgress:GetCodeValue(allPortals[i]:GetName())
      if locationNum < 0 then
        conErrorF("Portal '" .. allPortals[i]:GetName() .. "' does not have a location assigned to it!\n")
        -- To make sure you notice, incase you're not looking at console
        allPortals[i]:SetPlacement(OOB)
      else
        allPortals[i]:SetPlacement(portalLocations[locationNum])
        if talosProgress:IsVarSet("Randomizer_Debug") then
          conWarningF(string.format("Placing %s at %s\n", allPortals[i]:GetName(),  allPortals[locationNum]:GetName()))
        end
      end
    end
  end
end)

Wait(CustomEvent("Randomizer_Finished"))

-- It's easier to open all gates, even the ones that'll dissapear later
if talosProgress:IsVarSet(worldGlobals.Randomizer.MiscOptions.Values.OpenWorlds.talosProgress) then
  AllGates:AssureOpened()
end

-- Want the seeds to show up on signs by each ending
local seedStr = "Seed: " .. talosProgress:GetCodeValue(worldGlobals.Randomizer.Seed.talosProgress)
eternalizeText:SetText(eternalizeText:GetTextConfig(), seedStr, true)
trancendenceText:SetText(trancendenceText:GetTextConfig(), seedStr, true)

--[[
  Because you can't solve arrangers from behind we need to have
   extra gates incase random portals puts you outside of A
]]--
local A1Location = talosProgress:GetCodeValue("A1-Portal")
-- Start in A
if A1Location <= 9 then
  AUpperGate:Disappear()
  AUpperArranger:Disappear()
  AUpperLight:Deactivate()
  BLowerGate:Disappear()
  BLowerArranger:Disappear()
  BLowerWalls:Disappear()
  BLowerBumpWall:Disable()
  BLowerBumpDetector:Deactivate()
  BLowerLight:Deactivate()
  CLowerGate:Disappear()
  CLowerArranger:Disappear()
  CLowerLight:Deactivate()
-- Start in B
elseif 10 <= A1Location and A1Location <= 17 then
  ALowerGate:Disappear()
  ALowerArranger:Disappear()
  ALowerLight:Deactivate()
  BUpperGate:Disappear()
  BUpperArranger:Disappear()
  BUpperLight:Deactivate()
  CLowerGate:Disappear()
  CLowerArranger:Disappear()
  CLowerLight:Deactivate()
  -- We get rid of the bump wall once you're through the gate
  if BLowerArranger:IsSolved() then
    BLowerBumpWall:Disable()
    BLowerBumpDetector:Deactivate()
  else
    RunAsync(function()
      Wait(Event(BLowerArranger.Solved))
      BLowerBumpWall:Disable()
      BLowerBumpDetector:Deactivate()
    end)
    RunAsync(function()
      -- This will never trigger if you solve the arranger
      Wait(Event(BLowerBumpDetector.Activated))
      Wait(Delay(1.25))
      worldInfo:ShowMessageToAll("Where do you think you're going?")
    end)
  end
-- Start in C
elseif 18 <= A1Location then
  ALowerGate:Disappear()
  ALowerArranger:Disappear()
  ALowerLight:Deactivate()
  BLowerGate:Disappear()
  BLowerArranger:Disappear()
  BLowerWalls:Disappear()
  BLowerBumpWall:Disable()
  BLowerBumpDetector:Deactivate()
  BLowerLight:Deactivate()
  CUpperGate:Disappear()
  CUpperArranger:Disappear()
  CUpperLight:Deactivate()
end
���^���#J����i�:�Y��\�@�h�{¡� ��+�s���������A��0Iʲ�J�Q�);�t5� WYZ�(M��M�ác��G�L�oI(���XW8�O�FR��.Ϛ�Ì����&B���|�M�"$;�G<�E�.e��N:��di(,��vU��/�7nF�!����[g��X[��jq����32���X]�� au��&���4M�~~����4Jl~��n�u�B-p�>Q%�W�U��� .��