SIGSTRM12GIS             % 5                  Signkey.EditorSignature�$A����*���Ag D��ǡd���n�W���A��3�[dUb'"�ۋ�ߐ�������tB_ױ�����ܭ�מ�s�rT|[�d,���Y��
�&tf�m��2<�ܫ8G. �I)�]�������L<b��K`r����a>��{��x�x2�5Tѥ������?��&bk�%����E�
�*=l���x��Z�x��z{�2��;��q�w�^�:"��%C#��>�J6T��4�(�]����﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local lastMode = 1

talosProgress:SetCode("Randomizer_Mode", 1)

RunHandled(
  function()
    WaitForever()
  end,

  OnEvery(Any(Events(Modes.Activated))),
  function(event)
    local index = event.any.signaledIndex
    if index ~= lastMode then
      Modes[lastMode]:Deactivate()
      lastMode = index
      talosProgress:SetCode("Randomizer_Mode", index)
    end
  end,
  OnEvery(Any(Events(Modes.Deactivated))),
  function(event)
    local index = event.any.signaledIndex
    if index == lastMode then
      Modes[index]:Activate()
    end
  end,

  OnEvery(Event(NoGates.Activated)),
  function()
    talosProgress:SetVar("Randomizer_NoGates")
  end,
  OnEvery(Event(NoGates.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_NoGates")
  end,

  OnEvery(Event(UnlockItems.Activated)),
  function()
    talosProgress:SetVar("Randomizer_UnlockItems")
  end,
  OnEvery(Event(UnlockItems.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_UnlockItems")
  end,    
  
  OnEvery(Event(ShowAll.Activated)),
  function()
    talosProgress:SetVar("Randomizer_ShowAll")
  end,
  OnEvery(Event(ShowAll.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_ShowAll")
  end,
  
  OnEvery(Event(Debug.Activated)),
  function()
    talosProgress:SetVar("Randomizer_Debug")
  end,
  OnEvery(Event(Debug.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_Debug")
  end,
    
  --[[
  OnEvery(Event(Option.Activated)),
  function()
    talosProgress:SetVar("Randomizer_Option")
  end,
  OnEvery(Event(Option.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_Option")
  end,
  ]]--  

  OnEvery(Any(Events(NoFunction.Activated))),
  function(event)
    local index = event.any.signaledIndex
    NoFunction[index]:Deactivate()
  end
)�?���V�E,e�8�O�I�/��w�:���\D?&Ȁ_���[*��O���W�LN�{��
��@f���]�������?#���lVfqyZ`�-#M����C/]�J����	��;o��0���gу��Ux�<��F��ޤ���̍W��s,!���h��dHp��m�N��In G�S�Zn)�Ey��H��h�Ͼrs���7qע�~��U�D����g_�O��Du�L��h@��n�-��A���W� 