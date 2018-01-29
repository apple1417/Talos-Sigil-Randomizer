SIGSTRM12GIS             m[�n                  Signkey.EditorSignature&qQ���du����s��c�L�Q��8�"?�`~�`uF(կ����^�*��Y%,{�n֚�>�I���V>��(;�L����It�PR2`s�o/bݻ:�'%��i&�!�k�\v�-��k���J�]�6nqb�	�zV��c^'~��>Vu�y�1��P��t���z����a�&���{X�c�?Xƴn���F�	c5��a��I����H:]$l����s����'�A�h�'��!0_� �6�m�y﻿-- talosProgress : CTalosProgress
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
)� 
x�C=�3m�d^?��BHF�O99��%�c�~��Jʷ^�&�l�z��/�7L%�$pP�ߚE��}�8���-O 3����̄4�,ؗOm;X��M�h̉�;x\��B�=K:FK��sS'�Qc6��9U}���]����U���W�K*}��h=j����#��,�Q�?���XP����2F�yMM���y�]�t>E�1#״x$Г�@^��B�����#{�&�HFJ�A�¼���2�Ң��\�8����tW�