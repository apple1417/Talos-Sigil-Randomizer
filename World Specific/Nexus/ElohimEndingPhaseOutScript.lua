SIGSTRM12GIS             [�Z                  Signkey.EditorSignatureh�����%����)��R�a�0�a%�8�%�cƠN H^=)*}֢%0o���Q��nd��m�����#{?�y�x�����	�(�fbiiv�M������ʓ��|>���tAŁ� ��w��,�J��A��� z�	�Uɕ�P� ��26�= ��"I���'���(I��q�	�]�C[�=(\���u,U/�<F���zv2d�1d��뺇_{�8{@Ӕ�fmZ��i��ԫ�X)�Y�lV`����a����w﻿--[[
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
      local settings = {}
      for k, v in pairs(worldGlobals.Randomizer.EternalizeSave) do
        table.insert(settings, {
          tal = v,
          val = talosProgress:GetCodeValue(v)
        })
      end

      -- This one is redundant, but I don't want to leave options out
      local Loop = talosProgress:GetCodeValue("Randomizer_Loop")
      local Moody = talosProgress:GetCodeValue("Randomizer_Moody")
      local Jetpack = talosProgress:IsVarSet("Randomizer_Jetpack")

      -- clear the talos progress (so we can start the game anew)
      talClearTalosProgress(exitPortal)
      -- set the variable saying that we've already finished the
      -- game so the new beginning can be a little bit different
      local talosProgress = nexGetTalosProgress(worldInfo)
      talosProgress:SetVar("AlreadyFinishedGame")

      -- Set randomizer options again
      for _, v in pairs(settings) do
        if v.val ~= -1 then
          talosProgress:SetVarValue(v.tal, v.val)
        end
      end

      exitPortal:Enable(true)
    end
  end
)
�������8�f!G�p0I�}��68�9BL`��
�o�`��s��{��s���ilG����"��Y�����b D��g�E�	c��W^2a�����QF���ʎm�ud�]�V��V��� ��PҶ$Lm���i�b�a��v��ؠѰ堤)-<B�(�.��U����a$5�G�}􉘋�i2���-bss�C&4���������vf�������c����.#��BW{�)�u�4lP�NI9�6�}��J�