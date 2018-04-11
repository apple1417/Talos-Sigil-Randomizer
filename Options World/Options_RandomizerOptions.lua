SIGSTRM12GIS             ���x                  Signkey.EditorSignature*��m���4��/���F,d�P�i�n�3m�3]����!'��@��Ru��io)�-�Aέk�'8�L�Ou�HZ(Q�ҿ<xC-��Q���GW��6-c绯L��|)��|��t+&T�����Dr�mm�`ƫZ/ݤyIX��O��8�#\:��th��9��Z�(a�#4_��4���`+ap��j{�V�5$�D���bD��.�^���tn�h������vY}�|X@���Q�#4Q��;ҩ��|�﻿--[[
  This one is a lot of the same, (re)setting options when you
   toggle switches
]]--

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)
local lastMode = 1
local scavenger = false

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
      talosProgress:SetVarValue("Randomizer_Mode", 0)
    end
  end,
  
  OnEvery(Event(NoGates.Activated)),
  function()
    talosProgress:SetVar("Randomizer_NoGates")
  end,
  OnEvery(Event(NoGates.Deactivated)),
  function()
    if scavenger then
      NoGates:Activate()
    else
      talosProgress:ClearVar("Randomizer_NoGates")
    end
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
    if scavenger then
      ShowAll:Deactivate()
    else
      talosProgress:SetVar("Randomizer_ShowAll")
    end
  end,
  OnEvery(Event(ShowAll.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_ShowAll")
  end,
  
  OnEvery(Event(Portals.Activated)),
  function()
    talosProgress:SetVar("Randomizer_Portals")
  end,
  OnEvery(Event(Portals.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_Portals")
  end,
  
  
  OnEvery(Event(Scavenger.Activated)),
  function()
    talosProgress:SetVar("Randomizer_Scavenger")
    ShowAll:Deactivate()
    NoGates:Activate()
    scavenger = true
  end,
  OnEvery(Event(Scavenger.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_Scavenger")
    scavenger = false
  end
)m(_�P�|�G��+F��} l�#�ԝ�C���Q�o(Qy�b�&��FN�b �a��Qx�TX���#��OEt���]N�<�'},{��F(2��H��kG�M
�g��,>e��o���%�/�I\ %wT]�t�d�أ����i�\R��F�^ӊg��4F����'���}�,�m�%����T=��_ո1
Ո(�B�����-7	E�ν��	9E��"�����{�=R�����8T6m���#\