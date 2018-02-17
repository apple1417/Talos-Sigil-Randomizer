SIGSTRM12GIS             ,[�h                  Signkey.EditorSignatureL޲��ٶ���֦d!�3�D02Y��K����SHzD���JzL��5�]1�H$�Gy&6ӏ�+}��x��^�nY}G�5F����%�c��t��	�qe��G��~�N@�ble~4�fQ�����X~Bm<j�P �Y��:�L�_��M���3Ո�*�-6�{�*�`_����+c��,s�|��ɷ_���7�V8�&2��Q���r��u���%���<}���z>��$2�Zy�}�TC�~���f�﻿-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local lastMode = 1

talosProgress:SetVarValue("Randomizer_Mode", 1)
talosProgress:SetVar("Randomizer_ShowAll")

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
      talosProgress:SetVarValue("Randomizer_Mode", index)
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
)1A���ƪ$}Oz��3�g�Wu98� Qm^}1��y���bDw���QY�����?3��@�	|���!��l�~;���%��V���|e(Qq}���u�Zm�u�6������)�y��왲j�2�$|7wjnȘ�Sw��g�u�|�Q�ɺ[� �ONz���/���M	CF\����nb�G�D�c��x'<�z� F�Mܞ*l�+�}�5c��RGr"��uI�gX�W�b����m;�Xx�^Vڢ��N�V�©�