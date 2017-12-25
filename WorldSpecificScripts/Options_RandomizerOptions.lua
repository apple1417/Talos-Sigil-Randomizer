SIGSTRM12GIS             ��                  Signkey.EditorSignaturegE�:�z�S��qra6$��s��
���H_�*�,4Z��-[�õ�0�oH]�;qAys=(&��D���o�$��E�����h�|�=�z���6�|�����>D_|�����сr����J��?���!S�}<�N��!�~W�UrE2��c���tk}��A���}Ҽ�`F�;�(("�@�V�*�~�?��	���|�>#��OHg�m��b�E�Y�+�8��&�઩,�Ґ�&�����e�j�f�¼ȁ��|%WG{Tq﻿local lastMode = 1
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
)K�1.�S�^��hh�f��W��U���Z5�V:� ��B�S۲}��܂��]��}Vri}n5,@�R��Ty?�!��p�_�}�|7��K��ɜ�d�$��b�T���T(:���%����x,4�*U���L\d"V�ƑeBh�u.� "s[adG�Ǜӗ�\������+sK.�.︡C@���| ���.V6�Ť��0�9�_�qF�?9����C~�r�j�W`n�r"���Q��:`��M��a{H����	)2	