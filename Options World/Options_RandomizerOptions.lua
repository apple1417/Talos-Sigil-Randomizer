SIGSTRM12GIS             X���                  Signkey.EditorSignature >���<�ۘ�*U^=q-��t��8'�ޒ��$B�x|)�Ȱ!��䅡OI��R;�?M�\ `;K3�o�$bz���b��[���i�w_9�r��\��~�,���^H�E�Vʲ#eN�� �&h��u�h\�1�Cz*�+��![TCILU��)�M�*Rv(�&ݮq���}�nr^x4+��a�i�++Kn�B�ZJ��E��6�N�W���?�)�P̶ѫr��`�nXS�Tj���8�#��z�ʜ�﻿-- talosProgress : CTalosProgress
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
)�ҕ�zyk�"��O�.����И�
 ����t$�tC��~$�2B��v\檩h�f�a��\��KK_��^�����Ig�rG6�?�1T�em�{]��^����-o� 3d�����9H�4)�@��]o��d�C���O�Q�S)� w撀��De��U��ԩ��Q�\��G�4�5�X:��`�2H}�mu�em���U�$΋���H�Iq�]$�\�&�x�rk����_<�1��%��v��)��T���`�