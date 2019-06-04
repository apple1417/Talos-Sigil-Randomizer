SIGSTRM12GIS             -
��                  Signkey.EditorSignaturey��C�>}��9��2���VT�0�3NzZU'�Λ�I�)�Pl��=�&pTYJ�աX�����a�
��|�$VYmb�2����̫!��5m�vO��S"��/x.h"��h��͈�!&��1�����P4��$Jz����Q@���  z�>w���H�%bu�)�ǊI��p�5����^��F���t3X�j Ǟi��v(g�_ 4 };�mY(�%������/-��_8 x����*������ۜ�Q�ʹL8��$﻿Wait(CustomEvent("Randomizer_Finished"))
local talosProgress = nexGetTalosProgress(worldInfo)
local sigilNum = talosProgress:GetCodeValue(worldGlobals.Randomizer.Puzzles.A6.Bichromatic.talosProgress)
local bichromatic = worldGlobals.Randomizer.allTetros[sigilNum]


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
)���\k�oeZ���Q��֯�.q��<Xe�3I�dj���F�ƙ�jM&[^D�.c1b�r�.�i�Cqy8��Ćo\���GC
��AT��y�P�\����r�]�����*�Wb_��lD3#l�]_5�U�#�����\-9�_�
di�qF�`)ACv�Mi{�	��ѩۀ�d~y�=4��	 ��;��),��H,��=��Lz�Ȝg+���Y�p�ð�V���hf+�y������'3p���I4��gp;篐