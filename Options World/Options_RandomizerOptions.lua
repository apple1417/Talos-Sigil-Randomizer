SIGSTRM12GIS             X�#�                  Signkey.EditorSignature�llxA�2��H��~��}z���T�7�&޶��}�r�I<�~��j����֒���w�Y8.s������B@Ehx������p���AN���gxu�}T7>��~�>�)���	j��N�|��p���LBvg/�d�#���CM���L���1)P,�;�� *�c�A�A��e�:`,t�t�4l��j߫��Y�
i�fe\�=�9}=��I6����-�ZK�R_,&)�oz��"Yɛ� �Ąӏ,iar﻿--[[
  This one is a lot of the same, (re)setting options when you
   toggle switches
]]--

-- talosProgress : CTalosProgress
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
  
  OnEvery(Event(Portals.Activated)),
  function()
    talosProgress:SetVar("Randomizer_Portals")
  end,
  OnEvery(Event(Portals.Deactivated)),
  function()
    talosProgress:ClearVar("Randomizer_Portals")
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
)d�T�H��W=v���霷[��47���D|��8&KY[�iOۼߊ}�OTы.��_Z�������O��n�]>7�Ε��9Q	r��r�
cZ��͗ 8�B�gy�~�%�(�y!fDɈ+��
��ڪh���r�6&HJ�L#Y9V�%���+�9��&��K7H����f_�A��`���6·�d��8dϞ��$��Î���[O��	
��b�BM��ͺ���Ĵ��7$��7K]EOV�=��*�����