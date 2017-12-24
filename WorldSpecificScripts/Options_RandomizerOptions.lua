SIGSTRM12GIS             �\�                  Signkey.EditorSignaturef��a\��Z-����oji�9 ��C�!ڬ���&]~zϜ��	;ܽ�8&�� ��)�Gg�>�Ƌ�a��k�[:a=����H���ݩĳK� ?4��mW���#�q���\V�o��B�W�1�gn��&����9˭��r9���Q�볉�}��.�=�K�?n�F�C�~U�1� ��G�cd�בd��9ٝd���"��z���t�ې���� vTtGױG[(��' �I�@����k^q>,?�lu��Xa�﻿local lastMode = 1
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

talosProgress:SetCode("Randomizer_Mode", 1)

RunHandled(
  function()
    WaitForever()
  end,
  OnEvery(Any(Events(Modes.Activated))),
  function(event)
    local index = event.any.signaledIndex
    Modes[lastMode]:Deactivate()
    lastMode = index
    talosProgress:SetCode("Randomizer_Mode", index)
  end,
  OnEvery(Any(Events(Modes.Deactivated))),
  function(event)
    local index = event.any.signaledIndex
    if lastMode == index then
      Modes[1]:Activate()
      talosProgress:SetCode("Randomizer_Mode", 1)      
    end
  end
  --[[
  OnEvery(Event(Option1.Activated)),
  function()
    talosProgress:SetVar("Randomizer_Option1")
  end,
  OnEvery(Event(Option1.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_Option1")
  end,
  ]]--
)��z(��m@:�*��|�c4�U��F��?���і�>�!�x��n����`St�~-N���mM2�x(����,Ͽ�]s�x1��2ɽ*j+�a�� mĉ5���K���b��b2Ʈ?�B΄-�4m��ط�;+�QҨ!�����q-K�LB%��� �@ȠC�ꀱ��g�Cp4��e�kH��2�� 0��Y��Ije3Pv-��s��p�&1|8~�(�5������~ƑL_��a;zYΊ����׻�