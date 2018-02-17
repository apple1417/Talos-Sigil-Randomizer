SIGSTRM12GIS             b��t                  Signkey.EditorSignatureb�R��X ����u��n�۳�à��4(�hn�l��)�8oP�M9�O�*h�V�|-�Q�/���������S���X��-�BX�U��&��}��ڀu1���8� XJ;�lY:|��(2��|-.
�{q�����v������p ��d��B���F<c~��weQK)���y\3��qly@��^&��t-P�U�Sx���CXo*#�K*��5�qR)��N���C�7�-7�D'��L�7ϼ����&��H�8﻿exitPortal:Enable(false)
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
)X�4�HV����Ϧi霤�����`��|P�o�U���C�����q=g2������a%�zʔ�h�s���hY�F�&?�b�klW��PHt���ʹ{�	^�����<�fƤΎ�X��J��3(�໠�]o��ԡV�$��"_`T��J)��V���>�t���S��P90S'%z���&�4���)�� �{OY 6=3�,oW�oM!]�m�o�GFp�h#4I��_7�F��JӪ؛�t�f/�b�7뼳;��C�J