SIGSTRM12GIS             ���                  Signkey.EditorSignatureqaٴh�m��v�m߲M��-ᣇhN�ٹ��)���F�z�����@@K�4~��,`8`N#���b�x\q���C"�2���΢3Go��Cp�N�py���~�Kr��E�OHu��;�lԱK����� ��E�����y״�W�EJ����u1����{�,q|� ~72Aj�0ti|�$sBC���;vށ ����t�s��?f4�1�x*��v;�,���4�P�˔�?</2I��?��Rc�s��#��^�����﻿Wait(CustomEvent("Randomizer_Finished"))

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)
local Randomizer = worldGlobals.Randomizer

Arranger:DontSaveProgressWhenSolved()

-- With open all worlds we'll need to make sure the gate is already open
if talosProgress:IsVarSet(Randomizer.MiscOptions.Values.OpenWorlds.talosProgress) or Arranger:IsSolved() then
  Door:AssureOpened()
end

local mode = Randomizer.Modes.AsArray[talosProgress:GetCodeValue(Randomizer.Modes.talosProgress) + 1]
local warnGate = (mode ~= Randomizer.Modes.Values.None and mode ~= Randomizer.Modes.Values.Intended and not Arranger:IsSolved())

RunHandled(WaitForever,
  OnEvery(Event(Arranger.Enter)),
  function()
    -- Give a warning about unlocking the gate cause we assume you don't open it
    if warnGate then
      worldInfo:ShowMessageToAll("WARNING: Solving this gate can cause softlocks. There are other ways around it.")
    end
  end,
  OnEvery(Event(Arranger.Solved)),
  function()
    Door:Open()
    if warnGate then
      worldInfo:ShowMessageToAll("Last chance, if you reset checkpoint now it won't be saved. (Use the pause menu, DON'T hold {plcmdHome})")
    end
  end
)
Cr�L]0�h�hVr�6�X0`,d$JRnP:�[��,'��
��p�h�8D��Ia�B�nZ���)�&�gwEK#�ܻ�ȿ+\���g����]����'7�g�����=o⇍ %��d�{R�����c���`	5�Ec;z�E�c�>�R��n�a��,�$�
���򗴭A���f�F)O7�j��������G�1�wFC,�4�#��B�H�m^E��@R��z`��WY�&��z�l
�*#v����{L����