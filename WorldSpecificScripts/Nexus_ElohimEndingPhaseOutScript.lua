SIGSTRM12GIS             ,���                  Signkey.EditorSignatureQ�1t��+D���]$Hq�H�C8R���Y14�i�A_}�+%lF'�l�O��m1�e�G�6��8"�wD���ޫ��g�g�'�DkqW�����m	�
�u����B��}��*�h}��ݨ��5�`)�潃x6��7c ���Yu�uJ�-_��)@8�Am�Xkb�S���7�;ܦSU�5�y�pD9u���H�(�M!E:7������/����+
ڄU:z�/���j_�D�yX�.���(�:7�﻿--[[
  Normally eternalize ending restarts the game - we want to do the same
  We copy all the options that were set (except seed) so it plays just
   like last time
]]--

exitPortal:Enable(false)
Wait(Event(terminal.Started))
EndCSLevelChapter:AddNextLevelToWorldCache()
-- talosProgress : CTalosProgress

RunHandled(
  WaitForever,
  OnEvery(Event(terminal.FinishedTyping)),
  function()
    local talosProgress = nexGetTalosProgress(worldInfo)
    if talosProgress:IsVarSet("StartEndOfGameCS") then

      Wait(Any(CustomEvent(terminal, "TerminalEvent_1"), Delay(10))) -- delay, just in case so we don't get stuck
      Ending_Gates_WhitenessAnimator:StartAnimation("TurningOn")
      -- award the achievement if player has already reached the top of the tower and came back to elohim ending
      if talosProgress:IsVarSet("ACH_ReachedTheTowerTop") then
        worldGlobals.worldInfo:AwardAchievementToAllPlayers("ChangedMyMind")
      end
      Wait(Delay(2.5))
      -- Copy randomizer options before we delete them
      local Mode = talosProgress:GetCodeValue("Randomizer_Mode")
      local NoGates = talosProgress:IsVarSet("Randomizer_NoGates")
      local UnlockItems = talosProgress:IsVarSet("Randomizer_UnlockItems")
      local ShowAll = talosProgress:IsVarSet("Randomizer_ShowAll")
      local Debug = talosProgress:IsVarSet("Randomizer_Debug")
      local Portals = talosProgress:IsVarSet("Randomizer_Portals")
      local Scavenger = talosProgress:GetCodeValue("Randomizer_Scavenger")
      -- This one is redundant, but I don't want to leave options out
      local Loop = talosProgress:GetCodeValue("Randomizer_Loop")
      local Moody = talosProgress:GetCodeValue("Randomizer_Moody")
      
      -- clear the talos progress (so we can start the game anew)
      talClearTalosProgress(exitPortal)
      -- set the variable saying that we've already finished the 
      -- game so the new beginning can be a little bit different
      local talosProgress = nexGetTalosProgress(worldInfo)
      talosProgress:SetVar("AlreadyFinishedGame")
      
      -- Set randomizer options again
      talosProgress:SetVarValue("Randomizer_Mode", Mode)
      if NoGates then talosProgress:SetVar("Randomizer_NoGates") end
      if UnlockItems then talosProgress:SetVar("Randomizer_UnlockItems") end
      if ShowAll then talosProgress:SetVar("Randomizer_ShowAll") end
      if Debug then talosProgress:SetVar("Randomizer_Debug") end
      if Portals then talosProgress:SetVar("Randomizer_Portals") end
      talosProgress:SetVarValue("Randomizer_Scavenger", Scavenger)
      talosProgress:SetVarValue("Randomizer_Loop", Loop)
      talosProgress:SetVarValue("Randomizer_Moody", Moody)

      exitPortal:Enable(true)
    end
  end
)s-道~HT�5�R��Aw���v���K-��o�APӴM�"s`��[��43<P��[��*�� N -d��P��M-�A�"�j��� ��/��C���X��g)O�N�D�9�x�e,Y�֟�����j6|��r�ߋb%����'G~Į'Eײ��ב����E�bS|�n$9���n�dJ��T�H�X��^G��Q��F,!t�
��=��R=Ffq�o�w�E��
�:�qʔ�����U�ǒ�)��=����