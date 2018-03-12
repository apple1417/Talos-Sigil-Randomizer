SIGSTRM12GIS             c@��                  Signkey.EditorSignatureF�`s�~E��B��&�U��{����g��MǺ���6���J<=!�g8��[��k���"7N�ٗ	l=�7���{�F�Y����� ������cK�N|@`u"YIG���i\�L��A#�0��:����,1�T�^��_�T�!�J%q����Lv�P�L1|��-1n͌��ߚi�з�e�]>8)�3Hd���*�TO�%��$Bs]v��]Yvo�}ۡkv���G��A���3��4��﻿Wait(CustomEvent("Randomizer_Finished"))
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local sigilNum = talosProgress:GetCodeValue("303_SPM_000_PM_010")
local Bichromatic = worldGlobals.allTetros[sigilNum]


local bDoorOpen=0 -- 0 door is closed, 1 door is open
local iConnectorsInsideArea=0 -- how many connectors are inside possible stuck area
local bEnoughConnectors=false -- are there enough connectors inside stuck zone to finish puzzle

RunHandled(WaitForever,
  OnEvery(Event(plasmaDoor_BlueReceiver.Opened)),
  function()
    bDoorOpen=1
    SignalEvent("Door opened")
  end,
  -- decide if showing a reset msg is needed
  OnEvery(Event(plasmaDoor_BlueReceiver.Closed)),
  function()
    -- player : CPlayerPuppetEntity
    bDoorOpen=0
    detector_PlayerStuck:Recharge()
    local player=Wait(Event(detector_PlayerStuck.Activated)):GetActivator()
    Wait(Any(Delay(5), CustomEvent("Door Opened")))
    if bDoorOpen==0 then
      local vPlayer = player:GetPlacement():GetVect()
      if detector_PlayerStuck:IsPointInArea(vPlayer, player:GetNavigationRadius()) then
        if not bEnoughConnectors then
          if player then
            player:ShowTutorialMessage("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset", 30.0, 0.5)
          end
        else
          Wait(Event(bichromatic.Picked))
          if player then
            Wait(Delay(2))
            player:ShowTutorialMessage("TTRS:Hint.HoldToReset=Hold {plcmdHome} to reset", 30.0, 0.5)
          end
        end
      end
    end
  end,
  -- count how many connectors are in area when door closes
  OnEvery(Event(plasmaDoor_BlueReceiver.Closed)),
  function()
    iConnectorsInsideArea=0
    local vConnector1 = connector1:GetActualPlacement():GetVect()
    local vConnector2 = connector2:GetActualPlacement():GetVect()
    local vConnector3 = connector3:GetActualPlacement():GetVect()
    if detector_PlayerStuck:IsPointInArea(vConnector1, 0.5) then
      iConnectorsInsideArea=iConnectorsInsideArea+1
    end
    if detector_PlayerStuck:IsPointInArea(vConnector2, 0.5) then
      iConnectorsInsideArea=iConnectorsInsideArea+1
    end
    if detector_PlayerStuck:IsPointInArea(vConnector3, 0.5) then
      iConnectorsInsideArea=iConnectorsInsideArea+1
    end
    if iConnectorsInsideArea>1 then
      bEnoughConnectors=true -- there are enough connectors in area to solve puzzle
    else
      bEnoughConnectors=false -- there are not enough connectors in area to solve puzzle
    end
  end
)X��8a!�	�R��A�N��d�>p,����$юB�r��h������mo�=:��&��������N��7=G���n�	7rI�#<sv9�FM~��" o8��C�l�D��].Tߋ�_�z���e����	��:e�e�yd�U��w؋h��m��A�_�VMp�d�N}�R��ʣ鉮�m�*>��)��|)º!�	�h�\�I����5�71{S
w�+LS���%�!�'��:2�k�Mx��c�{