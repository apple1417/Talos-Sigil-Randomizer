SIGSTRM12GIS             ��%                  Signkey.EditorSignature �2iZ�5"�`0L>��G]5h�) ˬ��ΣΞ6=��e����	���!p�k!E`��T�ڼ �޺q��1���b�M��	�o������EI��=F)[Zt���$c[˯�Y���ޯO�_��n���)5y^����4X��g�����7�k�Q�f-�u����Y~��8��`�`��4eH����k:��JTBp:e�jX^��<v���
׆Y��`�Ŀm44�+� L^���y�P��d�A﻿exitPortal:Enable(false)
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

      exitPortal:Enable(true)
    end
  end
)
��(/��E'y��.��ڬ�S�#���Hh�K� s����L�ܑr��g�{8�d�KN�����&��������oi-M���'ߑ�~��|	����g9�BŦn�y�*�d |z���[e��A�����O���cg~���}_$Z7�K2�E��W�B���E��y��f@�a1��#��3tB�!}f��X����n]��I�z�(���=��+��N����d	��i�a��kRO���(E�&CjK%