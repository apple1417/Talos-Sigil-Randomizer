SIGSTRM12GIS             ��*�                  Signkey.EditorSignature~�_2��Y�Ӓ h��
/��<:�̂��	�*��[���_�ѧݜqp�� �S\�?�N��a�q���Ja7Ɨ8�"�P���d{��`�m�W��K���b�O9�j�����zp
,ř$֏7E�����~OP �,k���=��{�©�\!��I�ْ,\�����SP�"i��Ks�}�	ތ��t���R�pV�����+E`_�J� �p����>d���� ����9� ��z�?Jd��L�S�﻿--[[
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
      -- This is redundant, but I don't want to leave options out
      local Loop = talosProgress:GetCodeValue("Randomizer_Loop")
      
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

      exitPortal:Enable(true)
    end
  end
)��/�T0��4'o�{6�^�4�!��|E�xq�̷f2�c(��d�RO�J�4lr38�k_$A�����A5�O�i�N�L&�
R�o^���1�FgYGx�.�#{y��KԻt��	Lt=���gu�6�'��8������
�o�1XۻB/@��b6_�s�	��M��y��3��i�Ս{	Dj���D"���zy8I$z^-���-�'fB�H,Fø�v�7�R��C�2cI.��9�q8�%�Z���}�� � '���z�5=m��