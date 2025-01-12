SIGSTRM12GIS             �׾                  Signkey.EditorSignature#�IHs���BMY�7+06��E��PRWd,@`\ȧgO�BJ��i�"�kY�eH�_��qT���}3��`Ub�w�^�J���$%��:$(��@��zsm�<�pD�yr���U7c/���F"H���?2d1f�K�T��<.�`��/��lC>F�N��io��Q�.���}�︊�H~z �p���.=�S��]�gP��+{��Hf�#xA�^k*�*i��R�1�R��4ɾ�#~\ �3�L#�+�‘#�d﻿--[[
  Added a sign showing seed here, but like the terminal I only want
   it to be active for messenger ending
]]--

RunHandled(WaitForever,
  On(Event(Chapter_IslandStart.Started)),
  function()
      terminal:Disappear()
      sign:Disappear()
  end,
  On(Event(Chapter_MessengerEnd.Started)),
  function()
      -- hide messenger that is laying in the coffin
      MessengerInCoffin:Disappear(false)
      Coffin:PlayAnimStay("Closed")

      -- talosProgress : CTalosProgress
      local talosProgress = nexGetTalosProgress(worldInfo)
      text:SetText(text:GetTextConfig(), "Seed: " .. talosProgress:GetCodeValue(worldGlobals.Randomizer.Seed.talosProgress), true)

      talosProgress:SetVar("MessengerEnding")
      arranger:Disappear()
      arrangerStand:Disappear()
      Wait(Event(terminal.Stopped))
      -- when terminal has stopped, player should have selected its
      -- epitaph so add it to the tombstones
      tombstones:AddPlayersEpitaph(i)
      -- and start the cutscene
      ChapterCutSceneMessengerEnding:Start()
  end
)
>9�o����4�5�_���P�'8Ub9���Y$�raS{��%?�_8���Y��nW��������$�����U��Eeďf^(��n�U�?��a����#F�cM����.@Q���LɠQ�Ջ���y���p_-�RD��@�� m�Gǣp�������<\�F(�BY�}��{�O�dZǩc��f�ڤ���Qh�0A˷P�8�mdq�@l����=s��6,��T�^��Ȩ�9�'�A���=���d