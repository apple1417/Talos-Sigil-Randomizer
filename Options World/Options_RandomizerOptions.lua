SIGSTRM12GIS             y:�                  Signkey.EditorSignature���D+n�]/�^DR�
��rA�	�|��{�j-GL��k�e��|����Fe^+L�ZkT���kUd�`�p3�N4����s/�F���������M��o�*3ӑW�WI\=L��ypq�>?9� �?��PF��c��fN�H��f��x6����藸�h�3)4�|�K�V��&�x���W�)Pe�ù�|�D�ο@��^�ꕐ�w[�	E'�u�D	���ʹ5	X�ԯ�K+{��Nx�3�]�d����hZ�keZ���﻿-- talosProgress : CTalosProgress
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
)W���!�\\�nnW1���S��ڏ�Tj�i87	�Z_��o#����v���썾
�����]u:r>J��=N�%�@N��a]�"9�}g�S�^�t�D�≊w��������#t�#A�%�Fl��$�rt���A�U̜8��;V���0�qf���R��v�~��U�����~�3%���(a*x����_O�v��;(�3'@>2��`OW�ޏD 	���1�v�3g/��u�Ҍ57{�