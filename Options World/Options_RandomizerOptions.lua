SIGSTRM12GIS             ���                  Signkey.EditorSignature8��f��^n�j�rИٖpL$�ҋ=e5�)��<���eX��;���jj��6�H ���t�x�I�Fu�'�(B��>�F#�U����\�	�!�u���À�Y[ȱy2K]�s���_�BWg}�"+��_Ԅ��pwi��Iѓ �'�Z7tn*D�b��ۉ\97`�Q`��;kx�V�W����׺�}m���������"��c'�.*���������l�3���Z^��,��vD2wmdfg�b��.j���#﻿local lastMode = 1
local talosProgress = nexGetTalosProgress(worldGlobals.worldInfo)

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
)�+ß��c)�<�]y��>�z��AWM�М{]���/##�F���*�m�8\�'h]�{"�� !�3$\�%dL�c�u�k�i�Cګ��`h�/X:�h�ˋ��Zt�vA�ٴ�ÏݕZHNߘz�5S#��:n���V��1y��F�L���hǹ���Vx[�.ƋU:�.�����QE1�\2P�R$?��s̖��Pu�8���a|�T�-r�!G��^���0�T5�3VPZ��37�5����JZk�