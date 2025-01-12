SIGSTRM12GIS             �!G                  Signkey.EditorSignature|�q#��������//�c��EKg�	Xq|�a���c��		���=ĥ�Ǘ�<�$�ZTB��;���ε"��W$8���@ݛ؂���3�t�H>M�8��<�!3v�KsǁB�q2	�P
!b��,�o�H��'K�'�g`�>��8X$�8a�5=���j��(ôju�;!n� �ƁN;5Ҋ�q86�`d�����`���^�r�����; ����L�]���6��W'�Ω����d��|.�﻿Wait(CustomEvent("Randomizer_Finished"))
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
)�8٦5�Ku,l�yċZ��m׬
�ٯ�Ҭ��`59����M��!ˋ��V��ц�\���tQ��;@�!���
���ۣ/'F�vw�����b�E���ȃ�/%`�
??�n��ċ�y摞�w^�cGIi�o�1���>8V�3��o~#]���$�yW ,z!���>�~���\��{,M��Nv/�����d/����?m�9L�S􆘧(ޭ��T֙u�C>�D�I����ރ!A<d�95L���?��UZS�*�-^