SIGSTRM12GIS             ���                  Signkey.EditorSignature^^V�a�t�/tq�Zpid���6�+�} @~:v��L����*�C�C��ﱎ3T�����!�?bz�m�2.�I.%�?��+dZ�QPq�]4�W�}Áu|Q)M*D0Rq\�9�����P�m�,�@�2π��tM�b/�cSya��
F�z?RN�(�e�H�2��3���+h�PG�P	�d,ŏ
��אL:t1䎽M�Ɵ=L0�&�*�lRUS]��6��;�.�C�^���t$Μ�k�I���.����.9��\�O�O��﻿--[[
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
    -- Prevents an infinite loop
    if index ~= lastMode then
      -- Scavenger doesn't allow fully random
      if scavenger and index == 3 then
        Modes[3]:Deactivate()
      else
        if lastMode ~= 0 then
          Modes[lastMode]:Deactivate()
        end
        lastMode = index
        talosProgress:SetVarValue("Randomizer_Mode", index)
      end
    end
  end,
  OnEvery(Any(Events(Modes.Deactivated))),
  function(event)
    local index = event.any.signaledIndex
    if index == lastMode then
      -- Scavenger doesn't allow no randomization
      if scavenger then
        Modes[index]:Activate()
      else
        talosProgress:SetVarValue("Randomizer_Mode", 0)
        lastMode = 0
      end
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
    scavenger = true
    if lastMode == 0 or lastMode == 3 then
      -- When I activate switch 1 it'll deactivate switch [lastMode]
      lastMode = 3
      Modes[1]:Activate()
    end    
  end,
  OnEvery(Event(Scavenger.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_Scavenger")
    scavenger = false
  end
)=;L�F�Z3���A����T�YuN)��OL��Փ�k���نMߧMI��^�7u��uDP(�[�8����*8_#R���VI��$;�-2�\�r�ݞx���1�Z-e�u�V����ã[IO0����x����eD\��ݹ'�<廀����l\N��p���«:@?E�O������;�8
$:W.���Uk-:6ߝ�	� �L�A�t"2���ɣ0�d`bɆ˵�K��q�S�"�mx�K�
�=E��C���